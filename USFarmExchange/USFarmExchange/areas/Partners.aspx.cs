using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace USFarmExchange.areas
{
    public partial class Partners : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Set page name in the title section
            SessionInfo.CurrentPage = PageNames.Partners;
            TitleTag.Text = SessionInfo.DisplayCurrentPage;
            PartnersHomeContent.Text = SessionInfo.PageContent(PageContentBlocks.PartnersHomeContent);
        }
    }
}