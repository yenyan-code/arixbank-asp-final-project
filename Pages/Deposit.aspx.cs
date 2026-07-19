using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ASP_Final_Project.Pages
{
    public partial class Deposit : Page
    {
        // Database connection string from Web.config
        private readonly string connStr =
            ConfigurationManager.ConnectionStrings["ArixBankCon"].ConnectionString;

        // Runs whenever Deposit page loads
        protected void Page_Load(object sender, EventArgs e)
        {
            // Prevent unauthorized access
            if (Session["UserID"] == null)
            {
                Response.Redirect("~/SignIn_Up/Login.aspx");
                return;
            }

            // Load data only on first page load
            if (!IsPostBack)
            {
                LoadBalance();
            }
        }

        // Loads current balance from database
        private void LoadBalance()
        {
            int userId = Convert.ToInt32(Session["UserID"]);

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();

                // Query latest balance
                string query = @"
            SELECT CurrentBalance
            FROM ACCOUNTS
            WHERE UserID=@UserID";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@UserID", userId);

                    object result = cmd.ExecuteScalar();

                    // Display balance
                    if (result != null)
                    {
                        lblBalance.Text =
                            Convert.ToDecimal(result).ToString("N2");
                    }
                    else
                    {
                        lblBalance.Text = "0.00";
                    }
                }
            }
        }

        // Handles quick amount button clicks
        protected void QuickAmount_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;

            // Remove comma formatting (ex: 1,000.00 → 1000.00)
            txtAmount.Text = btn.Text.Replace(",", "");
        }

        // Clears form
        protected void BtnCancel_Click(object sender, EventArgs e)
        {
            txtAmount.Text = "";
            lblMessage.Text = "";
        }

        // Main deposit process
        protected void BtnDeposit_Click(object sender, EventArgs e)
        {
            // Clear old message
            lblMessage.Text = "";

            try
            {
                // Validate input
                if (string.IsNullOrWhiteSpace(txtAmount.Text))
                {
                    lblMessage.Text = "Please enter deposit amount.";
                    return;
                }

                // Parse amount
                if (!decimal.TryParse(txtAmount.Text.Replace(",", ""), out decimal amount))
                {
                    lblMessage.Text = "Invalid amount.";
                    return;
                }

                // Validate greater than zero
                if (amount <= 0)
                {
                    lblMessage.Text = "Amount must be greater than zero.";
                    return;
                }

                // Minimum rule
                if (amount < 100)
                {
                    lblMessage.Text = "Minimum deposit is ₱100.";
                    return;
                }

                // Maximum rule
                if (amount > 2000)
                {
                    lblMessage.Text = "Maximum deposit is ₱2,000.";
                    return;
                }

                // Divisibility rule
                if (amount % 100 != 0)
                {
                    lblMessage.Text = "Deposit must be divisible by 100.";
                    return;
                }

                // Logged-in user ID
                int userId = Convert.ToInt32(Session["UserID"]);

                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    conn.Open();

                    // Start transaction
                    SqlTransaction transaction = conn.BeginTransaction();

                    try
                    {
                        // Get current balance
                        decimal currentBalance = 0;

                        string getBalanceQuery = @"
                            SELECT CurrentBalance
                            FROM ACCOUNTS
                            WHERE UserID=@UserID";

                        using (SqlCommand cmd = new SqlCommand(getBalanceQuery, conn, transaction))
                        {
                            cmd.Parameters.AddWithValue("@UserID", userId);

                            object result = cmd.ExecuteScalar();

                            // Validate account exists
                            if (result == null)
                            {
                                transaction.Rollback();
                                lblMessage.Text = "Account not found.";
                                return;
                            }

                            currentBalance = Convert.ToDecimal(result);
                        }

                        // Compute new balance
                        decimal newBalance = currentBalance + amount;

                        if (newBalance > 10000)
                        {
                            transaction.Rollback();
                            lblMessage.Text = "Balance cannot exceed ₱10,000.";
                            return;
                        }

                        // Update account balance
                        string updateQuery = @"
                            UPDATE ACCOUNTS
                            SET CurrentBalance=@Balance
                            WHERE UserID=@UserID";

                        using (SqlCommand cmd = new SqlCommand(updateQuery, conn, transaction))
                        {
                            cmd.Parameters.AddWithValue("@Balance", newBalance);
                            cmd.Parameters.AddWithValue("@UserID", userId);
                            cmd.ExecuteNonQuery();
                        }

                        // Insert transaction history
                        string transactionQuery = @"
                            INSERT INTO TRANSACTIONS
                            (
                                UserID,
                                RecipientUserID,
                                TransactionType,
                                Amount,
                                Description,
                                DateCreated,
                                BalanceAfterTransaction
                            )
                            VALUES
                            (
                                @UserID,
                                NULL,
                                'Deposit',
                                @Amount,
                                @Description,
                                GETDATE(),
                                @BalanceAfter
                            )";

                        using (SqlCommand cmd = new SqlCommand(transactionQuery, conn, transaction))
                        {
                            cmd.Parameters.AddWithValue("@UserID", userId);
                            cmd.Parameters.AddWithValue("@Amount", amount);
                            cmd.Parameters.AddWithValue("@Description", "Cash Deposit");
                            cmd.Parameters.AddWithValue("@BalanceAfter", newBalance);
                            cmd.ExecuteNonQuery();
                        }

                        // Insert notification
                        string notifQuery = @"
                            INSERT INTO NOTIFICATIONS
                            (
                                UserID,
                                Message,
                                IsRead,
                                DateCreated
                            )
                            VALUES
                            (
                                @UserID,
                                @Message,
                                0,
                                GETDATE()
                            )";

                        using (SqlCommand cmd = new SqlCommand(notifQuery, conn, transaction))
                        {
                            cmd.Parameters.AddWithValue("@UserID", userId);
                            cmd.Parameters.AddWithValue(
                                "@Message",
                                $"Deposit successful: ₱{amount:N2} added.");

                            cmd.ExecuteNonQuery();
                        }

                        // Save changes
                        transaction.Commit();

                        // Session balance is updated here.
                        Session["CurrentBalance"] = newBalance;

                        // Store success page details
                        Session["DepositAmount"] = amount;
                        Session["DepositDate"] = DateTime.Now;

                        // Redirect to success page
                        Response.Redirect("~/Pages/DepositSuccess.aspx");
                    }
                    catch
                    {
                        // Undo all changes if failure occurs
                        transaction.Rollback();
                        lblMessage.Text = "Deposit failed.";
                    }
                }
            }
            catch
            {
                lblMessage.Text = "Something went wrong.";
            }
        }
    }
}