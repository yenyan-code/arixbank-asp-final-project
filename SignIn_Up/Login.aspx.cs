using System;
using System.Configuration;
using System.Data.SqlClient;

namespace ASP_Final_Project.SignIn_Up
{
    public partial class Login : System.Web.UI.Page
    {
        // Runs whenever the Login page loads
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        // Redirects user to Register page
        protected void BtnGoRegister_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/SignIn_Up/Register.aspx");
        }

        // Handles login button click event
        protected void BtnLogin_Click(object sender, EventArgs e)
        {
            // Get entered username and password, removing extra spaces
            string username = txtUsername.Text.Trim();
            string password = txtPassword.Text.Trim();

            // Validate that both fields are filled in
            if (string.IsNullOrWhiteSpace(username) ||
                string.IsNullOrWhiteSpace(password))
            {
                lblMessage.Text = "Please enter username and password.";
                return;
            }

            try
            {
                // Get database connection string from Web.config
                string connStr =
                    ConfigurationManager.ConnectionStrings["ArixBankCon"].ConnectionString;

                // Open SQL connection
                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    conn.Open();

                    // Query user information together with account details
                    // INNER JOIN connects USERS table with ACCOUNTS table using UserID
                    string query = @"
                    SELECT
                        U.UserID,
                        U.FirstName,
                        U.LastName,
                        U.Username,
                        A.AccountNo,
                        A.CurrentBalance,
                        A.TotalSentAmount
                    FROM USERS U
                    INNER JOIN ACCOUNTS A
                        ON U.UserID = A.UserID
                    WHERE U.Username=@Username
                    AND U.Password=@Password";

                    // Prepare SQL command with parameters
                    // Parameterized query helps prevent SQL Injection
                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@Username", username);
                        cmd.Parameters.AddWithValue("@Password", password);

                        // Execute query and read returned data
                        SqlDataReader reader = cmd.ExecuteReader();

                        // If account exists, login is successful
                        if (reader.Read())
                        {
                            // Store logged-in user information in Session
                            // Session allows data to be accessed across pages
                            Session["UserID"] = reader["UserID"];
                            Session["FirstName"] = reader["FirstName"].ToString();
                            Session["LastName"] = reader["LastName"].ToString();
                            Session["Username"] = reader["Username"].ToString();
                            Session["AccountNo"] = reader["AccountNo"].ToString();

                            // Store account financial details in Session
                            Session["CurrentBalance"] = reader["CurrentBalance"];
                            Session["TotalSentAmount"] = reader["TotalSentAmount"];

                            // Close reader before redirecting
                            reader.Close();

                            // Redirect user to Dashboard after successful login
                            Response.Redirect("~/Pages/Dashboard.aspx");
                        }
                        else
                        {
                            // Display message if username/password is incorrect
                            lblMessage.Text = "Invalid username or password.";
                        }
                    }
                }
            }
            catch
            {
                // Handle unexpected login/database errors
                lblMessage.Text = "Login failed.";
            }
        }
    }
}