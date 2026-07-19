<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="TransferSuccess.aspx.cs"
    Inherits="ASP_Final_Project.Pages.TransferSuccess" %>

<!DOCTYPE html>
<html>
<head runat="server">

    <!-- Browser tab title -->
    <title>Transfer Success</title>

    <!-- Success page stylesheet -->
    <link href="<%= ResolveUrl("~/Pages/css/TransferSuccess.css") %>" rel="stylesheet" />

</head>
<body class="success-body">

    <!-- Main ASP.NET form -->
    <form id="form1" runat="server">

        <!-- Success card container -->
        <div class="success-card">

            <!-- Success icon -->
            <div class="check-wrap">
                <img src="<%= ResolveUrl("~/Pages/Img/checkmark.png") %>"
                     class="check-img" />
            </div>

            <!-- Heading -->
            <h1>Transfer Successful!</h1>

            <!-- Confirmation message -->
            <p class="success-msg">
                Your funds have been securely sent!
            </p>

            <!-- Receipt summary -->
            <div class="receipt-box">

                <!-- Amount -->
                <div class="row">
                    <span>Amount</span>
                    <strong>
                        <asp:Label ID="lblAmount" runat="server" />
                    </strong>
                </div>

                <!-- Date -->
                <div class="row">
                    <span>Date</span>
                    <span>
                        <asp:Label ID="lblDate" runat="server" />
                    </span>
                </div>

                <!-- Recipient -->
                <div class="row">
                    <span>Recipient</span>
                    <span>
                        <asp:Label ID="lblRecipient" runat="server" />
                    </span>
                </div>

            </div>

            <!-- Return button -->
            <asp:Button ID="btnReturn"
                runat="server"
                Text="Return to Dashboard"
                CssClass="return-btn"
                OnClick="btnReturn_Click" />

        </div>

    </form>

</body>
</html>