<%@ Page Title="" Language="C#" MasterPageFile="~/admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="AdminHome.aspx.cs" Inherits="USFarmExchange.admin.AdminHome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  <asp:Literal ID="TitleTag" runat="server"></asp:Literal>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <asp:Literal ID="AdminHomeTop" runat="server" />
  <telerik:RadPageLayout runat="server" ID="RadPageLayout1">
    <Rows>
      <telerik:LayoutRow>
        <Columns>
          <telerik:LayoutColumn Span="1" HiddenMd="true" />
          <telerik:LayoutColumn Span="10" SpanMd="12">
            <div style="text-align: center; width: 100%;">
              <asp:Literal ID="AdminHomeToolHeader" runat="server" />
              <h2><span style="color: #3366ff;">US Farm Exchange Administrative Tools</span></h2>
            </div>
            <div class="adminTiles">
              <telerik:RadIconTile ID="AdminResourceLinks" runat="server" ImageUrl="~/images/menutiles/internet.png" AutoPostBack="true" OnClick="ResourceLinks_Click">
                <Title Text="Resource Links"></Title>
              </telerik:RadIconTile>
              <telerik:RadIconTile ID="EditPageAdmin" runat="server" ImageUrl="~/images/menutiles/pages.png" AutoPostBack="true" OnClick="EditPageAdmin_Click">
                <Title Text="Page Contents"></Title>
              </telerik:RadIconTile>
              <telerik:RadIconTile ID="QuoteAdmin" runat="server" ImageUrl="~/images/menutiles/quotes.png" AutoPostBack="true" OnClick="QuoteAdmin_Click">
                <Title Text="Sentimental"></Title>
              </telerik:RadIconTile>
            </div>
          </telerik:LayoutColumn>
          <telerik:LayoutColumn Span="1" HiddenMd="true" />
        </Columns>
      </telerik:LayoutRow>
    </Rows>
  </telerik:RadPageLayout>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
