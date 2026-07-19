<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="DepositSuccess.aspx.cs"
    Inherits="ASP_Final_Project.Pages.DepositSuccess" %>

<!DOCTYPE html>
<html>
<head runat="server">

    <!-- Browser tab title -->
    <title>Deposit Successful</title>

    <!-- Success page stylesheet -->
    <link href="<%= ResolveUrl("~/Pages/css/DepositSuccess.css") %>" rel="stylesheet" />

</head>
<body>

    <!-- Main ASP.NET form -->
    <form id="form1" runat="server">

        <!-- Success page wrapper -->
        <div class="success-page">

            <!-- Success card -->
            <div class="success-card">

                <!-- Success icon -->
                <div class="check-holder">
                    <img src="<%= ResolveUrl("~/Pages/Img/checkmark.png") %>" alt="Success" />
                </div>

                <!-- Success heading -->
                <h1>Deposit Successful!</h1>

                <!-- Confirmation text -->
                <p class="subtitle">
                    Your funds have been securely added to your ArixBank account.
                </p>

                <!-- Receipt details -->
                <div class="receipt-box">

                    <!-- Deposit amount -->
                    <div class="row">
                        <span>Amount</span>
                        <strong>
                            ₱<asp:Label ID="lblAmount" runat="server"></asp:Label>
                        </strong>
                    </div>

                    <!-- Deposit date -->
                    <div class="row">
                        <span>Date</span>
                        <span>
                            <asp:Label ID="lblDate" runat="server"></asp:Label>
                        </span>
                    </div>

                </div>

                <!-- Return to dashboard button -->
                <asp:Button
                    ID="btnDashboard"
                    runat="server"
                    Text="Return to Dashboard"
                    CssClass="return-btn"
                    OnClick="BtnDashboard_Click" />

            </div>

        </div>

    </form>

</body>
</html>