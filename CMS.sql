USE [cms]
GO
/****** Object:  StoredProcedure [dbo].[AddAlert]    Script Date: 8/14/2017 12:20:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
Create PROCEDURE [dbo].[AddAlert] 
	-- Add the parameters for the stored procedure here
	 @AlertName VarChar(500),
	 @AlertType VarChar(50),
	 @ApplicabilityRule VarChar(50),
	 @DueDays VarChar(50),
	 @AlertValidityFrom Date,
	 @AlertValidityTo Date,
	 @Audience VarChar(200),
	 @Schedule VarChar(50),
	 @CreatedDate DateTime,
	 @UpdatedDate DateTime

	   
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO dbo.AlertManager
          ( 
           AlertName,
		   AlertType,
		   ApplicabilityRule,
		   DueDays,
		   AlertValidityFrom,
		   AlertValidityTo,
		   Audience,
		   Schedule,
		   CreatedDate,
		   UpdatedDate
          ) 
     VALUES 
          ( 
            @AlertName,
			@AlertType,
			@ApplicabilityRule,
			@DueDays,
			@AlertValidityFrom,
			@AlertValidityTo,
			@Audience,
			@Schedule,
			@CreatedDate,
			@UpdatedDate
          ) 
END

GO
/****** Object:  StoredProcedure [dbo].[DeleteAlert]    Script Date: 8/14/2017 12:20:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DeleteAlert]
	-- Add the parameters for the stored procedure here
	 @AlterId INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE [dbo].[AlertManager] SET [IsDeleted]=1 WHERE [AlterId]=@AlterId
END

GO
/****** Object:  StoredProcedure [dbo].[GetAlertsInfoById]    Script Date: 8/14/2017 12:20:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetAlertsInfoById]
	@AlterId INT
	 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM [AlertManager] WHERE AlterId = @AlterId AND [IsDeleted]=0 Order by [CreatedDate] Desc
END

GO
/****** Object:  StoredProcedure [dbo].[GetAllAlerts]    Script Date: 8/14/2017 12:20:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetAllAlerts]
	-- Add the parameters for the stored procedure here
	 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM [AlertManager] WHERE [IsDeleted]=0 Order by [CreatedDate] Desc
END

GO
/****** Object:  StoredProcedure [dbo].[UpdateAlert]    Script Date: 8/14/2017 12:20:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[UpdateAlert] 
	-- Add the parameters for the stored procedure here
	 
	 @AlertName VarChar(500),
	 @AlertType VarChar(50),
	 @ApplicabilityRule VarChar(50),
	 @DueDays VarChar(50),
	 @AlertValidityFrom Date,
	 @AlertValidityTo Date,
	 @Audience VarChar(200),
	 @Schedule VarChar(50),	 
	 @UpdatedDate DateTime,
	 @AlterId INT

	   
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE dbo.AlertManager SET
	       AlertName = @AlertName,
		   AlertType = @AlertType,
		   ApplicabilityRule= @ApplicabilityRule,
		   DueDays= @DueDays,
		   AlertValidityFrom = @AlertValidityFrom,
		   AlertValidityTo = @AlertValidityTo,
		   Audience = @Audience,
		   Schedule = @Schedule,		    
		   UpdatedDate = @UpdatedDate
		   WHERE AlterId = @AlterId 
END

GO
/****** Object:  Table [dbo].[AlertManager]    Script Date: 8/14/2017 12:20:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AlertManager](
	[AlterId] [int] IDENTITY(1,1) NOT NULL,
	[AlertName] [varchar](500) NULL,
	[AlertType] [varchar](50) NULL,
	[ApplicabilityRule] [varchar](50) NULL,
	[DueDays] [varchar](50) NULL,
	[AlertValidityFrom] [date] NULL,
	[AlertValidityTo] [date] NULL,
	[Audience] [varchar](200) NULL,
	[Schedule] [varchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[IsDeleted] [tinyint] NULL,
 CONSTRAINT [PK_AlertManager] PRIMARY KEY CLUSTERED 
(
	[AlterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[AlertManager] ADD  CONSTRAINT [DF_AlertManager_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
