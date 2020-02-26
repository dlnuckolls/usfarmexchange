<%@ Page Title="" Language="C#" MasterPageFile="~/MasterContentPage.Master" AutoEventWireup="true" CodeBehind="MagnoliaBank.aspx.cs" Inherits="USFarmExchange.areas.MagnoliaBank" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <asp:Literal ID="TitleTag" runat="server"></asp:Literal>
   <script type="text/javascript">
        function LearnMore(sender, args) {
            window.open('https://magnoliabank.com', '_blank', 'toolbar=yes,status=yes,menubar=yes,scrollbars=yes,resizable=yes,addressbar=yes,height=400,width=800,left=50,top=50');
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TableOfContents1" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent1" runat="server">
    <p class="aligncenter">
        <img src="/images/MagnoliaBank.jpg" />
    </p>
    <br />
    <p class="magnoliatext">Magnolia Bank has remained an independent community bank serving the local area since its founding in 1919.  In 2019, the Bank celebrated one hundred years serving our customers and community.  As we look to our rich tradition of the past, we also look to the future with great expectations for our community, our customers and our Bank.  Our motto, <b>“We Have A Personal Way,” </b>is demonstrated by the actions of our employees every day.</p>
    <br />
    <br />
     <div class="aligncenter" style="width: 98%;">
        <telerik:RadButton Skin="Outlook" RenderMode="Auto" ID="btnLearnMore" runat="server" ButtonType="SkinnedButton" 
            Text="Learn More" OnClientClicked="LearnMore" AutoPostBack="false" />
        </div>
    <br />
    </asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="RightColumn1" runat="server">
</asp:Content>
