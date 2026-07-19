using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ASP_Final_Project.Pages
{
    public partial class Withdraw : Page
    {
        // Database connection string from Web.config
        private readonly string connStr =
            ConfigurationManager.ConnectionStrings["ArixBankCon"].ConnectionString;

        // Runs whenever Withdraw page loads
        protected void Page_Load(object sender, EventArgs e)
        {
            // Prevent unauthorized access
            if (Session["UserID"] == null)
            {
                Response.Redirect("~/SignIn_Up/Login.aspx");
                return;
            }

            // Load page data only on first load
            if (!IsPostBack)
            {
                LoadBalance();
            }
        }

        // Loads latest current balance from database
        private void LoadBalance()
        {
            try
            {
                // Get logged-in user ID
                int userId = Convert.ToInt32(Session["UserID"]);

                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    conn.Open();

                    // Query current balance
                    string query = @"
                SELECT CurrentBalance
                FROM ACCOUNTS
                WHERE UserID=@UserID";

                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@UserID", userId);

                        object result = cmd.ExecuteScalar();

                        // Display balance if found
                        if (result != null)
                        {
                            lblBalance.Text =
                                Convert.ToDecimal(result).ToString("N2");
                        }
                        else
                        {
                            // Default display if no account found
                            lblBalance.Text = "0.00";
                        }
                    }
                }
            }
            catch
            {
                // Fallback display if database read fails
                lblBalance.Text = "0.00";
            }
        }

        // Handles quick amount buttons
        protected void QuickAmount_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;

            // Remove commas before placing amount in textbox
            txtAmount.Text = btn.Text.Replace(",", "");
        }

        // Clears form inputs
        protected void BtnCancel_Click(object sender, EventArgs e)
        {
            txtAmount.Text = "";
            lblMessage.Text = "";
        }

        // Main withdrawal process
        protected void BtnWithdraw_Click(object sender, EventArgs e)
        {
            // Clear old messages
            lblMessage.Text = "";

            try
            {
                // Parse withdrawal amount
                if (!decimal.TryParse(txtAmount.Text.Replace(",", ""), out decimal amount))
                {
                    lblMessage.Text = "Enter valid amount.";
                    return;
                }

                // Minimum withdrawal rule
                if (amount < 100)
                {
                    lblMessage.Text = "Minimum withdrawal is ₱100.";
                    return;
                }

                // Maximum withdrawal rule
                if (amount > 2000)
                {
                    lblMessage.Text = "Maximum withdrawal is ₱2,000.";
                    return;
                }

                // Amount divisibility rule
                if (amount % 100 != 0)
                {
                    lblMessage.Text = "Amount must be divisible by 100.";
                    return;
                }

                // Logged-in user ID
                int userId = Convert.ToInt32(Session["UserID"]);

                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    conn.Open();

                    // Start SQL transaction
                    SqlTransaction transaction = conn.BeginTransaction();

                    try
                    {
                        decimal currentBalance = 0;

                        // Get current balance
                        string getBalanceQuery = @"
                            SELECT CurrentBalance
                            FROM ACCOUNTS
                            WHERE UserID=@UserID";

                        using (SqlCommand cmd =
                            new SqlCommand(getBalanceQuery, conn, transaction))
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

                        // Validate sufficient funds
                        if (currentBalance < amount)
                        {
                            transaction.Rollback();
                            lblMessage.Text = "Insufficient funds.";
                            return;
                        }

                        // Compute new balance after withdrawal
                        decimal newBalance = currentBalance - amount;

                        // Update account balance
                        string updateQuery = @"
                            UPDATE ACCOUNTS
                            SET CurrentBalance=@Balance
                            WHERE UserID=@UserID";

                        using (SqlCommand cmd =
                            new SqlCommand(updateQuery, conn, transaction))
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
                                'Withdraw',
                                @Amount,
                                @Description,
                                GETDATE(),
                                @BalanceAfter
                            )";

                        using (SqlCommand cmd =
                            new SqlCommand(transactionQuery, conn, transaction))
                        {
                            cmd.Parameters.AddWithValue("@UserID", userId);
                            cmd.Parameters.AddWithValue("@Amount", amount);
                            cmd.Parameters.AddWithValue("@Description", "Cash Withdrawal");
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

                        using (SqlCommand cmd =
                            new SqlCommand(notifQuery, conn, transaction))
                        {
                            cmd.Parameters.AddWithValue("@UserID", userId);
                            cmd.Parameters.AddWithValue(
                                "@Message",
                                $"Withdrawal successful: ₱{amount:N2} deducted.");

                            cmd.ExecuteNonQuery();
                        }

                        // Commit transaction
                        transaction.Commit();

                        // Session balance is updated here.
                        Session["CurrentBalance"] = newBalance;

                        // Store success page details
                        Session["LastWithdrawAmount"] = amount.ToString("N2");

                        // Redirect to success page
                        Response.Redirect("~/Pages/WithdrawSuccess.aspx");
                    }
                    catch
                    {
                        // Undo transaction on failure
                        transaction.Rollback();
                        lblMessage.Text = "Transaction failed.";
                    }
                }
            }
            catch
            {
                // General unexpected failure
                lblMessage.Text = "Something went wrong.";
            }
        }
    }
}