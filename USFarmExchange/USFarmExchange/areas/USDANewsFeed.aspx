<%@ Page Title="" Language="C#" MasterPageFile="~/MasterContentPage.Master" AutoEventWireup="true" CodeBehind="USDANewsFeed.aspx.cs" Inherits="USFarmExchange.areas.USDANewsFeed" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TableOfContents1" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent1" runat="server">
            <telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server" LoadingPanelID="RadAjaxLoadingPanel1">
              <telerik:RadListView ID="RadListView1" runat="server" RenderMode="Lightweight" OnNeedDataSource="RadListView1_NeedDataSource"
                AllowPaging="true" ItemPlaceholderID="Panel1" PageSize="10">
                <LayoutTemplate>
                  <div class="nslayoutWrapper">
                    <div class="nsrssSubHeader">
                      USDA Latest News - <%# "&copy; " + DateTime.Now.Year %>
                    </div>
                    <hr />
                    <table class="nsrssTable">
                      <asp:Panel ID="Panel1" runat="server"></asp:Panel>
                    </table>
                    <div class="nsimageWrapper">
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
                      <div class="nsrssTitle">
                        <a href='<%# GetXmlContent(Container, "link") %>' class="qsfSubtitle" target="_blank">
                          <asp:Literal runat="server" Text='<%# GetXmlContent(Container, "title") %>'></asp:Literal>
                        </a>
                        <div class="nsrssContent">
                          <asp:Literal runat="server" Text='<%# GetXmlContent(Container, "description") %>'></asp:Literal>
                        </div>
                        <div class="nsrssDate">
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
<asp:Content ID="Content4" ContentPlaceHolderID="RightColumn1" runat="server">
</asp:Content>
