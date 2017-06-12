<%@ Page Title="Dashboard - Maintenance Minder" Language="C#" MasterPageFile="~/template.Master" AutoEventWireup="true" CodeBehind="dashboard.aspx.cs" Inherits="comp2084_a2_app.dashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <script src="<%=ResolveUrl("~/scripts/sorttable.js")%>" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container" id="dashboard">
        <div class="row">
            <h2>Dashboard</h2>
        </div>
        
        <div class="row">
            <div class="col-xs-5 dash-table">
                <h3>Recent Assets</h3>
                <asp:GridView ID="recentAssetsGrid" runat="server" AutoGenerateColumns="false" CssClass="table table-hover table-bordered sortable">
                    <Columns>
                        <asp:BoundField DataField="callSign" HeaderText="Call Sign / Name" HeaderStyle-CssClass="text-center" />
                        <asp:BoundField DataField="createdDate" HeaderText="Created" DataFormatString="{0:dd-MM-yyyy HH:mm}" HeaderStyle-CssClass="text-center" />
                    </Columns>
                </asp:GridView>
                <div>
                    <asp:Label ID="recentAssetsMsg" runat="server"></asp:Label>
                </div>
                <a href="<%=ResolveUrl("~/private/assets.aspx")%>" title="View More Assets" class="pull-right">View All</a>
            </div>

            <div class="col-xs-6 col-sm-offset-1 dash-table">
                <h3>Recent Logs</h3>
               <asp:GridView ID="recentLogsGrid" runat="server" AutoGenerateColumns="false" CssClass="table table-hover table-bordered sortable">
                   <Columns>
                        <asp:BoundField DataField="title" HeaderText="Title" HeaderStyle-CssClass="text-center" />
                        <asp:BoundField DataField="assetCallSign" HeaderText="Asset" HeaderStyle-CssClass="text-center" />
                        <asp:BoundField DataField="createdDate" HeaderText="Created" DataFormatString="{0:dd-MM-yyyy HH:mm}" HeaderStyle-CssClass="text-center" />
                    </Columns>
                </asp:GridView>
                <div>
                    <asp:Label ID="recentLogsMsg" runat="server"></asp:Label>
                </div>
                <a href="<%=ResolveUrl("~/private/logs.aspx")%>" title="View More Logs" class="pull-right">View All</a>
            </div>
        </div>
    </div>
</asp:Content>
