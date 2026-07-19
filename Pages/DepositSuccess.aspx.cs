using System;

namespace ASP_Final_Project.Pages
{
    public partial class DepositSuccess : System.Web.UI.Page
    {
        // Runs whenever page loads
        protected void Page_Load(object sender, EventArgs e)
        {
            // Load data only on first load
            if (!IsPostBack)
            {
                // Prevent direct page access without deposit session data
                if (Session["DepositAmount"] == null)
                {
                    Response.Redirect("~/Pages/Deposit.aspx");
                    return;
                }

                // Display deposited amount
                lblAmount.Text =
                    Convert.ToDecimal(Session["DepositAmount"])
                    .ToString("N2");

                // Display deposit date/time
                lblDate.Text =
                    Convert.ToDateTime(Session["DepositDate"])
                    .ToString("MMM dd, yyyy, hh:mm tt");
            }
        }

        // Return user to Dashboard
        protected void BtnDashboard_Click(object sender, EventArgs e)
        {
            // Clear temporary success session values
            Session.Remove("DepositAmount");
            Session.Remove("DepositDate");

            // Redirect back to Dashboard
            Response.Redirect("~/Pages/Dashboard.aspx");
        }
    }
}