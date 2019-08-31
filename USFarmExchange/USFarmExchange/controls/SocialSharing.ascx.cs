using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace USFarmExchange {
  public partial class SocialSharing : BaseControl {
    public string LinkURL;
    public string Title;

    protected void Page_Load(object sender, EventArgs e) {
      RadSocialShare1.UrlToShare = LinkURL;
      RadSocialShare1.TitleToShare = Title;
    }
  }
}