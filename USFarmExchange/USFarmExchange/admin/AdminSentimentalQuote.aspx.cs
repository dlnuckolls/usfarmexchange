using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace USFarmExchange.admin {
  public partial class AdminSentimentalQuote : BasePage {
    protected void Page_Load(object sender, EventArgs e) {
      SessionInfo.CurrentPage = PageNames.Sentimental;
      TitleTag.Text = SessionInfo.DisplayCurrentPage;
      if (!SessionInfo.IsAuthenticated) Response.Redirect("/");
      if (!SessionInfo.IsAdmin) Response.Redirect("~/admin/AdminHome.aspx");
      PageAdminHeader.Text = SessionInfo.PageContent(PageContentBlocks.ResourceLinksManagement);
    }

    protected void gSenimentalSayings_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e) { ((RadGrid)sender).DataSource = SqlDatasets.GetAllSentimentalSayings(); }

    protected void gSenimentalSayings_UpdateCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e) {
      try {
      var sayingId = (int)((GridDataItem)e.Item).GetDataKeyValue("Id");
      Hashtable values = new Hashtable();
      var editableItem = ((GridEditableItem)e.Item);
      editableItem.ExtractValues(values);
      _ = SqlHelpers.Update(SqlStatements.SQL_UPDATE_RANDOM_SAYING.FormatWith(
        values["Title"].ToString().FixSqlString(), values["Description"].ToString().FixSqlString(), sayingId));
      MessageDisplay.Text = "Saying Updated";
      MessageDisplay.CssClass = "successMessageDisplay";
      } catch (Exception ex) {
        MessageDisplay.Text = "Saying Failed to Update";
        MessageDisplay.CssClass = "errorMessageDisplay";
        SessionInfo.Settings.LogError("Admin: Update Saying", ex);
      }
    }

    protected void gSenimentalSayings_InsertCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e) {
      try {
        Hashtable values = new Hashtable();
        var editableItem = ((GridEditableItem)e.Item);
        editableItem.ExtractValues(values);
        _ = SqlHelpers.Update(SqlStatements.SQL_INSERT_RANDOM_SAYING.FormatWith(
          values["Title"].ToString().FixSqlString(), values["Description"].ToString().FixSqlString()));
        MessageDisplay.Text = "Saying Created";
        MessageDisplay.CssClass = "successMessageDisplay";
      } catch (Exception ex) {
        MessageDisplay.Text = "Saying Failed to Create";
        MessageDisplay.CssClass = "errorMessageDisplay";
        SessionInfo.Settings.LogError("Admin: Create Saying", ex);
      }
    }

    protected void gSenimentalSayings_DeleteCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e) {
      var sayingId = (int)((GridDataItem)e.Item).GetDataKeyValue("Id");
      _ = SqlHelpers.Delete(SqlStatements.SQL_DELETE_RANDOM_SAYING.FormatWith(sayingId));
    }
  }
}