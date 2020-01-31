<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="USFarmExchange.Default" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<asp:Content ID="Content0" ContentPlaceHolderID="head" runat="Server">
    <asp:Literal ID="TitleTag" runat="server"></asp:Literal>
    <link href="/styles/default.css" rel="stylesheet" />
    <link href="/styles/scroller.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:XmlDataSource ID="xmlDataSource1" runat="Server" DataFile="/data/upperMarquee.xml"></asp:XmlDataSource>
    <asp:XmlDataSource ID="xmlDataSource2" runat="Server" DataFile="/data/lowerMarquee.xml"></asp:XmlDataSource>
    <asp:Literal ID="HomePageBottom" runat="server"></asp:Literal>
    <br />
    <br />
  <telerik:RadPageLayout runat="server" ID="RadPageLayout1">
    <Rows>
      <telerik:LayoutRow>
        <Columns>
          <telerik:LayoutColumn Span="12">
            <script type="text/javascript">
              (function (global, undefined) {
                var autoInterval;

                                function StartAutoRotation(rotator, args) {
                                    if (!autoInterval) {
                                        autoInterval = window.setInterval(function () {
                                            rotator.showNext(Telerik.Web.UI.RotatorScrollDirection.Left);
                                        }, rotator.get_frameDuration());
                                    }
                                }
                                function rotator_load(sender, args) {
                                    setTimeout(function () {//fix displaced button in Chrome
                                        if (sender._rightButton) {
                                            sender._rightButton.style.display = "inline-block";
                                        }
                                    }, 0);
                                }

                                function BeginRequestHandler(sender, args) {
                                    autoInterval = window.clearInterval(autoInterval);
                                }
                                Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);

                global.StartAutoRotation = StartAutoRotation;
                global.rotator_load = rotator_load;
              })(window);
            </script>
            <script type="text/javascript">
              var rotator = null;
              function OnClientLoad(sender, args) {
                rotator = sender;
                //rotator.
              }

              window.onresize = function () {
                rotator.repaint();
              }
            </script>
            <div class="rotator">
              <telerik:RadRotator RenderMode="Lightweight" Skin="Silk" FrameDuration="12000" ID="MainRotator1" runat="server" ScrollDirection="Left"
                Width="1000px" Height="500px" ItemWidth="1000px" ItemHeight="500px" PauseOnMouseOver="false" OnClientLoad="OnClientLoad">
                <Items>
                  <telerik:RadRotatorItem>
                    <ItemTemplate>
                      <img src="/images/rotator/purpose.jpg" alt="Farmers" class="left" />
                      <h2>
                        <br />
                        What is a farmer?</h2>
                      <p>
                        Daniel Webster defines farmer as “a person who manages or operates a farm.”  He also defines a farm as “a piece of land on which crops or animals are raised.”  
                    A farmer is so much more than that.  He or she is a hardworking, forward thinking individual with both feet on the ground – literally!  Our intent is to help the farmer navigate 
                    the 21st century.  Our purpose is to fill the gap with information farmers need and can understand.
                      </p>
                    </ItemTemplate>
                  </telerik:RadRotatorItem>

                  <telerik:RadRotatorItem>
                    <ItemTemplate>
                      <img src="/images/rotator/ThreeFarmers.png" alt="ThreeFarmers" class="right" />
                      <h2><br />Our Purpose</h2>
                      <p>
                        Providing American farmers with a platform of resources to help them succeed; offering a central exchange for conversation, compliance, education, technology, insurance, banking and financial services.
                      </p>
                    </ItemTemplate>
                  </telerik:RadRotatorItem>
                    <telerik:RadRotatorItem>
                    <ItemTemplate>
                      <img src="/images/rotator/talking-farmers.jpg" alt="talking-farmers" class="left" />
                      <h2><br />What's on your mind?</h2>
                      <p>
                        Join the U.S. Farm Exchange forum to discuss what is important to you!
                      </p>
                          <telerik:RadLinkButton ID="btnJoin" runat="server" Text="Join!"  NavigateURL="~/forum/login.aspx" > </telerik:RadLinkButton>
                    </ItemTemplate>
                  </telerik:RadRotatorItem>
                </Items>
              </telerik:RadRotator>
            </div>
          </telerik:LayoutColumn>
        </Columns>
      </telerik:LayoutRow>
      <telerik:LayoutRow>
        <Columns>
          <telerik:LayoutColumn Span="8" SpanMd="12" HiddenXs="true">
            <br />
            <div style="width: 100%; margin: 5px auto;">
              <telerik:RadMediaPlayer ID="RadMediaPlayer1" runat="server" Height="400px" Source="https://www.youtube.com/watch?v=7UBj4Rbq3ZI"></telerik:RadMediaPlayer>
            </div>
            <div style="width: 100%; margin: 5px auto;">
              <div class="top">
                <img src="/images/rotator/top.gif" width="452" height="35" alt="" />
              </div>
              <div class="marqueeTopBg">
                <div class="marqueeTop_Text">
                  <telerik:RadRotator RenderMode="Lightweight" Skin="Silk" ScrollDirection="left" DataSourceID="xmlDataSource1" FrameDuration="1"
                    Width="435" ItemWidth="145" Height="24" ItemHeight="24" ScrollDuration="2000"
                    ID="Rotator1" runat="server">
                    <ItemTemplate>
                      <div class="itemTemplate">
                        <div class="Symbol">
                          <%# XPath("Company")%>
                        </div>
                        <div class="Quote" style="cursor: default; float: left">
                          <%# XPath("Price")%>
                        </div>
                        <div class="Change">
                          <%# XPath("Difference")%>
                        </div>
                        <div style="margin-left: 5px; float: left;">
                          <img src='<%# XPath("Image") %>' style="border: 0px" alt="" />
                        </div>
                        <div class="Quote" style="float: left;">
                          &nbsp;&nbsp;
                        </div>
                      </div>
                    </ItemTemplate>
                  </telerik:RadRotator>
                </div>
              </div>
              <div class="marqueeBottomBg">
                <div class="marqueeBottom_Text">
                  <telerik:RadRotator RenderMode="Lightweight" Skin="Silk" ScrollDirection="left" DataSourceID="xmlDataSource2" Width="435"
                    ItemWidth="145" Height="24" ItemHeight="24" ScrollDuration="3000" FrameDuration="1"
                    ID="Rotator2" runat="server">
                    <ItemTemplate>
                      <div class="itemTemplate">
                        <div class="Symbol">
                          <%# XPath("Company")%>
                        </div>
                        <div class="Quote" style="cursor: default; float: left">
                          <%# XPath("Price")%>
                        </div>
                        <div class="Change">
                          <%# XPath("Difference")%>
                        </div>
                        <div style="margin-left: 5px; float: left;">
                          <img src='<%# XPath("Image") %>' style="border: 0px" alt="" />
                        </div>
                        <div class="Quote" style="float: left;">
                          &nbsp;&nbsp;
                        </div>
                      </div>
                    </ItemTemplate>
                  </telerik:RadRotator>
                </div>
              </div>
              <div class="bottom">
                <img src="/images/rotator/bottom.gif" width="452" height="108" alt="" />
              </div>
            </div>
          </telerik:LayoutColumn>
          <telerik:LayoutColumn Span="4" SpanMd="12" HiddenXs="true">
            <br />
            <telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server" LoadingPanelID="RadAjaxLoadingPanel1">
              <telerik:RadListView ID="RadListView1" runat="server" RenderMode="Lightweight" OnNeedDataSource="RadListView1_NeedDataSource"
                AllowPaging="true" ItemPlaceholderID="Panel1" PageSize="3">
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
          </telerik:LayoutColumn>
        </Columns>
      </telerik:LayoutRow>
    </Rows>
  </telerik:RadPageLayout>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <telerik:RadPageLayout runat="server" ID="Content1">
        <Rows>
            <telerik:LayoutRow>
                <Columns>
                    <telerik:LayoutColumn Span="4" SpanMd="12" SpanSm="12" HiddenXs="true">
                    </telerik:LayoutColumn>

                    <telerik:LayoutColumn Span="4" SpanMd="12" SpanSm="12" HiddenXs="true">
                    </telerik:LayoutColumn>

                    <telerik:LayoutColumn Span="4" SpanMd="12" SpanSm="12" HiddenXs="true">
                    </telerik:LayoutColumn>
                </Columns>
            </telerik:LayoutRow>
        </Rows>
    </telerik:RadPageLayout>
    <%--    <asp:Literal ID="HomePageBottom" runat="server"></asp:Literal>
    <br />
    <br />--%>
</asp:Content>
