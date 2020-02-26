<%@ Page Title="" Language="C#" MasterPageFile="~/MasterContentPage.Master" AutoEventWireup="true" CodeBehind="ResourceLinks.aspx.cs" Inherits="USFarmExchange.areas.ResourceLinks" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  <asp:Literal ID="TitleTag" runat="server"></asp:Literal>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TableOfContents1" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent1" runat="server">
  <telerik:RadPageLayout ID="ClientViewPage" runat="server" Width="100%">
    <Rows>
      <telerik:LayoutRow CssClass="adminLayout">
        <Columns>
          <telerik:LayoutColumn Span="9" SpanMd="10" SpanSm="12">
            <asp:Literal ID="ResourceLinksDescription" runat="server" />
          </telerik:LayoutColumn>
          <telerik:LayoutColumn Span="3" SpanMd="2" SpanSm="12">
            <telerik:RadButton ID="RadButton1" runat="server" Text="Submit Your Link Here!" Skin="Silk"></telerik:RadButton>
          </telerik:LayoutColumn>
        </Columns>
      </telerik:LayoutRow>
    </Rows>
  </telerik:RadPageLayout>
  <br />
  <br />
  <telerik:RadListView runat="server" DataSourceID="ObjectDataSource1" AllowNaturalSort="True" Skin="WebBlue">
    <LayoutTemplate>
      <div class="RadListView RadListView_WebBlue">
        <div runat="server" id="itemPlaceholder"></div>
      </div>
    </LayoutTemplate>
    <ItemTemplate>
      <div class="rlvI" style="min-height: 150px;">
        <img style="float: left; padding-right: 15px;" src='<%# Eval("ThumbNail") %>' />
        <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" CommandName="Navigate" CommandArgument='<%# Eval("Id") %>'><%# Eval("DisplayName") %></asp:LinkButton><br />
        <asp:Label ID="Label2" runat="server" Text='<%# Eval("Description") %>'></asp:Label>
      </div>
    </ItemTemplate>
    <AlternatingItemTemplate>
      <div class="rlvA" style="min-height: 150px;">
        <img style="float: left; padding-right: 15px;" src='<%# Eval("ThumbNail") %>' />
        <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" CommandName="Navigate" CommandArgument='<%# Eval("Id") %>'><%# Eval("DisplayName") %></asp:LinkButton><br />
        <asp:Label ID="Label2" runat="server" Text='<%# Eval("Description") %>'></asp:Label>
      </div>
    </AlternatingItemTemplate>
    <ValidationSettings EnableValidation="False" EnableModelValidation="False"></ValidationSettings>
  </telerik:RadListView>
  <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetAllResourceLinks" TypeName="USFarmExchange.SqlDatasets"></asp:ObjectDataSource>
  <br />
  <br />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="RightColumn1" runat="server">
  <telerik:RadWindow RenderMode="Lightweight" ID="modalPopup" runat="server" Width="650px" Height="525px" Modal="true"
    OffsetElementID="main" Style="z-index: 100001;" VisibleOnPageLoad="false" IconUrl="~/favicon.ico">
    <ContentTemplate>
      <div class="article2">
        <h2>Submit your link!</h2>
        <telerik:RadTextBox ID="ContactName" runat="server" Width="100%" MaxLength="256" Label="Your Name" EmptyMessage="Your Name Here" CssClass="MyEnabledTextBox" LabelCssClass="MyContactLabel">
          <HoveredStyle CssClass="MyHoveredTextBox"></HoveredStyle>
          <FocusedStyle CssClass="MyFocusedTextBox"></FocusedStyle>
        </telerik:RadTextBox>
        <asp:RequiredFieldValidator ID="ContactNameValidator" runat="server" ControlToValidate="ContactName" EnableClientScript="false" ValidationGroup="Group"
          ErrorMessage="Please fill in your name" Display="Dynamic" ForeColor="Red" />
        <telerik:RadTextBox ID="ContactEmail" runat="server" Width="100%" MaxLength="256" Label="Your Email" EmptyMessage="Your Email Address Here" CssClass="MyEnabledTextBox" LabelCssClass="MyContactLabel">
          <HoveredStyle CssClass="MyHoveredTextBox"></HoveredStyle>
          <FocusedStyle CssClass="MyFocusedTextBox"></FocusedStyle>
        </telerik:RadTextBox>
        <asp:RequiredFieldValidator ID="ContactEmailValidator" runat="server" ControlToValidate="ContactEmail" EnableClientScript="false" ValidationGroup="Group"
          ErrorMessage="Please fill in your email" Display="Dynamic" ForeColor="Red" />
        <telerik:RadTextBox ID="ContactSubject" runat="server" Width="100%" MaxLength="256" Label="Your Link" EmptyMessage="Your Awsome Link Here" CssClass="MyEnabledTextBox" LabelCssClass="MyContactLabel">
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
    </ContentTemplate>
  </telerik:RadWindow>
  <telerik:RadAjaxManager runat="server" ID="RadAjaxManager1">
    <AjaxSettings>
      <telerik:AjaxSetting AjaxControlID="rbSubmitChanges">
        <UpdatedControls>
          <telerik:AjaxUpdatedControl ControlID="modalPopup" />
        </UpdatedControls>
      </telerik:AjaxSetting>
    </AjaxSettings>
  </telerik:RadAjaxManager>
  <telerik:RadCodeBlock runat="server" ID="rdbScripts">
    <script type="text/javascript">

</script>
  </telerik:RadCodeBlock>
</asp:Content>
