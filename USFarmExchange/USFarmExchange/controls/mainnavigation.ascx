<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="mainnavigation.ascx.cs" Inherits="USFarmExchange.MainNavigation" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<telerik:RadMenu ID="RadMenu1" runat="server" RenderMode="Auto">
    <Items>
        <telerik:RadMenuItem Text="Home" NavigateUrl="~/" />
        <telerik:RadMenuItem IsSeparator="true" />
        <telerik:RadMenuItem Text="Conversation">
            <Items>
        <telerik:RadMenuItem IsSeparator="true" />
                <telerik:RadMenuItem Text="News" NavigateUrl="~/areas/News.aspx" />
        <telerik:RadMenuItem IsSeparator="true" />
                <telerik:RadMenuItem Text="Podcasts" NavigateUrl="~/areas/Podcasts.aspx" />
        <telerik:RadMenuItem IsSeparator="true" />
                <telerik:RadMenuItem Text="Forum" NavigateUrl="~/forum" />
            </Items>
        </telerik:RadMenuItem>
        <telerik:RadMenuItem IsSeparator="true" />
        <telerik:RadMenuItem Text="Education" NavigateUrl="~/areas/education.aspx">
            <Items>
                <telerik:RadMenuItem Text="Crop Insurance" NavigateUrl="~/areas/crop-insurance.aspx" />
                <telerik:RadMenuItem IsSeparator="true" />
                <telerik:RadMenuItem Text="History of Hemp in KY" NavigateUrl="~/areas/HempHistoryKY.aspx" />
            </Items>
        </telerik:RadMenuItem>
        <telerik:RadMenuItem IsSeparator="true" />
        <telerik:RadMenuItem Text="Agritourism" NavigateUrl="~/areas/agritourism.aspx" />
        <telerik:RadMenuItem IsSeparator="true" />
        <telerik:RadMenuItem Text="Insurance" NavigateUrl="~/areas/Insurance.aspx" />
        <telerik:RadMenuItem IsSeparator="true" />
        <telerik:RadMenuItem Text="Financial Services" NavigateUrl="~/areas/Financial-Services.aspx" />
        <telerik:RadMenuItem IsSeparator="true" />
        <telerik:RadMenuItem Text="Resources">
          <Items>
        <telerik:RadMenuItem IsSeparator="true" />
        <telerik:RadMenuItem Text="Technology" NavigateUrl="~/areas/Technology.aspx" />
        <telerik:RadMenuItem IsSeparator="true" />
        <telerik:RadMenuItem Text="Compliance" NavigateUrl="~/areas/Compliance.aspx" />
            </Items>
          </telerik:RadMenuItem>
        <telerik:RadMenuItem IsSeparator="true" />
        <telerik:RadMenuItem Text="Partners" NavigateUrl="~/areas/Partners.aspx" />
        <telerik:RadMenuItem IsSeparator="true" />
        <telerik:RadMenuItem Text="About Us" NavigateUrl="~/areas/aboutus.aspx" />
    </Items>
</telerik:RadMenu>
