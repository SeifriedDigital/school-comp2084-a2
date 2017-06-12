<%@ Page Title="Add Log - Maintenance Minder" Language="C#" MasterPageFile="~/template.Master" AutoEventWireup="true" CodeBehind="add-log.aspx.cs" Inherits="comp2084_a2_app.add_log" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container" id="add-log">
        <h2><asp:Label ID="add_log_header" runat="server" Text="Add Log"></asp:Label></h2>

        <div class="form-horizontal col-xs-10 col-sm-6">
            <div class="form-group">
                <label for="title">Title</label><small class="pull-right">*Required</small>
                <asp:TextBox ID="title" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ControlToValidate="title" ID="title_rfv" runat="server" ErrorMessage="*Required" CssClass="alert-danger pull-right"></asp:RequiredFieldValidator>
            </div>

            <div class="form-group pad-bottom">
                <label for="notes">Notes</label>
                <asp:TextBox ID="notes" TextMode="MultiLine" Rows="5" spellcheck="true" runat="server" CssClass="form-control"></asp:TextBox>
            </div>

            <div class="form-group pad-bottom">
                <label for="assets">Asset</label>
                <asp:DropDownList ID="assets" runat="server" CssClass="form-control">
                </asp:DropDownList>
            </div>

            <div class="form-group text-center">
                <asp:Button ID="add_log_button" Text="Add Log" runat="server" CssClass="btn" OnClick="Save_Log" />
            </div>

            <div class="form-group text-center form-msg">
                <asp:Label ID="add_log_msg" runat="server" CssClass="alert alert-danger"></asp:Label>
            </div>
        </div>
    </div>
</asp:Content>
