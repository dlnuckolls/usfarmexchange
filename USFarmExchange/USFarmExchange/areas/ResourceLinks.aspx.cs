using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace USFarmExchange.areas {
  public partial class ResourceLinks :BasePage {

    protected void Page_Load(object sender, EventArgs e) {
      // Set page name in the title section
      SessionInfo.CurrentPage = PageNames.Resources;
      TitleTag.Text = SessionInfo.DisplayCurrentPage;
      ResourceLinksDescription.Text = SessionInfo.PageContent(PageContentBlocks.ResourceLinksContent);
    }

    protected void Unnamed_SelectedIndexChanged(object sender, EventArgs e) {

    }

    protected void LinkButton1_Click(object sender, EventArgs e) {

      Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "myscript", "window.open('','_blank','location=0,menubar=0,status=1,titlebar=1,toolbar=1');", true);
    }
  }
}