using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using YAF.Types.Extensions;
using YAF.Utils;
using YAF.Utils.Helpers;

namespace USFarmExchange.controls {
  public partial class UserInteraction :BaseControl {
    protected void Page_Load(object sender, EventArgs e) {
      var loginLink = this.HeadLoginView.FindControlAs<LinkButton>("LoginLink");
      if(loginLink != null) { loginLink.PostBackUrl = "~/forum/forum.aspx?g=login&ReturnUrl={0}".FormatWith(this.GetReturnUrl()); }
    }

    protected string GetReturnUrl() {
      return
          HttpContext.Current.Server.UrlEncode(
              HttpContext.Current.Request.QueryString.GetFirstOrDefault("ReturnUrl").IsSet()
                  ? General.GetSafeRawUrl(HttpContext.Current.Request.QueryString.GetFirstOrDefault("ReturnUrl"))
                  : General.GetSafeRawUrl());
    }
  }
}