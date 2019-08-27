using System;
using System.IO;
using System.Net;
using System.Net.Mail;

namespace USFarmExchange {
  internal class PortalSession {
    // System settings and properties
    //public SystemSettings Settings => SystemSettings.StaticInstance;

    // Authentication indicator and user record
    //public SystemUser CurrentUser { get; set; }
    //public bool IsAuthenticated => CurrentUser.IsAuthenticated;
    //public bool IsAdmin => CurrentUser.IsAdmin;

    // Tracking for current page within the application
    public PageNames CurrentPage { get; set; }
    public string DisplayCurrentPage => "<title>{0}</title>".FormatWith(CurrentPage.TextValue());

  }
}