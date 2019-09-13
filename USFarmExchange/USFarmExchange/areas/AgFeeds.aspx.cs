using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using Telerik.Web.UI;

namespace USFarmExchange.areas {
  public partial class AgFeeds :BasePage {
    protected void Page_Load(object sender, EventArgs e) {
    }
    protected void RadListView1_NeedDataSource(object sender, RadListViewNeedDataSourceEventArgs e) {
      string rssUrl = "https://www.usda.gov/rss/home.xml";
      XmlDocument doc = new XmlDocument();
      doc.Load(rssUrl);
      RadListView1.DataSource = doc.DocumentElement.ChildNodes.Cast<XmlNode>().First().ChildNodes.Cast<XmlNode>().Where(x => x.Name == "item");
    }
    protected string GetXmlContent(RadListViewDataItem container, string fieldName) {
      XmlNode node = container.DataItem as XmlNode;
      var rtn = string.Empty;
      switch(fieldName) {
        case "description":
          rtn = (node != null ? node[fieldName].InnerText.Shorten(150) : String.Empty);
          break;
        default:
          rtn = (node != null ? node[fieldName].InnerText.Trim() : String.Empty);
          break;
      }
      return rtn;
    }
  }
}