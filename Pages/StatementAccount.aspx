<%@ Page Title="Statement of Account"
    Language="C#"
    MasterPageFile="~/Reports.Master"
    AutoEventWireup="true"
    CodeBehind="StatementAccount.aspx.cs"
    Inherits="ASP_Final_Project.StatementAccount" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Statement of Account page stylesheet -->
    <link href="<%= ResolveUrl("~/Pages/css/StatementAccount.css") %>" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

      <!-- Main statement page container -->
    <div class="statement-container">
        <!-- Page heading -->
        <h1>Statement of Account</h1>
        <p class="subtitle">View your complete transaction history</p>

        <!-- FILTER -->
        <div class="filter-card">
            <!-- Date From filter -->
            <div class="filter-group">
                <label>Date From</label>
                <asp:TextBox
                    ID="txtDateFrom"
                    runat="server"
                    TextMode="Date"
                    CssClass="date-input" />
            </div>
            <!-- Date To filter -->
            <div class="filter-group">
                <label>Date To</label>
                <asp:TextBox
                    ID="txtDateTo"
                    runat="server"
                    TextMode="Date"
                    CssClass="date-input" />
            </div>
            <!-- Filter action button -->
            <div class="filter-actions">
                <asp:Button
                    ID="btnList"
                    runat="server"
                    Text="List"
                    CssClass="list-btn"
                    OnClick="BtnList_Click" />
            </div>

        </div>
        <!-- Status / validation message -->
        <asp:Label
            ID="lblMessage"
            runat="server"
            CssClass="msg">
        </asp:Label>

        <!-- TRANSACTION TABLE -->
        <div class="table-card">

            <asp:GridView
                ID="gvStatement"
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
                    <asp:BoundField DataField="Debit" HeaderText="Debit" />
                    <asp:BoundField DataField="Credit" HeaderText="Credit" />
                    <asp:BoundField DataField="Balance" HeaderText="Balance" />
                    <asp:BoundField DataField="SentTo" HeaderText="Sent To" />
                    <asp:BoundField DataField="ReceivedFrom" HeaderText="Received From" />

                </Columns>

            </asp:GridView>

        </div>

    </div>

</asp:Content>