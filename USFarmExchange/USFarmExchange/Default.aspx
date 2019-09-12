﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="USFarmExchange.Default" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<asp:Content ID="Content0" ContentPlaceHolderID="head" runat="Server">
  <asp:Literal ID="TitleTag" runat="server"></asp:Literal>
  <link href="/styles/default.css" rel="stylesheet" />
  <link href="/styles/scroller.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
  <asp:XmlDataSource ID="xmlDataSource1" runat="Server" DataFile="/data/upperMarquee.xml"></asp:XmlDataSource>
  <asp:XmlDataSource ID="xmlDataSource2" runat="Server" DataFile="/data/lowerMarquee.xml"></asp:XmlDataSource>
  <telerik:RadPageLayout runat="server" ID="RadPageLayout1">
    <Rows>
      <telerik:LayoutRow>
        <Columns>
          <telerik:LayoutColumn Span="8" SpanMd="8" SpanSm="12" HiddenXs="true">
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
            <div class="rotator">
              <telerik:RadRotator RenderMode="Lightweight" Skin="Silk" FrameDuration="6000" ID="MainRotator1" runat="server" ScrollDirection="Left"
                Width="1000px" Height="500px" ItemWidth="1000px" ItemHeight="500px" PauseOnMouseOver="false">
                <Items>
                  <telerik:RadRotatorItem>
                    <ItemTemplate>
                      <img src="/images/rotator/purpose.jpg" alt="Farmers" class="left" />
                      <h2><br />What is a farmer?</h2>
                      <p>
                        <br />
                        <br />
                        Daniel Webster defines farmer as “a person who manages or operates a farm.”  He also defines a farm as “a piece of land on which crops or animals are raised.”  
                    A farmer is so much more than that.  He or she is a hardworking, forward thinking individual with both feet on the ground – literally!  Our intent is to help the farmer navigate 
                    the 21st century.  Our application will help do just that.  Our purpose is to fill the gap with information farmers need and can understand.
                      </p>
                    </ItemTemplate>
                  </telerik:RadRotatorItem>
                  <telerik:RadRotatorItem>
                    <ItemTemplate>
                      <img src="/images/rotator/hemp.jpg" alt="Hemp" class="right" />
                      <h2><br />History of Hemp</h2>
                      <p>
                        <br />
                        <br />
                        Some breief intro here
                      </p>
                    </ItemTemplate>
                  </telerik:RadRotatorItem>
                  <telerik:RadRotatorItem>
                    <ItemTemplate>
                      <img src="/images/rotator/apply.jpg" alt="Apply" class="left" />
                      <h2><br />Apply Online</h2>
                      <p>
                        <br />
                        <br />
                        Online applicatino details
                      </p>
                    </ItemTemplate>
                  </telerik:RadRotatorItem>
                  <telerik:RadRotatorItem>
                    <ItemTemplate>
                      <img src="/images/rotator/purpose.jpg" alt="Farmers" class="right" />
                      <h2><br />Our Purpose</h2>
                      <p>
                        <br />
                        <br />
                        To provide the American farmer a multi-channel platform of resources to help the succeed; offering a central exchange for communication, compliance, education, technology, insurance, banking and financial services.
                      </p>
                    </ItemTemplate>
                  </telerik:RadRotatorItem>
                </Items>
              </telerik:RadRotator>
            </div>
          </telerik:LayoutColumn>
          <telerik:LayoutColumn Span="4" SpanMd="4" SpanSm="12" HiddenXs="true"><br /><br /><br />
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
</asp:Content>
