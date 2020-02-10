using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace USFarmExchange.admin {
  public partial class AdminResourceLinks : BasePage {
    protected void Page_Load(object sender, EventArgs e) {
      // Set page name in the title section
      SessionInfo.CurrentPage = PageNames.ResourceLinks;
      TitleTag.Text = SessionInfo.DisplayCurrentPage;
      if (!SessionInfo.IsAuthenticated) Response.Redirect("/");
      if (!SessionInfo.IsAdmin) Response.Redirect("~/admin/AdminHome.aspx");
      PageAdminHeader.Text = SessionInfo.PageContent(PageContentBlocks.ResourceLinksManagement);
    }

    protected void gResourceLinks_CancelCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e) { SessionInfo.CurrentResourceLink = null; ((RadGrid)sender).Rebind(); }
    protected void gResourceLinks_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e) { ((RadGrid)sender).DataSource = SqlDatasets.GetAdminResourceLinks(); }

    protected void gResourceLinks_EditCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e) {
      var resourceId = (int)((GridDataItem)e.Item).GetDataKeyValue("Id");
      SessionInfo.CurrentResourceLink = new ResourceLink(resourceId);
    }

    protected void gResourceLinks_InsertCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e) {
      SessionInfo.CurrentResourceLink = new ResourceLink();
      SessionInfo.CurrentResourceLink.Active = ((RadCheckBox)e.Item.FindControl("ResourceActive")).Checked.Value;
      SessionInfo.CurrentResourceLink.Title = ((RadTextBox)e.Item.FindControl("ResourceTitle")).Text;
      SessionInfo.CurrentResourceLink.URL = ((RadTextBox)e.Item.FindControl("ResourceURL")).Text;
      SessionInfo.CurrentResourceLink.Description = ((RadEditor)e.Item.FindControl("ResourceDescription")).Content;
      SessionInfo.CurrentResourceLink.SaveResourceLink();
      ((RadGrid)sender).Rebind();
    }

    protected void gResourceLinks_UpdateCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e) {
      SessionInfo.CurrentResourceLink.Active = ((RadCheckBox)e.Item.FindControl("ResourceActive")).Checked.Value;
      SessionInfo.CurrentResourceLink.Title = ((RadTextBox)e.Item.FindControl("ResourceTitle")).Text;
      SessionInfo.CurrentResourceLink.URL = ((RadTextBox)e.Item.FindControl("ResourceURL")).Text;
      SessionInfo.CurrentResourceLink.Description = ((RadEditor)e.Item.FindControl("ResourceDescription")).Content;
      SessionInfo.CurrentResourceLink.SaveResourceLink();
      ((RadGrid)sender).Rebind();
    }

    protected void AsyncUpload1_FileUploaded(object sender, FileUploadedEventArgs e) {
      var fileUpload = (RadAsyncUpload)sender;
      if (fileUpload.UploadedFiles.Count > 0) {
        UploadedFile file = fileUpload.UploadedFiles[0];
        SessionInfo.CurrentResourceLink.ThumbNail = "/images/thumbnails/{0}".FormatWith(file.GetName());
        file.SaveAs("{0}/{1}".FormatWith(Server.MapPath("~/images/thumbnails"), file.GetName()), true);
      }
    }

    protected void gResourceLinks_DeleteCommand(object sender, GridCommandEventArgs e) {
      var resourceId = (int)((GridDataItem)e.Item).GetDataKeyValue("Id");
      _ = SqlHelpers.Delete(SqlStatements.SQL_DELETE_RESOURCE_LINK_BY_ID.FormatWith(resourceId));
      ((RadGrid)sender).Rebind();
    }
  }
}