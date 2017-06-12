<%@ Page Title="Maintenance Minder" Language="C#" MasterPageFile="~/template.Master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="comp2084_a2_app._default" %>
<asp:Content ID="DefaultHead" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="DefaultMain" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container" id="default">
        <img src="imgs/gears.svg" alt="Logo" />
        <div class="form-horizontal col-xs-10 col-sm-6">
            <div class="form-group">
                <label for="username">Username</label>
                <asp:TextBox ID="username" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ControlToValidate="username" ID="username_rfv" runat="server" ErrorMessage="*Username Required" CssClass="alert-danger pull-right"></asp:RequiredFieldValidator>
            </div>

            <div class="form-group">
                <label for="password">Password</label>
                <asp:TextBox ID="password" runat="server" type="password" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ControlToValidate="password" ID="RequiredFieldValidator1" runat="server" ErrorMessage="*Password Required" CssClass="alert-danger pull-right"></asp:RequiredFieldValidator>
            </div>

            <div class="form-group text-center">
                <asp:Button Text="Login" runat="server" CssClass="btn" OnClick="Login_User" />
            </div>

            <div class="form-group text-center form-msg">
                <asp:Label ID="login_msg" runat="server" CssClass="alert alert-danger"></asp:Label>
            </div>
        </div> <!-- /div.form-horizontal -->
        <div class="col-xs-10 col-sm-6">
            <a href="#" class="pull-right">Forgot password</a>
        </div>
     </div> <!-- /div.container -->
</asp:Content>
