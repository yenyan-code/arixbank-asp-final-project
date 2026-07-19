<%@ Page Title="Settings"
    Language="C#"
    MasterPageFile="~/Site.Master"
    AutoEventWireup="true"
    CodeBehind="Settings.aspx.cs"
    Inherits="ASP_Final_Project.SettingsPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <!-- Settings page stylesheet -->
    <link href="<%= ResolveUrl("~/Pages/css/Settings.css") %>" rel="stylesheet" />

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <!-- Main settings page -->
    <div class="settings-page">

        <!-- Heading -->
        <h1>Security Settings</h1>

        <!-- Subtitle -->
        <p class="subtitle">
            Ensure your account remains secure.
        </p>

        <!-- Account details card -->
        <div class="settings-card">

            <h2>Account Details</h2>

            <!-- Name row -->
            <div class="row">

                <!-- First name -->
                <div class="field half">
                    <label>First Name</label>
                    <asp:TextBox
                        ID="txtFirstName"
                        runat="server"
                        CssClass="input"
                        ReadOnly="true" />
                </div>

                <!-- Last name -->
                <div class="field half">
                    <label>Last Name</label>
                    <asp:TextBox
                        ID="txtLastName"
                        runat="server"
                        CssClass="input"
                        ReadOnly="true" />
                </div>

            </div>

            <!-- Username -->
            <div class="field">
                <label>Username</label>
                <asp:TextBox
                    ID="txtUsername"
                    runat="server"
                    CssClass="input"
                    ReadOnly="true" />
            </div>

            <!-- Masked password -->
            <div class="field">
                <label>Password</label>
                <asp:TextBox
                    ID="txtPassword"
                    runat="server"
                    CssClass="input"
                    ReadOnly="true" />
            </div>

            <!-- Change password button -->
            <div class="btn-wrap">
                <asp:Button
                    ID="btnChangePassword"
                    runat="server"
                    Text="Change Password"
                    CssClass="change-btn"
                    PostBackUrl="~/Pages/ChangePassword.aspx" />
            </div>

        </div>

    </div>

</asp:Content>