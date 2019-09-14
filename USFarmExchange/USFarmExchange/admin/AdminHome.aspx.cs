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
      if(!SessionInfo.IsAuthenticated) Response.Redirect("Login.aspx");
    }

    protected void UserAccounts_Click(object sender, EventArgs e) {

    }

    protected void AdminUsers_Click(object sender, EventArgs e) {

    }

    protected void SystemValues_Click(object sender, EventArgs e) {

    }

    protected void EditPageAdmin_Click(object sender, EventArgs e) {
      Response.Redirect("~/admin/AdminPages.aspx");
    }
  }
}