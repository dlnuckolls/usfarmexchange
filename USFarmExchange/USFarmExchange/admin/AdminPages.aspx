﻿<%@ Page Title="" Language="C#" MasterPageFile="~/admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="AdminPages.aspx.cs" Inherits="USFarmExchange.admin.AdminPages" %>

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
  <telerik:RadAjaxPanel runat="server">
    <div style="min-height: 800px;">
      <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetAllPageLocations" TypeName="USFarmExchange.SqlDatasets" />
      <h3>Page Content Editor</h3>
      <br />
      <br />
      <div id="messageDisplayArea">
        <telerik:RadLabel runat="server" ID="MessageDisplay"></telerik:RadLabel>
      </div>
      <div style="height: 40px; width: 98%; clear: both;">
        <div style="float: left;">
          <telerik:RadComboBox runat="server" ID="PageLocations" RenderMode="Auto" Width="100%" EmptyMessage="Select a Location"
            DataTextField="Description" DataValueField="Id" Skin="Silk" DataSourceID="ObjectDataSource1" ZIndex="10000" AutoPostBack="true"
            OnSelectedIndexChanged="PageLocations_SelectedIndexChanged" Label="Select Page Block to Edit" />
        </div>
        <div style="float: right;">
          <telerik:RadButton ID="SavePage" runat="server" Skin="Silk" RenderMode="Auto" Text="Save Changes" OnClick="SavePage_Click" CssClass="css3Simple" />
        </div>
      </div>
      <div class="adminTiles">
        <telerik:RadEditor RenderMode="Lightweight" runat="server" ID="PageDescription" SkinID="DefaultSetOfTools"
          Height="675px" Skin="Silk" Width="100%" EditModes="Design">
          <Tools>
            <telerik:EditorToolGroup Tag="MainToolbar">
              <telerik:EditorTool Name="FindAndReplace"></telerik:EditorTool>
              <telerik:EditorSeparator></telerik:EditorSeparator>
              <telerik:EditorSplitButton Name="Undo"></telerik:EditorSplitButton>
              <telerik:EditorSplitButton Name="Redo"></telerik:EditorSplitButton>
              <telerik:EditorSeparator></telerik:EditorSeparator>
              <telerik:EditorTool Name="Cut"></telerik:EditorTool>
              <telerik:EditorTool Name="Copy"></telerik:EditorTool>
              <telerik:EditorTool Name="Paste" ShortCut="CTRL+V / CMD+V"></telerik:EditorTool>
              <telerik:EditorTool Name="AjaxSpellCheck" Text="Spell Check"></telerik:EditorTool>
            </telerik:EditorToolGroup>
            <telerik:EditorToolGroup Tag="Formatting">
              <telerik:EditorTool Name="Bold"></telerik:EditorTool>
              <telerik:EditorTool Name="Italic"></telerik:EditorTool>
              <telerik:EditorTool Name="Underline"></telerik:EditorTool>
              <telerik:EditorSeparator></telerik:EditorSeparator>
              <telerik:EditorSplitButton Name="ForeColor"></telerik:EditorSplitButton>
              <telerik:EditorSplitButton Name="BackColor"></telerik:EditorSplitButton>
              <telerik:EditorSeparator></telerik:EditorSeparator>
              <telerik:EditorDropDown Name="FontName"></telerik:EditorDropDown>
              <telerik:EditorDropDown Name="RealFontSize"></telerik:EditorDropDown>
              <telerik:EditorSeparator></telerik:EditorSeparator>
              <telerik:EditorTool Name="ImageManager" Text="Image Manager"></telerik:EditorTool>
            </telerik:EditorToolGroup>
            <telerik:EditorToolGroup>
              <telerik:EditorTool Name="InsertLink" Text="Links"></telerik:EditorTool>
              <telerik:EditorTool Name="Unlink" Text="Unlink"></telerik:EditorTool>
            </telerik:EditorToolGroup>
          </Tools>
          <ImageManager ViewPaths="~/images/useruploads/pages"
            UploadPaths="~/images/useruploads/pages"
            DeletePaths="~/images/useruploads/pages"
            EnableAsyncUpload="true" />
          <Modules>
            <telerik:EditorModule Name="RadEditorStatistics" Visible="true" Enabled="true" />
            <telerik:EditorModule Name="RadEditorDomInspector" Visible="false" Enabled="true" />
            <telerik:EditorModule Name="RadEditorNodeInspector" Visible="false" Enabled="true" />
            <telerik:EditorModule Name="RadEditorHtmlInspector" Visible="false" Enabled="true" />
          </Modules>
        </telerik:RadEditor>
      </div>
    </div>
  </telerik:RadAjaxPanel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
