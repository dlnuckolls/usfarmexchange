<%@ Page Title="" Language="C#" MasterPageFile="~/MasterMapPage.Master" AutoEventWireup="true" CodeBehind="HempTrailKY.aspx.cs" Inherits="USFarmExchange.areas.HempTrailKY" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <asp:Literal ID="TitleTag" runat="server"></asp:Literal>
     <link href="../styles/default.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Column1" ContentPlaceHolderID="MainContent1" runat="server">    
    <%--<telerik:RadAjaxPanel runat="server">--%>
    
         
    <div class="HempTrailKY">
        <asp:ImageMap ID="ImageMap1" HotSpotMode="Navigate" ImageUrl="/images/HempTrailPage1.jpg"
            AlternateText="FloorPlan" runat="server">
              <asp:RectangleHotSpot Left="319" Top="360" Right="480" Bottom="475"   HotSpotMode="PostBack" />       
           <asp:RectangleHotSpot Left="495" Top="372" Right="640" Bottom="460"   HotSpotMode="PostBack" />

<%--            <asp:PolygonHotSpot Coordinates="301,34,490,34,490,151,301,149,301,34"></asp:PolygonHotSpot>
            <asp:PolygonHotSpot Coordinates="301,149,301,204,347,204,350,225,470,225,470,152,301,149"></asp:PolygonHotSpot>--%>

<%--            <asp:PolygonHotSpot Coordinates="321,360,475,360,470,469,379,469"></asp:PolygonHotSpot>--%>
        </asp:ImageMap>
    </div>

    <telerik:RadToolTip RenderMode="Lightweight" ID="tooltip" RelativeTo="Mouse" runat="server" TargetControlID="area0"
        Animation="FlyIn" Position="BottomCenter" IsClientID="true" ShowCallout="true" RenderInPageRoot="true"><div style="height: 25px; width: 50px; border: 1px red">Area 0</div>
        <%--<img src="images/livingRoom.jpg" alt="LivingRoom" />--%></telerik:RadToolTip>


    <telerik:RadToolTip RenderMode="Lightweight" ID="RadToolTip1" RelativeTo="Mouse" runat="server" TargetControlID="area1"
        Animation="FlyIn" Position="TopRight" IsClientID="true" ShowCallout="false" RenderInPageRoot="true"><div style="height: 25px; width: 50px;">Area 1</div>
        <img src="images/kitchen.jpg" alt="Kitchen" /></telerik:RadToolTip>


    <telerik:RadToolTip RenderMode="Lightweight" ID="RadToolTip2" RelativeTo="Mouse" runat="server" TargetControlID="area2"
        Animation="FlyIn" Position="MiddleRight" IsClientID="true" ShowCallout="false" RenderInPageRoot="true"><div style="height: 25px; width: 50px;">Area 2</div>
        <%--<img src="images/bathroom.jpg" alt="Bathroom" />--%></telerik:RadToolTip>



    <telerik:RadToolTip RenderMode="Lightweight" ID="RadToolTip3" RelativeTo="Mouse" runat="server" TargetControlID="area3"
        Animation="FlyIn" Position="BottomRight" IsClientID="true" ShowCallout="false" RenderInPageRoot="true">
        <img src="images/entrance.jpg" alt="Entrance" /></telerik:RadToolTip>
    <script src="/scripts/mapscripts.js" type="text/javascript"></script>
    <script type="text/javascript">
        //<![CDATA[
        serverID("imageMapID", "<%= ImageMap1.ClientID %>");
        //]]> 
    </script>


                <%--</telerik:RadAjaxPanel>--%>
        </asp:Content>

        