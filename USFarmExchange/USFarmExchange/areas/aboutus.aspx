<%@ Page Title="" Language="C#" MasterPageFile="~/MasterContentPage.Master" AutoEventWireup="true" CodeBehind="aboutus.aspx.cs" Inherits="USFarmExchange.areas.aboutus" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <asp:Literal ID="TitleTag" runat="server"></asp:Literal>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TableOfContents1" runat="server">
   
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent1" runat="server">
   <div class="largeheaderaboutus"></div>   
       <div class="justify">
       <asp:Literal ID="AboutUsHomeContent" runat="server" />
        <br />
        <br />
    </div>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="RightColumn1" runat="server">
</asp:Content>
