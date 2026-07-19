using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace ASP_Final_Project
{
    public partial class SentReceived : Page
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
                // Default: 1 month ago
                txtDateFrom.Text =
                    DateTime.Today.AddMonths(-1).ToString("yyyy-MM-dd");
                // Default: today
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

                // Validate login session
                if (Session["UserID"] == null)
                {
                    lblMessage.Text = "Please login again.";
                    lblMessage.CssClass = "msg error";
                    return;
                }

                DateTime fromDate;
                DateTime toDate;

                // Validate selected dates
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

                // Validate date order
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
            catch (Exception ex)
            {
                lblMessage.Text = ex.Message;
                lblMessage.CssClass = "msg error";
            }
        }

        // Loads Sent / Received transfer report
        private void LoadReport(DateTime fromDate,
                                DateTime toDate,
                                string type)
        {
            try
            {
                using (SqlConnection con =
                    new SqlConnection(conString))
                {
                    // Query transfer records
                    // This page correctly reads data from database
                    string query = @"
                    SELECT
                        ROW_NUMBER() OVER
                        (ORDER BY T.DateCreated DESC) AS SeqNo,

                        CASE
                            WHEN T.UserID=@UserID
                                THEN 'Sent'
                            ELSE 'Received'
                        END AS TransactionType,

                        CASE
                            WHEN T.UserID=@UserID
                                THEN 'transfer-sent'
                            ELSE 'transfer-received'
                        END AS BadgeClass,

                        FORMAT(T.DateCreated,'MM/dd/yyyy hh:mm tt')
                            AS DateTime,

                        FORMAT(T.Amount,'N2') AS Amount,

                        FORMAT(T.BalanceAfterTransaction,'N2')
                            AS Balance,

                        CASE
                            WHEN T.UserID=@UserID
                                THEN ReceiverAcc.AccountNo
                            ELSE ''
                        END AS SentTo,

                        CASE
                            WHEN T.RecipientUserID=@UserID
                                THEN SenderAcc.AccountNo
                            ELSE ''
                        END AS ReceivedFrom

                    FROM Transactions T

                    LEFT JOIN Accounts SenderAcc
                        ON T.UserID = SenderAcc.UserID

                    LEFT JOIN Accounts ReceiverAcc
                        ON T.RecipientUserID = ReceiverAcc.UserID

                    WHERE
                        T.TransactionType='Transfer Sent'
                        AND
                        (T.UserID=@UserID
                         OR T.RecipientUserID=@UserID)
                        AND CAST(T.DateCreated AS DATE)
                        BETWEEN @FromDate AND @ToDate
                        AND
                        (
                            @Type='All'
                            OR (@Type='Sent' AND T.UserID=@UserID)
                            OR (@Type='Received'
                                AND T.RecipientUserID=@UserID)
                        )

                    ORDER BY T.DateCreated DESC";

                    SqlCommand cmd =
                        new SqlCommand(query, con);

                    // Query parameters
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

                    // Execute query
                    SqlDataAdapter da =
                        new SqlDataAdapter(cmd);

                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    // Bind report to GridView
                    gvSentReceived.DataSource = dt;
                    gvSentReceived.DataBind();

                    // Show status message
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
            catch (Exception ex)
            {
                lblMessage.Text = ex.Message;
                lblMessage.CssClass = "msg error";
            }
        }
    }
}