<%@ Page Title="Logs - Maintenance Minder" Language="C#" MasterPageFile="~/template.Master" AutoEventWireup="true" CodeBehind="logs.aspx.cs" Inherits="comp2084_a2_app.logs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <script src="<%=ResolveUrl("~/scripts/sorttable.js")%>" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="vertical-center space-between">
            <h2 class="inline">Maintenance Logs</h2>
            <a href="<%=ResolveUrl("~/private/add-log.aspx")%>" class="btn btn-default pull-right">Add Log</a>
        </div>

        <asp:GridView ID="logsGrid" runat="server" AutoGenerateColumns="false" DataKeyNames="Id" OnRowDeleting="logsGrid_RowDeleting" CssClass="table table-hover table-bordered sortable">
            <Columns>
                <asp:BoundField DataField="Id" Visible="false" />
                <asp:BoundField DataField="title" HeaderText="Title" HeaderStyle-CssClass="text-center" />
                <asp:BoundField DataField="assetCallSign" HeaderText="Asset" HeaderStyle-CssClass="text-center" />
                <asp:BoundField DataField="createdDate" HeaderText="Created" DataFormatString="{0:dd-MM-yyyy HH:mm}" HeaderStyle-CssClass="text-center" />
                <asp:HyperLinkField HeaderText="View/Edit" Text="View/Edit" NavigateUrl="~/private/add-log.aspx" DataNavigateUrlFields="Id" DataNavigateUrlFormatString="~/private/add-log.aspx?logId={0}" ItemStyle-CssClass="text-center" ControlStyle-CssClass="btn btn-sm btn-default" HeaderStyle-CssClass="text-center" />
                <asp:CommandField HeaderText="Delete" ShowDeleteButton="true" ItemStyle-CssClass="text-center" ControlStyle-CssClass="btn btn-sm btn-danger confirm" HeaderStyle-CssClass="text-center"  />
            </Columns>
        </asp:GridView>
        <asp:Label ID="logsMsg" runat="server"></asp:Label>
    </div> 
</asp:Content>
