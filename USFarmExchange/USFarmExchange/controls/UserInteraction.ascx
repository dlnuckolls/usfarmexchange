<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UserInteraction.ascx.cs" Inherits="USFarmExchange.controls.UserInteraction" %>
<div style="text-align: right;">
  <asp:Label ID="lUserDisplayName" runat="server" CssClass="dashboardLink" Text=""></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;
  <asp:LinkButton ID="lbAccount" runat="server" CssClass="dashboardLink" OnClick="lbAccount_Click">Account</asp:LinkButton>
  <asp:LinkButton ID="lbDashboard" runat="server" CssClass="dashboardLink" OnClick="LbDashboard_Click">My Dashboard</asp:LinkButton><span runat="server" id="adminSpacer">&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;</span>
  <asp:LinkButton ID="lbAdminDashboard" runat="server" CssClass="dashboardLink" OnClick="LbAdminDashboard_Click">Admin Dashboard</asp:LinkButton><span runat="server" id="logoutSpacer">&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;</span>
  <asp:LinkButton ID="lbLogout" runat="server" CssClass="dashboardLink" OnClick="LbLogout_Click">Logout</asp:LinkButton>
</div>
