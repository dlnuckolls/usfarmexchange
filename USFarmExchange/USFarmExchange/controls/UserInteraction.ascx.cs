using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using YAF.Types.Extensions;
using YAF.Utils;
using YAF.Utils.Helpers;

namespace USFarmExchange.controls {
  public partial class UserInteraction : BaseControl {
    protected void Page_Load(object sender, EventArgs e) {
      var loginLink = this.HeadLoginView.FindControlAs<LinkButton>("LoginLink");
      if (loginLink != null) { loginLink.PostBackUrl = "~/forum/forum.aspx?g=login&ReturnUrl={0}".FormatWith(this.GetReturnUrl()); }
      if (!HttpContext.Current.User.Identity.IsNullOrEmpty() || !HttpContext.Current.User.Identity.Name.IsNullOrEmpty()) {
        SessionInfo.CurrentUser.UserName = HttpContext.Current.User.Identity.Name;
        SessionInfo.CurrentUser.IsAuthenticated = HttpContext.Current.User.Identity.IsAuthenticated;
        if (SessionInfo.CurrentUser.IsAuthenticated) {
          SessionInfo.CurrentUser.LoadUserDetails(SessionInfo.CurrentUser.UserName);
          SessionInfo.CurrentUser.IsAdmin = YAF.Core.RoleMembershipHelper.IsUserInRole(SessionInfo.CurrentUser.UserName, "Administrators");
          SessionInfo.CurrentUser.IsSuperAdmin = YAF.Core.RoleMembershipHelper.IsUserInRole(SessionInfo.CurrentUser.UserName, "Administrators");
        }
        var spacer = HeadLoginView.FindControlAs<HtmlGenericControl>("logoutSpacer");
        if (!spacer.IsNullOrEmpty()) spacer.Visible = SessionInfo.IsAdmin;
        var adminMenu = HeadLoginView.FindControlAs<LinkButton>("lbAdminDashboard");
        if (!adminMenu.IsNullOrEmpty()) adminMenu.Visible = (SessionInfo.IsAdmin && SessionInfo.IsAuthenticated);
      } else if (HttpContext.Current.User.Identity.Name.IsNullOrEmpty()) { SessionInfo.CurrentUser.LogoutUser(); }
    }

    protected string GetReturnUrl() {
      return
          HttpContext.Current.Server.UrlEncode(
              HttpContext.Current.Request.QueryString.GetFirstOrDefault("ReturnUrl").IsSet()
                  ? General.GetSafeRawUrl(HttpContext.Current.Request.QueryString.GetFirstOrDefault("ReturnUrl"))
                  : General.GetSafeRawUrl());
    }

    protected void lbAdminDashboard_Click(object sender, EventArgs e) {
      Response.Redirect("~/admin/AdminHome.aspx");
    }
  }
}