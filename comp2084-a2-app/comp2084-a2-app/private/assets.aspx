<%@ Page Title="Assets - Maintenance Minder" Language="C#" MasterPageFile="~/template.Master" AutoEventWireup="true" CodeBehind="assets.aspx.cs" Inherits="comp2084_a2_app.assets" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <script src="<%=ResolveUrl("~/scripts/sorttable.js")%>" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container" id="assets">
        <div class="vertical-center space-between">
            <h2 class="inline">Assets</h2>
            <a href="<%=ResolveUrl("~/private/add-asset.aspx")%>" class="btn btn-default pull-right">Add Asset</a>
        </div>

        <asp:GridView ID="assetsGrid" runat="server" AutoGenerateColumns="false" DataKeyNames="Id" OnRowDeleting="assetsGrid_RowDeleting" CssClass="table table-hover table-bordered sortable">
            <Columns>
                <asp:BoundField DataField="Id" Visible="false" />
                <asp:BoundField DataField="callSign" HeaderText="Call Sign / Name" HeaderStyle-CssClass="text-center" />
                <asp:BoundField DataField="year" HeaderText="Year" HeaderStyle-CssClass="text-center" />
                <asp:BoundField DataField="brand" HeaderText="Make" HeaderStyle-CssClass="text-center" />
                <asp:BoundField DataField="model" HeaderText="Model" HeaderStyle-CssClass="text-center" />
                <asp:BoundField DataField="createdDate" HeaderText="Created" DataFormatString="{0:dd-MM-yyyy HH:mm}" HeaderStyle-CssClass="text-center" />
                <asp:HyperLinkField HeaderText="View/Edit" Text="View/Edit" NavigateUrl="~/private/add-asset.aspx" DataNavigateUrlFields="Id" DataNavigateUrlFormatString="~/private/add-asset.aspx?assetId={0}" ItemStyle-CssClass="text-center" ControlStyle-CssClass="btn btn-sm btn-default" HeaderStyle-CssClass="text-center" />
                <asp:CommandField HeaderText="Delete" ShowDeleteButton="true" ItemStyle-CssClass="text-center" ControlStyle-CssClass="btn btn-sm btn-danger confirm" HeaderStyle-CssClass="text-center"  />
            </Columns>
        </asp:GridView>
        <asp:Label ID="assetsMsg" runat="server"></asp:Label>
    </div> 
</asp:Content>
