using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace USFarmExchange.areas
{
    public partial class Education : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Set page name in the title section
            SessionInfo.CurrentPage = PageNames.Education;
            TitleTag.Text = SessionInfo.DisplayCurrentPage;
            EducationHomeContent.Text = SessionInfo.PageContent(PageContentBlocks.EducationHomeContent);
        }
    }
}