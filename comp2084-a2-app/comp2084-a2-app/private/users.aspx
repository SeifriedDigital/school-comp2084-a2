<%@ Page Title="Users - Maintenance Minder" Language="C#" MasterPageFile="~/template.Master" AutoEventWireup="true" CodeBehind="users.aspx.cs" Inherits="comp2084_a2_app.users" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <script src="<%=ResolveUrl("~/scripts/sorttable.js")%>" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container" id="users">
        <h2>Application Users</h2>

        <asp:GridView ID="usersGrid" runat="server" AutoGenerateColumns="false" DataKeyNames="Id" OnRowDeleting="usersGrid_RowDeleting" CssClass="table table-hover table-bordered sortable">
            <Columns>
                <asp:BoundField DataField="Id" Visible="false" />
                <asp:BoundField DataField="UserName" HeaderText="User Name" HeaderStyle-CssClass="text-center" />
                <asp:BoundField DataField="Email" HeaderText="Email" HeaderStyle-CssClass="text-center" />
                <asp:BoundField DataField="PhoneNumber" HeaderText="Phone" HeaderStyle-CssClass="text-center" />
                <asp:CommandField HeaderText="Delete" ShowDeleteButton="true" ItemStyle-CssClass="text-center" ControlStyle-CssClass="btn btn-sm btn-danger confirm" />
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
