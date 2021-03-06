﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace USFarmExchange.areas
{
    public partial class Podcasts : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Set page name in the title section
            SessionInfo.CurrentPage = PageNames.Communications;
            TitleTag.Text = SessionInfo.DisplayCurrentPage;
            CommunicationHomeContent.Text = SessionInfo.PageContent(PageContentBlocks.CommunicationHomeContent);

        }
    }
}