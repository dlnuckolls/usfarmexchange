<%@ Page Title="" Language="C#" MasterPageFile="~/MasterContentPage.Master" AutoEventWireup="true" CodeBehind="AgFeeds.aspx.cs" Inherits="USFarmExchange.areas.AgFeeds" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  <link href="/styles/scroller.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TableOfContents1" runat="server">
  <telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server" LoadingPanelID="RadAjaxLoadingPanel1">
    <telerik:RadListView ID="RadListView1" runat="server" RenderMode="Lightweight" OnNeedDataSource="RadListView1_NeedDataSource"
      AllowPaging="true" ItemPlaceholderID="Panel1" PageSize="3">
      <LayoutTemplate>
        <div class="layoutWrapper">
          <div class="rssSubHeader">
            USDA Latest News - <%# "&copy; " + DateTime.Now.Year %>
          </div>
          <hr />
          <table class="rssTable">
            <asp:Panel ID="Panel1" runat="server"></asp:Panel>
          </table>
          <div class="imageWrapper">
            <asp:ImageButton ID="PrevBtn" runat="server" CommandName="Page" CommandArgument="Prev"
              AlternateText="<" CssClass="rssButtons" ImageUrl="/images/icons8-circled_chevron_left.png" />
            <asp:ImageButton ID="RefreshBtn" runat="server" CommandName="Rebind" AlternateText="Refresh"
              CssClass="rssButtons" ImageUrl="/images/icons8-refresh.png" />
            <asp:ImageButton ID="NextBtn" runat="server" CommandName="Page" CommandArgument="Next"
              AlternateText=">" CssClass="rssButtons" ImageUrl="/images/icons8-circled_chevron_right.png" />
          </div>
        </div>
      </LayoutTemplate>
      <ItemTemplate>
        <tr>
          <td>
            <div class="rssTitle">
              <a href='<%# GetXmlContent(Container, "link") %>' class="qsfSubtitle">
                <asp:Literal runat="server" Text='<%# GetXmlContent(Container, "title") %>'></asp:Literal>
              </a>
            <div class="rssContent">
              <asp:Literal runat="server" Text='<%# GetXmlContent(Container, "description") %>'></asp:Literal>
            </div>
              <div class="rssDate">
                <%# string.Format("{0:d}", Convert.ToDateTime(GetXmlContent(Container, "pubDate"))) %>
              </div>
            </div>
          </td>
        </tr>
      </ItemTemplate>
    </telerik:RadListView>
  </telerik:RadAjaxPanel>
  <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Skin="Black">
  </telerik:RadAjaxLoadingPanel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent1" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="RightColumn1" runat="server">
</asp:Content>
