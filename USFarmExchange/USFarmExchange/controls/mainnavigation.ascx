<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="mainnavigation.ascx.cs" Inherits="USFarmExchange.MainNavigation" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<telerik:RadMenu ID="RadMenu1" runat="server" RenderMode="Auto">
  <Items>
    <telerik:RadMenuItem Text="Home" NavigateUrl="~/" />
    <telerik:RadMenuItem IsSeparator="true" />
    <telerik:RadMenuItem Text="Products & Services" NavigateUrl="~/areas/products-services.aspx" />
    <telerik:RadMenuItem IsSeparator="true" />
    <telerik:RadMenuItem Text="About Us" NavigateUrl="~/areas/aboutus.aspx" />
    <telerik:RadMenuItem IsSeparator="true" />
    <telerik:RadMenuItem Text="Login" NavigateUrl="~/admin/login.aspx" />
  </Items>
</telerik:RadMenu>
