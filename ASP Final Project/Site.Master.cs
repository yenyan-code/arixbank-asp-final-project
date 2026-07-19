using System;
using System.Web.UI;

namespace ASP_Final_Project
{
    public partial class SiteMaster : MasterPage
    {
        // Runs whenever a page using Site.Master loads
        protected void Page_Load(object sender, EventArgs e)
        {
            // Highlight currently active navigation link
            SetActiveNav();
        }

        // Determines which navigation link should appear active
        private void SetActiveNav()
        {
            // Get current page URL path
            string page = Request.Url.AbsolutePath.ToLower();

            // Reset all navigation classes
            navDashboard.Attributes["class"] = "";
            navTransfer.Attributes["class"] = "";
            navDeposit.Attributes["class"] = "";
            navWithdraw.Attributes["class"] = "";
            navReports.Attributes["class"] = "";
            navSettings.Attributes["class"] = "";

            // Activate Dashboard navigation
            if (page.Contains("dashboard"))
                navDashboard.Attributes["class"] = "active";

            // Activate Transfer navigation
            else if (page.Contains("transfer"))
                navTransfer.Attributes["class"] = "active";

            // Activate Deposit navigation
            else if (page.Contains("deposit"))
                navDeposit.Attributes["class"] = "active";

            // Activate Withdraw navigation
            else if (page.Contains("withdraw"))
                navWithdraw.Attributes["class"] = "active";

            // Activate Reports navigation for report-related pages
            else if (page.Contains("statementaccount") ||
                     page.Contains("depositswithdrawals") ||
                     page.Contains("sentreceived"))
                navReports.Attributes["class"] = "active";

            // Activate Settings navigation for settings-related pages
            else if (page.Contains("settings") ||
                     page.Contains("changepassword"))
                navSettings.Attributes["class"] = "active";
        }

        // Handles logout button click
        protected void BtnLogout_Click(object sender, EventArgs e)
        {
            // Get current page URL
            string currentPage = Request.RawUrl;

            // Redirect to logout confirmation page
            // Pass current page as return URL parameter
            Response.Redirect(
                "~/Pages/LogoutConfirm.aspx?returnUrl=" +
                Server.UrlEncode(currentPage));
        }
    }
}