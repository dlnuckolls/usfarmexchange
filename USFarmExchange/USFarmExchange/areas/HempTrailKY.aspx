<%@ Page Title="" Language="C#" MasterPageFile="~/MasterMapPage.Master" AutoEventWireup="true" CodeBehind="HempTrailKY.aspx.cs" Inherits="USFarmExchange.areas.HempTrailKY" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <asp:Literal ID="TitleTag" runat="server"></asp:Literal>
     <link href="../styles/default.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Column1" ContentPlaceHolderID="MainContent1" runat="server">    
    <%--<telerik:RadAjaxPanel runat="server">--%>
    
         
    <div class="HempTrailKY">   
        <p><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Click each number to view more information</b></p>
        <asp:ImageMap ID="ImageMap1" HotSpotMode="Navigate" ImageUrl="/images/HempTrailPage1.jpg"
            AlternateText="KyHempTrail" runat="server">
              <asp:RectangleHotSpot Left="462" Top="466" Right="506" Bottom="500"   HotSpotMode="PostBack" />       
              <asp:RectangleHotSpot Left="744" Top="469" Right="784" Bottom="510"   HotSpotMode="PostBack" />
              <asp:RectangleHotSpot Left="857" Top="471" Right="888" Bottom="506"   HotSpotMode="PostBack" />
              <asp:RectangleHotSpot Left="880" Top="464" Right="912" Bottom="500"   HotSpotMode="PostBack" />
              <asp:RectangleHotSpot Left="947" Top="428" Right="990" Bottom="469"   HotSpotMode="PostBack" />
              <asp:RectangleHotSpot Left="1026" Top="392" Right="1068" Bottom="432"   HotSpotMode="PostBack" />
              <asp:RectangleHotSpot Left="1162" Top="439" Right="1205" Bottom="483"   HotSpotMode="PostBack" />
              <asp:RectangleHotSpot Left="1167" Top="605" Right="1206" Bottom="642"   HotSpotMode="PostBack" />
              <asp:RectangleHotSpot Left="1143" Top="714" Right="1183" Bottom="749"   HotSpotMode="PostBack" />
              <asp:RectangleHotSpot Left="909" Top="807" Right="952" Bottom="846"   HotSpotMode="PostBack" />
              <asp:RectangleHotSpot Left="881" Top="686" Right="927" Bottom="727"   HotSpotMode="PostBack" />
              <asp:RectangleHotSpot Left="909" Top="611" Right="953" Bottom="643"   HotSpotMode="PostBack" />
              <asp:RectangleHotSpot Left="950" Top="553" Right="986" Bottom="584"   HotSpotMode="PostBack" />
              <asp:RectangleHotSpot Left="1070" Top="562" Right="1101" Bottom="598"   HotSpotMode="PostBack" />
              <asp:RectangleHotSpot Left="1089" Top="561" Right="1121" Bottom="592"   HotSpotMode="PostBack" />
              <asp:RectangleHotSpot Left="1068" Top="600" Right="1110" Bottom="631"   HotSpotMode="PostBack" />
              <asp:RectangleHotSpot Left="1055" Top="630" Right="1096" Bottom="661"   HotSpotMode="PostBack" />
              <asp:RectangleHotSpot Left="1032" Top="675" Right="1070" Bottom="710"   HotSpotMode="PostBack" />
              <asp:RectangleHotSpot Left="1118" Top="322" Right="1164" Bottom="362"   HotSpotMode="PostBack" />
              <asp:RectangleHotSpot Left="1369" Top="172" Right="1411" Bottom="210"   HotSpotMode="PostBack" />
        </asp:ImageMap>
    </div>
 
    <telerik:RadToolTip RenderMode="Lightweight" ID="tooltip" RelativeTo="Mouse" runat="server" TargetControlID="area0" Width="250px" Height="90px"
        Animation="Resize" Position="BottomCenter" IsClientID="true" ShowCallout="true" RenderInPageRoot="true"   
        ShowEvent="OnClick" Text="Farmington Historic Plantation <br />3033 Bardstown Rd, Louisville<br /><br /><a href=/forum/topics/3-Farmington>Reviews</a>"> </telerik:RadToolTip>

    <telerik:RadToolTip RenderMode="Lightweight" ID="RadToolTip1" RelativeTo="Mouse" runat="server" TargetControlID="area1" Width="250px" Height="90px"
        Animation="Resize" Position="TopRight" IsClientID="true" ShowCallout="true" RenderInPageRoot="true"   
        ShowEvent="OnClick" Text="Hempridge Road <br />US 60/KY HWY 714, Shelbyville <br /><br /><a href=/forum/topics/4-Hempridge>Reviews</a>"> </telerik:RadToolTip>

     <telerik:RadToolTip RenderMode="Lightweight" ID="RadToolTip2" RelativeTo="Mouse" runat="server" TargetControlID="area2" Width="300px" Height="90px"
        Animation="Resize" Position="BottomCenter" IsClientID="true" ShowCallout="true" RenderInPageRoot="true"   
        ShowEvent="OnClick" Text="Franklin County Hemp (Jim's Seafood)<br />950 Wilkinson Blvd, Frankfort<br /><br /><a href=/forum/topics/5-Franklin>Reviews</a>"> </telerik:RadToolTip>

     <telerik:RadToolTip RenderMode="Lightweight" ID="RadToolTip3" RelativeTo="Mouse" runat="server" TargetControlID="area3" Width="250px" Height="90px"
        Animation="Resize" Position="BottomRight" IsClientID="true" ShowCallout="true" RenderInPageRoot="true"   
        ShowEvent="OnClick" Text="Leestown<br />113 Great Buffalo Trace, Frankfort<br /><br /><a href=/forum/topics/6-Leestown>Reviews</a>"> </telerik:RadToolTip>

    <telerik:RadToolTip RenderMode="Lightweight" ID="RadToolTip4" RelativeTo="Mouse" runat="server" TargetControlID="area4" Width="250px" Height="90px"
        Animation="Resize" Position="BottomCenter" IsClientID="true" ShowCallout="true" RenderInPageRoot="true"
        ShowEvent="OnClick" Text="Ward Hall<br />1782 Frankfort Rd, Georgetown<br /><br /><a href=/forum/topics/7-Ward-Hall>Reviews</a>"> </telerik:RadToolTip>

    <telerik:RadToolTip RenderMode="Lightweight" ID="RadToolTip5" RelativeTo="Mouse" runat="server" TargetControlID="area5" Width="250px" Height="90px"
        Animation="Resize" Position="BottomCenter" IsClientID="true" ShowCallout="true" RenderInPageRoot="true"
       ShowEvent="OnClick" Text="Scott County Hemp<br />800 Cincinnati Rd, Georgetown<br /><br /><a href=/forum/topics/8-Scott>Reviews</a>"> </telerik:RadToolTip>

    <telerik:RadToolTip RenderMode="Lightweight" ID="RadToolTip6" RelativeTo="Mouse" runat="server" TargetControlID="area6" Width="275px" Height="90px"
        Animation="Resize" Position="BottomRight" IsClientID="true" ShowCallout="true" RenderInPageRoot="true"       
       ShowEvent="OnClick" Text="Alexander House (Pleasanton Goods)<br />902 Main St, Paris<br /><br /><a href=/forum/topics/9-Alexander-House>Reviews</a>"> </telerik:RadToolTip>
    
    <telerik:RadToolTip RenderMode="Lightweight" ID="RadToolTip7" RelativeTo="Mouse" runat="server" TargetControlID="area7" Width="250px" Height="90px"
        Animation="Resize" Position="BottomCenter" IsClientID="true" ShowCallout="true" RenderInPageRoot="true"
       ShowEvent="OnClick" Text="Clark County Hemp<br />6169 Lexington Rd, Winchester<br /><br /><a href=/forum/topics/10-Clark>Reviews</a>"> </telerik:RadToolTip>

    <telerik:RadToolTip RenderMode="Lightweight" ID="RadToolTip8" RelativeTo="Mouse" runat="server" TargetControlID="area8" Width="275px" Height="90px"
        Animation="Resize" Position="BottomRight" IsClientID="true" ShowCallout="true" RenderInPageRoot="true"
       ShowEvent="OnClick" Text="White Hall<br />500 White Hall Shrine Rd, Richmond<br /><br /><a href=/forum/topics/11-White-Hall>Reviews</a>"> </telerik:RadToolTip>

    <telerik:RadToolTip RenderMode="Lightweight" ID="RadToolTip9" RelativeTo="Mouse" runat="server" TargetControlID="area9" Width="200px" Height="90px"
        Animation="Resize" Position="BottomCenter" IsClientID="true" ShowCallout="true" RenderInPageRoot="true"
       ShowEvent="OnClick" Text="First Crop<br />330 W Main St, Danville<br /><br /><a href=/forum/topics/12-First-Crop>Reviews</a>"> </telerik:RadToolTip>

    <telerik:RadToolTip RenderMode="Lightweight" ID="RadToolTip10" RelativeTo="Mouse" runat="server" TargetControlID="area10" Width="250px" Height="90px"
        Animation="Resize" Position="TopRight" IsClientID="true" ShowCallout="true" RenderInPageRoot="true"
       ShowEvent="OnClick" Text="Shaker Village<br />3501 Lexington Rd, Harrodsburg<br /><br /><a href=/forum/topics/13-Shaker-Village>Reviews</a>"> </telerik:RadToolTip>

    <telerik:RadToolTip RenderMode="Lightweight" ID="RadToolTip11" RelativeTo="Mouse" runat="server" TargetControlID="area11" Width="250px" Height="90px"
        Animation="Resize" Position="BottomCenter" IsClientID="true" ShowCallout="true" RenderInPageRoot="true"
       ShowEvent="OnClick" Text="Jack Jouett House<br />255 Craig's Creek Rd, Versailles<br /><br /><a href=/forum/topics/14-Jack-Jouett-House>Reviews</a>"> </telerik:RadToolTip>
    
    <telerik:RadToolTip RenderMode="Lightweight" ID="RadToolTip12" RelativeTo="Mouse" runat="server" TargetControlID="area12" Width="250px" Height="90px"
        Animation="Resize" Position="BottomRight" IsClientID="true" ShowCallout="true" RenderInPageRoot="true"
       ShowEvent="OnClick" Text="Woodford County Hemp<br />US 60/Paynes Mill Rd, Versailles<br /><br /><a href=/forum/topics/15-Woodford>Reviews</a>"> </telerik:RadToolTip>

    <telerik:RadToolTip RenderMode="Lightweight" ID="RadToolTip13" RelativeTo="Mouse" runat="server" TargetControlID="area13" Width="225px" Height="115px"
        Animation="Resize" Position="BottomCenter" IsClientID="true" ShowCallout="true" RenderInPageRoot="true"
       ShowEvent="OnClick" Text="Hopemont<br />The Hunt-Morgan House<br />201 N Mill St, Lexington<br /><br /><a href=/forum/topics/16-Hopemont>Reviews</a>"><br /></telerik:RadToolTip>

    <telerik:RadToolTip RenderMode="Lightweight" ID="RadToolTip14" RelativeTo="Mouse" runat="server" TargetControlID="area14" Width="375px" Height="100px"
        Animation="Resize" Position="BottomCenter" IsClientID="true" ShowCallout="true" RenderInPageRoot="true"
       ShowEvent="OnClick" Text="Gratz Park<br />Between Second, Mill, Third and Market St, Lexington<br /><br /><a href=/forum/topics/17-Gratz-Park>Reviews</a><br />"> </telerik:RadToolTip>
 
    <telerik:RadToolTip RenderMode="Lightweight" ID="RadToolTip15" RelativeTo="Mouse" runat="server" TargetControlID="area15" Width="225px" Height="115px"
        Animation="Resize" Position="TopRight" IsClientID="true" ShowCallout="true" RenderInPageRoot="true"
       ShowEvent="OnClick" Text="Ashland<br />The Henry Clay Estate<br />120 Sycamore Rd, Lexington<br /><br /><a href=/forum/topics/18-Ashland>Reviews</a>"> </telerik:RadToolTip>

    <telerik:RadToolTip RenderMode="Lightweight" ID="RadToolTip16" RelativeTo="Mouse" runat="server" TargetControlID="area16" Width="250px" Height="115px"
        Animation="Resize" Position="BottomCenter" IsClientID="true" ShowCallout="true" RenderInPageRoot="true"
       ShowEvent="OnClick" Text="Waveland<br />State Historic Site<br />225 Waveland Museum Ln, Lexington<br /><br /><a href=/forum/topics/19-Waveland>Reviews</a><br />"> </telerik:RadToolTip>
    
    <telerik:RadToolTip RenderMode="Lightweight" ID="RadToolTip17" RelativeTo="Mouse" runat="server" TargetControlID="area17" Width="250px" Height="90px"
        Animation="Resize" Position="BottomRight" IsClientID="true" ShowCallout="true" RenderInPageRoot="true"
       ShowEvent="OnClick" Text="Jessamine County Hemp<br />107 N Main St, Nicholasville<br /><br /><a href=/forum/topics/20-Jessamine>Reviews</a>"> </telerik:RadToolTip>

    <telerik:RadToolTip RenderMode="Lightweight" ID="RadToolTip18" RelativeTo="Mouse" runat="server" TargetControlID="area18" Width="250px" Height="90px"
        Animation="Resize" Position="TopCenter" IsClientID="true" ShowCallout="true" RenderInPageRoot="true"
       ShowEvent="OnClick" Text="Ashford Acres Inn<br />1801 KY 36, Cynthiana<br /><br /><a href=/forum/topics/21-Ashford>Reviews</a>"> </telerik:RadToolTip>

    <telerik:RadToolTip RenderMode="Lightweight" ID="RadToolTip19" RelativeTo="Mouse" runat="server" TargetControlID="area19" Width="250px" Height="90px"
        Animation="Resize" Position="BottomCenter" IsClientID="true" ShowCallout="true" RenderInPageRoot="true"
       ShowEvent="OnClick" Text="Mason County Hemp<br />1755 US 68 BUS, Maysville<br /><br /><a href=/forum/topics/22-Mason>Reviews</a>"> </telerik:RadToolTip>

    <script src="/scripts/mapscripts.js" type="text/javascript"></script>
    <script type="text/javascript">
        //<![CDATA[
        serverID("imageMapID", "<%= ImageMap1.ClientID %>");
        //]]> 
    </script>

                <%--</telerik:RadAjaxPanel>--%>
        </asp:Content>

        