using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace USFarmExchange {
  public static class SqlStatements {
    // These values are from the database and should not be changed here!!!
    private const string REGISTRATION = "7ec7d607-18b1-452d-8d78-3d065959d358";
    private const string USER = "a7107c8f-ff15-4d5a-bba1-6db286fcef0a";
    private const string ADMIN = "b6522703-8844-4cff-8fc1-916ba90f515b";

    #region System Settings
    public const string SQL_GET_MAIL_SETTINGS = "SELECT Id, MailServer, ServerPort, SmtpUser, SmtpPassword, FromEmail, FromUsername, RequireAuth, RequireSsl FROM dbo.SystemConfigs;";
    public const string SQL_UPDATE_MAIL_SETTINGS = "UPDATE dbo.SystemConfigs SET MailServer = '{0}', ServerPort = {1}, SmtpUser = '{2}', SmtpPassword = '{3}', FromEmail = '{4}', FromUsername = '{5}', RequireAuth = {6}, RequireSsl = {7} WHERE Id = '{8}';";
    #endregion
    #region User and authentication
    public const string SQL_AUTHENTICATE_USER = "SELECT * FROM dbo.SystemUsers WHERE UserName = '{0}' AND UserPass = '{1}' AND Deleted = 0;";
    public const string SQL_GET_USER_ROLE = "SELECT RoleName FROM dbo.AdminRoles WHERE Id = '{0}';";
    public const string SQL_GET_USER_DETAILS = "SELECT * FROM dbo.SystemUsers WHERE Id = '{0}';";
    public const string SQL_RESET_USER_PASSWORD = "UPDATE dbo.SystemUsers SET UserPass = '{0}', PasswordReset = 1 WHERE Id = '{1}';";
    public const string SQL_UPDATE_USER_PASSWORD = "UPDATE dbo.SystemUsers SET UserPass = '{0}', PasswordReset = 0 WHERE Id = '{1}';";
    public const string SQL_APPROVE_USER = "UPDATE dbo.SystemUsers SET RoleId = '" + USER + "' WHERE Id = '{0}';";
    public const string SQL_CREATE_USER_DETAILS = "INSERT INTO dbo.SystemUsers (RoleId, DisplayName, UserName, Notes) OUTPUT inserted.Id  VALUES ('" + USER + "', '{0}', '{1}', '{2}');";
    public const string SQL_UPDATE_USER_DETAILS = "UPDATE dbo.SystemUsers SET DisplayName = '{0}', UserName = '{1}', Notes = '{2}' WHERE Id = '{3}';";
    public const string SQL_CREATE_ADMIN_USER_DETAILS = "INSERT INTO dbo.SystemUsers (RoleId, DisplayName, UserName, Notes, SuperAdmin) OUTPUT inserted.Id  VALUES ('" + ADMIN + "', '{0}', '{1}', '{2}', {3});";
    public const string SQL_UPDATE_ADMIN_USER_DETAILS = "UPDATE dbo.SystemUsers SET DisplayName = '{0}', UserName = '{1}', Notes = '{2}', SuperAdmin = {3} WHERE Id = '{4}';";
    public const string SQL_DELETE_USER = "UPDATE dbo.SystemUsers SET Deleted = 1 WHERE Id = '{0}';";
    public const string SQL_VALIDATE_USER = "SELECT Id FROM dbo.SystemUsers WHERE UserName = '{0}' AND Deleted = 0;";
    #endregion
    #region User/Admin Management
    public const string SQL_GET_REGISTRATION_LIST = "SELECT au.Id, au.DisplayName, au.UserName, au.Notes FROM dbo.SystemUsers au WHERE au.RoleId = '" + REGISTRATION + "' AND Deleted = 0 GROUP BY au.Id, au.DisplayName, au.UserName, au.Notes;";
    public const string SQL_GET_ADMIN_LIST = "SELECT au.Id, au.DisplayName, au.UserName, au.Notes, au.SuperAdmin FROM dbo.SystemUsers au WHERE au.RoleId = '" + REGISTRATION + "' AND Deleted = 0;";
    #endregion
    #region Exceptions
    public const string SQL_LOG_EXCEPTION = "INSERT INTO dbo.SystemExceptions (ExceptionTimeStamp, Module, Exception, StackTrace) VALUES ({0}, '{1}', '{2}', '{3}');";
    public const string SQL_READ_EXCEPTIONS = "SELECT * FROM dbo.SystemExceptions ORDER BY ExceptionTimeStamp DESC;";
    #endregion
    #region Page Editing
    public const string SQL_GET_PAGE_LOCATIONS = "SELECT [Id],[Description] FROM [dbo].[PageLocations];";
    public const string SQL_GET_PAGE_CONTENTS = "SELECT [Description] FROM [dbo].[PageContent] WHERE [PageLocation] = '{0}';";
    public const string SQL_GET_PAGE_CONTENT_FOR_DISPLAY = "SELECT a.[Description] FROM [dbo].[PageContent] a INNER JOIN [dbo].[PageLocations] b ON a.[PageLocation] = b.[Id] WHERE b.[Description] = '{0}';";
    public const string SQL_SAVE_PAGE_CONTENTS = "UPDATE [dbo].[PageContent] SET [Description] = '{0}' WHERE [PageLocation] = '{1}';";
    #endregion
    #region Registration
    public const string SQL_LOOKUP_USERNAME = "SELECT UserName FROM dbo.SystemUsers WHERE UserName = '{0}';";
    public const string SQL_CREATE_USER_REGISTRATION = "INSERT INTO dbo.SystemUsers (RoleId, DisplayName, UserName, UserPass, Notes) OUTPUT inserted.Id  VALUES ('" + REGISTRATION + "', '{0}', '{1}', '{2}', 'User Registration');";
    #endregion
  }
}