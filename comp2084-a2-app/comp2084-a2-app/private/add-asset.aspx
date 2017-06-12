<%@ Page Title="Add Asset - Maintenance Minder" Language="C#" MasterPageFile="~/template.Master" AutoEventWireup="true" CodeBehind="add-asset.aspx.cs" Inherits="comp2084_a2_app.add_asset" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container" id="add-asset">
        <h2><asp:Label ID="add_asset_header" runat="server" Text="Add Asset"></asp:Label></h2>

        <div class="form-horizontal col-xs-10 col-sm-6">
            <div class="form-group">
                <label for="call_sign">Call Sign / Name</label><small class="pull-right">*Required</small>
                <asp:TextBox ID="call_sign" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ControlToValidate="call_sign" ID="call_sign_rfv" runat="server" ErrorMessage="*Required" CssClass="alert-danger pull-right"></asp:RequiredFieldValidator>
            </div>

            <div class="form-group multi-group">
                <div class="col-xs-4">
                    <label for="year">Year</label>
                    <asp:DropDownList ID="year" runat="server" CssClass="form-control">
                        <asp:ListItem Value=""> --Select-- </asp:ListItem>
                    </asp:DropDownList>
                </div>

                <div class="col-xs-4">
                    <label for="brand">Brand</label>
                    <asp:TextBox ID="brand" spellcheck="true" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                        
                <div class="col-xs-4">
                    <label for="model">Model</label>
                    <asp:TextBox ID="model" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
            </div>

            <div class="form-group">
                <label for="vin">VIN / Serial Code</label>
                <asp:TextBox ID="vin" runat="server" CssClass="form-control"></asp:TextBox>
            </div>

            <div class="form-group">
                <label for="hours">Runtime</label>
                <div class="input-group">
                    <span class="input-group-addon">Hours</span>
                    <asp:TextBox ID="hours" TextMode="Number" min="0" max="2147483647" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <asp:CompareValidator ControlToValidate="hours" ID="hours_cv" runat="server" Type="Integer" Operator="DataTypeCheck" ErrorMessage="*Must be a whole number" CssClass="alert-danger pull-right" />
            </div>

            <div class="form-group">
                <label for="odometer">Odometer</label>
                <div class="input-group">
                    <span class="input-group-addon">
                        <asp:DropDownList ID="odometer_unit" runat="server">
                          <asp:ListItem Value="0"> Kilometers </asp:ListItem>
                          <asp:ListItem Value="1"> Miles </asp:ListItem>
                       </asp:DropDownList>
                    </span>
                    <asp:TextBox ID="odometer" TextMode="Number" step="any" min="0" max="2147483647" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <asp:CompareValidator ControlToValidate="odometer" ID="odometer_cv" runat="server" Type="Integer" Operator="DataTypeCheck" ErrorMessage="*Must be a whole number" CssClass="alert-danger pull-right" />
            </div>

            <div class="form-group">
                <label for="purchased_date">Purchased Date</label>
                <asp:TextBox ID="purchased_date" type="Date" runat="server" CssClass="form-control"></asp:TextBox>
            </div>

            <div class="form-group">
                <label for="price_paid">Price Paid (after tax)</label>
                <div class="input-group">
                    <span class="input-group-addon">$</span>
                    <asp:TextBox ID="price_paid" TextMode="Number" min="0" max="2147483647" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <!-- http://www.aspsnippets.com/Articles/Regular-Expression-Regex-to-allow-both-decimals-as-well-as-integers-and-Regex-for-allowing-any-decimal-number.aspx -->
                <asp:RegularExpressionValidator ID="price_paid_rev" runat="server" ValidationExpression="((\d{0,9})((\.\d{1,2})?))$" ErrorMessage="Invalid price value" ControlToValidate="price_paid" CssClass="alert-danger pull-right" />
            </div>

            <div class="form-group pad-bottom">
                <label for="notes">Notes</label>
                <asp:TextBox ID="notes" TextMode="MultiLine" Rows="5" spellcheck="true" runat="server" CssClass="form-control"></asp:TextBox>
            </div>

            <div class="form-group text-center">
                <asp:Button ID="add_asset_button" Text="Add Asset" runat="server" CssClass="btn" OnClick="Save_Asset" />
            </div>

            <div class="form-group text-center form-msg">
                <asp:Label ID="add_asset_msg" runat="server" CssClass="alert alert-danger"></asp:Label>
            </div>
        </div>
    </div>
</asp:Content>
