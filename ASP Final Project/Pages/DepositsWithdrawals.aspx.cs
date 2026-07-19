using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace ASP_Final_Project
{
    public partial class DepositsWithdrawals : Page
    {
        // Database connection string from Web.config
        string conString =
            ConfigurationManager.ConnectionStrings["ArixBankCon"].ConnectionString;

        // Runs whenever page loads
        protected void Page_Load(object sender, EventArgs e)
        {
            // Initialize default filter dates on first load
            if (!IsPostBack)
            {
                // Default starting date = 1 month ago
                txtDateFrom.Text =
                    DateTime.Today.AddMonths(-1).ToString("yyyy-MM-dd");
                // Default ending date = today
                txtDateTo.Text =
                    DateTime.Today.ToString("yyyy-MM-dd");
            }
        }

        // Runs when List button is clicked
        protected void BtnList_Click(object sender, EventArgs e)
        {
            try
            {
                // Clear old message
                lblMessage.Text = "";
                // Validate user session
                if (Session["UserID"] == null)
                {
                    lblMessage.Text = "Please login again.";
                    lblMessage.CssClass = "msg error";
                    return;
                }

                DateTime fromDate;
                DateTime toDate;

                // Validate entered dates
                if (!DateTime.TryParse(txtDateFrom.Text, out fromDate) ||
                    !DateTime.TryParse(txtDateTo.Text, out toDate))
                {
                    lblMessage.Text = "Please select valid dates.";
                    lblMessage.CssClass = "msg error";
                    return;
                }
                // Prevent future dates
                if (fromDate.Date > DateTime.Today ||
                    toDate.Date > DateTime.Today)
                {
                    lblMessage.Text = "Error: Dates cannot be in the future.";
                    lblMessage.CssClass = "msg error";
                    return;
                }
                // Validate proper date order
                if (fromDate >= toDate)
                {
                    lblMessage.Text =
                        "Error: Date From must be earlier than Date To.";
                    lblMessage.CssClass = "msg error";
                    return;
                }
                // Load report data
                LoadReport(fromDate, toDate, ddlType.SelectedValue);
            }
            catch
            {
                // Unexpected failure
                lblMessage.Text = "Unable to load report.";
                lblMessage.CssClass = "msg error";
            }
        }

        // Loads deposit/withdraw history report
        private void LoadReport(DateTime fromDate,
                                DateTime toDate,
                                string type)
        {
            try
            {
                using (SqlConnection con =
                    new SqlConnection(conString))
                {
                    // Query report data
                    // This correctly reads balance history from database
                    // (BalanceAfterTransaction), not Session balance.
                    string query = @"
                    SELECT
                        ROW_NUMBER() OVER
                        (ORDER BY DateCreated DESC) AS SeqNo,

                        TransactionType,

                        CASE
                            WHEN TransactionType='Deposit'
                                THEN 'deposit'
                            WHEN TransactionType='Withdraw'
                                THEN 'withdraw'
                            ELSE ''
                        END AS BadgeClass,

                        FORMAT(DateCreated,'MM/dd/yyyy hh:mm tt')
                            AS DateTime,

                        FORMAT(Amount,'N2') AS Amount,

                        FORMAT(BalanceAfterTransaction,'N2')
                            AS Balance

                    FROM Transactions

                    WHERE
                        UserID=@UserID
                        AND TransactionType IN ('Deposit','Withdraw')
                        AND CAST(DateCreated AS DATE)
                        BETWEEN @FromDate AND @ToDate
                        AND
                        (
                            @Type='All'
                            OR TransactionType=@Type
                        )

                    ORDER BY DateCreated DESC";

                    SqlCommand cmd =
                        new SqlCommand(query, con);

                    cmd.Parameters.AddWithValue(
                        "@UserID",
                        Session["UserID"]);

                    cmd.Parameters.AddWithValue(
                        "@FromDate",
                        fromDate.Date);

                    cmd.Parameters.AddWithValue(
                        "@ToDate",
                        toDate.Date);

                    cmd.Parameters.AddWithValue(
                        "@Type",
                        type);

                    // Fill DataTable
                    SqlDataAdapter da =
                        new SqlDataAdapter(cmd);

                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    // Bind report to GridView
                    gvReport.DataSource = dt;
                    gvReport.DataBind();

                    // Display result message
                    if (dt.Rows.Count == 0)
                    {
                        lblMessage.Text =
                            "No transactions found.";
                        lblMessage.CssClass = "msg error";
                    }
                    else
                    {
                        lblMessage.Text =
                            dt.Rows.Count +
                            " transaction(s) loaded.";

                        lblMessage.CssClass = "msg success";
                    }
                }
            }
            catch
            {
                // Database/report loading failure
                lblMessage.Text =
                    "Unable to load report.";
                lblMessage.CssClass = "msg error";
            }
        }
    }
}