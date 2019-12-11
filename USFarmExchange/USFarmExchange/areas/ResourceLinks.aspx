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
  <telerik:RadListView runat="server" DataSourceID="ObjectDataSource1" AllowNaturalSort="True" Skin="WebBlue" OnSelectedIndexChanged="Unnamed_SelectedIndexChanged">
    <LayoutTemplate>
      <div class="RadListView RadListView_WebBlue">
        <div runat="server" id="itemPlaceholder"></div>
      </div>
    </LayoutTemplate>
    <ItemTemplate>
      <div class="rlvI" style="min-height:150px;">
          <img style="float:left; padding-right:15px;" src='<%# Eval("ThumbNail") %>' />
          <asp:Label ID="Label1" runat="server" Text='<%# Eval("DisplayName") %>'></asp:Label><br />
          <asp:Label ID="Label2" runat="server" Text='<%# Eval("DestinationURL") %>'></asp:Label>
      </div>
    </ItemTemplate>
    <AlternatingItemTemplate>
      <div class="rlvA" style="min-height:150px;">
          <img style="float:left; padding-right:15px;"  src='<%# Eval("ThumbNail") %>' />
          <asp:Label ID="Label1" runat="server" Text='<%# Eval("DisplayName") %>'></asp:Label><br />
          <asp:Label ID="Label2" runat="server" Text='<%# Eval("DestinationURL") %>'></asp:Label>
      </div>
    </AlternatingItemTemplate>
    <ValidationSettings EnableValidation="False" EnableModelValidation="False"></ValidationSettings>
  </telerik:RadListView>
  <telerik:RadPanelBar RenderMode="Auto" Skin="Silk" ID="RadPanelBar1" runat="server" Width="100%" ExpandMode="MultipleExpandedItems" AllowCollapseAllItems="true"
    DataSourceID="ObjectDataSource1" DataFieldID="Id" DataFieldParentID="GroupId" DataNavigateUrlField="DestinationURL" DataTextField="DisplayName">
  </telerik:RadPanelBar>
  <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetAllResourceLinks" TypeName="USFarmExchange.SqlDatasets"></asp:ObjectDataSource>
  <br />
  <br />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="RightColumn1" runat="server">
</asp:Content>
