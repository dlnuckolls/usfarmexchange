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
          <telerik:LayoutColumn Span="6" SpanMd="12" SpanSm="12" SpanXs="12">
            <div class="homearticle">
              <div class="smallinner">
                <img src="/images/rotator/ThreeFarmers.png" alt="ThreeFarmers" class="right" />
                <h2>Our Purpose</h2>
                <p>
                  Providing American farmers with a platform of resources to help them succeed; offering a central exchange for conversation, compliance, education, technology, insurance, banking and financial services.
                </p>
              </div>
              <hr />
              <div class="smallinner">
                <img src="/images/rotator/talking-farmers.jpg" alt="talking-farmers" class="left" />
                <h2>What's on your mind?</h2>
                <p>
                  Join the U. S. Farm Exchange forum to discuss what is important to you!
                </p>
                <telerik:RadLinkButton ID="btnJoin" runat="server" Text="Join!" NavigateUrl="~/forum/login.aspx"></telerik:RadLinkButton>
              </div>
            </div>
          </telerik:LayoutColumn>
          <telerik:LayoutColumn Span="6" SpanMd="12" SpanSm="12" SpanXs="12">
            <div class="homearticle">
              <img src="/images/rotator/purpose.jpg" alt="Farmers" class="left" />
              <h2>
                <br />
                What is a farmer?</h2>
              <p>
                Daniel Webster defines farmer as “a person who manages or operates a farm.”  He also defines a farm as “a piece of land on which crops or animals are raised.”  
                    A farmer is so much more than that.  He or she is a hardworking, forward thinking individual with both feet on the ground – literally!  Our intent is to help the farmer navigate 
                    the 21st century.  Our purpose is to fill the gap with information farmers need and can understand.
              </p>
            </div>
          </telerik:LayoutColumn>
        </Columns>
      </telerik:LayoutRow>
      <telerik:LayoutRow>
        <Columns>
          <telerik:LayoutColumn Span="6" SpanMd="12" SpanSm="12" SpanXs="12">
            <div class="sentimentalarticle">
              <div class="sentimentalTitle">
                <h1>
                  <telerik:RadLabel ID="SentimentalTitle" runat="server"></telerik:RadLabel>
                </h1>
              </div>
              <div class="sentimentalText">
                <h5>
                  <telerik:RadLabel ID="SentimentalText" runat="server"></telerik:RadLabel>
                </h5>
              </div>
            </div>
          </telerik:LayoutColumn>
          <telerik:LayoutColumn Span="6" SpanMd="12" SpanSm="12" SpanXs="12">
            <div class="homearticle">
              <telerik:RadMediaPlayer ID="RadMediaPlayer1" runat="server" Height="400px" Source="https://www.youtube.com/watch?v=7UBj4Rbq3ZI"></telerik:RadMediaPlayer>
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
  <%--    <asp:Literal ID="HomePageBottom" runat="server"></asp:Literal>
    <br />
    <br />--%>
</asp:Content>
