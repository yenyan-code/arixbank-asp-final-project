using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace ASP_Final_Project.Pages
{
    public partial class Dashboard : System.Web.UI.Page
    {
        // Runs whenever Dashboard page loads
        protected void Page_Load(object sender, EventArgs e)
        {
            // Prevent unauthorized access
            if (Session["UserID"] == null)
            {
                Response.Redirect("~/SignIn_Up/Login.aspx");
                return;
            }

            // Load data only on first page load
            if (!IsPostBack)
            {
                LoadDashboard();
                LoadNotifications();
            }
        }

        // Loads account summary details
        private void LoadDashboard()
        {
            // Get logged-in user ID from Session
            int userId = Convert.ToInt32(Session["UserID"]);

            // Database connection string
            string connStr =
                ConfigurationManager.ConnectionStrings["ArixBankCon"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connStr))
            {
                // Query user and account details
                string query = @"
                    SELECT
                        U.FirstName,
                        U.LastName,
                        U.DateRegistered,
                        A.AccountNo,
                        A.CurrentBalance,
                        A.TotalSentAmount
                    FROM USERS U
                    INNER JOIN ACCOUNTS A
                        ON U.UserID = A.UserID
                    WHERE U.UserID = @UserID
                ";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@UserID", userId);

                    con.Open();

                    SqlDataReader reader = cmd.ExecuteReader();

                    // Populate dashboard labels
                    if (reader.Read())
                    {
                        lblFullName.Text =
                            reader["FirstName"] + " " + reader["LastName"];

                        lblAccountNo.Text =
                            reader["AccountNo"].ToString();

                        lblRegisteredDate.Text =
                            Convert.ToDateTime(reader["DateRegistered"])
                            .ToString("MMMM dd, yyyy");

                        // Display latest current balance
                        lblBalance.Text =
                            Convert.ToDecimal(reader["CurrentBalance"])
                            .ToString("N2");

                        // Display total amount sent
                        lblSentAmount.Text =
                            Convert.ToDecimal(reader["TotalSentAmount"])
                            .ToString("N2");
                    }
                }
            }
        }

        // Loads latest notifications
        private void LoadNotifications()
        {
            // Get logged-in user ID
            int userId = Convert.ToInt32(Session["UserID"]);

            string connStr =
                ConfigurationManager.ConnectionStrings["ArixBankCon"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connStr))
            {
                // Get latest 10 notifications
                string query = @"
            SELECT TOP 10 Message, DateCreated
            FROM NOTIFICATIONS
            WHERE UserID = @UserID
            ORDER BY DateCreated DESC";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@UserID", userId);

                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();

                    // Store notifications for binding
                    var notifications =
                        new System.Collections.Generic.List<dynamic>();

                    while (reader.Read())
                    {
                        DateTime created =
                            Convert.ToDateTime(reader["DateCreated"]);

                        TimeSpan diff = DateTime.Now - created;

                        string timeAgo;

                        // Format human-readable time
                        if (diff.TotalMinutes < 1)
                            timeAgo = "Just now";
                        else if (diff.TotalMinutes < 60)
                            timeAgo = ((int)diff.TotalMinutes) + " mins ago";
                        else if (diff.TotalHours < 24)
                            timeAgo = ((int)diff.TotalHours) + " hrs ago";
                        else
                            timeAgo = ((int)diff.TotalDays) + " days ago";

                        notifications.Add(new
                        {
                            Message = reader["Message"].ToString(),
                            TimeAgo = timeAgo
                        });
                    }

                    // Bind notification list to Repeater
                    rptNotifications.DataSource = notifications;
                    rptNotifications.DataBind();
                }
            }
        }

    }
}
