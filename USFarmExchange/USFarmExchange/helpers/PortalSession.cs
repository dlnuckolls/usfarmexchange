using System;
using System.IO;
using System.Net;
using System.Net.Mail;

namespace USFarmExchange {
  internal class PortalSession {
    // System settings and properties
    public SystemSettings Settings => SystemSettings.StaticInstance;

    // Authentication indicator and user record
    public SystemUser CurrentUser => SystemUser.StaticInstance;
    public bool IsAuthenticated => CurrentUser.IsAuthenticated;
    public bool IsAdmin => CurrentUser.IsAdmin;

    public ResourceLink CurrentResourceLink;

    // Tracking for current page within the application
    public PageNames CurrentPage { get; set; }
    public string DisplayCurrentPage => "<title>{0}</title>".FormatWith(CurrentPage.TextValue());
    public string PageContent(PageContentBlocks pageLocation) => SqlHelpers.SelectScalar(SqlStatements.SQL_GET_PAGE_CONTENT_FOR_DISPLAY.FormatWith(pageLocation.TextValue())).ToString();

    private SmtpClient SetMailServerSettings() {
      var smtp = new SmtpClient {
        Port = Settings.ServerPort,
        EnableSsl = Settings.RequireSsl,
        DeliveryMethod = SmtpDeliveryMethod.Network,
        Host = Settings.MailServer
      };
      if(Settings.RequireAuth) {
        smtp.UseDefaultCredentials = false;
        smtp.Credentials = new NetworkCredential(Settings.SmtpUser, Settings.SmtpPassword);
      }
      return smtp;
    }

    public void SendResetEmail(SystemUser user, string tempPassword) {
      var mail = new MailMessage {
        From = new MailAddress(Settings.FromEmail, Settings.FromUsername),
        IsBodyHtml = true,
        Subject = "Password Reset Confirmation",
        Body = "Your new password has been set to: {0}<br /><br />Please login to change your password to something you can remember.<br /><br />Thanks,<br />{1}".FormatWith(tempPassword, Settings.FromUsername)
      };
      mail.To.Add(new MailAddress(user.UserName));
      SmtpClient smtp = SetMailServerSettings();
      smtp.Send(mail);
    }

    public void SendContactEmail(ref MailMessage msg) {
      SmtpClient smtp = SetMailServerSettings();
      smtp.Send(msg);
    }

    public void SendRegistrationEmail(SystemUser user) {
      try {
        var mail = new MailMessage {
          From = new MailAddress(user.UserName, user.DisplayName),
          IsBodyHtml = true,
          Subject = "New user registered on US Farm Exchange",
          Body = @"<br />New User Registration: {0} ({1}) has registered on the website.<br /><br />Thank you<br />Admin System".FormatWith(user.DisplayName, user.UserName)
        };
        mail.To.Add(new MailAddress(Settings.FromEmail, Settings.FromUsername));
        SmtpClient smtp = SetMailServerSettings();
        smtp.Send(mail);

        mail = new MailMessage {
          From = new MailAddress(Settings.FromEmail, Settings.FromUsername),
          IsBodyHtml = true,
          Subject = "New user registered on US Farm Exchange",
          Body = @"<br />Hi {0},<br /><br />Thank you for registering with US Farm Exchange.".FormatWith(user.DisplayName)
        };
        mail.To.Add(new MailAddress(user.UserName, user.DisplayName));
        smtp.Send(mail);
      } catch(Exception ex) {
        Settings.LogError("Registration Emails Failed", ex);
      }
    }
  }
}