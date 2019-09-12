using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace USFarmExchange.controls {
  public partial class UserInteraction :BaseControl {
    protected void Page_Load(object sender, EventArgs e) {
      lbAccount.Visible = !SessionInfo.IsAuthenticated;
      lbDashboard.Visible = SessionInfo.IsAuthenticated;
      adminSpacer.Visible = SessionInfo.IsAdmin;
      lbAdminDashboard.Visible = (SessionInfo.IsAdmin && SessionInfo.IsAuthenticated);
      logoutSpacer.Visible = SessionInfo.IsAuthenticated;
      lbLogout.Visible = SessionInfo.IsAuthenticated;
      lUserDisplayName.Text = "Welcome Back {0}".FormatWith(SessionInfo.CurrentUser.DisplayName);
    }

    protected void lbAccount_Click(object sender, EventArgs e) {
      Response.Redirect("~/admin/Login.aspx");
    }

    protected void LbDashboard_Click(object sender, EventArgs e) {
      Response.Redirect("~/admin/Dashboard.aspx");
    }

    protected void LbAdminDashboard_Click(object sender, EventArgs e) {
      Response.Redirect("~/admin/AdminHome.aspx");
    }

    protected void LbLogout_Click(object sender, EventArgs e) {
      SessionInfo.CurrentUser.LogoutUser();
      Response.Redirect("~/");
    }
  }
}