<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="ASP_Final_Project.SignIn_Up.Register" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <!-- Browser tab title -->
    <title>Register</title>

    <!-- External stylesheet for Register page -->
    <link href="CSS/Register.css" rel="stylesheet" type="text/css" />

</head>
<body>

<!-- Main ASP.NET form -->
<form id="form1" runat="server">

    <!-- Main registration card wrapper -->
    <div class="card-container">
        <div class="register-card">

            <!-- Branding / header section -->
            <div class="header">
                <img src="Images/logo.png?v=1" class="logo" />
                <h1>ArixBank</h1>
                <p>Create Account</p>
            </div>

            <!-- Success panel shown after successful registration -->
            <asp:Panel ID="pnlSuccess" runat="server" Visible="false" CssClass="success-panel">

                <!-- Success heading -->
                <h2 class="success-title">Registration Successful</h2>

                <!-- Informational text -->
                <p class="success-text">
                    Welcome to ArixBank.<br />
                    Your Account Number is:
                </p>

                <!-- Generated account number display -->
                <div class="account-number-box">
                    <asp:Label ID="lblAccountNumber" runat="server"></asp:Label>
                </div>

                <!-- Reminder for user -->
                <p class="save-note">
                    Please save this account number for future transactions.
                </p>

                <!-- Redirect button to Login page -->
                <asp:Button
                    ID="btnGoLogin"
                    runat="server"
                    Text="Go to Login"
                    CssClass="btnRegister"
                    PostBackUrl="~/SignIn_Up/Login.aspx" />

            </asp:Panel>

            <!-- Registration form panel -->
            <asp:Panel ID="pnlForm" runat="server">

                <!-- First Name + Last Name row -->
                <div class="row">

                    <div class="input-group">
                        <label>First Name</label>

                        <!-- First name textbox -->
                        <asp:TextBox ID="txtFirstName" runat="server" CssClass="box" />
                    </div>

                    <div class="input-group">
                        <label>Last Name</label>

                        <!-- Last name textbox -->
                        <asp:TextBox ID="txtLastName" runat="server" CssClass="box" />
                    </div>

                </div>

                <!-- Username field -->
                <div class="input-group full-width">
                    <label>Username</label>
                    <asp:TextBox ID="txtUsername" runat="server" CssClass="box" />
                </div>

                <!-- Password section -->
                <div class="row">

                    <!-- Password -->
                    <div class="input-group">
                        <label>Password</label>

                        <div class="password-wrap">

                            <!-- Password textbox -->
                            <asp:TextBox
                                ID="txtPassword"
                                runat="server"
                                CssClass="box"
                                TextMode="Password" />

                            <!-- Toggle password visibility -->
                            <span
                                class="toggle-password"
                                onclick="togglePassword('<%= txtPassword.ClientID %>', this)">
                                SHOW
                            </span>

                        </div>
                    </div>

                    <!-- Confirm Password -->
                    <div class="input-group">
                        <label>Confirm Password</label>

                        <div class="password-wrap">

                            <!-- Confirm password textbox -->
                            <asp:TextBox
                                ID="txtConfirm"
                                runat="server"
                                CssClass="box"
                                TextMode="Password" />

                            <!-- Toggle confirm password visibility -->
                            <span
                                class="toggle-password"
                                onclick="togglePassword('<%= txtConfirm.ClientID %>', this)">
                                SHOW
                            </span>

                        </div>
                    </div>

                </div>

                <!-- Validation / error message label -->
                <asp:Label ID="lblMessage" runat="server" CssClass="msg" />

                <!-- Register button -->
                <asp:Button
                    ID="btnRegister"
                    runat="server"
                    Text="Register"
                    CssClass="btnRegister"
                    OnClick="BtnRegister_Click" />

                <!-- Link to Login page -->
                <p class="footer-text">
                    Already have account?
                    <a href="<%= ResolveUrl("~/SignIn_Up/Login.aspx") %>" class="loginLink">Log in</a>
                </p>

            </asp:Panel>

        </div>
    </div>

    <script>
        // Toggle password visibility
        function togglePassword(id, btn) {
            const box = document.getElementById(id);

            // Show password
            if (box.type === "password") {
                box.type = "text";
                btn.innerText = "HIDE";
            }
            // Hide password
            else {
                box.type = "password";
                btn.innerText = "SHOW";
            }
        }
    </script>

</form>
</body>
</html>