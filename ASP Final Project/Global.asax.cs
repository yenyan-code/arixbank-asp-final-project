using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;

namespace ASP_Final_Project
{
    public class Global : HttpApplication
    {
        void Application_Start(object sender, EventArgs e)
        {
            // Code that runs on application startup
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
        }

        void Application_BeginRequest(object sender, EventArgs e)
        {
            try
            {
                var connSettings = System.Configuration.ConfigurationManager.ConnectionStrings["ArixBankCon"];
                if (connSettings != null)
                {
                    string host = HttpContext.Current.Request.Url.Host.ToLower();
                    string targetConnString = "";

                    // If running locally (covers localhost, 127.0.0.1, ::1, and local hostname), connect to LocalDB
                    if (HttpContext.Current.Request.IsLocal)
                    {
                        targetConnString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\ArixBankDB.mdf;Integrated Security=True";
                    }
                    else
                    {
                        // If running on the remote server (Somee), connect to Somee's SQL Server
                        targetConnString = "workstation id=ArixBankDB.mssql.somee.com;packet size=4096;user id=yenyan_SQLLogin_1;pwd=almkn7wkga;data source=ArixBankDB.mssql.somee.com;persist security info=False;initial catalog=ArixBankDB;TrustServerCertificate=True";
                    }

                    // Apply the connection string dynamically using reflection
                    if (connSettings.ConnectionString != targetConnString)
                    {
                        var readOnlyField = typeof(System.Configuration.ConfigurationElement)
                            .GetField("_readOnly", System.Reflection.BindingFlags.Instance | System.Reflection.BindingFlags.NonPublic);
                        
                        if (readOnlyField != null)
                        {
                            readOnlyField.SetValue(connSettings, false);
                            connSettings.ConnectionString = targetConnString;
                        }
                    }
                }
            }
            catch (Exception)
            {
                // Silently ignore to prevent app crash if configuration is locked
            }
        }
    }
}