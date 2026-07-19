<%@ Page Title="Sent & Received"
    Language="C#"
    MasterPageFile="~/Reports.Master"
    AutoEventWireup="true"
    CodeBehind="SentReceived.aspx.cs"
    Inherits="ASP_Final_Project.SentReceived" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Sent & Received stylesheet -->
    <link href="<%= ResolveUrl("~/Pages/css/SentReceived.css") %>" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Main report container -->
    <div class="statement-container">
        <!-- Page heading -->
        <h1>Sent & Received</h1>
        <p class="subtitle">View your sent and received transactions</p>

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
            <!-- Type filter -->
            <div class="filter-group">
                <label>Type</label>
                <asp:DropDownList
                    ID="ddlType"
                    runat="server"
                    CssClass="date-input">
                    <asp:ListItem Text="All" Value="All" />
                    <asp:ListItem Text="Sent" Value="Sent" />
                    <asp:ListItem Text="Received" Value="Received" />
                </asp:DropDownList>
            </div>
            <!-- Load report -->
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

        <!-- TABLE -->
        <div class="table-card">

            <asp:GridView
                ID="gvSentReceived"
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
                    <asp:BoundField DataField="SentTo" HeaderText="Sent To" />
                    <asp:BoundField DataField="ReceivedFrom" HeaderText="Received From" />

                </Columns>

            </asp:GridView>

        </div>

    </div>

</asp:Content>