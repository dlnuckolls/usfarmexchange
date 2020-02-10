<%@ Page Title="" Language="C#" MasterPageFile="~/MasterSubPage.Master" AutoEventWireup="true" CodeBehind="ContactUs.aspx.cs" Inherits="USFarmExchange.areas.ContactUs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  <asp:Literal ID="TitleTag" runat="server"></asp:Literal>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

  <telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server">
    <div class="article">
      <h2>Email Us Here!</h2>
      <telerik:RadTextBox ID="ContactName" runat="server" Width="100%" MaxLength="256" Label="Your Name" CssClass="MyEnabledTextBox" LabelCssClass="MyContactLabel">
        <HoveredStyle CssClass="MyHoveredTextBox"></HoveredStyle>
        <FocusedStyle CssClass="MyFocusedTextBox"></FocusedStyle>
      </telerik:RadTextBox>
      <asp:RequiredFieldValidator ID="ContactNameValidator" runat="server" ControlToValidate="ContactName" EnableClientScript="false" ValidationGroup="Group"
        ErrorMessage="Please fill in your name" Display="Dynamic" ForeColor="Red" />
      <telerik:RadTextBox ID="ContactEmail" runat="server" Width="100%" MaxLength="256" Label="Your Email" CssClass="MyEnabledTextBox" LabelCssClass="MyContactLabel">
        <HoveredStyle CssClass="MyHoveredTextBox"></HoveredStyle>
        <FocusedStyle CssClass="MyFocusedTextBox"></FocusedStyle>
      </telerik:RadTextBox>
      <asp:RequiredFieldValidator ID="ContactEmailValidator" runat="server" ControlToValidate="ContactEmail" EnableClientScript="false" ValidationGroup="Group"
        ErrorMessage="Please fill in your email" Display="Dynamic" ForeColor="Red" />
      <telerik:RadTextBox ID="ContactSubject" runat="server" Width="100%" MaxLength="256" Label="Subject" CssClass="MyEnabledTextBox" LabelCssClass="MyContactLabel">
        <HoveredStyle CssClass="MyHoveredTextBox"></HoveredStyle>
        <FocusedStyle CssClass="MyFocusedTextBox"></FocusedStyle>
      </telerik:RadTextBox>
      <telerik:RadTextBox ID="ContactMessage" runat="server" Width="100%" Label="Message" CssClass="MyEnabledTextBox" LabelCssClass="MyContactLabel" TextMode="MultiLine" Rows="8" Resize="None">
        <HoveredStyle CssClass="MyHoveredTextBox"></HoveredStyle>
        <FocusedStyle CssClass="MyFocusedTextBox"></FocusedStyle>
      </telerik:RadTextBox>
      <div style="padding-left: 100px; padding-top: 10px; padding-bottom: 10px;">
        <telerik:RadCaptcha ID="RadCaptcha1" runat="server" ErrorMessage="The code you entered is not valid." ForeColor="Red"
          ValidationGroup="Group" EnableRefreshImage="true" CaptchaTextBoxCssClass="MyCaptchaTextBox" CaptchaTextBoxLabel="Please enter code">
          <CaptchaImage ImageCssClass="imageClass" />
        </telerik:RadCaptcha>
        <telerik:RadButton ID="SendMessage" runat="server" Skin="Silk" RenderMode="Auto" Text="Send Message" ValidationGroup="Group" OnClick="SendMessage_Click" CssClass="css3Simple" />
      </div>
    </div>
  </telerik:RadAjaxPanel>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
  <div class="article">
    <asp:Literal ID="ContactUsHomeContent" runat="server" />
  </div>
</asp:Content>
