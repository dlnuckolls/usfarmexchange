﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="mainnavigation.ascx.cs" Inherits="USFarmExchange.MainNavigation" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<telerik:RadMenu ID="RadMenu1" runat="server" RenderMode="Auto">
  <Items>
    <telerik:RadMenuItem Text="Home" NavigateUrl="~/" />
    <telerik:RadMenuItem IsSeparator="true" />

    <telerik:RadMenuItem Text="Conversation">
      <Items>
        <telerik:RadMenuItem Text="News" NavigateUrl="~/areas/News.aspx">
          <Items>
            <telerik:RadMenuItem Text="USDA News" NavigateUrl="~/areas/USDANewsFeed.aspx" />
          </Items>
        </telerik:RadMenuItem>
        <telerik:RadMenuItem IsSeparator="true" />
        <telerik:RadMenuItem Text="Forum" NavigateUrl="~/forum" />
      </Items>
    </telerik:RadMenuItem>
    <telerik:RadMenuItem IsSeparator="true" />

    <telerik:RadMenuItem Text="History" NavigateUrl="~/areas/education.aspx">
      <Items>
        <telerik:RadMenuItem Text="History of Agriculture" NavigateUrl="~/areas/HistoryAgriculture.aspx" />
        <telerik:RadMenuItem IsSeparator="true" />
        <telerik:RadMenuItem Text="History of Hemp in KY" NavigateUrl="~/areas/HempHistoryKY.aspx" />
      </Items>
    </telerik:RadMenuItem>
    <telerik:RadMenuItem IsSeparator="true" />

    <telerik:RadMenuItem Text="Agritourism" NavigateUrl="~/areas/agritourism.aspx">
      <Items>
        <telerik:RadMenuItem Text="Heritage Hemp Trail" NavigateUrl="~/areas/HempTrailKY.aspx" />
      </Items>
    </telerik:RadMenuItem>
    <telerik:RadMenuItem IsSeparator="true" />

    <telerik:RadMenuItem Text="Financial" NavigateUrl="~/areas/Partners.aspx">
      <Items>
        <telerik:RadMenuItem Text="Financial Services" NavigateUrl="~/areas/Financial-Services.aspx">
          <Items>
            <telerik:RadMenuItem Text="Magnolia Bank" NavigateUrl="~/areas/MagnoliaBank.aspx" />
          </Items>
        </telerik:RadMenuItem>
        <telerik:RadMenuItem IsSeparator="true" />
        <telerik:RadMenuItem Text="Insurance" NavigateUrl="~/areas/Insurance.aspx">
          <Items>
            <telerik:RadMenuItem Text="Crop Insurance" NavigateUrl="~/areas/crop-insurance.aspx" />
          </Items>
        </telerik:RadMenuItem>
      </Items>
    </telerik:RadMenuItem>
    <telerik:RadMenuItem IsSeparator="true" />

    <telerik:RadMenuItem Text="Helpful Links" NavigateUrl="~/areas/ResourceLinks.aspx" />
    <telerik:RadMenuItem IsSeparator="true" />

    <telerik:RadMenuItem Text="About Us" NavigateUrl="~/areas/aboutus.aspx">
      <Items>
        <telerik:RadMenuItem Text="Contact Us" NavigateUrl="~/areas/ContactUs.aspx" />
      </Items>
    </telerik:RadMenuItem>
  </Items>
</telerik:RadMenu>
