<%@ Page Title="" Language="C#" MasterPageFile="~/MasterContentPage.Master" AutoEventWireup="true" CodeBehind="agritourism.aspx.cs" Inherits="USFarmExchange.areas.agritourism" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <asp:Literal ID="TitleTag" runat="server"></asp:Literal>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TableOfContents1" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent1" runat="server">
    <div class="justify">
     <asp:Literal ID="AgritourismHomeContent" runat="server"></asp:Literal>
    <br />
    <br />
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="RightColumn1" runat="server">
</asp:Content>
