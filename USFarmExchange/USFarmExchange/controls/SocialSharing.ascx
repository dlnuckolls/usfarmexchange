<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SocialSharing.ascx.cs" Inherits="USFarmExchange.SocialSharing" %>
<style>
  div.RadSocialShare_Silk {
    font-family: Arial, Helvetica, sans-serif;
    font-size: 16px;
    border: 0;
    background-color: transparent !important;
    box-shadow: 0 0 0;
    width: 100% !important;
    text-align: center !important;
  }

    div.RadSocialShare_Silk .sshLinkItem:hover {
      background-color: #14afca !important;
      border-radius: 5px !important;
    }

    div.RadSocialShare_Silk .sshCustomIcon {
      height: 50px !important;
      width: 50px !important;
    }
</style>
  <telerik:RadSocialShare RenderMode="Auto" Skin="Silk" ID="RadSocialShare1" runat="server">
    <MainButtons>
      <telerik:RadSocialButton SocialNetType="ShareOnFacebook" CustomIconUrl="~/images/social/icons8-facebook.png" />
      <telerik:RadSocialButton SocialNetType="ShareOnTwitter" CustomIconUrl="~/images/social/icons8-twitter.png" />
      <telerik:RadSocialButton SocialNetType="LinkedIn" CustomIconUrl="~/images/social/icons8-linkedin.png" />
      <telerik:RadSocialButton SocialNetType="ShareOnPinterest" CustomIconUrl="~/images/social/icons8-pinterest.png" />
      <telerik:RadSocialButton SocialNetType="Delicious" CustomIconUrl="~/images/social/icons8-delicious.png" />
      <telerik:RadSocialButton SocialNetType="Digg" CustomIconUrl="~/images/social/icons8-digg.png" />
      <telerik:RadSocialButton SocialNetType="StumbleUpon" CustomIconUrl="~/images/social/icons8-stumbleupon.png" />
      <telerik:RadSocialButton SocialNetType="Tumblr" CustomIconUrl="~/images/social/icons8-tumblr.png" />
      <telerik:RadSocialButton SocialNetType="MailTo" CustomIconUrl="~/images/social/icons8-gmail_login.png" />
    </MainButtons>
  </telerik:RadSocialShare>
