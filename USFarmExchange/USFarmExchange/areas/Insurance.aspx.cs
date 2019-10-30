using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace USFarmExchange.areas
{
    public partial class Insurance : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Set page name in the title section
            SessionInfo.CurrentPage = PageNames.Insurance;
            TitleTag.Text = SessionInfo.DisplayCurrentPage;
            InsuranceHomeContent.Text = SessionInfo.PageContent(PageContentBlocks.InsuranceHomeContent);
        }
    }
}