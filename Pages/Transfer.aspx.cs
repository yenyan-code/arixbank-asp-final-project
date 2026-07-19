using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace ASP_Final_Project.Pages
{
    public partial class Transfer : System.Web.UI.Page
    {
        // Database connection string from Web.config
        private readonly string connStr =
            ConfigurationManager.ConnectionStrings["ArixBankCon"].ConnectionString;

        // Runs whenever the Transfer page loads
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

        // Returns the currently logged-in user's ID
        private int GetCurrentUserID()
        {
            return Convert.ToInt32(Session["UserID"]);
        }

        // Loads current available balance from database
        private void LoadBalance()
        {
            using (SqlConnection con = new SqlConnection(connStr))
            {
                con.Open();

                // Query latest balance of logged-in user
                string sql =
                    "SELECT CurrentBalance FROM ACCOUNTS WHERE UserID=@UserID";

                using (SqlCommand cmd = new SqlCommand(sql, con))
                {
                    cmd.Parameters.AddWithValue("@UserID", GetCurrentUserID());

                    object result = cmd.ExecuteScalar();

                    // Display balance if account exists
                    if (result != null)
                    {
                        lblBalance.Text =
                            Convert.ToDecimal(result).ToString("N2");
                    }
                    else
                    {
                        // Default value if no account is found
                        lblBalance.Text = "0.00";
                    }
                }
            }
        }

        // Auto-fills recipient name after entering account number
        protected void TxtAccountNo_TextChanged(object sender, EventArgs e)
        {
            // Clear previous values/messages
            txtRecipientName.Text = "";
            lblMessage.Text = "";

            string accountNo = txtAccountNo.Text.Trim();

            // Stop process if account field is empty
            if (string.IsNullOrWhiteSpace(accountNo))
                return;

            using (SqlConnection con = new SqlConnection(connStr))
            {
                con.Open();

                // Find recipient full name using account number
                string sql = @"
                    SELECT
                        U.FirstName + ' ' + U.LastName
                    FROM USERS U
                    INNER JOIN ACCOUNTS A
                        ON U.UserID = A.UserID
                    WHERE A.AccountNo=@AccountNo";

                using (SqlCommand cmd = new SqlCommand(sql, con))
                {
                    cmd.Parameters.AddWithValue("@AccountNo", accountNo);

                    object result = cmd.ExecuteScalar();

                    // Display recipient name if found
                    if (result != null)
                    {
                        txtRecipientName.Text = result.ToString();
                    }
                    else
                    {
                        lblMessage.Text = "Recipient account not found.";
                    }
                }
            }
        }

        // Handles quick amount button clicks
        protected void QuickAmount_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;

            // Remove comma formatting before assigning
            txtAmount.Text = btn.Text.Replace(",", "");
        }

        // Clears all entered form values
        protected void BtnCancel_Click(object sender, EventArgs e)
        {
            txtAccountNo.Text = "";
            txtRecipientName.Text = "";
            txtAmount.Text = "";
            txtPassword.Text = "";
            lblMessage.Text = "";
        }

        // Main transfer process
        protected void BtnSend_Click(object sender, EventArgs e)
        {
            // Clear previous message
            lblMessage.Text = "";

            try
            {
                // Get entered values
                string accountNo = txtAccountNo.Text.Trim();
                string recipientName = txtRecipientName.Text.Trim();
                string password = txtPassword.Text.Trim();

                decimal amount;

                // Validate recipient account number
                if (string.IsNullOrWhiteSpace(accountNo))
                {
                    lblMessage.Text = "Enter recipient account number.";
                    return;
                }

                // Validate recipient existence
                if (string.IsNullOrWhiteSpace(recipientName))
                {
                    lblMessage.Text = "Recipient not found.";
                    return;
                }

                // Validate transfer amount
                if (!decimal.TryParse(txtAmount.Text, out amount))
                {
                    lblMessage.Text = "Enter valid amount.";
                    return;
                }

                // Validate password entry
                if (string.IsNullOrWhiteSpace(password))
                {
                    lblMessage.Text = "Enter your password.";
                    return;
                }

                // BUSINESS RULE:
                // Minimum transfer amount
                if (amount < 100)
                {
                    lblMessage.Text = "Minimum transfer is ₱100.";
                    return;
                }
                // Maximum transfer amount
                if (amount > 2000)
                {
                    lblMessage.Text = "Maximum transfer is ₱2,000.";
                    return;
                }

                // Amount must be divisible by 100
                if (amount % 100 != 0)
                {
                    lblMessage.Text = "Amount must be divisible by 100.";
                    return;
                }

                using (SqlConnection con = new SqlConnection(connStr))
                {
                    con.Open();

                    // Current logged-in sender ID
                    int senderID = GetCurrentUserID();

                    // Verify sender password
                    string passSql =
                        "SELECT Password FROM USERS WHERE UserID=@UserID";

                    string storedHash = "";

                    using (SqlCommand cmd = new SqlCommand(passSql, con))
                    {
                        cmd.Parameters.AddWithValue("@UserID", senderID);

                        object obj = cmd.ExecuteScalar();

                        if (obj != null)
                            storedHash = obj.ToString();
                    }

                    // Password is currently compared as plain text.
                    // No hashing/encryption is implemented yet.
                    if (storedHash != password)
                    {
                        lblMessage.Text = "Incorrect password.";
                        return;
                    }

                    // Get sender's current balance
                    decimal senderBalance = 0;

                    using (SqlCommand cmd = new SqlCommand(
                        "SELECT CurrentBalance FROM ACCOUNTS WHERE UserID=@UserID", con))
                    {
                        cmd.Parameters.AddWithValue("@UserID", senderID);
                        senderBalance = Convert.ToDecimal(cmd.ExecuteScalar());
                    }

                    // Validate sufficient funds
                    if (senderBalance < amount)
                    {
                        lblMessage.Text = "Insufficient funds.";
                        return;
                    }

                    // Find recipient user ID
                    int recipientID = 0;

                    using (SqlCommand cmd = new SqlCommand(
                        "SELECT UserID FROM ACCOUNTS WHERE AccountNo=@AccountNo", con))
                    {
                        cmd.Parameters.AddWithValue("@AccountNo", accountNo);

                        object obj = cmd.ExecuteScalar();

                        if (obj == null)
                        {
                            lblMessage.Text = "Recipient not found.";
                            return;
                        }

                        recipientID = Convert.ToInt32(obj);
                    }

                    // Prevent self-transfer
                    if (recipientID == senderID)
                    {
                        lblMessage.Text = "You cannot transfer to yourself.";
                        return;
                    }

                    // Begin SQL transaction for safe money transfer
                    SqlTransaction transaction = con.BeginTransaction();

                    try
                    {
                        // Compute sender's new balance after deduction
                        decimal senderNewBalance = senderBalance - amount;

                        // Debit sender account
                        using (SqlCommand cmd = new SqlCommand(@"
                        UPDATE ACCOUNTS     
                        SET CurrentBalance = CurrentBalance - @Amount,
                            TotalSentAmount = TotalSentAmount + @Amount
                        WHERE UserID=@UserID", con, transaction))
                        {
                            cmd.Parameters.AddWithValue("@Amount", amount);
                            cmd.Parameters.AddWithValue("@UserID", senderID);

                            cmd.ExecuteNonQuery();
                        }

                        // Credit recipient account
                        using (SqlCommand cmd = new SqlCommand(@"
                        UPDATE ACCOUNTS
                        SET CurrentBalance = CurrentBalance + @Amount
                        WHERE UserID=@RecipientID", con, transaction))
                        {
                            cmd.Parameters.AddWithValue("@Amount", amount);
                            cmd.Parameters.AddWithValue("@RecipientID", recipientID);

                            cmd.ExecuteNonQuery();
                        }

                        // Save sender transaction record
                        using (SqlCommand cmd = new SqlCommand(@"
                            INSERT INTO TRANSACTIONS
                            (UserID, RecipientUserID, TransactionType, Amount, Description, DateCreated, BalanceAfterTransaction)
                            VALUES
                            (@UserID, @RecipientID, 'Transfer Sent', @Amount, 'Money transferred', GETDATE(), @Balance)",
                            con, transaction))
                        {
                            cmd.Parameters.AddWithValue("@UserID", senderID);
                            cmd.Parameters.AddWithValue("@RecipientID", recipientID);
                            cmd.Parameters.AddWithValue("@Amount", amount);
                            cmd.Parameters.AddWithValue("@Balance", senderNewBalance);

                            cmd.ExecuteNonQuery();
                        }

                        // Insert recipient notification (only once)
                        using (SqlCommand cmd = new SqlCommand(@"
                            INSERT INTO NOTIFICATIONS
                            (UserID, Message, IsRead, DateCreated)
                            VALUES
                            (@UserID, @Message, 0, GETDATE())",
                            con, transaction))
                        {
                            cmd.Parameters.AddWithValue("@UserID", recipientID);
                            cmd.Parameters.AddWithValue(
                                "@Message",
                                "You received ₱" + amount.ToString("N2") +
                                " from " + Session["FirstName"] + " " + Session["LastName"]);

                            cmd.ExecuteNonQuery();
                        }

                        // Commit transfer transaction
                        transaction.Commit();

                        // Insert sender notification
                        using (SqlConnection notifCon = new SqlConnection(connStr))
                        {
                            notifCon.Open();

                            using (SqlCommand cmd = new SqlCommand(@"
                            INSERT INTO NOTIFICATIONS
                            (UserID, Message, IsRead, DateCreated)
                            VALUES
                            (@UserID, @Message, 0, GETDATE())", notifCon))
                            {
                                cmd.Parameters.AddWithValue("@UserID", senderID);
                                cmd.Parameters.AddWithValue(
                                    "@Message",
                                    "You sent ₱" + amount.ToString("N2") +
                                    " to " + recipientName);

                                cmd.ExecuteNonQuery();
                            }
                        }

                        // Store values for success page
                        Session["SuccessAmount"] = amount;
                        Session["SuccessType"] = "Transfer";
                        Session["RecipientName"] = recipientName;

                        // Redirect to success page
                        Response.Redirect("~/Pages/TransferSuccess.aspx");
                    }
                    catch (Exception ex)
                    {
                        // Rollback transaction if any error occurs
                        transaction.Rollback();

                        // Raw exception is shown to user.
                        // Useful during development, but not ideal for production.
                        lblMessage.Text = ex.ToString();
                    }
                }
            }
            catch (Exception ex)
            {
                // Raw exception is shown to user.
                lblMessage.Text = ex.ToString();
            }
        }
    }
}