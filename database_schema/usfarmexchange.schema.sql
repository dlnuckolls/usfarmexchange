/*
    USFarmExchange Core Database
    --Production--
    Server: glorykidd.com (or localhost)
    Database: USFarmExchange
 	  Username: USFarmExchangeUser
    Password: XJ$7d{84)sa(kV4
  */ 
 USE Master;
 SET NOCOUNT ON;
 
 IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'USFarmExchange') BEGIN
   DECLARE @tail       INT
   DECLARE @basefolder NVARCHAR(MAX)
   DECLARE @datafile   NVARCHAR(MAX)
   DECLARE @logfile    NVARCHAR(MAX)
 
   SET @tail = (SELECT CHARINDEX('\',REVERSE(physical_name)) FROM Master.sys.master_files WHERE name = 'master')
   SET @basefolder = (SELECT SUBSTRING(physical_name,1,LEN(physical_name)-@tail) FROM Master.sys.master_files WHERE name = 'master')
   SET @datafile = @basefolder + '\USFarmExchange.mdf'
   SET @logfile = @basefolder + '\USFarmExchange_log.ldf'
   DECLARE @sql NVARCHAR(MAX)
   SET @sql = 'CREATE DATABASE [USFarmExchange] ON PRIMARY ' +
   '( NAME = N''USFarmExchange'', FILENAME = ''' + @datafile + ''', SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB ) ' +
    ' LOG ON ' + 
   '( NAME = N''USFarmExchange_log'', FILENAME = ''' + @logfile + ''', SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)'
   EXEC(@sql)
   
   ALTER DATABASE USFarmExchange SET COMPATIBILITY_LEVEL = 100;
   ALTER DATABASE USFarmExchange SET ANSI_NULL_DEFAULT OFF;
   ALTER DATABASE USFarmExchange SET ANSI_NULLS OFF;
   ALTER DATABASE USFarmExchange SET ANSI_PADDING OFF; 
   ALTER DATABASE USFarmExchange SET ANSI_WARNINGS OFF; 
   ALTER DATABASE USFarmExchange SET ARITHABORT OFF; 
   ALTER DATABASE USFarmExchange SET AUTO_CLOSE OFF; 
   ALTER DATABASE USFarmExchange SET AUTO_CREATE_STATISTICS ON; 
   ALTER DATABASE USFarmExchange SET AUTO_SHRINK OFF; 
   ALTER DATABASE USFarmExchange SET AUTO_UPDATE_STATISTICS ON; 
   ALTER DATABASE USFarmExchange SET CURSOR_CLOSE_ON_COMMIT OFF; 
   ALTER DATABASE USFarmExchange SET CURSOR_DEFAULT  GLOBAL; 
   ALTER DATABASE USFarmExchange SET CONCAT_NULL_YIELDS_NULL OFF; 
   ALTER DATABASE USFarmExchange SET NUMERIC_ROUNDABORT OFF; 
   ALTER DATABASE USFarmExchange SET QUOTED_IDENTIFIER OFF; 
   ALTER DATABASE USFarmExchange SET RECURSIVE_TRIGGERS OFF; 
   ALTER DATABASE USFarmExchange SET AUTO_UPDATE_STATISTICS_ASYNC OFF; 
   ALTER DATABASE USFarmExchange SET DATE_CORRELATION_OPTIMIZATION OFF; 
   ALTER DATABASE USFarmExchange SET TRUSTWORTHY OFF; 
   ALTER DATABASE USFarmExchange SET ALLOW_SNAPSHOT_ISOLATION OFF; 
   ALTER DATABASE USFarmExchange SET PARAMETERIZATION SIMPLE; 
   ALTER DATABASE USFarmExchange SET READ_WRITE; 
   ALTER DATABASE USFarmExchange SET RECOVERY SIMPLE; 
   ALTER DATABASE USFarmExchange SET MULTI_USER; 
   ALTER DATABASE USFarmExchange SET PAGE_VERIFY CHECKSUM;  
   ALTER DATABASE USFarmExchange SET DB_CHAINING OFF; 
     
      IF(@@ERROR <> 0) BEGIN
        RETURN
      END
 END
 GO
 
USE USFarmExchange;

SET NOCOUNT ON;

DECLARE @majorVersion INT;
DECLARE @minorVersion INT;

-- Start the main transaction: Initialize the database with SchemaVersion table and data
BEGIN TRANSACTION initialCreate;
  IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[SchemaVersion]')) 
  BEGIN
    CREATE TABLE [dbo].[SchemaVersion](
      Id           UNIQUEIDENTIFIER  NOT NULL DEFAULT NEWID(),
      MajorVersion INT               NOT NULL,
      MinorVersion INT               NOT NULL,
      InstallDate  DATETIMEOFFSET(7) NOT NULL
     CONSTRAINT PK_SchemaVersion PRIMARY KEY CLUSTERED 
      (MajorVersion, MinorVersion ASC) WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
    ) ON [PRIMARY]
  END
  
  IF(@@ERROR <> 0)
  BEGIN
    ROLLBACK TRANSACTION;
    RETURN;
  END

  SET @majorVersion = 1;
  SET @minorVersion = 0;
  IF NOT EXISTS(SELECT * FROM SchemaVersion WHERE (MajorVersion = @majorVersion) AND (MinorVersion = @minorVersion))
  BEGIN
    INSERT INTO SchemaVersion values (newid(), @majorVersion, @minorVersion, getutcdate());
  END
  
  IF(@@ERROR <> 0)
  BEGIN
    ROLLBACK TRANSACTION;
    RETURN;
  END
COMMIT TRANSACTION initialCreate;

-- Begin database modifications here
SELECT @majorVersion = 1, @minorVersion = 1;
IF NOT EXISTS(SELECT * FROM SchemaVersion WHERE (MajorVersion = @majorVersion) AND (MinorVersion = @minorVersion))
BEGIN
  BEGIN TRANSACTION Version1_1

    -- Role Table
	  CREATE TABLE [dbo].[AdminRoles] (
		  [Id]       [uniqueidentifier] NOT NULL,
		  [RoleName] [varchar](50)          NULL,
		  [Notes]    [varchar](250)         NULL,
	  CONSTRAINT [PK_AdminRoles] PRIMARY KEY CLUSTERED (
			  [Id] ASC
		  ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	  ) ON [PRIMARY];
	
	  ALTER TABLE [dbo].[AdminRoles] ADD  DEFAULT (newid()) FOR [Id];
    -- Insert Roles
    INSERT INTO [dbo].[AdminRoles] (RoleName, Notes) VALUES ('User', 'User level access'),('Administrator','Admin User'),('System User','System Administrator');

    -- User Table
	  CREATE TABLE [dbo].[SystemUsers] (
		  [Id]            [uniqueidentifier] NOT NULL,
		  [RoleId]        [uniqueidentifier] NOT NULL,
		  [DisplayName]   [varchar](50)          NULL,
		  [UserName]      [varchar](50)      NOT NULL,
		  [UserPass]      [varchar](256)         NULL,
		  [Notes]         [varchar](250)         NULL,
		  [Deleted]       [tinyint]          NOT NULL,
		  [SuperAdmin]    [bit]              NOT NULL,
		  [PasswordReset] [bit]              NOT NULL,
	  CONSTRAINT [PK_SystemUsers] PRIMARY KEY CLUSTERED (
			  [Id] ASC
		  ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	  ) ON [PRIMARY];

	  ALTER TABLE [dbo].[SystemUsers] ADD  DEFAULT (newid()) FOR [Id];
	  ALTER TABLE [dbo].[SystemUsers] ADD  DEFAULT ((0)) FOR [Deleted];
	  ALTER TABLE [dbo].[SystemUsers] ADD  DEFAULT ((0)) FOR [SuperAdmin];
	  ALTER TABLE [dbo].[SystemUsers] ADD  DEFAULT ((0)) FOR [PasswordReset];

    INSERT INTO SchemaVersion values (newid(), @majorVersion, @minorVersion, getutcdate());
  COMMIT TRANSACTION Version1_1
END

SELECT @majorVersion = 1, @minorVersion = 2;
IF NOT EXISTS(SELECT * FROM SchemaVersion WHERE (MajorVersion = @majorVersion) AND (MinorVersion = @minorVersion))
BEGIN
  BEGIN TRANSACTION Version1_2
    -- System Configurations
    CREATE TABLE [dbo].[SystemConfigs] (
	    [Id]           UNIQUEIDENTIFIER NOT NULL,
	    [MailServer]   VARCHAR(75)          NULL,
	    [ServerPort]   INT                  NULL,
	    [SmtpUser]     VARCHAR(75)          NULL,
	    [SmtpPassword] VARCHAR(256)         NULL,
	    [FromEmail]    VARCHAR(75)          NULL,
	    [FromUsername] VARCHAR(75)          NULL,
	    [RequireSsl]   BIT              NOT NULL,
	    [RequireAuth]  BIT              NOT NULL,
      CONSTRAINT [PK_SystemConfigs] PRIMARY KEY CLUSTERED (
	      [Id] ASC
      ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]

    ALTER TABLE [dbo].[SystemConfigs] ADD  DEFAULT ((1)) FOR [RequireSsl];
    ALTER TABLE [dbo].[SystemConfigs] ADD  DEFAULT ((1)) FOR [RequireAuth];

    -- Exception Logging
    CREATE TABLE [dbo].[SystemExceptions](
      [Id]                 UNIQUEIDENTIFIER  NOT NULL,
      [ExceptionTimeStamp] DATETIME          NOT NULL,
      [Module]             VARCHAR(50)       NOT NULL,
      [Exception]          VARCHAR(255)      NOT NULL,
      [StackTrace]         VARCHAR(2000)     NOT NULL,
      CONSTRAINT [PK_SystemExceptions] PRIMARY KEY CLUSTERED (
	      [Id] ASC
      ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY];

    ALTER TABLE [dbo].[SystemExceptions] ADD  CONSTRAINT [DF_SystemExceptions_Id]  DEFAULT (NEWID()) FOR [Id];

    -- States with Abbreviations
	  CREATE TABLE [dbo].[States] (
      [Id]           INT         NOT NULL IDENTITY(1,1),
	    [State]        VARCHAR(50) NOT NULL,
      [Abbreviation] VARCHAR(2)  NOT NULL,
      CONSTRAINT PK_States PRIMARY KEY CLUSTERED (
        [Id] ASC
      ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]

    INSERT INTO dbo.States (Abbreviation,State) 
	  VALUES ('AL', 'Alabama'),('AK', 'Alaska'),('AZ', 'Arizona'),('AR', 'Arkansas'),('CA', 'California'),('CO', 'Colorado'),('CT', 'Connecticut'),
		       ('DE', 'Delaware'),('DC', 'District of Columbia'),('FL', 'Florida'),('GA', 'Georgia'),('HI', 'Hawaii'),('ID', 'Idaho'),('IL', 'Illinois'),
		       ('IN', 'Indiana'),('IA', 'Iowa'),('KS', 'Kansas'),('KY', 'Kentucky'),('LA', 'Louisiana'),('ME', 'Maine'),('MD', 'Maryland'),('MA', 'Massachusetts'),
		       ('MI', 'Michigan'),('MN', 'Minnesota'),('MS', 'Mississippi'),('MO', 'Missouri'),('MT', 'Montana'),('NE', 'Nebraska'),('NV', 'Nevada'),
           ('NH', 'New Hampshire'),('NJ', 'New Jersey'),('NM', 'New Mexico'),('NY', 'New York'),('NC', 'North Carolina'),('ND', 'North Dakota'),
		       ('OH', 'Ohio'),('OK', 'Oklahoma'),('OR', 'Oregon'),('PA', 'Pennsylvania'),('PR', 'Puerto Rico'),('RI', 'Rhode Island'),('SC', 'South Carolina'),
		       ('SD', 'South Dakota'),('TN', 'Tennessee'),('TX', 'Texas'),('UT', 'Utah'),('VT', 'Vermont'),('VA', 'Virginia'),('WA', 'Washington'),
		       ('WV', 'West Virginia'),('WI', 'Wisconsin'),('WY', 'Wyoming'),('AS', 'American Samoa'),('FM', 'Micronesia'),('VI', 'U.S. Virgin Islands'),
           ('PW', 'Palau'),('AA', 'U.S. Armed Forces America'),('GU', 'Guam'),('MP', 'Northern Mariana Islands'),('AE', 'U.S. Armed Forces Europe'),
           ('MH', 'Marshall Islands'),('AP', 'U.S. Armed Forces Pacific');    

    INSERT INTO SchemaVersion values (newid(), @majorVersion, @minorVersion, getutcdate());
  COMMIT TRANSACTION Version1_2
END

SELECT @majorVersion = 1, @minorVersion = 3;
IF NOT EXISTS(SELECT * FROM SchemaVersion WHERE (MajorVersion = @majorVersion) AND (MinorVersion = @minorVersion))
BEGIN
  BEGIN TRANSACTION Version1_3

    -- Clear and recreate System Roles with specific Id's
    DELETE [dbo].[AdminRoles];

    INSERT INTO [dbo].[AdminRoles] (Id, RoleName, Notes) 
    VALUES ('7ec7d607-18b1-452d-8d78-3d065959d358','Registered', 'New Registration'),
           ('a7107c8f-ff15-4d5a-bba1-6db286fcef0a','User','User level access'),
           ('b6522703-8844-4cff-8fc1-916ba90f515b','System User','System Administrator');
    
    -- Create default users
    INSERT INTO [dbo].[SystemUsers] ([Id], [RoleId], [DisplayName], [UserName], [UserPass], [Notes], 
           [Deleted], [SuperAdmin], [PasswordReset])
    VALUES (newid(),'b6522703-8844-4cff-8fc1-916ba90f515b','David Nuckolls','davidnuckolls@usfarmexchange.com','5zO9V86nJwv4G04yfZ/V++IhIqOytb8ot3XcpsxjfPw=','System Created',0,1,0),
           (newid(),'b6522703-8844-4cff-8fc1-916ba90f515b','Jennifer Hobbs','jenniferhobbs@usfarmexchange.com','5zO9V86nJwv4G04yfZ/V++IhIqOytb8ot3XcpsxjfPw=','System Created',0,1,0);

    INSERT INTO SchemaVersion values (newid(), @majorVersion, @minorVersion, getutcdate());
  COMMIT TRANSACTION Version1_3
END

SELECT @majorVersion = 1, @minorVersion = 4;
IF NOT EXISTS(SELECT * FROM SchemaVersion WHERE (MajorVersion = @majorVersion) AND (MinorVersion = @minorVersion))
BEGIN
  BEGIN TRANSACTION Version1_4

    INSERT INTO [dbo].[SystemConfigs] ([Id],[MailServer],[ServerPort],[SmtpUser],[SmtpPassword],[FromEmail],[FromUsername],[RequireSsl],[RequireAuth])
    VALUES (NEWID(),'usfarmexchange.com',465,'social@usfarmexchange.com','ZC6L0WZ5liUtx/9a8eNzlRApzF/ftLg2h4CyvctmkzM=','postmaster@usfarmexchange.com','US Farm Exchange Postmaster',1,1)

    INSERT INTO SchemaVersion values (newid(), @majorVersion, @minorVersion, getutcdate());
  COMMIT TRANSACTION Version1_4
END

SELECT @majorVersion = 1, @minorVersion = 5;
IF NOT EXISTS(SELECT * FROM SchemaVersion WHERE (MajorVersion = @majorVersion) AND (MinorVersion = @minorVersion))
BEGIN
  BEGIN TRANSACTION Version1_5
    
    -- Add tables for dynamic page content
    CREATE TABLE [dbo].[PageLocations] (
	    [Id]          UNIQUEIDENTIFIER NOT NULL,
	    [Description] VARCHAR(255)         NULL,
      CONSTRAINT [PK_PageLocations] PRIMARY KEY CLUSTERED ( 
	      [Id] ASC
      ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY];

    ALTER TABLE [dbo].[PageLocations] ADD  CONSTRAINT [DF_PageLocations_Id]  DEFAULT (NEWID()) FOR [Id];

    CREATE TABLE [dbo].[PageContent](
	    [Id]           UNIQUEIDENTIFIER NOT NULL,
	    [PageLocation] UNIQUEIDENTIFIER NOT NULL,
	    [Description]  VARCHAR(max)         NULL,
      CONSTRAINT [PK_PageContent] PRIMARY KEY CLUSTERED (
	      [Id] ASC
      ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY];

    ALTER TABLE [dbo].[PageContent] ADD  CONSTRAINT [DF_PageContent_Id]  DEFAULT (NEWID()) FOR [Id];

    ALTER TABLE [dbo].[PageContent] WITH CHECK ADD FOREIGN KEY([PageLocation]) REFERENCES [dbo].[PageLocations] ([Id]);

    INSERT INTO SchemaVersion values (newid(), @majorVersion, @minorVersion, getutcdate());
  COMMIT TRANSACTION Version1_5
END

SELECT @majorVersion = 1, @minorVersion = 6;
IF NOT EXISTS(SELECT * FROM SchemaVersion WHERE (MajorVersion = @majorVersion) AND (MinorVersion = @minorVersion))
BEGIN
  BEGIN TRANSACTION Version1_6
    
    INSERT INTO [dbo].[PageLocations] (Id, [Description])
    VALUES ('4667B33D-BE48-4B7D-816E-D705F1F732C5', 'Admin Home Top Panel'),
           ('06688FA2-EBCB-4F42-9F63-091524C9B839', 'Admin Home Tool Header'),
           ('61175E8D-6131-4789-8989-DC4C4695E711', 'Page Management Header'),
           ('D42ABA67-51F4-4416-AFA4-A4015551B07C', 'Dashboard Header');
    
    INSERT INTO SchemaVersion values (newid(), @majorVersion, @minorVersion, getutcdate());
  COMMIT TRANSACTION Version1_6
END

SELECT @majorVersion = 1, @minorVersion = 7;
IF NOT EXISTS(SELECT * FROM SchemaVersion WHERE (MajorVersion = @majorVersion) AND (MinorVersion = @minorVersion))
BEGIN
  BEGIN TRANSACTION Version1_7
    
    INSERT INTO [dbo].[PageContent] ([PageLocation], [Description])
    VALUES ('4667B33D-BE48-4B7D-816E-D705F1F732C5', 'Admin Home Top Panel'),
           ('06688FA2-EBCB-4F42-9F63-091524C9B839', 'Admin Home Tool Header'),
           ('61175E8D-6131-4789-8989-DC4C4695E711', 'Page Management Header'),
           ('D42ABA67-51F4-4416-AFA4-A4015551B07C', 'Dashboard Header');
    
    INSERT INTO SchemaVersion values (newid(), @majorVersion, @minorVersion, getutcdate());
  COMMIT TRANSACTION Version1_7
END

SELECT @majorVersion = 1, @minorVersion = 8;
IF NOT EXISTS(SELECT * FROM SchemaVersion WHERE (MajorVersion = @majorVersion) AND (MinorVersion = @minorVersion))
BEGIN
  BEGIN TRANSACTION Version1_8
  
    INSERT INTO [dbo].[PageLocations] (Id, [Description])
    VALUES ('8F9B4D10-6294-45AC-9692-9A29335F1661', 'Home Page Bottom'),
           ('4BD53B47-C3FB-4290-9A02-A29E099190EC', 'Communication Home Content'),
           ('12D27D83-3FE3-4777-B1BE-F0A0F4DF764B', 'Technology Home Content'),
		   ('7F4E7B55-F845-4A7B-B485-CE98474BB732', 'Education Home Content'),
		   ('EDAD6341-5FEF-48B4-9F07-1F7E6B647E06', 'Insurance Home Content'),
	       ('DD0AE211-21C9-4E3B-A654-101EABB3F4E4', 'Financial Services Home Content'),
	       ('25CFE0DF-5DDA-48E8-8C1C-091167A99169', 'Compliance Home Content'),
	       ('96463B34-FE4B-4760-BD11-5463AA30DBF6', 'Partners Home Content'),
           ('D9E75614-BEA8-472D-9A42-E37CAEAA7506', 'About Us Home Content');
					   
     INSERT INTO [dbo].[PageContent] ([PageLocation], [Description])
     VALUES ('8F9B4D10-6294-45AC-9692-9A29335F1661', 'Home Page Bottom'),
            ('4BD53B47-C3FB-4290-9A02-A29E099190EC', 'Communication Home Content'),
            ('12D27D83-3FE3-4777-B1BE-F0A0F4DF764B', 'Technology Home Content'),
	        ('7F4E7B55-F845-4A7B-B485-CE98474BB732', 'Education Home Content'),
	        ('EDAD6341-5FEF-48B4-9F07-1F7E6B647E06', 'Insurance Home Content'),
	        ('DD0AE211-21C9-4E3B-A654-101EABB3F4E4', 'Financial Services Home Content'),
	        ('25CFE0DF-5DDA-48E8-8C1C-091167A99169', 'Compliance Home Content'),
	        ('96463B34-FE4B-4760-BD11-5463AA30DBF6', 'Partners Home Content'),
            ('D9E75614-BEA8-472D-9A42-E37CAEAA7506', 'About Us Home Content');

  
 INSERT INTO SchemaVersion values (newid(), @majorVersion, @minorVersion, getutcdate());
  COMMIT TRANSACTION Version1_8
END

SELECT @majorVersion = 1, @minorVersion = 9;
IF NOT EXISTS(SELECT * FROM SchemaVersion WHERE (MajorVersion = @majorVersion) AND (MinorVersion = @minorVersion))
BEGIN
  BEGIN TRANSACTION Version1_9
  
    INSERT INTO [dbo].[PageLocations] (Id, [Description])
    VALUES ('84CF66D9-A864-4029-8976-71AB25FD430C', 'Agritourism Home Content');
	        
					   
     INSERT INTO [dbo].[PageContent] ([PageLocation], [Description])
     VALUES ('84CF66D9-A864-4029-8976-71AB25FD430C', 'Agritourism Home Content');
        
  
 INSERT INTO SchemaVersion values (newid(), @majorVersion, @minorVersion, getutcdate());
  COMMIT TRANSACTION Version1_9
END

SELECT @majorVersion = 1, @minorVersion = 10;
IF NOT EXISTS(SELECT * FROM SchemaVersion WHERE (MajorVersion = @majorVersion) AND (MinorVersion = @minorVersion))
BEGIN
  BEGIN TRANSACTION Version1_10
  
    INSERT INTO [dbo].[PageLocations] (Id, [Description])
    VALUES 	('D9744A18-D526-45D5-B0F6-B347A4581DBD', 'Forum Left'),
			('75A0CE6A-A837-4261-B480-240EEABF4D55', 'Forum Top'),
			('329D0E46-3C1E-4B53-9C6C-4CA7BAAE6536', 'Resource Links');
        
					   
     INSERT INTO [dbo].[PageContent] ([PageLocation], [Description])
     VALUES ('D9744A18-D526-45D5-B0F6-B347A4581DBD', 'Forum Left'),
			('75A0CE6A-A837-4261-B480-240EEABF4D55', 'Forum Top'),   
			('329D0E46-3C1E-4B53-9C6C-4CA7BAAE6536', 'Resource Links');
  
	-- ResourceLinks table
	CREATE TABLE [dbo].[ResourceLinks] (
      [Id] INT NOT NULL IDENTITY(1,1),
	  [Title] VARCHAR(150),
	  [URL] VARCHAR(300),
	  [Count] INT,
	  [LastClicked] SMALLDATETIME,
	  [Active] BIT

	  CONSTRAINT [PK_ResourceLinks] PRIMARY KEY CLUSTERED (
	      [Id] ASC
      ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
	
 INSERT INTO SchemaVersion values (newid(), @majorVersion, @minorVersion, getutcdate());
  COMMIT TRANSACTION Version1_10
END

SELECT @majorVersion = 1, @minorVersion = 11;
IF NOT EXISTS(SELECT * FROM SchemaVersion WHERE (MajorVersion = @majorVersion) AND (MinorVersion = @minorVersion))
BEGIN
  BEGIN TRANSACTION Version1_11
    
    ALTER TABLE [dbo].[ResourceLinks]
      ADD [ThumbNail]   VARCHAR(255)  NULL,
          [Description] VARCHAR(2000) NULL;
    
    INSERT INTO SchemaVersion values (newid(), @majorVersion, @minorVersion, getutcdate());
  COMMIT TRANSACTION Version1_11
END


SELECT @majorVersion = 1, @minorVersion = 12;
IF NOT EXISTS(SELECT * FROM SchemaVersion WHERE (MajorVersion = @majorVersion) AND (MinorVersion = @minorVersion))
BEGIN
  BEGIN TRANSACTION Version1_12
    INSERT INTO [dbo].[PageLocations] (Id, [Description])
    VALUES 	('BB0F852F-2C0E-4C2E-8CE0-59319318BC38', 'Resource Link Management');
        
					   
     INSERT INTO [dbo].[PageContent] ([PageLocation], [Description])
     VALUES ('BB0F852F-2C0E-4C2E-8CE0-59319318BC38', 'Resource Link Management');
    INSERT INTO SchemaVersion values (newid(), @majorVersion, @minorVersion, getutcdate());
  COMMIT TRANSACTION Version1_12
END

SELECT @majorVersion = 1, @minorVersion = 13;
IF NOT EXISTS(SELECT * FROM SchemaVersion WHERE (MajorVersion = @majorVersion) AND (MinorVersion = @minorVersion))
BEGIN
  BEGIN TRANSACTION Version1_13

    CREATE TABLE dbo.NewsArticles (
      [Id]          INT          NOT NULL IDENTITY(1,1),
      [Title]       VARCHAR(100) NOT NULL, 
      [Intro]       VARCHAR(500)     NULL,      
      [Description] VARCHAR(MAX)     NULL,      
      [ByLine]      VARCHAR(75)      NULL,
      [UserId]      INT          NOT NULL,
      [Created]     DATETIME     NOT NULL DEFAULT GETDATE(),
	    CONSTRAINT [PK_NewsArticles] PRIMARY KEY CLUSTERED (
	        [Id] ASC
        ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY];

    INSERT INTO SchemaVersion values (newid(), @majorVersion, @minorVersion, getutcdate());
  COMMIT TRANSACTION Version1_13
END

SELECT @majorVersion = 1, @minorVersion = 14;
IF NOT EXISTS(SELECT * FROM SchemaVersion WHERE (MajorVersion = @majorVersion) AND (MinorVersion = @minorVersion))
BEGIN
  BEGIN TRANSACTION Version1_14
    INSERT INTO [dbo].[PageLocations] (Id, [Description])
    VALUES 	('A1E9F1FF-9D7C-45A2-94A4-E9BDBFC13CF3', 'Contact Us');
        
					   
     INSERT INTO [dbo].[PageContent] ([PageLocation], [Description])
     VALUES ('A1E9F1FF-9D7C-45A2-94A4-E9BDBFC13CF3', 'Contact Us Content');
    INSERT INTO SchemaVersion values (newid(), @majorVersion, @minorVersion, getutcdate());
  COMMIT TRANSACTION Version1_14
END

/* 
  Use this model to create database changes
  Just change NEWVERSION to the next number in the sequence

SELECT @majorVersion = 1, @minorVersion = NEWVERSION;
IF NOT EXISTS(SELECT * FROM SchemaVersion WHERE (MajorVersion = @majorVersion) AND (MinorVersion = @minorVersion))
BEGIN
  BEGIN TRANSACTION Version1_NEWVERSION

    INSERT INTO SchemaVersion values (newid(), @majorVersion, @minorVersion, getutcdate());
  COMMIT TRANSACTION Version1_NEWVERSION
END
*/
