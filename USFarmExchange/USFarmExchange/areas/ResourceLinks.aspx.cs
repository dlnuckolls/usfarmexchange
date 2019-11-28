using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace USFarmExchange.areas
{
    public partial class ResourceLinks : BasePage
    {
        private static string Text;

        protected void Page_Load(object sender, EventArgs e)
        {
            // Set page name in the title section
            SessionInfo.CurrentPage = PageNames.Resources;
            TitleTag.Text = SessionInfo.DisplayCurrentPage;
           ResourceLinks.Text = SessionInfo.PageContent(PageContentBlocks.ResourceLinks);
            

        }
    }
}