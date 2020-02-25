using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using Telerik.Web.UI;

namespace USFarmExchange {
  public partial class Default : BasePage {
    protected void Page_Load(object sender, EventArgs e) {
      // Set page name in the title section
      SessionInfo.CurrentPage = PageNames.Home;
      TitleTag.Text = SessionInfo.DisplayCurrentPage;
      HomePageBottom.Text = SessionInfo.PageContent(PageContentBlocks.HomePageBottom);
      var senText = SqlHelpers.Select(SqlStatements.SQL_SELECT_RANDOM_SAYING);
      if (!senText.IsNullOrEmpty()) {
        SentimentalTitle.Text = senText.Rows[0][0].ToString();
        SentimentalText.Text = senText.Rows[0][1].ToString();
      }
    }
  }

}