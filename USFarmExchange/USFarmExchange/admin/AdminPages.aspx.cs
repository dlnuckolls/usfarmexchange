using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace USFarmExchange.admin {
  public partial class AdminPages : BasePage {
    protected void Page_Load(object sender, EventArgs e) {
      // Set page name in the title section
      SessionInfo.CurrentPage = PageNames.PageAdmin;
      TitleTag.Text = SessionInfo.DisplayCurrentPage;
      if(!SessionInfo.IsAuthenticated) Response.Redirect("/");
      if(!SessionInfo.IsAdmin) Response.Redirect("~/admin/AdminHome.aspx");
      PageAdminHeader.Text = SessionInfo.PageContent(PageContentBlocks.PageAdminHeader);
    }

    protected void PageLocations_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e) {
      var locationDropdown = (RadComboBox)sender;
      if (locationDropdown.SelectedIndex > -1)
        PageDescription.Content = SqlHelpers.SelectScalar(SqlStatements.SQL_GET_PAGE_CONTENTS.FormatWith(locationDropdown.SelectedValue)).ToString();
      else
        PageDescription.Content = string.Empty;
    }

    protected void SavePage_Click(object sender, EventArgs e) {
      try {
        SqlHelpers.Update(SqlStatements.SQL_SAVE_PAGE_CONTENTS.FormatWith(PageDescription.Content.FixSqlString(), PageLocations.SelectedValue));
        MessageDisplay.Text = "Page Area was Updated";
        MessageDisplay.CssClass = "successMessageDisplay";
        PageLocations.SelectedIndex = -1;
        PageDescription.Content = string.Empty;
      } catch (Exception ex) {
        MessageDisplay.Text = "Page Area failed to update";
        MessageDisplay.CssClass = "errorMessageDisplay";
        SessionInfo.Settings.LogError("Admin: Update Page Area", ex);
      }
    }
  }
}