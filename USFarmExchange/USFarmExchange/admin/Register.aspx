<%@ Page Title="" Language="C#" MasterPageFile="~/admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="USFarmExchange.Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  <title>MyHealthE: Register</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <telerik:RadAjaxPanel runat="server">
    <telerik:RadPageLayout runat="server" ID="RegistrationPage">
      <Rows>
        <telerik:LayoutRow>
          <Columns>
            <telerik:LayoutColumn Span="4" SpanMd="3" SpanSm="12" HiddenXs="true" />
            <telerik:LayoutColumn Span="4" SpanMd="6" SpanSm="12">
              <div style="width: 500px;">
                <div style="width: 100%; padding: 5px;">
                  <telerik:RadTextBox ID="displayName" runat="server" Width="100%" Label="Full Name" CssClass="MyEnabledTextBox" LabelCssClass="MyLabel">
                    <HoveredStyle CssClass="MyHoveredTextBox"></HoveredStyle>
                    <FocusedStyle CssClass="MyFocusedTextBox"></FocusedStyle>
                  </telerik:RadTextBox>
                </div>
                <div style="width: 100%; padding: 5px;">
                  <telerik:RadTextBox ID="userName" runat="server" Width="100%" Label="Email Address" CssClass="MyEnabledTextBox" LabelCssClass="MyLabel">
                    <HoveredStyle CssClass="MyHoveredTextBox"></HoveredStyle>
                    <FocusedStyle CssClass="MyFocusedTextBox"></FocusedStyle>
                  </telerik:RadTextBox>
                </div>
                <div style="width: 100%; padding: 5px;">
                  <telerik:RadTextBox ID="password" TextMode="Password" runat="server" Width="100%" Label="Password" CssClass="MyEnabledTextBox" LabelCssClass="MyLabel">
                    <HoveredStyle CssClass="MyHoveredTextBox"></HoveredStyle>
                    <FocusedStyle CssClass="MyFocusedTextBox"></FocusedStyle>
                  </telerik:RadTextBox>
                </div>
                <div style="width: 100%; padding: 5px; margin-left: 150px;">
                  <telerik:RadButton ID="SubmitLogin" runat="server" Skin="Silk" RenderMode="Auto" Text="Register" OnClick="SubmitLogin_OnClick" CssClass="css3Simple2" />
                  &nbsp;&nbsp;&nbsp;<telerik:RadLabel ID="lErrorMessage" runat="server" CssClass="appErrorMessage" />
                </div>
              </div>
            </telerik:LayoutColumn>
            <telerik:LayoutColumn Span="4" SpanMd="3" SpanSm="12" HiddenXs="true" />
          </Columns>
        </telerik:LayoutRow>
      </Rows>
    </telerik:RadPageLayout>
    <telerik:RadPageLayout runat="server" ID="RegistrationThankYou" Visible="false">
      <Rows>
        <telerik:LayoutRow>
          <Columns>
            <telerik:LayoutColumn Span="4" SpanMd="3" SpanSm="12" HiddenXs="true" />
            <telerik:LayoutColumn Span="4" SpanMd="6" SpanSm="12">
              <div style="width: 500px;">
                <div style="width: 100%; padding: 5px; margin-left: 150px;">
                  Thank you for registering. You should get an email confirmation shortly with next steps.
                </div>
              </div>
            </telerik:LayoutColumn>
            <telerik:LayoutColumn Span="4" SpanMd="3" SpanSm="12" HiddenXs="true" />
          </Columns>
        </telerik:LayoutRow>
      </Rows>
    </telerik:RadPageLayout>
  </telerik:RadAjaxPanel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
