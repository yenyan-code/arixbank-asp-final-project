<%@ Page Title="Log out"
    Language="C#"
    AutoEventWireup="true"
    CodeBehind="LogoutConfirm.aspx.cs"
    Inherits="ASP_Final_Project.LogoutConfirmPage" %>

<!DOCTYPE html>
<html>
<head runat="server">

    <!-- Browser title -->
    <title>Log out</title>

    <!-- Logout confirmation stylesheet -->
    <link href="<%= ResolveUrl("~/Pages/css/LogoutConfirm.css") %>" rel="stylesheet" />

</head>
<body>

    <!-- Main ASP.NET form -->
    <form id="form1" runat="server">

        <!-- Page wrapper -->
        <div class="logout-page">

            <!-- Confirmation card -->
            <div class="logout-card">

                <!-- Logout icon -->
                <img
                    src="<%= ResolveUrl("~/Pages/Img/LogoutLogo.png") %>"
                    class="logout-icon"
                    alt="Logout Icon" />

                <!-- Heading -->
                <h1>Log out</h1>

                <!-- Confirmation message -->
                <p>
                    Are you sure you want to log out of your
                    ArixBank session?
                </p>

                <!-- Confirm logout -->
                <asp:Button
                    ID="btnLogout"
                    runat="server"
                    Text="Log out"
                    CssClass="logout-btn"
                    OnClick="BtnLogout_Click" />

                <!-- Cancel logout -->
                <asp:Button
                    ID="btnCancel"
                    runat="server"
                    Text="Cancel"
                    CssClass="cancel-btn"
                    OnClick="BtnCancel_Click" />

            </div>

        </div>

    </form>

</body>
</html>