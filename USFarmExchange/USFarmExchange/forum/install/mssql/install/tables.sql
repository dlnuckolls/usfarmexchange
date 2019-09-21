CREATE PROCEDURE [dbo].[yaf_drop_defaultconstraint_oncolumn](@tablename varchar(255), @columnname varchar(255)) as
BEGIN
DECLARE @DefName sysname

SELECT 
  @DefName = o1.name
FROM
  sys.objects o1
  INNER JOIN sys.columns c ON
  o1.object_id = c.default_object_id
  INNER JOIN sys.objects o2 ON
  c.object_id = o2.object_id
WHERE
  o2.name = @tablename AND
  c.name = @columnname
  
IF @DefName IS NOT NULL
  EXECUTE ('ALTER TABLE [dbo].[' + @tablename + '] DROP constraint [' + @DefName + ']')
END;

/* Create Thanks Table */
CREATE TABLE [dbo].[yaf_Thanks](
	[ThanksID] [int] IDENTITY(1,1) NOT NULL,
	[ThanksFromUserID] [int] NOT NULL,
	[ThanksToUserID] [int] NOT NULL,
	[MessageID] [int] NOT NULL,
	[ThanksDate] [smalldatetime] NOT NULL,
	constraint [PK_yaf_Thanks] primary key(ThanksID)
	);

/* YAF Buddy Table */
CREATE TABLE [dbo].[yaf_Buddy](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FromUserID] [int] NOT NULL,
	[ToUserID] [int] NOT NULL,
	[Approved] [bit] NOT NULL,
	[Requested] [datetime] NOT NULL,
	constraint [PK_yaf_Buddy] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF),
 constraint [IX_yaf_Buddy] UNIQUE NONCLUSTERED 
(
	[FromUserID] ASC,
	[ToUserID] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF)
	);

/* YAF FavoriteTopic Table */
CREATE TABLE [dbo].[yaf_FavoriteTopic](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[TopicID] [int] NOT NULL,
	constraint [PK_yaf_FavoriteTopic] primary key(ID)
	);

/* YAF Album Tables*/
CREATE TABLE [dbo].[yaf_UserAlbum](
	[AlbumID] [INT] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[Title] [NVARCHAR](255),
	[CoverImageID] [INT],
	[Updated] [DATETIME] NOT NULL,
	constraint [PK_yaf_User_Album] primary key(AlbumID)
	);

