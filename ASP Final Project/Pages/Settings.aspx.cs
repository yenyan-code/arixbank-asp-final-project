using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

namespace ASP_Final_Project
{
    public partial class SettingsPage : Page
    {
        // Database connection string
        string conString =
            ConfigurationManager.ConnectionStrings["ArixBankCon"].ConnectionString;

        // Runs whenever page loads
        protected void Page_Load(object sender, EventArgs e)
        {
            // Load details only once
            if (!IsPostBack)
            {
                LoadUserDetails();
            }
        }

        // Loads logged-in user's account details
        private void LoadUserDetails()
        {
            // Validate session
            if (Session["UserID"] == null)
            {
                Response.Redirect("~/Pages/Login.aspx");
                return;
            }

            using (SqlConnection con =
                new SqlConnection(conString))
            {
                // Query user details
                string query = @"
                    SELECT FirstName, LastName, Username, Password
                    FROM USERS
                    WHERE UserID=@UserID";

                SqlCommand cmd =
                    new SqlCommand(query, con);

                cmd.Parameters.AddWithValue(
                    "@UserID",
                    Session["UserID"]);

                con.Open();

                SqlDataReader reader =
                    cmd.ExecuteReader();

                // Populate fields
                if (reader.Read())
                {
                    txtFirstName.Text =
                        reader["FirstName"].ToString();

                    txtLastName.Text =
                        reader["LastName"].ToString();

                    txtUsername.Text =
                        reader["Username"].ToString();

                    // Mask password display
                    txtPassword.Text = "********";
                }

                reader.Close();
            }
        }
    }
}