<%@ Page Title="Deposits & Withdrawals"
    Language="C#"
    MasterPageFile="~/Reports.Master"
    AutoEventWireup="true"
    CodeBehind="DepositsWithdrawals.aspx.cs"
    Inherits="ASP_Final_Project.DepositsWithdrawals" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Deposits & Withdrawals stylesheet -->
    <link href="<%= ResolveUrl("~/Pages/css/DepositsWithdrawals.css") %>" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Main report container -->
    <div class="statement-container">
        <!-- Page heading -->
        <h1>Deposits & Withdrawals</h1>
        <p class="subtitle">View your deposit and withdrawal history</p>

        <!-- FILTER CARD -->
        <div class="filter-card">
            <!-- Date From -->
            <div class="filter-group">
                <label>Date From</label>
                <asp:TextBox
                    ID="txtDateFrom"
                    runat="server"
                    TextMode="Date"
                    CssClass="date-input" />
            </div>
            <!-- Date To -->
            <div class="filter-group">
                <label>Date To</label>
                <asp:TextBox
                    ID="txtDateTo"
                    runat="server"
                    TextMode="Date"
                    CssClass="date-input" />
            </div>
            <!-- Transaction type filter -->
            <div class="filter-group">
                <label>Type</label>
                <asp:DropDownList
                    ID="ddlType"
                    runat="server"
                    CssClass="date-input">
                    <asp:ListItem Text="All" Value="All" />
                    <asp:ListItem Text="Deposit" Value="Deposit" />
                    <asp:ListItem Text="Withdrawal" Value="Withdraw" />
                </asp:DropDownList>
            </div>
            <!-- Load report button -->
            <div class="filter-actions">
                <asp:Button
                    ID="btnList"
                    runat="server"
                    Text="List"
                    CssClass="list-btn"
                    OnClick="BtnList_Click" />
            </div>

        </div>
        <!-- Status message -->
        <asp:Label
            ID="lblMessage"
            runat="server"
            CssClass="msg">
        </asp:Label>

        <!-- REPORT TABLE -->
        <div class="table-card">

            <asp:GridView
                ID="gvReport"
                runat="server"
                AutoGenerateColumns="False"
                CssClass="statement-grid"
                GridLines="None">

                <Columns>

                    <asp:BoundField DataField="SeqNo" HeaderText="Seq #" />

                    <asp:TemplateField HeaderText="Type">
                        <ItemTemplate>
                            <span class='badge <%# Eval("BadgeClass") %>'>
                                <%# Eval("TransactionType") %>
                            </span>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:BoundField DataField="DateTime" HeaderText="Date / Time" />
                    <asp:BoundField DataField="Amount" HeaderText="Amount" />
                    <asp:BoundField DataField="Balance" HeaderText="Balance" />

                </Columns>

            </asp:GridView>

        </div>

    </div>

</asp:Content>