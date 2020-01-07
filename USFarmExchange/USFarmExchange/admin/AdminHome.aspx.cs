using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace USFarmExchange.admin {
  public partial class AdminHome :BasePage {
    protected void Page_Load(object sender, EventArgs e) {
      // Set page name in the title section
      SessionInfo.CurrentPage = PageNames.Admin;
      TitleTag.Text = SessionInfo.DisplayCurrentPage;
      if(!SessionInfo.IsAuthenticated) Response.Redirect("/");
      AdminHomeTop.Text = SessionInfo.PageContent(PageContentBlocks.AdminHomeTop);
      AdminHomeToolHeader.Text = SessionInfo.PageContent(PageContentBlocks.AdminHomeToolHeader);
    }

    protected void EditPageAdmin_Click(object sender, EventArgs e) {
      Response.Redirect("~/admin/AdminPages.aspx");
    }

    protected void ResourceLinks_Click(object sender, EventArgs e) {
      Response.Redirect("~/admin/AdminResourceLinks.aspx");
    }
  }
}