using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace USFarmExchange.areas
{
    public partial class MagnoliaBank : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SessionInfo.CurrentPage = PageNames.MagnoliaBank;
            TitleTag.Text = SessionInfo.DisplayCurrentPage;
        }

        protected void btnLearnMore_Click(object sender, EventArgs e)
        {

        }
    }
}