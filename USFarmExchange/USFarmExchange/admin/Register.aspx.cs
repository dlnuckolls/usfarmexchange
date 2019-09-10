using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace USFarmExchange {
  public partial class Register :BasePage {
    protected void Page_Load(object sender, EventArgs e) {
      SessionInfo.CurrentPage = PageNames.Registration;
      TitleTag.Text = SessionInfo.DisplayCurrentPage;
      lErrorMessage.Text = string.Empty;
    }

    protected void SubmitLogin_OnClick(object sender, EventArgs e) {
      try {
        // Disallow empty fields
        if(displayName.Text.Trim().Length == 0 || userName.Text.Trim().Length == 0 || password.Text.Trim().Length == 0)
          throw new ApplicationException("Please provide the required details");
        // Check Username (email)
        var userSearch = SqlHelpers.SelectScalar(SqlStatements.SQL_LOOKUP_USERNAME.FormatWith(userName.Text.Trim().FixSqlString()));
        if(!userSearch.IsNullOrEmpty()) throw new ApplicationException("Email Address is already in use, please check your entry or use the Forgot Password to reset.");
        // Insert Base Record
        var newRegistration = SqlHelpers.InsertScalar(SqlStatements.SQL_CREATE_USER_REGISTRATION.FormatWith(
          displayName.Text.Trim().FixSqlString(), userName.Text.Trim().FixSqlString(), password.Text.Trim().EncryptString()));
        RegistrationPage.Visible = false;
        RegistrationThankYou.Visible = true;
      } catch(Exception ex) {
        lErrorMessage.Text = ex.Message;
        SessionInfo.Settings.LogError("Registration Failed", ex);
      }
    }
  }
}