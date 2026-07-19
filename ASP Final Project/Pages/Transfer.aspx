<%@ Page Title="Transfer"
    Language="C#"
    MasterPageFile="~/Site.Master"
    AutoEventWireup="true"
    CodeBehind="Transfer.aspx.cs"
    Inherits="ASP_Final_Project.Pages.Transfer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <!-- Transfer page stylesheet -->
    <link href="<%= ResolveUrl("~/Pages/css/Transfer.css") %>" rel="stylesheet" />

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <!-- Main transfer page layout -->
    <div class="transfer-page">

        <!-- LEFT SECTION -->
        <div class="transfer-left">

            <!-- Page heading -->
            <h1>Transfer Funds</h1>

            <!-- Page subtitle -->
            <p class="subtitle">
                Send Funds securely to any ArixBank account instantly.
            </p>

            <!-- Transfer form container -->
            <div class="transfer-form">

                <!-- Recipient details section -->
                <div class="section-label">RECIPIENT DETAILS</div>

                <div class="row two">

                    <!-- Recipient account number input -->
                    <asp:TextBox
                        ID="txtAccountNo"
                        runat="server"
                        CssClass="pill-input"
                        placeholder="Account Number"
                        AutoPostBack="true"
                        OnTextChanged="TxtAccountNo_TextChanged">
                    </asp:TextBox>

                    <!-- Auto-filled recipient full name -->
                    <asp:TextBox
                        ID="txtRecipientName"
                        runat="server"
                        CssClass="pill-input"
                        placeholder="Recipient Name"
                        ReadOnly="true">
                    </asp:TextBox>

                </div>

                <div class="line"></div>

                <!-- Transfer amount section -->
                <div class="section-label">TRANSFER AMOUNT</div>

                <!-- Manual amount input -->
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

                <div class="line"></div>

                <!-- Sender verification -->
                <div class="section-label">SENDER VERIFICATION</div>

                <!-- Password confirmation input -->
                <asp:TextBox
                    ID="txtPassword"
                    runat="server"
                    TextMode="Password"
                    CssClass="pill-input full"
                    placeholder="Enter Password to Confirm">
                </asp:TextBox>

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

                    <!-- Submit transfer -->
                    <asp:Button
                        ID="btnTransfer"
                        runat="server"
                        Text="Transfer"
                        CssClass="send-btn"
                        OnClick="BtnSend_Click" />

                </div>

            </div>

        </div>

        <!-- RIGHT SECTION -->
        <div class="transfer-right">

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

            <!-- Transfer rules -->
            <div class="rules-card">

                <h3>Transfer Rules</h3>

                <ul>
                    <li>
                        <b>Minimum Transfer</b><br />
                        Minimum of 100.00 required per transaction
                    </li>

                    <li>
                        <b>Maximum Transfer</b><br />
                        Up to 2,000.00 per single transaction
                    </li>

                    <li>
                        <b>Increment Rule</b><br />
                        Amount must be divisible by 100
                    </li>

                    <li>
                        <b>Funds Verification</b><br />
                        Transaction blocked if funds are insufficient
                    </li>

                    <li>
                        <b>Security Rule</b><br />
                        Current user password required to send
                    </li>
                </ul>

            </div>

        </div>

    </div>

</asp:Content>