using System;

namespace ASP_Final_Project.Pages
{
    public partial class WithdrawSuccess : System.Web.UI.Page
    {
        // Runs whenever page loads
        protected void Page_Load(object sender, EventArgs e)
        {
            // Load success details only on first load
            if (!IsPostBack)
            {
                // Display withdrawn amount from Session
                lblAmount.Text =
                    Session["LastWithdrawAmount"]?.ToString() ?? "0.00";

                // Display current date/time

                // Uses page load time, not exact transaction timestamp.
                lblDate.Text =
                    DateTime.Now.ToString("MMM dd, yyyy, hh:mm tt");
            }
        }

        // Return user to Dashboard
        protected void btnDashboard_Click(object sender, EventArgs e)
        {
            // LastWithdrawAmount session value is not cleared here.
            // Temporary success data may remain in Session.
            Response.Redirect("~/Pages/Dashboard.aspx");
        }
    }
}