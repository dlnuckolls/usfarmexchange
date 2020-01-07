using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace USFarmExchange.admin {
  public partial class AdminResourceLinks :BasePage {
    protected void Page_Load(object sender, EventArgs e) {
      // Set page name in the title section
      SessionInfo.CurrentPage = PageNames.ResourceLinks;
      TitleTag.Text = SessionInfo.DisplayCurrentPage;
      if(!SessionInfo.IsAuthenticated) Response.Redirect("/");
      if(!SessionInfo.IsAdmin) Response.Redirect("~/admin/AdminHome.aspx");
      PageAdminHeader.Text = SessionInfo.PageContent(PageContentBlocks.ResourceLinksManagement);
    }

    protected void gResourceLinks_CancelCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e) { ((RadGrid)sender).Rebind(); }
    protected void gResourceLinks_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e) { ((RadGrid)sender).DataSource = SqlDatasets.GetAdminResourceLinks(); }

    protected void gResourceLinks_EditCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e) {

    }

    protected void gResourceLinks_InsertCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e) {

    }

    protected void gResourceLinks_UpdateCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e) {

    }
  }
}