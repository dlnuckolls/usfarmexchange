using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace USFarmExchange {
  public partial class Login : BasePage {
    protected void Page_Load(object sender, EventArgs e) {
      // Set page name in the title section
      SessionInfo.CurrentPage = PageNames.Login;
      TitleTag.Text = SessionInfo.DisplayCurrentPage;
      lErrorMessage.Text = string.Empty;
    }

    protected void SubmitLogin_OnClick(object sender, EventArgs e) {
      var locationRedirect = string.Empty;
      try {
        SessionInfo.CurrentUser.AuthenticateUser(userName.Text.Trim(), password.Text.Trim().EncryptString());
        if (!SessionInfo.IsAuthenticated) { lErrorMessage.Text = "Username or password do not match"; SessionInfo.Settings.LogError("Login: Login Failed", "Invalid credentials"); return; }
        locationRedirect = (SessionInfo.CurrentUser.UserPassReset) ? "ResetPassword.aspx" : (SessionInfo.CurrentUser.IsSuperAdmin) ? "AdminHome.aspx" :  "Dashboard.aspx";
      } catch (Exception ex) {
        lErrorMessage.Text = "Login failed; please verify your username and password";
        SessionInfo.Settings.LogError("Login: Login Failed", ex);
      }
      if (!locationRedirect.IsNullOrEmpty()) Response.Redirect(locationRedirect);
    }
    protected void ForgotPassword_OnClick(object sender, EventArgs e) {
      Response.Redirect("ForgotPassword.aspx");
    }
  }
}