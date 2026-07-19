using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

namespace ASP_Final_Project
{
    public partial class ChangePasswordPage : Page
    {
        // Database connection string
        string conString =
            ConfigurationManager.ConnectionStrings["ArixBankCon"].ConnectionString;

        // Runs when Update Password button is clicked
        protected void BtnUpdate_Click(object sender, EventArgs e)
        {
            // Reset message
            lblMessage.Text = "";
            lblMessage.CssClass = "msg";

            // Validate login session
            if (Session["UserID"] == null)
            {
                Response.Redirect("~/SignIn_Up/Login.aspx");
                return;
            }

            // Get inputs
            string oldPass = txtOldPassword.Text.Trim();
            string newPass = txtNewPassword.Text.Trim();
            string confirmPass = txtConfirmPassword.Text.Trim();

            // Empty field validation
            if (oldPass == "" || newPass == "" || confirmPass == "")
            {
                lblMessage.Text = "Please complete all fields.";
                lblMessage.CssClass = "msg error";
                return;
            }

            // Minimum length rule
            if (newPass.Length < 8)
            {
                lblMessage.Text = "Password must be at least 8 characters.";
                lblMessage.CssClass = "msg error";
                return;
            }

            // Prevent same password reuse
            if (newPass == oldPass)
            {
                lblMessage.Text = "New password cannot be same as old password.";
                lblMessage.CssClass = "msg error";
                return;
            }

            // Confirm password validation
            if (newPass != confirmPass)
            {
                lblMessage.Text = "Confirm password does not match.";
                lblMessage.CssClass = "msg error";
                return;
            }

            using (SqlConnection con =
                new SqlConnection(conString))
            {
                con.Open();

                // Get current password
                string checkQuery =
                    "SELECT Password FROM USERS WHERE UserID=@UserID";

                SqlCommand checkCmd =
                    new SqlCommand(checkQuery, con);

                checkCmd.Parameters.AddWithValue(
                    "@UserID",
                    Session["UserID"]);

                string dbPassword =
                    Convert.ToString(checkCmd.ExecuteScalar());


                // Plain text password
                if (dbPassword != oldPass)
                {
                    lblMessage.Text = "Current password is incorrect.";
                    lblMessage.CssClass = "msg error";
                    return;
                }

                // Update password
                string updateQuery =
                    "UPDATE USERS SET Password=@Password WHERE UserID=@UserID";

                SqlCommand updateCmd =
                    new SqlCommand(updateQuery, con);

                updateCmd.Parameters.AddWithValue("@Password", newPass);
                updateCmd.Parameters.AddWithValue("@UserID", Session["UserID"]);

                updateCmd.ExecuteNonQuery();

                // Success message
                lblMessage.Text = "Password changed successfully.";
                lblMessage.CssClass = "msg success";

                // Clear fields
                txtOldPassword.Text = "";
                txtNewPassword.Text = "";
                txtConfirmPassword.Text = "";
            }
        }
    }
}