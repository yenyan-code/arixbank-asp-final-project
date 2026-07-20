<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Welcome.aspx.cs" Inherits="ASP_Final_Project.Welcome" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ArixBank</title>
    <!-- Modern Sans-Serif Font -->
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&display=swap" rel="stylesheet" />
    <link href="CSS/Welcome.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form runat="server">
        <div class="welcome-container">
            <div class="content-box">
                <div class="logo-wrapper">
                    <img src="Images/logo.png" alt="ArixBank Logo" class="logo-img" />
                </div>
                
                <h1 class="welcome-title">
                    Welcome to<br />
                    <span>ArixBank.</span>
                </h1>
                
                <p class="welcome-subtitle">Bank built for your future.</p>
                
                <div class="button-group">
                    <asp:Button ID="btnLogin" runat="server" Text="Log in" CssClass="btn-login" OnClick="BtnLogin_Click" />
                    <asp:Button ID="btnRegister" runat="server" Text="Open an Account" CssClass="btn-register" OnClick="BtnRegister_Click" />
                </div>
            </div>
        </div>
    </form>
</body>
</html>