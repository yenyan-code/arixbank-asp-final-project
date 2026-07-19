<%@ Page Title="Change Password"
    Language="C#"
    MasterPageFile="~/Site.Master"
    AutoEventWireup="true"
    CodeBehind="ChangePassword.aspx.cs"
    Inherits="ASP_Final_Project.ChangePasswordPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <!-- Change Password stylesheet -->
    <link href="<%= ResolveUrl("~/Pages/css/ChangePassword.css") %>" rel="stylesheet" />

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <!-- Main change password page -->
    <div class="change-page">

        <!-- Heading -->
        <h1>Security Settings</h1>

        <!-- Subtitle -->
        <p class="subtitle">
            Ensure your account remains secure.
        </p>

        <div class="change-layout">

            <!-- LEFT CARD -->
            <div class="change-card">

                <h2>Change Password</h2>

                <!-- Validation / status message -->
                <asp:Label
                    ID="lblMessage"
                    runat="server"
                    CssClass="msg">
                </asp:Label>

                <!-- Old password -->
                <div class="field">
                    <label>Old Password</label>
                    <div class="password-wrap">
                        <asp:TextBox
                            ID="txtOldPassword"
                            runat="server"
                            TextMode="Password"
                            CssClass="input password-input" />

                        <span class="toggle-pass"
                              onclick="togglePassword('<%= txtOldPassword.ClientID %>', this)">
                            SHOW
                        </span>
                    </div>
                </div>

                <!-- New password -->
                <div class="field">
                    <label>New Password</label>
                    <div class="password-wrap">
                        <asp:TextBox
                            ID="txtNewPassword"
                            runat="server"
                            TextMode="Password"
                            CssClass="input password-input" />

                        <span class="toggle-pass"
                              onclick="togglePassword('<%= txtNewPassword.ClientID %>', this)">
                            SHOW
                        </span>
                    </div>
                </div>

                <!-- Confirm password -->
                <div class="field">
                    <label>Confirm New Password</label>
                    <div class="password-wrap">
                        <asp:TextBox
                            ID="txtConfirmPassword"
                            runat="server"
                            TextMode="Password"
                            CssClass="input password-input" />

                        <span class="toggle-pass"
                              onclick="togglePassword('<%= txtConfirmPassword.ClientID %>', this)">
                            SHOW
                        </span>
                    </div>
                </div>

                <!-- Action buttons -->
                <div class="btn-row">

                    <!-- Cancel -->
                    <asp:Button
                        ID="btnCancel"
                        runat="server"
                        Text="Cancel"
                        CssClass="cancel-btn"
                        PostBackUrl="~/Pages/Settings.aspx" />

                    <!-- Update -->
                    <asp:Button
                        ID="btnUpdate"
                        runat="server"
                        Text="Update Password"
                        CssClass="update-btn"
                        OnClick="BtnUpdate_Click" />

                </div>

            </div>

            <!-- RIGHT CARD -->
            <div class="rules-card">

                <h3>Password Requirements</h3>

                <ul>
                    <li>Minimum of 8 characters</li>
                    <li>New password cannot be same as old password</li>
                    <li>Confirm password must match new password</li>
                </ul>

            </div>

        </div>

    </div>

    <!-- Password show/hide toggle -->
    <script>
        function togglePassword(id, el) {
            const input = document.getElementById(id);

            if (input.type === "password") {
                input.type = "text";
                el.innerText = "HIDE";
            } else {
                input.type = "password";
                el.innerText = "SHOW";
            }
        }
    </script>

</asp:Content>