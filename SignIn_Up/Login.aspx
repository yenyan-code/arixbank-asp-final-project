<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="Login.aspx.cs"
    Inherits="ASP_Final_Project.SignIn_Up.Login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <!-- Page title shown in browser tab -->
    <title>ArixBank Login</title>

    <!-- External stylesheet for Login page design -->
    <link href="CSS/Login.css?v=10" rel="stylesheet" type="text/css" />
</head>
<body>

<!-- Main ASP.NET form container -->
<form id="form1" runat="server">

    <!-- Wrapper for centering login content -->
    <div class="page-wrapper">

        <!-- Login card container -->
        <div class="login-card">

            <!-- Bank logo -->
            <img src="Images/logo.png" class="logo" alt="ArixBank Logo" />

            <!-- System / brand name -->
            <h1 class="brand-name">ArixBank</h1>

            <!-- Page subtitle -->
            <p class="sub-title">Log In</p>

            <!-- Username input section -->
            <div class="input-group">
                <label>Username</label>
                <!-- Username textbox -->
                <asp:TextBox ID="txtUsername" runat="server" CssClass="input-box"></asp:TextBox>
            </div>
            <!-- Password input section -->
            <div class="input-group">
            <label>Password</label>
            <!-- Password wrapper for textbox + show/hide toggle -->
            <div class="password-wrap">
                <!-- Password textbox-->
                <asp:TextBox
                    ID="txtPassword"
                    runat="server"
                    TextMode="Password"
                    CssClass="input-box password-box">
                </asp:TextBox>
                <!-- Toggle password visibility -->
                <span class="toggle-password"
                      onclick="togglePassword('<%= txtPassword.ClientID %>', this)">
                    SHOW
                </span>
            </div>
        </div>
            <!-- Label for displaying login errors/messages -->
            <asp:Label ID="lblMessage" runat="server" CssClass="error-msg"></asp:Label>
            <!-- Login button -->
            <asp:Button ID="btnLogin" runat="server" Text="Log in"
                CssClass="btn-login" OnClick="BtnLogin_Click" />
            <!-- Register link for users without account -->
            <p class="footer-text">
            Don't have an account?
            <a href="<%= ResolveUrl("~/SignIn_Up/Register.aspx") %>" class="register-link">Register</a>
            </p>

        </div>
    </div>

    <script>
    // Toggles password visibility between hidden and visible
    function togglePassword(id, btn) {
        const box = document.getElementById(id);
        // Show password text
        if (box.type === "password") {
            box.type = "text";
            btn.innerText = "HIDE";
        // Hide password text
        } else {
            box.type = "password";
            btn.innerText = "SHOW";
        }
    }
    </script>

</form>
</body>
</html>