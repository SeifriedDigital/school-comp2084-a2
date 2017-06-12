<%@ Page Title="Register - Maintenance Minder" Language="C#" MasterPageFile="~/template.Master" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="comp2084_a2_app.register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container" id="register">
        <h2>Create Account</h2>
    
        <div class="form-horizontal col-xs-10 col-sm-6">
            <div class="form-group">
                <label for="username">User Name</label>
                <asp:TextBox ID="username" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ControlToValidate="username" ID="username_rfv" runat="server" ErrorMessage="*Username Required" CssClass="alert-danger pull-right"></asp:RequiredFieldValidator>
            </div>

            <div class="form-group">
                <label for="email">Email</label>
                <asp:TextBox ID="email" runat="server" type="email" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ControlToValidate="email" ID="email_rfv" runat="server" ErrorMessage="*Email Required" CssClass="alert-danger pull-right"></asp:RequiredFieldValidator>
            </div>

            <div class="form-group">
                <label for="phone_number">Phone Number</label>
                <asp:TextBox ID="phone_number" runat="server" type="tel" CssClass="form-control"></asp:TextBox>
                <asp:CompareValidator ControlToValidate="phone_number" ID="phone_number_cv" runat="server" Type="Integer" Operator="DataTypeCheck" ErrorMessage="*Must be a number" CssClass="alert-danger pull-right" />
            </div>

            <div class="form-group">
                <label for="password">Password</label>
                <asp:TextBox ID="password" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ControlToValidate="password" ID="password_rfv1" runat="server" ErrorMessage="*Password Required" CssClass="alert-danger pull-right"></asp:RequiredFieldValidator>
            </div>

            <div class="form-group">
                <label for="confirm_passworsd">Confirm Password</label>
                <asp:TextBox ID="confirm_password" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ControlToValidate="confirm_password" ID="password_rfv2" runat="server" ErrorMessage="*Confirm Password" CssClass="alert-danger pull-right"></asp:RequiredFieldValidator>
            </div>

            <div class="form-group text-center">
                <asp:Button Text="Register" runat="server" CssClass="btn" OnClick="Create_User" />
            </div>

            <div class="form-group text-center form-msg">
                <asp:Label ID="registration_msg" runat="server" CssClass="alert alert-danger"></asp:Label>
            </div>
        </div>
    </div>
</asp:Content>
