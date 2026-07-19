    <%@ Page Language="C#" AutoEventWireup="true"
        CodeBehind="WithdrawSuccess.aspx.cs"
        Inherits="ASP_Final_Project.Pages.WithdrawSuccess" %>

    <!DOCTYPE html>
    <html>
    <head runat="server">

        <!-- Browser tab title -->
        <title>Withdrawal Successful</title>

        <!-- Success page stylesheet -->
        <link href="<%= ResolveUrl("~/Pages/css/WithdrawSuccess.css") %>" rel="stylesheet" />

    </head>
    <body class="success-body">

        <!-- Main ASP.NET form -->
        <form id="form1" runat="server">

            <!-- Success card -->
            <div class="success-card">

                <!-- Success icon -->
                <div class="check-wrap">
                    <img src="<%= ResolveUrl("~/Pages/Img/checkmark.png") %>"
                        alt="Success"
                        class="check-img" />
                </div>

                <!-- Heading -->
                <h1>Withdrawal Successful!</h1>

                <!-- Confirmation text -->
                <p class="success-msg">
                    Funds successfully withdrawn from your account.
                </p>

                <!-- Receipt details -->
                <div class="receipt-box">

                    <!-- Withdraw amount -->
                    <div class="row">
                        <span>Amount</span>
                        <strong>
                            ₱<asp:Label ID="lblAmount" runat="server" />
                        </strong>
                    </div>

                    <!-- Date -->
                    <div class="row">
                        <span>Date</span>
                        <span>
                            <asp:Label ID="lblDate" runat="server" />
                        </span>
                    </div>

                </div>

                <!-- Return button -->
                <asp:Button
                    ID="btnDashboard"
                    runat="server"
                    Text="Return to Dashboard"
                    CssClass="return-btn"
                    OnClick="btnDashboard_Click" />

            </div>

        </form>

    </body>
    </html>