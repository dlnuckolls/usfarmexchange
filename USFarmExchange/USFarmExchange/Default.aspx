<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="USFarmExchange.Default" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<asp:Content ID="Content0" ContentPlaceHolderID="head" runat="Server">
  <asp:Literal ID="TitleTag" runat="server"></asp:Literal>
  <link href="styles/default.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
  <script type="text/javascript">
    (function (global, undefined) {
      var autoInterval;

      function StartAutoRotation(rotator, args) {
        if (!autoInterval) {
          autoInterval = window.setInterval(function () {
            rotator.showNext(Telerik.Web.UI.RotatorScrollDirection.Left);
          }, rotator.get_frameDuration());
        }
      }
      function rotator_load(sender, args) {
        setTimeout(function () {//fix displaced button in Chrome
          if (sender._rightButton) {
            sender._rightButton.style.display = "inline-block";
          }
        }, 0);
      }

      function BeginRequestHandler(sender, args) {
        autoInterval = window.clearInterval(autoInterval);
      }
      Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);

      global.StartAutoRotation = StartAutoRotation;
      global.rotator_load = rotator_load;
    })(window);
  </script>
  <telerik:RadRotator RenderMode="Lightweight" Skin="Silk" FrameDuration="4000" ID="MainRotator1" runat="server" ScrollDirection="Left"
    Width="1200px" Height="400px" ItemWidth="1200px" ItemHeight="400px" PauseOnMouseOver="false">
    <Items>
      <telerik:RadRotatorItem>
        <ItemTemplate>
          <img src="/images/rotator/purpose.jpg" alt="Farmers" style="margin: 15px; max-width: 350px; border: 0; border-radius: 10px !important; float: left;" />
          <h2>What is a farmer?</h2>
          <h4>Daniel Webster defines farmer as “a person who manages or operates a farm.”  He also defines a farm as “a piece of land on which crops or animals are raised.”  
                    A farmer is so much more than that.  He or she is a hardworking, forward thinking individual with both feet on the ground – literally!  Our intent is to help the farmer navigate 
                    the 21st century.  Our application will help do just that.  Our purpose is to fill the gap with information farmers need and can understand.</h4>
        </ItemTemplate>
      </telerik:RadRotatorItem>
      <telerik:RadRotatorItem>
        <ItemTemplate>
          <img src="/images/rotator/hemp.jpg" alt="Hemp" style="margin: 15px; max-width: 350px; border: 0; border-radius: 10px !important; float: left;" />
          <h2>History of Hemp</h2>
          <h4>Some breief intro here</h4>
        </ItemTemplate>
      </telerik:RadRotatorItem>
      <telerik:RadRotatorItem>
        <ItemTemplate>
          <img src="/images/rotator/apply.jpg" alt="Apply" style="margin: 15px; max-width: 350px; border: 0; border-radius: 10px !important; float: left;" />
          <h2>Apply Online</h2>
          <h4>Online applicatino details</h4>
        </ItemTemplate>
      </telerik:RadRotatorItem>
      <telerik:RadRotatorItem>
        <ItemTemplate>
          <img src="/images/rotator/purpose.jpg" alt="Farmers" style="margin: 15px; max-width: 350px; border: 0; border-radius: 10px !important; float: left;" />
          <h2>Our Purpose</h2>
          <h4>To provide the American farmer a multi-channel platform of resources to help the succeed; offering a central exchange for communication, compliance, education, technology, insurance, banking and financial services.</h4>
        </ItemTemplate>
      </telerik:RadRotatorItem>
    </Items>
  </telerik:RadRotator>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
  <telerik:RadPageLayout runat="server" ID="Content1">
    <Rows>
      <telerik:LayoutRow>
        <Columns>
          <telerik:LayoutColumn Span="4" SpanMd="12" SpanSm="12" HiddenXs="true">
          </telerik:LayoutColumn>

          <telerik:LayoutColumn Span="4" SpanMd="12" SpanSm="12" HiddenXs="true">
          </telerik:LayoutColumn>

          <telerik:LayoutColumn Span="4" SpanMd="12" SpanSm="12" HiddenXs="true">
          </telerik:LayoutColumn>
        </Columns>
      </telerik:LayoutRow>
    </Rows>
  </telerik:RadPageLayout>
</asp:Content>
