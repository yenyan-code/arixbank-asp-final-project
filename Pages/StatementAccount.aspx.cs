
using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace ASP_Final_Project
{
    public partial class StatementAccount : Page
    {
        // Database connection string
        string conString =
            ConfigurationManager.ConnectionStrings["ArixBankCon"].ConnectionString;

        // Runs whenever page loads
        protected void Page_Load(object sender, EventArgs e)
        {
            // Initialize default date filters on first load
            if (!IsPostBack)
            {
                // Default: last 1 month
                txtDateFrom.Text = DateTime.Today.AddMonths(-1).ToString("yyyy-MM-dd");
                txtDateTo.Text = DateTime.Today.ToString("yyyy-MM-dd");
            }
        }

        // Runs when List button is clicked
        protected void BtnList_Click(object sender, EventArgs e)
        {
            try
            {
                // Clear old messages
                lblMessage.Text = "";

                // Validate login session
                if (Session["UserID"] == null)
                {
                    lblMessage.Text = "Please login again.";
                    return;
                }

                DateTime fromDate;
                DateTime toDate;

                // Validate date input
                if (!DateTime.TryParse(txtDateFrom.Text, out fromDate) ||
                    !DateTime.TryParse(txtDateTo.Text, out toDate))
                {
                    lblMessage.Text = "Please select valid dates.";
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
                    lblMessage.Text = "Error: Date From must be earlier than Date To.";
                    lblMessage.CssClass = "msg error";
                    return;
                }

                // Load transaction statement
                LoadStatement(fromDate, toDate);
            }
            catch
            {
                lblMessage.Text = "Unable to load statement.";
            }
        }

        // Loads statement records from database
        private void LoadStatement(DateTime fromDate, DateTime toDate)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(conString))
                {
                    // Main transaction statement query
                    string query = @"
                    SELECT
                        ROW_NUMBER() OVER (ORDER BY T.DateCreated DESC) AS SeqNo,

                        CASE
                            WHEN T.TransactionType='Deposit'
                                THEN 'Deposit'
                            WHEN T.TransactionType='Withdraw'
                                THEN 'Withdraw'
                            WHEN T.TransactionType='Transfer Sent'
                                 AND T.UserID=@UserID
                                THEN 'Transfer Sent'
                            WHEN T.TransactionType='Transfer Sent'
                                 AND T.RecipientUserID=@UserID
                                THEN 'Transfer Received'
                            ELSE T.TransactionType
                        END AS TransactionType,

                        CASE
                            WHEN T.TransactionType='Deposit'
                                THEN 'deposit'
                            WHEN T.TransactionType='Withdraw'
                                THEN 'withdraw'
                            WHEN T.TransactionType='Transfer Sent'
                                 AND T.UserID=@UserID
                                THEN 'transfer-sent'
                            WHEN T.TransactionType='Transfer Sent'
                                 AND T.RecipientUserID=@UserID
                                THEN 'transfer-received'
                            ELSE ''
                        END AS BadgeClass,

                        FORMAT(T.DateCreated,'MM/dd/yyyy hh:mm tt') AS DateTime,

                        CASE
                            WHEN T.TransactionType='Withdraw'
                                 AND T.UserID=@UserID
                                THEN FORMAT(T.Amount,'N2')
                            WHEN T.TransactionType='Transfer Sent'
                                 AND T.UserID=@UserID
                                THEN FORMAT(T.Amount,'N2')
                            ELSE ''
                        END AS Debit,

                        CASE
                            WHEN T.TransactionType='Deposit'
                                THEN FORMAT(T.Amount,'N2')
                            WHEN T.TransactionType='Transfer Sent'
                                 AND T.RecipientUserID=@UserID
                                THEN FORMAT(T.Amount,'N2')
                            ELSE ''
                        END AS Credit,

                        FORMAT(T.BalanceAfterTransaction,'N2') AS Balance,

                        CASE
                            WHEN T.TransactionType='Transfer Sent'
                                 AND T.UserID=@UserID
                                THEN ReceiverAcc.AccountNo
                            ELSE ''
                        END AS SentTo,

                        CASE
                            WHEN T.TransactionType='Transfer Sent'
                                 AND T.RecipientUserID=@UserID
                                THEN SenderAcc.AccountNo
                            ELSE ''
                        END AS ReceivedFrom

                    FROM Transactions T

                    LEFT JOIN Accounts SenderAcc
                        ON T.UserID = SenderAcc.UserID

                    LEFT JOIN Accounts ReceiverAcc
                        ON T.RecipientUserID = ReceiverAcc.UserID

                    WHERE
                        (T.UserID=@UserID OR T.RecipientUserID=@UserID)
                        AND CAST(T.DateCreated AS DATE)
                        BETWEEN @FromDate AND @ToDate

                    ORDER BY T.DateCreated DESC";

                    SqlCommand cmd = new SqlCommand(query, con);

                    // Parameters
                    cmd.Parameters.AddWithValue("@UserID", Session["UserID"]);
                    cmd.Parameters.AddWithValue("@FromDate", fromDate.Date);
                    cmd.Parameters.AddWithValue("@ToDate", toDate.Date);

                    // Fill table
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();

                    da.Fill(dt);
                    // Bind GridView
                    gvStatement.DataSource = dt;
                    gvStatement.DataBind();

                    // Result message
                    if (dt.Rows.Count == 0)
                    {
                        lblMessage.Text = "No transactions found.";
                        lblMessage.CssClass = "msg error";
                    }
                    else
                    {
                        lblMessage.Text = dt.Rows.Count + " transaction(s) loaded.";
                        lblMessage.CssClass = "msg success";
                    }
                }
            }
            catch
            {
                lblMessage.Text = "Unable to load statement.";
            }
        }
    }
}