<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="mainnavigation.ascx.cs" Inherits="USFarmExchange.MainNavigation" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<telerik:RadMenu ID="RadMenu1" runat="server" RenderMode="Auto">
    <Items>
        <telerik:RadMenuItem Text="Home" NavigateUrl="~/" />
        <telerik:RadMenuItem IsSeparator="true" />
        <telerik:RadMenuItem Text="Communication" NavigateUrl="~/areas/communication.aspx">
            <Items>
                <telerik:RadMenuItem Text="News" NavigateUrl="~/areas/News.aspx" />
            </Items>
        </telerik:RadMenuItem>
        <telerik:RadMenuItem IsSeparator="true" />
        <telerik:RadMenuItem Text="Compliance" NavigateUrl="~/areas/Compliance.aspx" />
        <telerik:RadMenuItem IsSeparator="true" />
        <telerik:RadMenuItem Text="Education" NavigateUrl="~/areas/education.aspx">
            <Items>
                <telerik:RadMenuItem Text="Crop Insurance" NavigateUrl="~/areas/crop-insurance.aspx" />
            </Items>
        </telerik:RadMenuItem>
        <telerik:RadMenuItem IsSeparator="true" />
        <telerik:RadMenuItem Text="About Us" NavigateUrl="~/areas/aboutus.aspx" />
  
    </Items>
</telerik:RadMenu>
