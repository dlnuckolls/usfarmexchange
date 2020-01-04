<%@ Page Title="" Language="C#" MasterPageFile="~/admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="AdminResourceLinks.aspx.cs" Inherits="USFarmExchange.admin.AdminResourceLinks" %>

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
  <telerik:RadGrid RenderMode="Auto" runat="server" ID="gResourceLinks" AllowPaging="true" GridLines="Horizontal"
    CellPadding="0" BorderWidth="0px" BorderStyle="None" MasterTableView-CellPadding="0" MasterTableView-CellSpacing="0" MasterTableView-GridLines="Horizontal"
    Skin="Silk" OnNeedDataSource="gResourceLinks_NeedDataSource" OnUpdateCommand="gResourceLinks_UpdateCommand" OnEditCommand="gResourceLinks_EditCommand"
    OnInsertCommand="gResourceLinks_InsertCommand" OnCancelCommand="gResourceLinks_CancelCommand" Width="100%">
    <MasterTableView AutoGenerateColumns="False" EditMode="InPlace" DataKeyNames="Id" GridLines="None"
      ClientDataKeyNames="Id" CommandItemDisplay="Bottom" InsertItemPageIndexAction="ShowItemOnFirstPage">
      <Columns>
        <telerik:GridEditCommandColumn UniqueName="EditCommandColumn" ItemStyle-VerticalAlign="Top" HeaderText="Edit" ItemStyle-Width="30px" />
        <telerik:GridButtonColumn ConfirmText="Delete this entry?" ConfirmDialogType="Classic" ConfirmTitle="Delete" ButtonType="FontIconButton" HeaderText="Delete"
          CommandName="Delete" ItemStyle-Width="30px" ItemStyle-VerticalAlign="Top" />
        <telerik:GridTemplateColumn UniqueName="CareerPostItem" HeaderText="Career Postings">
          <ItemTemplate>
            <telerik:RadPageLayout runat="server" ID="RadPageLayout2">
              <Rows>
                <telerik:LayoutRow>
                  <Columns>
                    <telerik:LayoutColumn Span="4" SpanMd="4" SpanSm="12">
                      <div style="display: block; width: 150px !important; margin-top: 4px; margin-bottom: 4px; text-align: left; font-weight: bold;">Title</div>
                      <telerik:RadLabel ID="RadLabel1" runat="server" Text='<%# Bind("Title") %>' Width="100%" />
                      <div style="display: block; width: 150px !important; margin-top: 4px; margin-bottom: 4px; text-align: left; font-weight: bold;">Display Name</div>
                      <telerik:RadLabel ID="RadLabel2" runat="server" Text='<%# Bind("DisplayName") %>' Width="100%" />
                      <div style="display: block; width: 150px !important; margin-top: 4px; margin-bottom: 4px; text-align: left; font-weight: bold;">Thumbnail</div>
                      <telerik:RadLabel ID="RadLabel3" runat="server" Text='<%# Bind("ThumbNail") %>' Width="100%" />
                      <div style="display: block; width: 150px !important; margin-top: 4px; margin-bottom: 4px; text-align: left; font-weight: bold;">Active</div>
                      <telerik:RadLabel ID="RadLabel4" runat="server" Text='<%# (Eval("Active").ToString() == "1") ? "Active" : "Inactive" %>' Width="100%" />
                    </telerik:LayoutColumn>
                    <telerik:LayoutColumn Span="8" SpanMd="8" SpanSm="12">
                      <div class="adminTiles">
                        <asp:Literal ID="Literal1" runat="server" Text='<%# Bind("Description") %>' />
                      </div>
                    </telerik:LayoutColumn>
                  </Columns>
                </telerik:LayoutRow>
              </Rows>
            </telerik:RadPageLayout>
          </ItemTemplate>
          <EditItemTemplate>
            <telerik:RadPageLayout runat="server" ID="RadPageLayout2">
              <Rows>
                <telerik:LayoutRow>
                  <Columns>
                    <telerik:LayoutColumn Span="4" SpanMd="4" SpanSm="12">
                      <div style="display: block; width: 150px !important; margin-top: 4px; margin-bottom: 4px; text-align: left; font-weight: bold;">Position Title</div>
                      <telerik:RadTextBox ID="CareerTitle" runat="server" RenderMode="Auto" Width="100%" EmptyMessage="Enter a Title" Skin="Silk" Text='<%# Bind("Title") %>' />
                      <div style="display: block; width: 150px !important; margin-top: 4px; margin-bottom: 4px; text-align: left; font-weight: bold;">Display Name</div>
                      <telerik:RadTextBox ID="RadTextBox1" runat="server" RenderMode="Auto" Width="100%" EmptyMessage="Enter a Title" Skin="Silk" Text='<%# Bind("DisplayName") %>' />
                      <div style="display: block; width: 150px !important; margin-top: 4px; margin-bottom: 4px; text-align: left; font-weight: bold;">Thumbnail</div>
                    </telerik:LayoutColumn>
                    <telerik:LayoutColumn Span="8" SpanMd="8" SpanSm="12">
                      <div class="adminTiles">
                        <telerik:RadEditor RenderMode="Lightweight" runat="server" ID="CareerDescription" SkinID="DefaultSetOfTools"
                          Height="675px" Skin="Silk" Width="100%" EditModes="Design" Content='<%# Bind("Description") %>'>
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
                          <ImageManager ViewPaths="~/images/useruploads/careers"
                            UploadPaths="~/images/useruploads/careers"
                            DeletePaths="~/images/useruploads/careers"
                            EnableAsyncUpload="true" />
                          <Modules>
                            <telerik:EditorModule Name="RadEditorStatistics" Visible="true" Enabled="true" />
                            <telerik:EditorModule Name="RadEditorDomInspector" Visible="false" Enabled="true" />
                            <telerik:EditorModule Name="RadEditorNodeInspector" Visible="false" Enabled="true" />
                            <telerik:EditorModule Name="RadEditorHtmlInspector" Visible="false" Enabled="true" />
                          </Modules>
                        </telerik:RadEditor>
                      </div>
                    </telerik:LayoutColumn>
                  </Columns>
                </telerik:LayoutRow>
              </Rows>
            </telerik:RadPageLayout>
          </EditItemTemplate>
        </telerik:GridTemplateColumn>
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
