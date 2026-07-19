using System;

namespace ASP_Final_Project.Pages
{
    public partial class TransferSuccess : System.Web.UI.Page
    {
        // Runs whenever page loads
        protected void Page_Load(object sender, EventArgs e)
        {
            // Load success details only on first load
            if (!IsPostBack)
            {
                // Display recipient name from Session
                lblRecipient.Text =
                    Session["RecipientName"]?.ToString() ?? "-";

                // Display transferred amount

                // This assumes SuccessAmount exists in Session.
                // If Session is null/expired, conversion may throw error.
                lblAmount.Text =
                    Convert.ToDecimal(Session["SuccessAmount"]).ToString("N2");

                // Display current date/time
                lblDate.Text =
                    DateTime.Now.ToString("MMM dd, yyyy, hh:mm tt");
            }
        }

        // Return user to Dashboard
        protected void btnReturn_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Pages/Dashboard.aspx");
        }
    }
}