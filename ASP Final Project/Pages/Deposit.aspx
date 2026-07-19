<%@ Page Title="Deposit"
    Language="C#"
    MasterPageFile="~/Site.Master"
    AutoEventWireup="true"
    CodeBehind="Deposit.aspx.cs"
    Inherits="ASP_Final_Project.Pages.Deposit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <!-- Deposit page stylesheet -->
    <link href="<%= ResolveUrl("~/Pages/css/Deposit.css") %>" rel="stylesheet" />

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <!-- Main deposit page layout -->
    <div class="deposit-page">

        <!-- LEFT SECTION -->
        <div class="deposit-left">

            <!-- Page heading -->
            <h1>Deposit Funds</h1>

            <!-- Subtitle -->
            <p class="subtitle">
                Add money to your ArixBank account instantly.
            </p>

            <!-- Deposit form -->
            <div class="deposit-form">

                <!-- Deposit amount section -->
                <div class="section-label">DEPOSIT AMOUNT</div>

                <!-- Amount textbox -->
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

                    <!-- Clear form -->
                    <asp:Button
                        ID="btnCancel"
                        runat="server"
                        Text="Cancel"
                        CssClass="cancel-btn"
                        OnClick="BtnCancel_Click" />

                    <!-- Confirm deposit -->
                    <asp:Button
                        ID="btnDeposit"
                        runat="server"
                        Text="Confirm Deposit"
                        CssClass="send-btn"
                        OnClick="BtnDeposit_Click" />

                </div>

            </div>

        </div>

        <!-- RIGHT SECTION -->
        <div class="deposit-right">

            <!-- Available balance card -->
            <div class="balance-card">

                <div class="balance-title">Available Balance</div>

                <div class="balance-amount">
                    ₱<asp:Label ID="lblBalance"
                        runat="server"
                        Text="0.00">
                    </asp:Label>
                </div>

            </div>

            <!-- Deposit rules -->
            <div class="rules-card">
                <h3>Deposit Rules</h3>

                <ul>
                    <li><b>Minimum Deposit</b><br />Minimum of 100.00 required per deposit</li>
                    <li><b>Maximum Deposit</b><br />Up to 2,000.00 per single deposit</li>
                    <li><b>Increment Rule</b><br />Amount must be divisible by 100</li>
                    <li><b>Account Ceiling</b><br />Total account balance cannot exceed 10,000.00</li>
                </ul>
            </div>

        </div>

    </div>

</asp:Content>