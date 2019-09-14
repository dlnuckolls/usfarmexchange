<%@ Page Title="" Language="C#" MasterPageFile="~/admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="AdminHome.aspx.cs" Inherits="USFarmExchange.admin.AdminHome" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  <asp:Literal ID="TitleTag" runat="server"></asp:Literal>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <telerik:RadPageLayout runat="server" ID="RadPageLayout1">
    <Rows>
      <telerik:LayoutRow>
        <Columns>
          <telerik:LayoutColumn Span="1" HiddenMd="true" />
          <telerik:LayoutColumn Span="10" SpanMd="12">
            <div style="text-align: center; width: 100%;"><h2><span style="color: #3366ff;">US Farm Exchange Administrative Tools</span></h2></div>
            <div class="adminTiles">
              <telerik:RadImageAndTextTile ID="UserAccounts" runat="server" BackColor="Transparent" 
                ImageUrl="~/images/menutiles/icons8-group.png" OnClick="UserAccounts_Click" AutoPostBack="True" />
              <telerik:RadImageAndTextTile ID="AdminUsers" runat="server" BackColor="Transparent" 
                ImageUrl="~/images/menutiles/icons8-find_user.png" OnClick="AdminUsers_Click" AutoPostBack="True" />
              <telerik:RadImageAndTextTile ID="SystemValues" runat="server" BackColor="Transparent" 
                ImageUrl="~/images/menutiles/icons8-accept_database.png" OnClick="SystemValues_Click" AutoPostBack="True" />
              <telerik:RadImageAndTextTile ID="EditPageAdmin" runat="server" BackColor="Transparent" 
                ImageUrl="~/images/menutiles/icons8-edit_image.png" OnClick="EditPageAdmin_Click" AutoPostBack="True" />
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
