<%@ Page Title="" Language="C#" MasterPageFile="~/MasterContentPage.Master" AutoEventWireup="true" CodeBehind="ResourceLinks.aspx.cs" Inherits="USFarmExchange.areas.ResourceLinks" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  <asp:Literal ID="TitleTag" runat="server"></asp:Literal>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TableOfContents1" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent1" runat="server">
  <asp:Literal ID="ResourceLinksDescription" runat="server" />
  <br />
  <br />
  <telerik:RadListView runat="server" DataSourceID="ObjectDataSource1" AllowNaturalSort="True" Skin="WebBlue" >
    <LayoutTemplate>
      <div class="RadListView RadListView_WebBlue">
        <div runat="server" id="itemPlaceholder"></div>
      </div>
    </LayoutTemplate>
    <ItemTemplate>
      <div class="rlvI" style="min-height: 150px;">
        <img style="float: left; padding-right: 15px;" src='<%# Eval("ThumbNail") %>' />
        <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" CommandName="Navigate" CommandArgument='<%# Eval("Id") %>'><%# Eval("DisplayName") %></asp:LinkButton><br />
        <asp:Label ID="Label2" runat="server" Text='<%# Eval("Description") %>'></asp:Label>
      </div>
    </ItemTemplate>
    <AlternatingItemTemplate>
      <div class="rlvA" style="min-height: 150px;">
        <img style="float: left; padding-right: 15px;" src='<%# Eval("ThumbNail") %>' />
        <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" CommandName="Navigate" CommandArgument='<%# Eval("Id") %>'><%# Eval("DisplayName") %></asp:LinkButton><br />
        <asp:Label ID="Label2" runat="server" Text='<%# Eval("Description") %>'></asp:Label>
      </div>
    </AlternatingItemTemplate>
    <ValidationSettings EnableValidation="False" EnableModelValidation="False"></ValidationSettings>
  </telerik:RadListView>
  <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetAllResourceLinks" TypeName="USFarmExchange.SqlDatasets"></asp:ObjectDataSource>
  <br />
  <br />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="RightColumn1" runat="server">
</asp:Content>
