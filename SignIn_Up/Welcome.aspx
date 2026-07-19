<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Welcome.aspx.cs" Inherits="ASP_Final_Project.Welcome" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title>ArixBank</title>
 <link href="CSS/Welcome.css" rel="stylesheet" type="text/css" />

</head>
<body>
<form runat="server">

<div class="container">
    <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="btnRegister" OnClick="BtnRegister_Click" />
    <asp:Button ID="btnLogin" runat="server" Text="Log in" CssClass="btnLogin" OnClick="BtnLogin_Click" />
</div>
    </form>
</body>
</html>