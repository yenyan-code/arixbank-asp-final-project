using System;
using System.Web.UI;

namespace ASP_Final_Project
{
    public partial class ReportsMaster : MasterPage
    {
        // Runs whenever master page loads
        protected void Page_Load(object sender, EventArgs e)
        {
            // Highlight active report link
            HighlightActiveMenu();
        }

        // Highlights current sidebar menu
        private void HighlightActiveMenu()
        {
            // Inline active styling
            string activeStyle =
                "background:#9DD44E;" +
                "font-weight:600;" +
                "border-radius:999px;" +
                "display:block;" +
                "padding:22px 20px;";

            // Get current page filename
            string page =
                System.IO.Path.GetFileName(
                    Request.Url.AbsolutePath).ToLower();

            // Reset styles
            lnkStatement.Attributes["style"] = "";
            lnkDeposits.Attributes["style"] = "";
            lnkSent.Attributes["style"] = "";

            // Apply active style
            if (page.Contains("statementaccount"))
            {
                lnkStatement.Attributes["style"] = activeStyle;
            }
            else if (page.Contains("depositswithdrawals"))
            {
                lnkDeposits.Attributes["style"] = activeStyle;
            }
            else if (page.Contains("sentreceived"))
            {
                lnkSent.Attributes["style"] = activeStyle;
            }

        }

        // Logout button click
        protected void BtnLogout_Click(object sender, EventArgs e)
        {
            // Save current page so user can return after cancel
            string currentPage = Request.RawUrl;

            // Redirect to logout confirmation page
            Response.Redirect(
                "~/Pages/LogoutConfirm.aspx?returnUrl=" +
                Server.UrlEncode(currentPage));
        }
    }
}