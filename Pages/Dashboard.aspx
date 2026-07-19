<%@ Page Title="Dashboard"
    Language="C#"
    MasterPageFile="~/Site.Master"
    AutoEventWireup="true"
    CodeBehind="Dashboard.aspx.cs"
    Inherits="ASP_Final_Project.Pages.Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <!-- Dashboard-specific stylesheet -->
    <link href='<%= ResolveUrl("~/Pages/css/Dashboard.css") %>' rel="stylesheet" type="text/css" />

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <!-- Main dashboard layout -->
    <div class="dashboard-grid">

        <!-- LEFT SIDE -->
        <div class="left-section">

            <!-- Welcome / account information card -->
            <div class="welcome-card">

                <p class="welcome-text">Welcome!</p>

                <!-- Logged-in user's full name -->
                <h1 class="full-name">
                    <asp:Label ID="lblFullName" runat="server"></asp:Label>
                </h1>

                <!-- Account details -->
                <div class="account-info">

                    <p>
                        Account Number:
                        <span>
                            <!-- Account number display -->
                            <asp:Label ID="lblAccountNo" runat="server"></asp:Label>
                        </span>
                    </p>

                    <p>
                        Registered Since:
                        <span>
                            <!-- Registration date display -->
                            <asp:Label ID="lblRegisteredDate" runat="server"></asp:Label>
                        </span>
                    </p>

                </div>
            </div>

            <!-- Financial summary cards -->
            <div class="summary-row">

                <!-- Current balance -->
                <div class="info-card">
                    <p class="card-title">Total Current Balance</p>
                    <h2 class="amount">
                        &#8369;<asp:Label ID="lblBalance" runat="server"></asp:Label>
                    </h2>
                </div>

                <!-- Total sent amount -->
                <div class="info-card">
                    <p class="card-title">Total Sent Amount</p>
                    <h2 class="amount">
                        &#8369;<asp:Label ID="lblSentAmount" runat="server"></asp:Label>
                    </h2>
                </div>

            </div>

        </div>

        <!-- RIGHT SIDE -->
        <div class="right-section">

            <!-- Notification card -->
            <div class="notification-card">

                <div class="notification-header">
                    <span>Recent Notifications</span>
                </div>

                <!-- Notification list -->
                <asp:Repeater ID="rptNotifications" runat="server">
                    <ItemTemplate>

                        <div class="notification-item">

                            <!-- Notification message -->
                            <span class="notif-message">
                                <%# Eval("Message") %>
                            </span>

                            <!-- Relative time display -->
                            <span class="notif-time">
                                <%# Eval("TimeAgo") %>
                            </span>

                        </div>

                    </ItemTemplate>
                </asp:Repeater>

            </div>

        </div>

    </div>

</asp:Content>