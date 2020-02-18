<%@ Page Title="" Language="C#" MasterPageFile="~/admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="AdminSentimentalQuote.aspx.cs" Inherits="USFarmExchange.admin.AdminSentimentalQuote" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  <asp:Literal ID="TitleTag" runat="server"></asp:Literal>
  <style>
    .RadGrid {
      border-radius: 10px;
      overflow: hidden;
    }

    .RadGrid_Silk .rgFilterRow > td > [type="text"] {
      width: 90% !important;
    }
  </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <asp:Literal ID="PageAdminHeader" runat="server" />
  <div id="messageDisplayArea">
    <telerik:RadLabel runat="server" ID="MessageDisplay"></telerik:RadLabel>
  </div>
  <telerik:RadGrid RenderMode="Auto" runat="server" ID="gSenimentalSayings" AllowPaging="true" GridLines="Horizontal"
    CellPadding="0" BorderWidth="0px" BorderStyle="None" MasterTableView-CellPadding="0" MasterTableView-CellSpacing="0" MasterTableView-GridLines="Horizontal"
    Skin="Silk" OnNeedDataSource="gSenimentalSayings_NeedDataSource" OnUpdateCommand="gSenimentalSayings_UpdateCommand" 
    OnInsertCommand="gSenimentalSayings_InsertCommand" Width="100%" OnDeleteCommand="gSenimentalSayings_DeleteCommand">
    <MasterTableView AutoGenerateColumns="False" EditMode="InPlace" DataKeyNames="Id" GridLines="None"
      ClientDataKeyNames="Id" CommandItemDisplay="TopAndBottom" InsertItemPageIndexAction="ShowItemOnFirstPage">
      <Columns>
        <telerik:GridEditCommandColumn UniqueName="EditCommandColumn" ItemStyle-VerticalAlign="Top" HeaderText="Edit" ItemStyle-Width="30px" />
        <telerik:GridButtonColumn ConfirmText="Delete this entry?" ConfirmDialogType="Classic" ConfirmTitle="Delete" ButtonType="FontIconButton" HeaderText="Delete"
          CommandName="Delete" ItemStyle-Width="30px" ItemStyle-VerticalAlign="Top" />
        <telerik:GridBoundColumn ShowFilterIcon="False" DataField="Title" AllowFiltering="False" HeaderText="Title" ItemStyle-Width="175px" />
        <telerik:GridBoundColumn ShowFilterIcon="false" DataField="Description" AllowFiltering="False" HeaderText="Saying"  />
      </Columns>
    </MasterTableView>
    <ClientSettings EnableRowHoverStyle="true">
      <Selecting AllowRowSelect="True"></Selecting>
    </ClientSettings>
    <PagerStyle Mode="NextPrevAndNumeric"></PagerStyle>
  </telerik:RadGrid>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
