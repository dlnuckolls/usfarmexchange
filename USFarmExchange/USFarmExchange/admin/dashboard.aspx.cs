using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace USFarmExchange.admin {
  public partial class Dashboard :BasePage {
    protected void Page_Load(object sender, EventArgs e) {
      // Set page name in the title section
      SessionInfo.CurrentPage = PageNames.Dashboard;
      TitleTag.Text = SessionInfo.DisplayCurrentPage;
      if(!SessionInfo.IsAuthenticated) Response.Redirect("~/admin/Login.aspx");
      if(!SessionInfo.IsAdmin) Response.Redirect("~/admin/AdminHome.aspx");
      DashboardHeader.Text = SessionInfo.PageContent(PageContentBlocks.DashboardHeader);
    }
  }
}