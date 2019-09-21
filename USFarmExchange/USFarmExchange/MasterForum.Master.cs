using System;
using System.Web;
using System.Web.UI.WebControls;
using YAF.Types.Extensions;
using YAF.Utils;
using YAF.Utils.Helpers;

namespace USFarmExchange {

  /// <summary>
  /// Class SiteMaster
  /// </summary>
  public partial class SiteMaster :BaseMasterPage {
    /// <summary>
    /// The get return url.
    /// </summary>
    /// <returns>
    /// The url.
    /// </returns>
    //protected string GetReturnUrl() {
    //  return
    //      HttpContext.Current.Server.UrlEncode(
    //          HttpContext.Current.Request.QueryString.GetFirstOrDefault("ReturnUrl").IsSet()
    //              ? General.GetSafeRawUrl(HttpContext.Current.Request.QueryString.GetFirstOrDefault("ReturnUrl"))
    //              : General.GetSafeRawUrl());
    //}

    /// <summary>
    /// Handles the Load event of the Page control.
    /// </summary>
    /// <param name="sender">The source of the event.</param>
    /// <param name="e">The <see cref="System.EventArgs"/> instance containing the event data.</param>
    protected void Page_Load(object sender, EventArgs e) {
      //var loginLink = this.HeadLoginView.FindControlAs<HyperLink>("LoginLink");

      //if(loginLink != null) {
      //  loginLink.NavigateUrl = "~/forum/forum.aspx?g=login&ReturnUrl={0}".FormatWith(this.GetReturnUrl());
      //}
    }
  }
}