if not exists (select top 1 1 from sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[yaf_UserAlbumImage]') and type in (N'U'))
CREATE TABLE [dbo].[yaf_UserAlbumImage](
	[ImageID] [INT] IDENTITY(1,1) NOT NULL,
	[AlbumID] [int] NOT NULL,
	[Caption] [NVARCHAR](255),
	[FileName] [NVARCHAR](255) NOT NULL,
	[Bytes] [INT] NOT NULL,
	[ContentType] [NVARCHAR](50),
	[Uploaded] [DATETIME] NOT NULL,
	[Downloads] [INT] NOT NULL,
	constraint [PK_yaf_User_AlbumImage] primary key(ImageID)
	)
GO

if not exists (select top 1 1 from sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[yaf_Active]') and type in (N'U'))
	create table [dbo].[yaf_Active](
		SessionID		nvarchar (24) NOT NULL,
		BoardID			int NOT NULL,
		UserID			int NOT NULL,
		IP				varchar (39) NOT NULL,
		[Login]			datetime NOT NULL,
		LastActive		datetime NOT NULL,
		Location		nvarchar (255) NOT NULL,
		ForumID			int NULL,
		TopicID			int NULL,
		Browser			nvarchar (50) NULL,
		[Platform]		nvarchar (50) NULL,
		Flags           int NULL,
		ForumPage       nvarchar(1024) NULL,
        constraint [PK_yaf_Active] PRIMARY KEY CLUSTERED 
(
	[SessionID] ASC,
	[BoardID] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF)
	)
go

if not exists (select top 1 1 from sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[yaf_ActiveAccess]') and type in (N'U'))
	create table [dbo].[yaf_ActiveAccess](		
		UserID			    int NOT NULL,
		BoardID			    int NOT NULL,			
		ForumID			    int NOT NULL,
		IsAdmin				bit NOT NULL,
		IsForumModerator	bit NOT NULL,
		IsModerator			bit NOT NULL,
		ReadAccess			bit NOT NULL,
		PostAccess			bit NOT NULL,
		ReplyAccess			bit NOT NULL,
		PriorityAccess		bit NOT NULL,
		PollAccess			bit NOT NULL,
		VoteAccess			bit NOT NULL,
		ModeratorAccess		bit NOT NULL,
		EditAccess			bit NOT NULL,
		DeleteAccess		bit NOT NULL,
		UploadAccess		bit NOT NULL,		
		DownloadAccess		bit NOT NULL,
		LastActive			datetime NULL,
		IsGuestX			bit NOT NULL,
        constraint [PK_yaf_ActiveAccess] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[ForumID] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF)	
	)
go

if not exists (select top 1 1 from sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[yaf_AdminPageUserAccess]') and type in (N'U'))
	create table [dbo].[yaf_AdminPageUserAccess](
		UserID		    int NOT NULL,		
		PageName		nvarchar (128) NOT NULL,
 constraint [PK_yaf_AdminPageUserAccess] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[PageName] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF)
	)
go

if not exists (select top 1 1 from sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[yaf_EventLogGroupAccess]') and type in (N'U'))
	create table [dbo].[yaf_EventLogGroupAccess](
		GroupID		    int NOT NULL,	
		EventTypeID     int NOT NULL,  	
		EventTypeName	nvarchar (128) NOT NULL,
		DeleteAccess    bit NOT NULL,
 constraint [PK_yaf_EventLogGroupAccess] PRIMARY KEY CLUSTERED 
(
	[GroupID] ASC,
	[EventTypeID] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF)
	)
go

if not exists (select top 1 1 from sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[yaf_BannedIP]') and type in (N'U'))
	create table [dbo].[yaf_BannedIP](
		ID				int IDENTITY (1,1) NOT NULL,
		BoardID			int NOT NULL,
		Mask			nvarchar (15) NOT NULL,
		Since			datetime NOT NULL,
		Reason          nvarchar (128) NULL,
		UserID			int null,
 constraint [PK_yaf_BannedIP] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF),
 constraint [IX_yaf_BannedIP] UNIQUE NONCLUSTERED 
(
	[BoardID] ASC,
	[Mask] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF)
	)
go

if not exists (select top 1 1 from sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[yaf_BannedName]') and type in (N'U'))
	create table [dbo].[yaf_BannedName](
		ID				int IDENTITY (1,1) NOT NULL,
		BoardID			int NOT NULL,
		Mask			nvarchar (255) NOT NULL,
		Since			datetime NOT NULL,
		Reason          nvarchar (128) NULL,
 constraint [PK_yaf_BannedName] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF),
 constraint [IX_yaf_BannedName] UNIQUE NONCLUSTERED 
(
	[BoardID] ASC,
	[Mask] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF)
	)
go

if not exists (select top 1 1 from sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[yaf_BannedEmail]') and type in (N'U'))
	create table [dbo].[yaf_BannedEmail](
		ID				int IDENTITY (1,1) NOT NULL,
		BoardID			int NOT NULL,
		Mask			nvarchar (255) NOT NULL,
		Since			datetime NOT NULL,
		Reason          nvarchar (128) NULL,
 constraint [PK_yaf_BannedEmail] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF),
 constraint [IX_yaf_BannedEmail] UNIQUE NONCLUSTERED 
(
	[BoardID] ASC,
	[Mask] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF)
	)
go

if not exists (select top 1 1 from sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[yaf_Category]') and type in (N'U'))
	create table [dbo].[yaf_Category](
		CategoryID		int IDENTITY (1,1) NOT NULL,
		BoardID			int NOT NULL,
		[Name]			[nvarchar](128) NOT NULL,
		[CategoryImage] [nvarchar](255) NULL,		
		SortOrder		smallint NOT NULL,
		PollGroupID     int null,
 constraint [PK_yaf_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF),
 constraint [IX_yaf_Category] UNIQUE NONCLUSTERED 
(
	[BoardID] ASC,
	[Name] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF)
	)
GO

if not exists (select top 1 1 from sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[yaf_CheckEmail]') and type in (N'U'))
	create table [dbo].[yaf_CheckEmail](
		CheckEmailID	int IDENTITY (1,1) NOT NULL,
		UserID			int NOT NULL,
		Email			nvarchar (255) NOT NULL,
		Created			datetime NOT NULL,
		[Hash]			nvarchar (32) NOT NULL,
 constraint [PK_yaf_CheckEmail] PRIMARY KEY CLUSTERED 
(
	[CheckEmailID] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF),
 constraint [IX_yaf_CheckEmail] UNIQUE NONCLUSTERED 
(
	[Hash] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF)
	)
GO

if not exists (select top 1 1 from sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[yaf_Choice]') and type in (N'U'))
	create table [dbo].[yaf_Choice](
		ChoiceID		int IDENTITY (1,1) NOT NULL,
		PollID			int NOT NULL,
		Choice			nvarchar (50) NOT NULL,
		Votes			int NOT NULL,
		[ObjectPath] nvarchar(255) NULL,
		[MimeType] varchar(50) NULL,
 constraint [PK_yaf_Choice] PRIMARY KEY CLUSTERED 
(
	[ChoiceID] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF)
	)
GO

if not exists (select top 1 1 from sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[yaf_PollVote]') and type in (N'U'))
	CREATE TABLE [dbo].[yaf_PollVote] (
		[PollVoteID] [int] IDENTITY (1,1) NOT NULL,
		[PollID] [int] NOT NULL,
		[UserID] [int] NULL,
		[RemoteIP] [varchar] (39) NULL,
		[ChoiceID] [int] NULL,
 constraint [PK_yaf_PollVote] PRIMARY KEY CLUSTERED 
(
	[PollVoteID] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF)
	)
GO

if not exists (select top 1 1 from sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[yaf_PollVoteRefuse]') and type in (N'U'))
	CREATE TABLE [dbo].[yaf_PollVoteRefuse] (
		[RefuseID] [int] IDENTITY (1,1) NOT NULL,		
		[PollID] [int] NOT NULL,
		[UserID] [int] NULL,
		[RemoteIP] [varchar] (57) NULL
	)
GO

if not exists (select top 1 1 from sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[yaf_Forum]') and type in (N'U'))
	create table [dbo].[yaf_Forum](
		ForumID			int IDENTITY (1,1) NOT NULL,
		CategoryID		int NOT NULL,
		ParentID		int NULL,
		Name			nvarchar (50) NOT NULL,
		[Description]	nvarchar (255) NULL,
		SortOrder		smallint NOT NULL,
		LastPosted		datetime NULL,
		LastTopicID		int NULL,
		LastMessageID	int NULL,
		LastUserID		int NULL,
		LastUserName	nvarchar (255) NULL,
		LastUserDisplayName	nvarchar (255) NULL,
		NumTopics		int NOT NULL,
		NumPosts		int NOT NULL,
		RemoteURL		nvarchar(100) null,
		Flags			int not null constraint [DF_yaf_Forum_Flags] default (0),
		[IsLocked]		AS (CONVERT([bit],sign([Flags]&(1)),(0))),
		[IsHidden]		AS (CONVERT([bit],sign([Flags]&(2)),(0))),
		[IsNoCount]		AS (CONVERT([bit],sign([Flags]&(4)),(0))),
		[IsModerated]	AS (CONVERT([bit],sign([Flags]&(8)),(0))),
		ThemeURL		nvarchar(50) NULL,
		PollGroupID     int null,
		ImageURL        nvarchar(128) NULL,
	    Styles          nvarchar(255) NULL,
		UserID          int null,
		ModeratedPostCount int null,
		IsModeratedNewTopicOnly	bit not null constraint [DF_yaf_Forum_IsModeratedNewTopicOnly] default (0),
 constraint [PK_yaf_Forum] PRIMARY KEY CLUSTERED 
(
	[ForumID] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF)
	)
GO

if not exists (select top 1 1 from sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[yaf_ForumAccess]') and type in (N'U'))
	create table [dbo].[yaf_ForumAccess](
		GroupID			int NOT NULL,
		ForumID			int NOT NULL,
		AccessMaskID	int NOT NULL,
 constraint [PK_yaf_ForumAccess] PRIMARY KEY CLUSTERED 
(
	[GroupID] ASC,
	[ForumID] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF)
	)
GO

if not exists (select top 1 1 from sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[yaf_Group]') and type in (N'U'))
	create table [dbo].[yaf_Group](
		GroupID		   int IDENTITY (1,1) NOT NULL,
		BoardID		   int NOT NULL,
		[Name]		   nvarchar (255) NOT NULL,
		Flags		   int not null constraint [DF_yaf_Group_Flags] default (0),
		PMLimit        int NOT NULL	constraint [DF_yaf_Group_PMLimit] default (0),
	    Style          nvarchar(255) NULL,
	    SortOrder      smallint NOT NULL constraint [DF_yaf_Group_SortOrder] default (0),
	    [Description]  nvarchar(128) NULL,
	    UsrSigChars    int NOT NULL constraint [DF_yaf_Group_UsrSigChars] default (0),
	    UsrSigBBCodes  nvarchar(255) NULL,
	    UsrSigHTMLTags nvarchar(255) NULL,
	    UsrAlbums      int NOT NULL constraint [DF_yaf_Group_UsrAlbums] default (0),
	    UsrAlbumImages int NOT NULL constraint [DF_yaf_Group_UsrAlbumImages]  default (0),
	    IsHidden       AS (CONVERT([bit],sign([Flags]&(16)),(0))),
	    IsUserGroup    AS (CONVERT([bit],sign([Flags]&(32)),(0))),
 constraint [PK_yaf_Group] PRIMARY KEY CLUSTERED 
(
	[GroupID] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF),
 constraint [IX_yaf_Group] UNIQUE NONCLUSTERED 
(
	[BoardID] ASC,
	[Name] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF)
	)
GO

if not exists (select top 1 1 from sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[yaf_Mail]') and type in (N'U'))
	create table [dbo].[yaf_Mail](
		[MailID] [int] IDENTITY(1,1) NOT NULL,
		[FromUser] [nvarchar](255) NOT NULL,
		[FromUserName] [nvarchar](255) NULL,
		[ToUser] [nvarchar](255) NOT NULL,
		[ToUserName] [nvarchar](255) NULL,
		[Created] [datetime] NOT NULL,
		[Subject] [nvarchar](100) NOT NULL,
		[Body] [nvarchar](max) NOT NULL,
		[BodyHtml] [nvarchar](max) NULL,
		[SendTries] [int] NOT NULL constraint [DF_yaf_Mail_SendTries]  default (0),
		[SendAttempt] [datetime] NULL,
		[ProcessID] [int] NULL,
 constraint [PK_yaf_Mail] PRIMARY KEY CLUSTERED 
(
	[MailID] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF)
	)
GO

if not exists (select top 1 1 from sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[yaf_Message]') and type in (N'U'))
	create table [dbo].[yaf_Message](
		MessageID		    int IDENTITY (1,1) NOT NULL,
		TopicID			    int NOT NULL,
		ReplyTo			    int NULL,
		Position		    int NOT NULL,
		Indent			    int NOT NULL,
		UserID			    int NOT NULL,
		UserName		    nvarchar (255) NULL,
		UserDisplayName		nvarchar (255) NULL,
		Posted			    datetime NOT NULL,
		[Message]		    nvarchar(max) NOT NULL,
		IP				    varchar (39) NOT NULL,
		Edited			    datetime NULL,
		Flags			    int NOT NULL,
		EditReason          nvarchar (100) NULL,
		IsModeratorChanged  bit NOT NULL constraint [DF_yaf_Message_IsModeratorChanged] default (0),
	    DeleteReason        nvarchar (100)  NULL,
		ExternalMessageId	nvarchar(255) NULL,
		ReferenceMessageId	nvarchar(255) NULL,
		IsDeleted		    AS (CONVERT([bit],sign([Flags]&(8)),0)),
		IsApproved		    AS (CONVERT([bit],sign([Flags]&(16)),(0))),
		BlogPostID          nvarchar(50) NULL,
	    EditedBy            int NULL,
 constraint [PK_yaf_Message] PRIMARY KEY CLUSTERED 
(
	[MessageID] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF)
	)
GO

if not exists (select top 1 1 from sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[yaf_MessageHistory]') and type in (N'U'))
	create table [dbo].[yaf_MessageHistory](
		MessageID		    int NOT NULL,
		[Message]		    nvarchar(max) NOT NULL,
		IP				    varchar (39) NOT NULL,
		Edited			    datetime NOT NULL,
		EditedBy		    int NULL,	
		EditReason          nvarchar (100) NULL,
		IsModeratorChanged  bit NOT NULL constraint [DF_yaf_MessageHistory_IsModeratorChanged] default (0),
		Flags               int NOT NULL constraint [DF_yaf_MessageHistory_Flags] default (23),
 constraint [PK_yaf_MessageHistory] PRIMARY KEY CLUSTERED 
(
	[MessageID] ASC,
	[Edited] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF) 
	)
GO

exec('[dbo].[yaf_drop_defaultconstraint_oncolumn] yaf_MessageHistory, MessageHistoryID')
GO

IF NOT EXISTS (select top 1 1 from sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[yaf_MessageReported]') and type in (N'U'))
	CREATE TABLE [dbo].[yaf_MessageReported](
		[MessageID] [int] NOT NULL,
		[Message] [nvarchar](max) NULL,
		[Resolved] [bit] NULL,
		[ResolvedBy] [int] NULL,
		[ResolvedDate] [datetime] NULL,
 constraint [PK_yaf_MessageReported] PRIMARY KEY CLUSTERED 
(
	[MessageID] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF)
	)
GO

IF NOT EXISTS (select top 1 1 from sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[yaf_MessageReportedAudit]') and type in (N'U'))
	CREATE TABLE [dbo].[yaf_MessageReportedAudit](
		[LogID] [int] IDENTITY(1,1) NOT NULL,
		[UserID] [int] NULL,
		[MessageID] [int] NOT NULL,
		[Reported] [datetime] NULL,
	    [ReportedNumber] [int] NOT NULL default (1),
	    [ReportText] [nvarchar](4000) NULL
		)
GO

if not exists (select top 1 1 from sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[yaf_PMessage]') and type in (N'U'))
	create table [dbo].[yaf_PMessage](
		PMessageID		int IDENTITY (1,1) NOT NULL,
		FromUserID      int NOT NULL,
		ReplyTo			int NULL,
		Created			datetime NOT NULL,
		[Subject]		nvarchar (100) NOT NULL,
		Body			nvarchar(max) NOT NULL,
		Flags			int NOT NULL constraint [DF_yaf_Message_Flags] default (23),
 constraint [PK_yaf_PMessage] PRIMARY KEY CLUSTERED 
(
	[PMessageID] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF)
	)
GO

if not exists (select top 1 1 from sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[yaf_PollGroupCluster]') and type in (N'U'))
	create table [dbo].[yaf_PollGroupCluster](		
		PollGroupID int IDENTITY (1,1) NOT NULL,
		UserID	    int not NULL,
		[Flags]     int NOT NULL constraint [DF_yaf_PollGroupCluster_Flags] default (0),
		[IsBound]   AS (CONVERT([bit],sign([Flags]&(2)),(0)))
 constraint [PK_yaf_PollGroupCluster] PRIMARY KEY CLUSTERED 
(
	[PollGroupID] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF)	
	)
GO

if not exists (select top 1 1 from sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[yaf_Poll]') and type in (N'U'))
	create table [dbo].[yaf_Poll](
		PollID			       int IDENTITY (1,1) NOT NULL,
		Question		       nvarchar (50) NOT NULL,
		Closes                 datetime NULL,		
		PollGroupID            int NULL,
		UserID                 int not NULL constraint [DF_yaf_Poll_UserID] default (1),	
		[ObjectPath]           nvarchar(255) NULL,
		[MimeType]             varchar(50) NULL,
		[Flags]                int NOT NULL constraint [DF_yaf_Poll_Flags] default (0),		
		[IsClosedBound] 	   AS (CONVERT([bit],sign([Flags]&(4)),(0))),
		[AllowMultipleChoices] AS (CONVERT([bit],sign([Flags]&(8)),(0))),
		[ShowVoters]           AS (CONVERT([bit],sign([Flags]&(16)),(0))),
		[AllowSkipVote]        AS (CONVERT([bit],sign([Flags]&(32)),(0))),
 constraint [PK_yaf_Poll] PRIMARY KEY CLUSTERED 
(
	[PollID] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF)
	)
GO

if not exists (select top 1 1 from sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[yaf_Smiley]') and type in (N'U'))
	create table [dbo].[yaf_Smiley](
		SmileyID		int IDENTITY (1,1) NOT NULL,
		BoardID			int NOT NULL,
		Code			nvarchar (10) NOT NULL,
		Icon			nvarchar (50) NOT NULL,
		Emoticon		nvarchar (50) NULL,
		SortOrder		tinyint	NOT NULL default 0,
 constraint [PK_yaf_Smiley] PRIMARY KEY CLUSTERED 
(
	[SmileyID] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF),
 constraint [IX_yaf_Smiley] UNIQUE NONCLUSTERED 
(
	[BoardID] ASC,
	[Code] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF)
	)
GO

if not exists (select top 1 1 from sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[yaf_Topic]') and type in (N'U'))
	create table [dbo].[yaf_Topic](
		TopicID			    int IDENTITY (1,1) NOT NULL,
		ForumID			    int NOT NULL,
		UserID			    int NOT NULL,
		UserName		    nvarchar (255) NULL,
		UserDisplayName		nvarchar (255) NULL,	
		Posted			    datetime NOT NULL,
		Topic			    nvarchar (100) NOT NULL,
		[Description]		nvarchar (255) NULL,
		[Status]	     	nvarchar (255) NULL,
		[Styles]	     	nvarchar (255) NULL,
		[LinkDate]          datetime NULL,
		[Views]			    int NOT NULL,
		[Priority]		    smallint NOT NULL,
		PollID			    int NULL,
		TopicMovedID	    int NULL,
		LastPosted		    datetime NULL,
		LastMessageID	    int NULL,
		LastUserID		    int NULL,
		LastUserName	    nvarchar (255) NULL,
		LastUserDisplayName	nvarchar (255) NULL,	
		NumPosts		    int NOT NULL,
		Flags			    int not null constraint [DF_yaf_Topic_Flags] default (0),
		IsDeleted		    AS (CONVERT([bit],sign([Flags]&(8)),0)),
		[IsQuestion]        AS (CONVERT([bit],sign([Flags]&(1024)),(0))),
		[AnswerMessageId]   [int] NULL,
		[LastMessageFlags]	[int] NULL,
		[TopicImage]        nvarchar(255) NULL,
 constraint [PK_yaf_Topic] PRIMARY KEY CLUSTERED 
(
	[TopicID] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF)
	)
GO

if not exists (select top 1 1 from sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[yaf_User]') and type in (N'U'))
	create table [dbo].[yaf_User](
		UserID			int IDENTITY (1,1) NOT NULL,
		BoardID			int NOT NULL,
		ProviderUserKey	nvarchar(64),
		[Name]			nvarchar (255) NOT NULL,
		[DisplayName]	nvarchar (255) NOT NULL,
		[Password]		nvarchar (32) NOT NULL,
		[Email]			nvarchar (255) NULL,
		Joined			datetime NOT NULL,
		LastVisit		datetime NOT NULL,
		IP				nvarchar (39) NULL,
		NumPosts		int NOT NULL,
		TimeZone		nvarchar(max) NULL,
		Avatar			nvarchar (255) NULL,
		[Signature]		nvarchar(max) NULL,
		AvatarImage		image NULL,
		AvatarImageType	nvarchar (50) NULL,
		RankID			[int] NOT NULL,
		Suspended		[datetime] NULL,
		SuspendedReason nvarchar(max) NULL,
		SuspendedBy     int not null default (0),
		LanguageFile	nvarchar(50) NULL,
		ThemeFile		nvarchar(50) NULL,
		TextEditor		nvarchar(50) NULL,
		OverridedefaultThemes	bit NOT NULL constraint [DF_yaf_User_OverridedefaultThemes] default (1),
		[PMNotification] [bit] NOT NULL constraint [DF_yaf_User_PMNotification] default (1),
		[AutoWatchTopics] [bit] NOT NULL constraint [DF_yaf_User_AutoWatchTopics] default (0),
		[DailyDigest] [bit] NOT NULL constraint [DF_yaf_User_DailyDigest] default (0),
		[NotificationType] [int] default (10),
		[Flags] [int]	NOT NULL  constraint [DF_yaf_User_Flags]  default (0),
		[Points] [int]	NOT NULL constraint [DF_yaf_User_Points] default (1),		
		[IsApproved]	AS (CONVERT([bit],sign([Flags]&(2)),(0))),
		[IsGuest]	AS (CONVERT([bit],sign([Flags]&(4)),(0))),
		[IsCaptchaExcluded]	AS (CONVERT([bit],sign([Flags]&(8)),(0))),
		[IsActiveExcluded] AS (CONVERT([bit],sign([Flags]&(16)),(0))),
		[IsDST]	AS (CONVERT([bit],sign([Flags]&(32)),(0))),
		[IsDirty]	AS (CONVERT([bit],sign([Flags]&(64)),(0))),
		[Culture] varchar (10) default (10),
		[IsFacebookUser][bit] NOT NULL constraint [DF_yaf_User_IsFacebookUser] default (0),
		[IsTwitterUser][bit] NOT NULL constraint [DF_yaf_User_IsTwitterUser] default (0),
		[UserStyle] [varchar](510) NULL,
	    [StyleFlags] [int] NOT NULL constraint [DF_yaf_User_StyleFlags] default (0),
	    [IsUserStyle]  AS (CONVERT([bit],sign([StyleFlags]&(1)),(0))),
	    [IsGroupStyle]  AS (CONVERT([bit],sign([StyleFlags]&(2)),(0))),
	    [IsRankStyle]  AS (CONVERT([bit],sign([StyleFlags]&(4)),(0))),
		[IsGoogleUser][bit] NOT NULL constraint [DF_yaf_User_IsGoogleUser] default (0),
 constraint [PK_yaf_User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF),
 constraint [IX_yaf_User] UNIQUE NONCLUSTERED 
(
	[BoardID] ASC,
	[Name] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF)
)
GO

IF not exists (select top 1 1 from sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[yaf_UserProfile]') and type in (N'U'))
	CREATE TABLE [dbo].[yaf_UserProfile]
	(
		[UserID] [int] NOT NULL,
		[LastUpdatedDate] [datetime] NOT NULL,
		-- added columns
		[LastActivity] [datetime],
		[ApplicationName] [nvarchar](255) NOT NULL,	
		[IsAnonymous] [bit] NOT NULL,
		[UserName] [nvarchar](255) NOT NULL,
 constraint [PK_yaf_UserProfile] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[ApplicationName] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF),
 constraint [IX_yaf_UserProfile] UNIQUE NONCLUSTERED 
(
	[UserID] ASC,
	[ApplicationName] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF)
	)
GO

if not exists (select top 1 1 from sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[yaf_WatchForum]') and type in (N'U'))
	create table [dbo].[yaf_WatchForum](
		WatchForumID	int IDENTITY (1,1) NOT NULL,
		ForumID			int NOT NULL,
		UserID			int NOT NULL,
		Created			datetime NOT NULL,
		LastMail		datetime null,
 constraint [PK_yaf_WatchForum] PRIMARY KEY CLUSTERED 
(
	[WatchForumID] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF),
 constraint [IX_yaf_WatchForum] UNIQUE NONCLUSTERED 
(
	[ForumID] ASC,
	[UserID] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF)
	)
GO

if not exists (select top 1 1 from sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[yaf_WatchTopic]') and type in (N'U'))
	create table [dbo].[yaf_WatchTopic](
		WatchTopicID	int IDENTITY (1,1) NOT NULL,
		TopicID			int NOT NULL,
		UserID			int NOT NULL,
		Created			datetime NOT NULL,
		LastMail		datetime null,
 constraint [PK_yaf_WatchTopic] PRIMARY KEY CLUSTERED 
(
	[WatchTopicID] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF),
 constraint [IX_yaf_WatchTopic] UNIQUE NONCLUSTERED 
(
	[TopicID] ASC,
	[UserID] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF)
	)
GO

if not exists (select top 1 1 from sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[yaf_Attachment]') and type in (N'U'))
	create table [dbo].[yaf_Attachment](
		AttachmentID	int IDENTITY (1,1) not null,
		MessageID		int not null default (0),
		UserID          int not null default (0),		
		[FileName]		nvarchar(255) not null,
		Bytes			int not null,
		ContentType		nvarchar(max) null,
		Downloads		int not null,
		FileData		image null,
 constraint [PK_yaf_Attachment] PRIMARY KEY CLUSTERED 
(
	[AttachmentID] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF)
	)
GO

if not exists (select top 1 1 from sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[yaf_UserGroup]') and type in (N'U'))
	create table [dbo].[yaf_UserGroup](
		UserID			int NOT NULL,
		GroupID			int NOT NULL,
 constraint [PK_yaf_UserGroup] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[GroupID] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF)
	)
GO

if not exists (select top 1 1 from sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[yaf_Rank]') and type in (N'U'))
	create table [dbo].[yaf_Rank](
		RankID			 int IDENTITY (1,1) NOT NULL,
		BoardID			 int NOT NULL,
		Name			 nvarchar (50) NOT NULL,
		MinPosts		 int NULL,
		RankImage		 nvarchar (50) NULL,
		Flags			 int not null constraint [DF_yaf_Rank_Flags] default (0),
	    [PMLimit]        [int] NULL,
	    [Style]          [nvarchar](255) NULL,
	    [SortOrder]      [smallint] NOT NULL constraint [DF_yaf_Rank_SortOrder] default (0),
	    [Description]    [nvarchar](128) NULL,
	    [UsrSigChars]    [int] NOT NULL constraint [DF_yaf_Rank_UsrSigChars] default (0),
	    [UsrSigBBCodes]  [nvarchar](255) NULL,
	    [UsrSigHTMLTags] [nvarchar](255) NULL,
	    [UsrAlbums]      [int] NOT NULL constraint [DF_yaf_Rank_UsrAlbums] default (0),
	    [UsrAlbumImages] [int] NOT NULL constraint [DF_yaf_Rank_UsrAlbumImages]  default (0),
 constraint [PK_yaf_Rank] PRIMARY KEY CLUSTERED 
(
	[RankID] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF),
 constraint [IX_yaf_Rank] UNIQUE NONCLUSTERED 
(
	[BoardID] ASC,
	[Name] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF)
	)
GO

if not exists (select top 1 1 from sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[yaf_AccessMask]') and type in (N'U'))
	create table [dbo].[yaf_AccessMask](
		AccessMaskID	int IDENTITY (1,1) NOT NULL,
		BoardID			int NOT NULL,
		Name			nvarchar(50) NOT NULL,
		Flags			int not null constraint [DF_yaf_AccessMask_Flags] default (0),
	    [SortOrder]     [smallint] NOT NULL default (0),
 constraint [PK_yaf_AccessMask] PRIMARY KEY CLUSTERED 
(
	[AccessMaskID] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF)
	)
GO

if not exists (select top 1 1 from sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[yaf_UserForum]') and type in (N'U'))
	create table [dbo].[yaf_UserForum](
		UserID			int NOT NULL,
		ForumID			int NOT NULL,
		AccessMaskID	int NOT NULL,
		Invited			datetime NOT NULL,
		Accepted		bit NOT NULL,
 constraint [PK_yaf_UserForum] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[ForumID] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF)
	)
GO

if not exists (select top 1 1 from sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[yaf_Board]') and type in (N'U'))
begin
	create table [dbo].[yaf_Board](
		BoardID			int IDENTITY (1,1) NOT NULL,
		Name			nvarchar(50) NOT NULL,
		AllowThreaded	bit NOT NULL,
		MembershipAppName nvarchar(255) NULL,
		RolesAppName nvarchar(255) NULL,
 constraint [PK_yaf_Board] PRIMARY KEY CLUSTERED 
(
	[BoardID] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF)
	)
end
GO

if not exists (select top 1 1 from sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[yaf_NntpServer]') and type in (N'U'))
	create table [dbo].[yaf_NntpServer](
		NntpServerID	int IDENTITY (1,1) not null,
		BoardID			int NOT NULL,
		Name			nvarchar(50) not null,
		[Address]		nvarchar(100) not null,
		Port			int null,
		UserName		nvarchar(255) null,
		UserPass		nvarchar(50) null,
 constraint [PK_yaf_NntpServer] PRIMARY KEY CLUSTERED 
(
	[NntpServerID] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF)
		
	)
GO

if not exists (select top 1 1 from sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[yaf_NntpForum]') and type in (N'U'))
	create table [dbo].[yaf_NntpForum](
		NntpForumID		int IDENTITY (1,1) not null,
		NntpServerID	int not null,
		GroupName		nvarchar(100) not null,
		ForumID			int not null,
		LastMessageNo	int not null,
		LastUpdate		datetime not null,
		Active			bit not null,
		DateCutOff		datetime null,
 constraint [PK_yaf_NntpForum] PRIMARY KEY CLUSTERED 
(
	[NntpForumID] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF)
	)
GO

if not exists (select top 1 1 from sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[yaf_NntpTopic]') and type in (N'U'))
	create table [dbo].[yaf_NntpTopic](
		NntpTopicID		int IDENTITY (1,1) not null,
		NntpForumID		int not null,
		Thread			nvarchar(64) not null,
		TopicID			int not null,
 constraint [PK_yaf_NntpTopic] PRIMARY KEY CLUSTERED 
(
	[NntpTopicID] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF)
	)
GO

if not exists (select top 1 1 from sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[yaf_UserPMessage]') and type in (N'U'))
begin
	create table [dbo].[yaf_UserPMessage](
		UserPMessageID	int IDENTITY (1,1) not null,
		UserID			int not null,
		PMessageID		int not null,
		[Flags]			int NOT NULL constraint [DF_yaf_UserPMessage_Flags]  default (0),
		[IsRead]		AS (CONVERT([bit],sign([Flags]&(1)),(0))),
		[IsInOutbox]	AS (CONVERT([bit],sign([Flags]&(2)),(0))),
		[IsArchived]	AS (CONVERT([bit],sign([Flags]&(4)),(0))),
		[IsDeleted]		AS (CONVERT([bit],sign([Flags]&(8)),(0))),
		[IsReply]		[bit] NOT NULL  default (0)		,
 constraint [PK_yaf_UserPMessage] PRIMARY KEY CLUSTERED 
(
	[UserPMessageID] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF)
	)
end
GO

if not exists (select top 1 1 from sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[yaf_Replace_Words]') and type in (N'U'))
begin
	create table [dbo].[yaf_Replace_Words](
		ID				int IDENTITY (1,1) NOT NULL,
		BoardId			int NOT NULL constraint [DF_yaf_Replace_Words_BoardID] default (1),
		BadWord			nvarchar (255) NULL,
		GoodWord		nvarchar (255) NULL,
 constraint [PK_yaf_Replace_Words] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF)
	)
end
GO

if not exists (select top 1 1 from sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[yaf_Spam_Words]') and type in (N'U'))
begin
	create table [dbo].[yaf_Spam_Words](
		ID				int IDENTITY (1,1) NOT NULL,
		BoardId			int NOT NULL,
		SpamWord			nvarchar (255) NULL,
		constraint [PK_yaf_Spam_Words] primary key(ID)
	)
end
GO

if not exists (select top 1 1 from sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[yaf_Registry]') and type in (N'U'))
begin
	create table [dbo].[yaf_Registry](
		RegistryID		int IDENTITY(1,1) NOT NULL,
		Name			nvarchar(50) NOT NULL,
		Value			nvarchar(max),
		BoardID			int,
		constraint [PK_yaf_Registry] PRIMARY KEY (RegistryID)
	)
end
GO

if not exists (select top 1 1 from sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[yaf_EventLog]') and type in (N'U'))
begin
	create table [dbo].[yaf_EventLog](
		EventLogID	int identity(1,1) not null,
		EventTime	datetime not null constraint [DF_yaf_EventLog_EventTime] default GETUTCDATE() ,
		UserID		int, -- deprecated
		UserName	nvarchar(100) null,
		[Source]	nvarchar(50) not null,
		Description	nvarchar(max) not null,
		[Type] [int] NOT NULL constraint [DF_yaf_EventLog_Type] default (0),
		constraint [PK_yaf_EventLog] primary key(EventLogID)
	)
end
GO

if not exists (select top 1 1 from sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[yaf_Extension]') and type in (N'U'))
BEGIN
	CREATE TABLE [dbo].[yaf_Extension](
		ExtensionID int IDENTITY(1,1) NOT NULL,
		BoardId int NOT NULL,
		Extension nvarchar(10) NOT NULL,
		constraint [PK_yaf_Extension] PRIMARY KEY(ExtensionID)
	)
END
GO

if not exists (select top 1 1 from sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[yaf_BBCode]') and type in (N'U'))
begin
	create table [dbo].[yaf_BBCode](
		[BBCodeID] [int] IDENTITY(1,1) NOT NULL,
		[BoardID] [int] NOT NULL,
		[Name] [nvarchar](255) NOT NULL,
		[Description] [nvarchar](4000) NULL,
		[OnClickJS] [nvarchar](1000) NULL,
		[DisplayJS] [nvarchar](max) NULL,
		[EditJS] [nvarchar](max) NULL,
		[DisplayCSS] [nvarchar](max) NULL,
		[SearchRegex] [nvarchar](max) NULL,
		[ReplaceRegex] [nvarchar](max) NULL,
		[Variables] [nvarchar](1000) NULL,
		[UseModule] [bit] NULL,
		[ModuleClass] [nvarchar](255) NULL,		
		[ExecOrder] [int] NOT NULL,
		constraint [PK_yaf_BBCode] PRIMARY KEY (BBCodeID)
	)
end
GO


if not exists (select top 1 1 from sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[yaf_Medal]') and type in (N'U'))
begin
	create table [dbo].[yaf_Medal](
		[BoardID] [int] NOT NULL,
		[MedalID] [int] IDENTITY(1,1) NOT NULL,
		[Name] [nvarchar](100) NOT NULL,
		[Description] [nvarchar](max) NOT NULL,
		[Message] [nvarchar](100) NOT NULL,
		[Category] [nvarchar](50) NULL,
		[MedalURL] [nvarchar](250) NOT NULL,
		[RibbonURL] [nvarchar](250) NULL,
		[SmallMedalURL] [nvarchar](250) NOT NULL,
		[SmallRibbonURL] [nvarchar](250) NULL,
		[SmallMedalWidth] [smallint] NOT NULL,
		[SmallMedalHeight] [smallint] NOT NULL,
		[SmallRibbonWidth] [smallint] NULL,
		[SmallRibbonHeight] [smallint] NULL,
		[SortOrder] [tinyint] NOT NULL constraint [DF_yaf_Medal_defaultOrder]  default ((255)),
		[Flags] [int] NOT NULL constraint [DF_yaf_Medal_Flags]  default ((0)),
		constraint [PK_yaf_Medal] PRIMARY KEY CLUSTERED ([MedalID] ASC)
		)
end
GO

if not exists (select top 1 1 from sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[yaf_GroupMedal]') and type in (N'U'))
begin
	create table [dbo].[yaf_GroupMedal](
		[GroupID] [int] NOT NULL,
		[MedalID] [int] NOT NULL,
		[Message] [nvarchar](100) NULL,
		[Hide] [bit] NOT NULL constraint [DF_yaf_GroupMedal_Hide]  default ((0)),
		[OnlyRibbon] [bit] NOT NULL constraint [DF_yaf_GroupMedal_OnlyRibbon]  default ((0)),
		[SortOrder] [tinyint] NOT NULL constraint [DF_yaf_GroupMedal_SortOrder]  default ((255)),
 constraint [PK_yaf_GroupMedal] PRIMARY KEY CLUSTERED 
(
	[MedalID] ASC,
	[GroupID] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF)
		)
end
GO

if not exists (select top 1 1 from sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[yaf_UserMedal]') and type in (N'U'))
begin
	create table [dbo].[yaf_UserMedal](
		[UserID] [int] NOT NULL,
		[MedalID] [int] NOT NULL,
		[Message] [nvarchar](100) NULL,
		[Hide] [bit] NOT NULL constraint [DF_yaf_UserMedal_Hide]  default ((0)),
		[OnlyRibbon] [bit] NOT NULL constraint [DF_yaf_UserMedal_OnlyRibbon]  default ((0)),
		[SortOrder] [tinyint] NOT NULL constraint [DF_yaf_UserMedal_SortOrder]  default ((255)),
		[DateAwarded] [datetime] NOT NULL,
 constraint [PK_yaf_UserMedal] PRIMARY KEY CLUSTERED 
(
	[MedalID] ASC,
	[UserID] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF)
	)
end
GO

if not exists (select top 1 1 from sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[yaf_IgnoreUser]') and type in (N'U'))
begin
	CREATE TABLE [dbo].[yaf_IgnoreUser]
	(
		[UserID] int NOT NULL,
		[IgnoredUserID] int NOT NULL,
 constraint [PK_yaf_IgnoreUser] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[IgnoredUserID] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF)
	)
end
GO

-- Create Topic Read Tracking Table

if not exists (select top 1 1 from sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[yaf_TopicReadTracking]') and type in (N'U'))
	create table [dbo].[yaf_TopicReadTracking](
		UserID			int NOT NULL,
		TopicID			int NOT NULL,
		LastAccessDate	datetime NOT NULL
 constraint [PK_yaf_TopicReadTracking] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[TopicID] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF)
	)
GO

-- Create Forum Read Tracking Table

if not exists (select top 1 1 from sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[yaf_ForumReadTracking]') and type in (N'U'))
	create table [dbo].[yaf_ForumReadTracking](
		UserID			int NOT NULL,
		ForumID			int NOT NULL,
		LastAccessDate	datetime NOT NULL,
 constraint [PK_yaf_ForumReadTracking] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[ForumID] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF)
	)
GO

if not exists (select top 1 1 from sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[yaf_TopicStatus]') and type in (N'U'))
BEGIN
	CREATE TABLE [dbo].[yaf_TopicStatus](
	    TopicStatusID int IDENTITY(1,1) NOT NULL,
		TopicStatusName nvarchar(100) NOT NULL,
		BoardID int NOT NULL,
		defaultDescription nvarchar(100) NOT NULL,
		constraint [PK_yaf_TopicStatus] PRIMARY KEY(TopicStatusID)
	)
END
GO

if not exists (select top 1 1 from sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[yaf_ReputationVote]') and type in (N'U'))
	create table [dbo].[yaf_ReputationVote](
		ReputationFromUserID  int NOT NULL,
		ReputationToUserID	  int NOT NULL,
		VoteDate	datetime NOT NULL,
 constraint [PK_yaf_ReputationVote] PRIMARY KEY CLUSTERED 
(
	[ReputationFromUserID] ASC,
	[ReputationToUserID] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF)
	)
GO

if not exists (select top 1 1 from sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[yaf_ShoutboxMessage]') and type in (N'U'))
begin
	CREATE TABLE [dbo].[yaf_ShoutboxMessage](
		[ShoutBoxMessageID] [int] IDENTITY(1,1) NOT NULL,		
		[BoardId] [int] NOT NULL constraint [DF_yaf_ShoutboxMessage_BoardID] default (1),
		[UserID] [int] NULL,
		[UserName] [nvarchar](255) NOT NULL,
		[UserDisplayName] [nvarchar](255) NOT NULL,
		[Message] [nvarchar](max) NULL,
		[Date] [datetime] NOT NULL,
		[IP] [varchar](50) NOT NULL,
 constraint [PK_yaf_ShoutboxMessage] PRIMARY KEY CLUSTERED 
(
	[ShoutBoxMessageID] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF)
	)
end
GO	

exec('[dbo].[yaf_drop_defaultconstraint_oncolumn] yaf_Board, BoardUID')
GO