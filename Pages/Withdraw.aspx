<%@ Page Title="Withdraw"
    Language="C#"
    MasterPageFile="~/Site.Master"
    AutoEventWireup="true"
    CodeBehind="Withdraw.aspx.cs"
    Inherits="ASP_Final_Project.Pages.Withdraw" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <!-- Withdraw page stylesheet -->
    <link href="<%= ResolveUrl("~/Pages/css/Withdraw.css") %>" rel="stylesheet" />

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <!-- Main withdraw page layout -->
    <div class="withdraw-page">

        <!-- LEFT SECTION -->
        <div class="withdraw-left">

            <!-- Page heading -->
            <h1>Withdraw Funds</h1>

            <!-- Subtitle -->
            <p class="subtitle">
                Withdraw money from your ArixBank account instantly.
            </p>

            <!-- Withdraw form -->
            <div class="withdraw-form">

                <!-- Amount section -->
                <div class="section-label">WITHDRAW AMOUNT</div>

                <!-- Amount input -->
                <asp:TextBox
                    ID="txtAmount"
                    runat="server"
                    CssClass="pill-input full"
                    placeholder="0.00">
                </asp:TextBox>

                <!-- Quick amount buttons -->
                <div class="amount-buttons">
                    <asp:Button runat="server" Text="100.00" CssClass="amount-btn" OnClick="QuickAmount_Click" />
                    <asp:Button runat="server" Text="500.00" CssClass="amount-btn" OnClick="QuickAmount_Click" />
                    <asp:Button runat="server" Text="1,000.00" CssClass="amount-btn" OnClick="QuickAmount_Click" />
                    <asp:Button runat="server" Text="2,000.00" CssClass="amount-btn" OnClick="QuickAmount_Click" />
                </div>

                <!-- Validation / status message -->
                <asp:Label
                    ID="lblMessage"
                    runat="server"
                    CssClass="msg">
                </asp:Label>

                <!-- Action buttons -->
                <div class="bottom-buttons">

                    <!-- Cancel -->
                    <asp:Button
                        ID="btnCancel"
                        runat="server"
                        Text="Cancel"
                        CssClass="cancel-btn"
                        OnClick="BtnCancel_Click" />

                    <!-- Confirm withdrawal -->
                    <asp:Button
                        ID="btnWithdraw"
                        runat="server"
                        Text="Confirm Withdraw"
                        CssClass="send-btn"
                        OnClick="BtnWithdraw_Click" />

                </div>

            </div>

        </div>

        <!-- RIGHT SECTION -->
        <div class="withdraw-right">

            <!-- Available balance -->
            <div class="balance-card">
                <div class="balance-title">Available Balance</div>

                <div class="balance-amount">
                    ₱<asp:Label ID="lblBalance" runat="server" Text="0.00"></asp:Label>
                </div>
            </div>

            <!-- Withdraw rules -->
            <div class="rules-card">
                <h3>Withdraw Rules</h3>

                <ul>
                    <li><b>Minimum Withdraw</b><br />Minimum of 100.00 required per withdrawal</li>
                    <li><b>Maximum Withdraw</b><br />Up to 2,000.00 per single withdrawal</li>
                    <li><b>Increment Rule</b><br />Amount must be divisible by 100</li>
                    <li><b>Funds Verification</b><br />Withdrawal blocked if funds are insufficient</li>
                </ul>
            </div>

        </div>

    </div>

</asp:Content>