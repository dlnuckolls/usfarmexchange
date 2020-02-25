using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace USFarmExchange.areas
{
    public partial class HistoryAgriculture : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SessionInfo.CurrentPage = PageNames.HistoryAgriculture;
            TitleTag.Text = SessionInfo.DisplayCurrentPage;
        }
    }
}