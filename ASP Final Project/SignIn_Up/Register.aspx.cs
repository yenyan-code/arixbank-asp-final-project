using System;
using System.Configuration;
using System.Data.SqlClient;

namespace ASP_Final_Project.SignIn_Up
{
    public partial class Register : System.Web.UI.Page
    {
        // Runs whenever the Register page loads
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        // Redirects user to Login page
        protected void BtnGoLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/SignIn_Up/Login.aspx");
        }

        // Handles Register button click event
        protected void BtnRegister_Click(object sender, EventArgs e)
        {
            // Get user input and remove extra spaces
            string fname = txtFirstName.Text.Trim();
            string lname = txtLastName.Text.Trim();
            string uname = txtUsername.Text.Trim();
            string pass = txtPassword.Text.Trim();
            string confirm = txtConfirm.Text.Trim();

            // Validate required fields
            if (string.IsNullOrWhiteSpace(fname) ||
                string.IsNullOrWhiteSpace(lname) ||
                string.IsNullOrWhiteSpace(uname) ||
                string.IsNullOrWhiteSpace(pass) ||
                string.IsNullOrWhiteSpace(confirm))
            {
                lblMessage.Text = "Please complete all fields.";
                return;
            }

            // First name validation
            if (!System.Text.RegularExpressions.Regex.IsMatch(fname, @"^[A-Za-z\s]+$"))
            {
                lblMessage.Text = "First name must contain letters only.";
                return;
            }

            // Last name validation
            if (!System.Text.RegularExpressions.Regex.IsMatch(lname, @"^[A-Za-z\s]+$"))
            {
                lblMessage.Text = "Last name must contain letters only.";
                return;
            }

            // Username validation
            if (uname.Length < 4)
            {
                lblMessage.Text = "Username must be at least 4 characters.";
                return;
            }
            // Username should not contain spaces
            if (uname.Contains(" "))
            {
                lblMessage.Text = "Username must not contain spaces.";
                return;
            }

            // Validate password minimum length
            if (pass.Length < 8)
            {
                lblMessage.Text = "Password must be at least 8 characters.";
                return;
            }
            // Validate password contains letters and numbers
            if (!System.Text.RegularExpressions.Regex.IsMatch(pass, @"^(?=.*[A-Za-z])(?=.*\d).{8,}$"))
            {
                lblMessage.Text = "Password must contain letters and numbers.";
                return;
            }

            // Confirm both password fields match
            if (pass != confirm)
            {
                lblMessage.Text = "Passwords do not match.";
                return;
            }

            try
            {
                // Get connection string from Web.config
                string conStr =
                    ConfigurationManager.ConnectionStrings["ArixBankCon"].ConnectionString;
                // Open database connection
                using (SqlConnection con = new SqlConnection(conStr))
                {
                    con.Open();
                    // Start SQL transaction to ensure all registration steps succeed together
                    SqlTransaction transaction = con.BeginTransaction();

                    try
                    {
                        // Check if username already exists
                        string checkUser =
                            "SELECT COUNT(*) FROM USERS WHERE Username=@Username";

                        using (SqlCommand cmdCheck = new SqlCommand(checkUser, con, transaction))
                        {
                            cmdCheck.Parameters.AddWithValue("@Username", uname);

                            int count = Convert.ToInt32(cmdCheck.ExecuteScalar());

                            // Stop registration if duplicate username is found
                            if (count > 0)
                            {
                                lblMessage.Text = "Username already exists.";
                                // Rollback transaction
                                transaction.Rollback();
                                return;
                            }
                        }
                        // Store password
                        string hashedPassword = pass;

                        // Insert user record into USERS table
                        string insertUser = @"
                    INSERT INTO USERS
                    (FirstName, LastName, Username, Password, DateRegistered)
                    VALUES
                    (@FirstName, @LastName, @Username, @Password, GETDATE());

                    SELECT SCOPE_IDENTITY();
                ";

                        int userId;

                        using (SqlCommand cmdUser = new SqlCommand(insertUser, con, transaction))
                        {
                            cmdUser.Parameters.AddWithValue("@FirstName", fname);
                            cmdUser.Parameters.AddWithValue("@LastName", lname);
                            cmdUser.Parameters.AddWithValue("@Username", uname);
                            cmdUser.Parameters.AddWithValue("@Password", hashedPassword);
                            // Get newly created UserID
                            userId = Convert.ToInt32(cmdUser.ExecuteScalar());
                        }
                        // Generate unique account number for new user
                        string accountNo = GenerateUniqueAccountNumber(con, transaction);
                        // Insert corresponding bank account record
                        string insertAccount = @"
                    INSERT INTO ACCOUNTS
                    (UserID, AccountNo, CurrentBalance, TotalSentAmount)
                    VALUES
                    (@UserID, @AccountNo, 0, 0)
                ";

                        using (SqlCommand cmdAcc = new SqlCommand(insertAccount, con, transaction))
                        {
                            cmdAcc.Parameters.AddWithValue("@UserID", userId);
                            cmdAcc.Parameters.AddWithValue("@AccountNo", accountNo);
                            // Save account record
                            cmdAcc.ExecuteNonQuery();
                        }
                        // Commit transaction if all steps succeed
                        transaction.Commit();
                        // Hide registration form
                        pnlForm.Visible = false;
                        // Show success panel
                        pnlSuccess.Visible = true;
                        // Display generated account number
                        lblAccountNumber.Text = accountNo;
                    }
                    catch
                    {
                        // Undo all database changes if any step fails
                        transaction.Rollback();
                        lblMessage.Text = "Registration failed. Please try again.";
                    }
                }
            }
            catch (Exception ex)
            {
                // Handle connection/database failure
                lblMessage.Text = "Database connection failed: " + ex.Message;
            }
        }

        // Generates a unique account number for each new user
        private string GenerateUniqueAccountNumber(SqlConnection con, SqlTransaction transaction)
        {
            // Random number generator
            Random rnd = new Random();
            // Keep generating until unique account number is found
            while (true)
            {
                // Example format: AB123456789012
                string accountNo =
                    "AB" +
                    rnd.Next(1000, 9999) +
                    rnd.Next(1000, 9999) +
                    rnd.Next(1000, 9999);
                // Check if generated account number already exists
                string query =
                    "SELECT COUNT(*) FROM ACCOUNTS WHERE AccountNo=@AccountNo";

                using (SqlCommand cmd = new SqlCommand(query, con, transaction))
                {
                    cmd.Parameters.AddWithValue("@AccountNo", accountNo);

                    int count = Convert.ToInt32(cmd.ExecuteScalar());

                    // Return account number once uniqueness is confirmed
                    if (count == 0)
                        return accountNo;
                }
            }
        }
    }
}