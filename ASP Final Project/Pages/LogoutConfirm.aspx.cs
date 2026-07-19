using System;
using System.Web.UI;

namespace ASP_Final_Project
{
    public partial class LogoutConfirmPage : Page
    {
        // Runs when user confirms logout
        protected void BtnLogout_Click(object sender, EventArgs e)
        {
            // Clear session values
            Session.Clear();

            // End session
            Session.Abandon();

            // Redirect to login page
            Response.Redirect("~/SignIn_Up/Login.aspx");
        }

        // Runs when user cancels logout
        protected void BtnCancel_Click(object sender, EventArgs e)
        {
            // Get return page from querystring
            string returnUrl =
                Request.QueryString["returnUrl"];

            // Redirect back if provided
            if (!string.IsNullOrWhiteSpace(returnUrl))
            {
                // Querystring URL is directly redirected.
                // This may allow open redirect if not validated.
                Response.Redirect(
                    Server.UrlDecode(returnUrl));
            }
            else
            {
                // Default fallback page
                Response.Redirect("~/Pages/Dashboard.aspx");
            }
        }
    }
}