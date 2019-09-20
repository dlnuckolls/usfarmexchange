<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UserInteraction.ascx.cs" Inherits="USFarmExchange.controls.UserInteraction" %>
<div style="text-align: right;">
  <div class="loginDisplay dashboardLink">
    <asp:LoginView ID="HeadLoginView" runat="server" EnableViewState="false">
      <AnonymousTemplate>
         Welcome back <span class="bold">Guest</span>&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;<asp:LinkButton ID="LoginLink" CssClass="dashboardLink" runat="server">Log In</asp:LinkButton>
      </AnonymousTemplate>
      <LoggedInTemplate>
        Welcome back <span class="bold">
          <asp:LoginName ID="HeadLoginName" runat="server" />
        </span>&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;<asp:LoginStatus ID="HeadLoginStatus" runat="server" CssClass="dashboardLink" LogoutAction="Redirect" LogoutText="Log Out" LogoutPageUrl="~/" />
      </LoggedInTemplate>
    </asp:LoginView>
  </div>
</div>
