 

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'Advertising.SpecialGet') AND type in (N'P', N'PC')) 
	DROP PROCEDURE Advertising.SpecialGet 
GO 

CREATE PROCEDURE Advertising.SpecialGet ( 
	@Special_Pk AS int  = NULL  OUTPUT 
	, @SpecialsCatagory_Fk AS int  = NULL  
	, @SpecialText AS varchar (500)  = NULL  
	, @StartDate AS datetime  = NULL  
	, @EndDate AS datetime  = NULL  
	, @Shipping AS bit  = NULL  
	, @Catagory AS int  = NULL  
	, @itemkey AS int  = NULL  
	, @DiscountPer AS int  = NULL  
	, @DiscountAmount AS money  = NULL  
	, @OrderTotal AS money  = NULL  
) AS 


	DECLARE @ErrMsg nvarchar(4000) = 'Advertising.SpecialGet:', @ErrSeverity int = 16


	 SELECT 
			[Special].[Special_Pk] 
 			, [Special].[SpecialsCatagory_Fk] 
 			, [Special].[SpecialText] 
 			, [Special].[StartDate] 
 			, [Special].[EndDate] 
 			, [Special].[Shipping] 
 			, [Special].[Catagory] 
 			, [Special].[itemkey] 
 			, [Special].[DiscountPer] 
 			, [Special].[DiscountAmount] 
 			, [Special].[OrderTotal] 
 	 FROM [Advertising].[Special] 
	 WHERE 
			 ( [Special].[Special_Pk] = @Special_Pk OR @Special_Pk IS NULL ) 
 			AND  ( [Special].[SpecialsCatagory_Fk] = @SpecialsCatagory_Fk OR @SpecialsCatagory_Fk IS NULL ) 
 			AND  ( [Special].[SpecialText] = @SpecialText OR @SpecialText IS NULL ) 
 			AND  ( [Special].[StartDate] = @StartDate OR @StartDate IS NULL ) 
 			AND  ( [Special].[EndDate] = @EndDate OR @EndDate IS NULL ) 
 			AND  ( [Special].[Shipping] = @Shipping OR @Shipping IS NULL ) 
 			AND  ( [Special].[Catagory] = @Catagory OR @Catagory IS NULL ) 
 			AND  ( [Special].[itemkey] = @itemkey OR @itemkey IS NULL ) 
 			AND  ( [Special].[DiscountPer] = @DiscountPer OR @DiscountPer IS NULL ) 
 			AND  ( [Special].[DiscountAmount] = @DiscountAmount OR @DiscountAmount IS NULL ) 
 			AND  ( [Special].[OrderTotal] = @OrderTotal OR @OrderTotal IS NULL ) 
 
	IF @@ROWCOUNT <= 0 
	BEGIN
		SET @ErrMsg += 'No Records Found Matching the Search Criteria'
		RAISERROR ( @ErrMsg, @ErrSeverity, 1 );
	END

SET  @Special_Pk=SCOPE_IDENTITY()

GO

SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'Advertising.SpecialCreate') AND type in (N'P', N'PC')) 
	DROP PROCEDURE Advertising.SpecialCreate 
GO 

CREATE PROCEDURE Advertising.SpecialCreate ( 
	@Special_Pk AS int  OUTPUT 
	, @SpecialsCatagory_Fk AS int  
	, @SpecialText AS varchar (500)  
	, @StartDate AS datetime  
	, @EndDate AS datetime  
	, @Shipping AS bit  
	, @Catagory AS int  
	, @itemkey AS int  
	, @DiscountPer AS int  
	, @DiscountAmount AS money  
	, @OrderTotal AS money  
) AS 

BEGIN TRY 
BEGIN TRANSACTION 


	DECLARE @ErrMsg nvarchar(4000) = 'Advertising.SpecialCreate:', @ErrSeverity int = 16

		 INSERT INTO [Advertising].[Special] ( 
			SpecialsCatagory_Fk 
			, SpecialText 
			, StartDate 
			, EndDate 
			, Shipping 
			, Catagory 
			, itemkey 
			, DiscountPer 
			, DiscountAmount 
			, OrderTotal 
		 ) 
		 VALUES ( 
			 @SpecialsCatagory_Fk 
			,  @SpecialText 
			,  @StartDate 
			,  @EndDate 
			,  @Shipping 
			,  @Catagory 
			,  @itemkey 
			,  @DiscountPer 
			,  @DiscountAmount 
			,  @OrderTotal 
		 ) 

		SET  @Special_Pk=SCOPE_IDENTITY()

COMMIT 
END TRY 
BEGIN CATCH 
		IF @@TRANCOUNT > 0 ROLLBACK 
		SELECT @ErrMsg = 
			'Message: '+ ERROR_MESSAGE() 
			+ ', Error ' + CONVERT(VARCHAR(50), ERROR_NUMBER()) 
			+ ', Severity ' + CONVERT(VARCHAR(5), ERROR_SEVERITY()) 
			+ ', State ' + CONVERT(VARCHAR(5), ERROR_STATE()) 
			+ ', Line ' + CONVERT(VARCHAR(5), ERROR_LINE()); 
		SELECT @ErrSeverity = ERROR_SEVERITY() 
		RAISERROR(@ErrMsg, @ErrSeverity, 1) 
END CATCH 

GO

SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'Advertising.SpecialUpdate') AND type in (N'P', N'PC')) 
	DROP PROCEDURE Advertising.SpecialUpdate 
GO 

CREATE PROCEDURE Advertising.SpecialUpdate ( 
	@Special_Pk AS int  = NULL  OUTPUT 
	, @SpecialsCatagory_Fk AS int  = NULL  
	, @SpecialText AS varchar (500)  = NULL  
	, @StartDate AS datetime  = NULL  
	, @EndDate AS datetime  = NULL  
	, @Shipping AS bit  = NULL  
	, @Catagory AS int  = NULL  
	, @itemkey AS int  = NULL  
	, @DiscountPer AS int  = NULL  
	, @DiscountAmount AS money  = NULL  
	, @OrderTotal AS money  = NULL  
) AS 

BEGIN TRY 
BEGIN TRANSACTION 


	DECLARE @ErrMsg nvarchar(4000) = 'Advertising.SpecialUpdate:', @ErrSeverity int = 16

		 UPDATE [Advertising].[Special] 
	 SET 
		 SpecialsCatagory_Fk = CASE 
	 WHEN NOT @SpecialsCatagory_Fk IS NULL THEN @SpecialsCatagory_Fk 
	 ELSE SpecialsCatagory_Fk 
	 END 
	,  SpecialText = CASE 
	 WHEN NOT @SpecialText IS NULL THEN @SpecialText 
	 ELSE SpecialText 
	 END 
	,  StartDate = CASE 
	 WHEN NOT @StartDate IS NULL THEN @StartDate 
	 ELSE StartDate 
	 END 
	,  EndDate = CASE 
	 WHEN NOT @EndDate IS NULL THEN @EndDate 
	 ELSE EndDate 
	 END 
	,  Shipping = CASE 
	 WHEN NOT @Shipping IS NULL THEN @Shipping 
	 ELSE Shipping 
	 END 
	,  Catagory = CASE 
	 WHEN NOT @Catagory IS NULL THEN @Catagory 
	 ELSE Catagory 
	 END 
	,  itemkey = CASE 
	 WHEN NOT @itemkey IS NULL THEN @itemkey 
	 ELSE itemkey 
	 END 
	,  DiscountPer = CASE 
	 WHEN NOT @DiscountPer IS NULL THEN @DiscountPer 
	 ELSE DiscountPer 
	 END 
	,  DiscountAmount = CASE 
	 WHEN NOT @DiscountAmount IS NULL THEN @DiscountAmount 
	 ELSE DiscountAmount 
	 END 
	,  OrderTotal = CASE 
	 WHEN NOT @OrderTotal IS NULL THEN @OrderTotal 
	 ELSE OrderTotal 
	 END 
	 WHERE Special_Pk = @Special_Pk 
	IF @@ROWCOUNT <= 0 
	BEGIN
		SET @ErrMsg += 'No Records Found Matching the Search Criteria'
		RAISERROR ( @ErrMsg, @ErrSeverity, 1 );
	END

COMMIT 
END TRY 
BEGIN CATCH 
		IF @@TRANCOUNT > 0 ROLLBACK 
		SELECT @ErrMsg = 
			'Message: '+ ERROR_MESSAGE() 
			+ ', Error ' + CONVERT(VARCHAR(50), ERROR_NUMBER()) 
			+ ', Severity ' + CONVERT(VARCHAR(5), ERROR_SEVERITY()) 
			+ ', State ' + CONVERT(VARCHAR(5), ERROR_STATE()) 
			+ ', Line ' + CONVERT(VARCHAR(5), ERROR_LINE()); 
		SELECT @ErrSeverity = ERROR_SEVERITY() 
		RAISERROR(@ErrMsg, @ErrSeverity, 1) 
END CATCH 

GO

SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'Advertising.SpecialDelete') AND type in (N'P', N'PC')) 
	DROP PROCEDURE Advertising.SpecialDelete 
GO 

CREATE PROCEDURE Advertising.SpecialDelete ( 
	@Special_Pk AS int  OUTPUT 
	, 	@delete AS BIT = NULL ) AS 

BEGIN TRY 
BEGIN TRANSACTION 


	DECLARE @ErrMsg nvarchar(4000) = 'Advertising.SpecialDelete:', @ErrSeverity int = 16

		 IF @delete = 1 
		 BEGIN 
	 DELETE FROM [Advertising].[Special] WHERE ( Special_Pk= @Special_Pk ) 
		 END 
	IF @@ROWCOUNT <= 0 
	BEGIN
		SET @ErrMsg += 'No Records Found Matching the Search Criteria'
		RAISERROR ( @ErrMsg, @ErrSeverity, 1 );
	END

COMMIT 
END TRY 
BEGIN CATCH 
		IF @@TRANCOUNT > 0 ROLLBACK 
		SELECT @ErrMsg = 
			'Message: '+ ERROR_MESSAGE() 
			+ ', Error ' + CONVERT(VARCHAR(50), ERROR_NUMBER()) 
			+ ', Severity ' + CONVERT(VARCHAR(5), ERROR_SEVERITY()) 
			+ ', State ' + CONVERT(VARCHAR(5), ERROR_STATE()) 
			+ ', Line ' + CONVERT(VARCHAR(5), ERROR_LINE()); 
		SELECT @ErrSeverity = ERROR_SEVERITY() 
		RAISERROR(@ErrMsg, @ErrSeverity, 1) 
END CATCH 

GO

SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO


 

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'Advertising.SpecialCatagoryGet') AND type in (N'P', N'PC')) 
	DROP PROCEDURE Advertising.SpecialCatagoryGet 
GO 

CREATE PROCEDURE Advertising.SpecialCatagoryGet ( 
	@SpecialsCatagory_Pk AS int  = NULL  OUTPUT 
	, @Description AS varchar (50)  = NULL  
) AS 


	DECLARE @ErrMsg nvarchar(4000) = 'Advertising.SpecialCatagoryGet:', @ErrSeverity int = 16


	 SELECT 
			[SpecialCatagory].[SpecialsCatagory_Pk] 
 			, [SpecialCatagory].[Description] 
 	 FROM [Advertising].[SpecialCatagory] 
	 WHERE 
			 ( [SpecialCatagory].[SpecialsCatagory_Pk] = @SpecialsCatagory_Pk OR @SpecialsCatagory_Pk IS NULL ) 
 			AND  ( [SpecialCatagory].[Description] = @Description OR @Description IS NULL ) 
 
	IF @@ROWCOUNT <= 0 
	BEGIN
		SET @ErrMsg += 'No Records Found Matching the Search Criteria'
		RAISERROR ( @ErrMsg, @ErrSeverity, 1 );
	END

SET  @SpecialsCatagory_Pk=SCOPE_IDENTITY()

GO

SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'Advertising.SpecialCatagoryCreate') AND type in (N'P', N'PC')) 
	DROP PROCEDURE Advertising.SpecialCatagoryCreate 
GO 

CREATE PROCEDURE Advertising.SpecialCatagoryCreate ( 
	@SpecialsCatagory_Pk AS int  OUTPUT 
	, @Description AS varchar (50)  
) AS 

BEGIN TRY 
BEGIN TRANSACTION 


	DECLARE @ErrMsg nvarchar(4000) = 'Advertising.SpecialCatagoryCreate:', @ErrSeverity int = 16

		 INSERT INTO [Advertising].[SpecialCatagory] ( 
			Description 
		 ) 
		 VALUES ( 
			 @Description 
		 ) 

		SET  @SpecialsCatagory_Pk=SCOPE_IDENTITY()

COMMIT 
END TRY 
BEGIN CATCH 
		IF @@TRANCOUNT > 0 ROLLBACK 
		SELECT @ErrMsg = 
			'Message: '+ ERROR_MESSAGE() 
			+ ', Error ' + CONVERT(VARCHAR(50), ERROR_NUMBER()) 
			+ ', Severity ' + CONVERT(VARCHAR(5), ERROR_SEVERITY()) 
			+ ', State ' + CONVERT(VARCHAR(5), ERROR_STATE()) 
			+ ', Line ' + CONVERT(VARCHAR(5), ERROR_LINE()); 
		SELECT @ErrSeverity = ERROR_SEVERITY() 
		RAISERROR(@ErrMsg, @ErrSeverity, 1) 
END CATCH 

GO

SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'Advertising.SpecialCatagoryUpdate') AND type in (N'P', N'PC')) 
	DROP PROCEDURE Advertising.SpecialCatagoryUpdate 
GO 

CREATE PROCEDURE Advertising.SpecialCatagoryUpdate ( 
	@SpecialsCatagory_Pk AS int  = NULL  OUTPUT 
	, @Description AS varchar (50)  = NULL  
) AS 

BEGIN TRY 
BEGIN TRANSACTION 


	DECLARE @ErrMsg nvarchar(4000) = 'Advertising.SpecialCatagoryUpdate:', @ErrSeverity int = 16

		 UPDATE [Advertising].[SpecialCatagory] 
	 SET 
		 Description = CASE 
	 WHEN NOT @Description IS NULL THEN @Description 
	 ELSE Description 
	 END 
	 WHERE SpecialsCatagory_Pk = @SpecialsCatagory_Pk 
	IF @@ROWCOUNT <= 0 
	BEGIN
		SET @ErrMsg += 'No Records Found Matching the Search Criteria'
		RAISERROR ( @ErrMsg, @ErrSeverity, 1 );
	END

COMMIT 
END TRY 
BEGIN CATCH 
		IF @@TRANCOUNT > 0 ROLLBACK 
		SELECT @ErrMsg = 
			'Message: '+ ERROR_MESSAGE() 
			+ ', Error ' + CONVERT(VARCHAR(50), ERROR_NUMBER()) 
			+ ', Severity ' + CONVERT(VARCHAR(5), ERROR_SEVERITY()) 
			+ ', State ' + CONVERT(VARCHAR(5), ERROR_STATE()) 
			+ ', Line ' + CONVERT(VARCHAR(5), ERROR_LINE()); 
		SELECT @ErrSeverity = ERROR_SEVERITY() 
		RAISERROR(@ErrMsg, @ErrSeverity, 1) 
END CATCH 

GO

SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'Advertising.SpecialCatagoryDelete') AND type in (N'P', N'PC')) 
	DROP PROCEDURE Advertising.SpecialCatagoryDelete 
GO 

CREATE PROCEDURE Advertising.SpecialCatagoryDelete ( 
	@SpecialsCatagory_Pk AS int  OUTPUT 
	, 	@delete AS BIT = NULL ) AS 

BEGIN TRY 
BEGIN TRANSACTION 


	DECLARE @ErrMsg nvarchar(4000) = 'Advertising.SpecialCatagoryDelete:', @ErrSeverity int = 16

		 IF @delete = 1 
		 BEGIN 
	 DELETE FROM [Advertising].[SpecialCatagory] WHERE ( SpecialsCatagory_Pk= @SpecialsCatagory_Pk ) 
		 END 
	IF @@ROWCOUNT <= 0 
	BEGIN
		SET @ErrMsg += 'No Records Found Matching the Search Criteria'
		RAISERROR ( @ErrMsg, @ErrSeverity, 1 );
	END

COMMIT 
END TRY 
BEGIN CATCH 
		IF @@TRANCOUNT > 0 ROLLBACK 
		SELECT @ErrMsg = 
			'Message: '+ ERROR_MESSAGE() 
			+ ', Error ' + CONVERT(VARCHAR(50), ERROR_NUMBER()) 
			+ ', Severity ' + CONVERT(VARCHAR(5), ERROR_SEVERITY()) 
			+ ', State ' + CONVERT(VARCHAR(5), ERROR_STATE()) 
			+ ', Line ' + CONVERT(VARCHAR(5), ERROR_LINE()); 
		SELECT @ErrSeverity = ERROR_SEVERITY() 
		RAISERROR(@ErrMsg, @ErrSeverity, 1) 
END CATCH 

GO

SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO


 

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.ELMAH_ErrorGet') AND type in (N'P', N'PC')) 
	DROP PROCEDURE dbo.ELMAH_ErrorGet 
GO 

CREATE PROCEDURE dbo.ELMAH_ErrorGet ( 
	@ErrorId AS uniqueidentifier  = NULL  OUTPUT 
	, @Application AS nvarchar (60)  = NULL  
	, @Host AS nvarchar (50)  = NULL  
	, @Type AS nvarchar (100)  = NULL  
	, @Source AS nvarchar (60)  = NULL  
	, @Message AS nvarchar (500)  = NULL  
	, @User AS nvarchar (50)  = NULL  
	, @StatusCode AS int  = NULL  
	, @TimeUtc AS datetime  = NULL  
	, @Sequence AS int  = NULL  
) AS 


	DECLARE @ErrMsg nvarchar(4000) = 'dbo.ELMAH_ErrorGet:', @ErrSeverity int = 16


	 SELECT 
			[ELMAH_Error].[ErrorId] 
 			, [ELMAH_Error].[Application] 
 			, [ELMAH_Error].[Host] 
 			, [ELMAH_Error].[Type] 
 			, [ELMAH_Error].[Source] 
 			, [ELMAH_Error].[Message] 
 			, [ELMAH_Error].[User] 
 			, [ELMAH_Error].[StatusCode] 
 			, [ELMAH_Error].[TimeUtc] 
 			, [ELMAH_Error].[Sequence] 
 	 FROM [dbo].[ELMAH_Error] 
	 WHERE 
			 ( [ELMAH_Error].[ErrorId] = @ErrorId OR @ErrorId IS NULL ) 
 			AND  ( [ELMAH_Error].[Application] = @Application OR @Application IS NULL ) 
 			AND  ( [ELMAH_Error].[Host] = @Host OR @Host IS NULL ) 
 			AND  ( [ELMAH_Error].[Type] = @Type OR @Type IS NULL ) 
 			AND  ( [ELMAH_Error].[Source] = @Source OR @Source IS NULL ) 
 			AND  ( [ELMAH_Error].[Message] = @Message OR @Message IS NULL ) 
 			AND  ( [ELMAH_Error].[User] = @User OR @User IS NULL ) 
 			AND  ( [ELMAH_Error].[StatusCode] = @StatusCode OR @StatusCode IS NULL ) 
 			AND  ( [ELMAH_Error].[TimeUtc] = @TimeUtc OR @TimeUtc IS NULL ) 
 			AND  ( [ELMAH_Error].[Sequence] = @Sequence OR @Sequence IS NULL ) 
 
	IF @@ROWCOUNT <= 0 
	BEGIN
		SET @ErrMsg += 'No Records Found Matching the Search Criteria'
		RAISERROR ( @ErrMsg, @ErrSeverity, 1 );
	END

SET  @ErrorId=SCOPE_IDENTITY()

GO

SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.ELMAH_ErrorCreate') AND type in (N'P', N'PC')) 
	DROP PROCEDURE dbo.ELMAH_ErrorCreate 
GO 

CREATE PROCEDURE dbo.ELMAH_ErrorCreate ( 
	@ErrorId AS uniqueidentifier  OUTPUT 
	, @Application AS nvarchar (60)  
	, @Host AS nvarchar (50)  
	, @Type AS nvarchar (100)  
	, @Source AS nvarchar (60)  
	, @Message AS nvarchar (500)  
	, @User AS nvarchar (50)  
	, @StatusCode AS int  
	, @TimeUtc AS datetime  
	, @Sequence AS int  
) AS 

BEGIN TRY 
BEGIN TRANSACTION 


	DECLARE @ErrMsg nvarchar(4000) = 'dbo.ELMAH_ErrorCreate:', @ErrSeverity int = 16

		 INSERT INTO [dbo].[ELMAH_Error] ( 
			Application 
			, Host 
			, Type 
			, Source 
			, Message 
			, User 
			, StatusCode 
			, TimeUtc 
			, Sequence 
		 ) 
		 VALUES ( 
			 @Application 
			,  @Host 
			,  @Type 
			,  @Source 
			,  @Message 
			,  @User 
			,  @StatusCode 
			,  @TimeUtc 
			,  @Sequence 
		 ) 

		SET  @ErrorId=SCOPE_IDENTITY()

COMMIT 
END TRY 
BEGIN CATCH 
		IF @@TRANCOUNT > 0 ROLLBACK 
		SELECT @ErrMsg = 
			'Message: '+ ERROR_MESSAGE() 
			+ ', Error ' + CONVERT(VARCHAR(50), ERROR_NUMBER()) 
			+ ', Severity ' + CONVERT(VARCHAR(5), ERROR_SEVERITY()) 
			+ ', State ' + CONVERT(VARCHAR(5), ERROR_STATE()) 
			+ ', Line ' + CONVERT(VARCHAR(5), ERROR_LINE()); 
		SELECT @ErrSeverity = ERROR_SEVERITY() 
		RAISERROR(@ErrMsg, @ErrSeverity, 1) 
END CATCH 

GO

SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.ELMAH_ErrorUpdate') AND type in (N'P', N'PC')) 
	DROP PROCEDURE dbo.ELMAH_ErrorUpdate 
GO 

CREATE PROCEDURE dbo.ELMAH_ErrorUpdate ( 
	@ErrorId AS uniqueidentifier  = NULL  OUTPUT 
	, @Application AS nvarchar (60)  = NULL  
	, @Host AS nvarchar (50)  = NULL  
	, @Type AS nvarchar (100)  = NULL  
	, @Source AS nvarchar (60)  = NULL  
	, @Message AS nvarchar (500)  = NULL  
	, @User AS nvarchar (50)  = NULL  
	, @StatusCode AS int  = NULL  
	, @TimeUtc AS datetime  = NULL  
	, @Sequence AS int  = NULL  
) AS 

BEGIN TRY 
BEGIN TRANSACTION 


	DECLARE @ErrMsg nvarchar(4000) = 'dbo.ELMAH_ErrorUpdate:', @ErrSeverity int = 16

		 UPDATE [dbo].[ELMAH_Error] 
	 SET 
		 Application = CASE 
	 WHEN NOT @Application IS NULL THEN @Application 
	 ELSE Application 
	 END 
	,  Host = CASE 
	 WHEN NOT @Host IS NULL THEN @Host 
	 ELSE Host 
	 END 
	,  Type = CASE 
	 WHEN NOT @Type IS NULL THEN @Type 
	 ELSE Type 
	 END 
	,  Source = CASE 
	 WHEN NOT @Source IS NULL THEN @Source 
	 ELSE Source 
	 END 
	,  Message = CASE 
	 WHEN NOT @Message IS NULL THEN @Message 
	 ELSE Message 
	 END 
	,  User = CASE 
	 WHEN NOT @User IS NULL THEN @User 
	 ELSE User 
	 END 
	,  StatusCode = CASE 
	 WHEN NOT @StatusCode IS NULL THEN @StatusCode 
	 ELSE StatusCode 
	 END 
	,  TimeUtc = CASE 
	 WHEN NOT @TimeUtc IS NULL THEN @TimeUtc 
	 ELSE TimeUtc 
	 END 
	,  Sequence = CASE 
	 WHEN NOT @Sequence IS NULL THEN @Sequence 
	 ELSE Sequence 
	 END 
	 WHERE ErrorId = @ErrorId 
	IF @@ROWCOUNT <= 0 
	BEGIN
		SET @ErrMsg += 'No Records Found Matching the Search Criteria'
		RAISERROR ( @ErrMsg, @ErrSeverity, 1 );
	END

COMMIT 
END TRY 
BEGIN CATCH 
		IF @@TRANCOUNT > 0 ROLLBACK 
		SELECT @ErrMsg = 
			'Message: '+ ERROR_MESSAGE() 
			+ ', Error ' + CONVERT(VARCHAR(50), ERROR_NUMBER()) 
			+ ', Severity ' + CONVERT(VARCHAR(5), ERROR_SEVERITY()) 
			+ ', State ' + CONVERT(VARCHAR(5), ERROR_STATE()) 
			+ ', Line ' + CONVERT(VARCHAR(5), ERROR_LINE()); 
		SELECT @ErrSeverity = ERROR_SEVERITY() 
		RAISERROR(@ErrMsg, @ErrSeverity, 1) 
END CATCH 

GO

SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.ELMAH_ErrorDelete') AND type in (N'P', N'PC')) 
	DROP PROCEDURE dbo.ELMAH_ErrorDelete 
GO 

CREATE PROCEDURE dbo.ELMAH_ErrorDelete ( 
	@ErrorId AS uniqueidentifier  OUTPUT 
	, 	@delete AS BIT = NULL ) AS 

BEGIN TRY 
BEGIN TRANSACTION 


	DECLARE @ErrMsg nvarchar(4000) = 'dbo.ELMAH_ErrorDelete:', @ErrSeverity int = 16

		 IF @delete = 1 
		 BEGIN 
	 DELETE FROM [dbo].[ELMAH_Error] WHERE ( ErrorId= @ErrorId ) 
		 END 
	IF @@ROWCOUNT <= 0 
	BEGIN
		SET @ErrMsg += 'No Records Found Matching the Search Criteria'
		RAISERROR ( @ErrMsg, @ErrSeverity, 1 );
	END

COMMIT 
END TRY 
BEGIN CATCH 
		IF @@TRANCOUNT > 0 ROLLBACK 
		SELECT @ErrMsg = 
			'Message: '+ ERROR_MESSAGE() 
			+ ', Error ' + CONVERT(VARCHAR(50), ERROR_NUMBER()) 
			+ ', Severity ' + CONVERT(VARCHAR(5), ERROR_SEVERITY()) 
			+ ', State ' + CONVERT(VARCHAR(5), ERROR_STATE()) 
			+ ', Line ' + CONVERT(VARCHAR(5), ERROR_LINE()); 
		SELECT @ErrSeverity = ERROR_SEVERITY() 
		RAISERROR(@ErrMsg, @ErrSeverity, 1) 
END CATCH 

GO

SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO


 

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'Inventory.ReplacementGet') AND type in (N'P', N'PC')) 
	DROP PROCEDURE Inventory.ReplacementGet 
GO 

CREATE PROCEDURE Inventory.ReplacementGet ( 
	@Replacement_Pk AS int  = NULL  OUTPUT 
	, @Item_Fk AS int  = NULL  
	, @Amount AS int  = NULL  
	, @Date AS datetime  = NULL  
) AS 


	DECLARE @ErrMsg nvarchar(4000) = 'Inventory.ReplacementGet:', @ErrSeverity int = 16


	 SELECT 
			[Replacement].[Replacement_Pk] 
 			, [Replacement].[Item_Fk] 
 			, [Replacement].[Amount] 
 			, [Replacement].[Date] 
 	 FROM [Inventory].[Replacement] 
	 WHERE 
			 ( [Replacement].[Replacement_Pk] = @Replacement_Pk OR @Replacement_Pk IS NULL ) 
 			AND  ( [Replacement].[Item_Fk] = @Item_Fk OR @Item_Fk IS NULL ) 
 			AND  ( [Replacement].[Amount] = @Amount OR @Amount IS NULL ) 
 			AND  ( [Replacement].[Date] = @Date OR @Date IS NULL ) 
 
	IF @@ROWCOUNT <= 0 
	BEGIN
		SET @ErrMsg += 'No Records Found Matching the Search Criteria'
		RAISERROR ( @ErrMsg, @ErrSeverity, 1 );
	END

SET  @Replacement_Pk=SCOPE_IDENTITY()

GO

SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'Inventory.ReplacementCreate') AND type in (N'P', N'PC')) 
	DROP PROCEDURE Inventory.ReplacementCreate 
GO 

CREATE PROCEDURE Inventory.ReplacementCreate ( 
	@Replacement_Pk AS int  OUTPUT 
	, @Item_Fk AS int  
	, @Amount AS int  
	, @Date AS datetime  
) AS 

BEGIN TRY 
BEGIN TRANSACTION 


	DECLARE @ErrMsg nvarchar(4000) = 'Inventory.ReplacementCreate:', @ErrSeverity int = 16

		 INSERT INTO [Inventory].[Replacement] ( 
			Item_Fk 
			, Amount 
			, Date 
		 ) 
		 VALUES ( 
			 @Item_Fk 
			,  @Amount 
			,  @Date 
		 ) 

		SET  @Replacement_Pk=SCOPE_IDENTITY()

COMMIT 
END TRY 
BEGIN CATCH 
		IF @@TRANCOUNT > 0 ROLLBACK 
		SELECT @ErrMsg = 
			'Message: '+ ERROR_MESSAGE() 
			+ ', Error ' + CONVERT(VARCHAR(50), ERROR_NUMBER()) 
			+ ', Severity ' + CONVERT(VARCHAR(5), ERROR_SEVERITY()) 
			+ ', State ' + CONVERT(VARCHAR(5), ERROR_STATE()) 
			+ ', Line ' + CONVERT(VARCHAR(5), ERROR_LINE()); 
		SELECT @ErrSeverity = ERROR_SEVERITY() 
		RAISERROR(@ErrMsg, @ErrSeverity, 1) 
END CATCH 

GO

SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'Inventory.ReplacementUpdate') AND type in (N'P', N'PC')) 
	DROP PROCEDURE Inventory.ReplacementUpdate 
GO 

CREATE PROCEDURE Inventory.ReplacementUpdate ( 
	@Replacement_Pk AS int  = NULL  OUTPUT 
	, @Item_Fk AS int  = NULL  
	, @Amount AS int  = NULL  
	, @Date AS datetime  = NULL  
) AS 

BEGIN TRY 
BEGIN TRANSACTION 


	DECLARE @ErrMsg nvarchar(4000) = 'Inventory.ReplacementUpdate:', @ErrSeverity int = 16

		 UPDATE [Inventory].[Replacement] 
	 SET 
		 Item_Fk = CASE 
	 WHEN NOT @Item_Fk IS NULL THEN @Item_Fk 
	 ELSE Item_Fk 
	 END 
	,  Amount = CASE 
	 WHEN NOT @Amount IS NULL THEN @Amount 
	 ELSE Amount 
	 END 
	,  Date = CASE 
	 WHEN NOT @Date IS NULL THEN @Date 
	 ELSE Date 
	 END 
	 WHERE Replacement_Pk = @Replacement_Pk 
	IF @@ROWCOUNT <= 0 
	BEGIN
		SET @ErrMsg += 'No Records Found Matching the Search Criteria'
		RAISERROR ( @ErrMsg, @ErrSeverity, 1 );
	END

COMMIT 
END TRY 
BEGIN CATCH 
		IF @@TRANCOUNT > 0 ROLLBACK 
		SELECT @ErrMsg = 
			'Message: '+ ERROR_MESSAGE() 
			+ ', Error ' + CONVERT(VARCHAR(50), ERROR_NUMBER()) 
			+ ', Severity ' + CONVERT(VARCHAR(5), ERROR_SEVERITY()) 
			+ ', State ' + CONVERT(VARCHAR(5), ERROR_STATE()) 
			+ ', Line ' + CONVERT(VARCHAR(5), ERROR_LINE()); 
		SELECT @ErrSeverity = ERROR_SEVERITY() 
		RAISERROR(@ErrMsg, @ErrSeverity, 1) 
END CATCH 

GO

SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'Inventory.ReplacementDelete') AND type in (N'P', N'PC')) 
	DROP PROCEDURE Inventory.ReplacementDelete 
GO 

CREATE PROCEDURE Inventory.ReplacementDelete ( 
	@Replacement_Pk AS int  OUTPUT 
	, 	@delete AS BIT = NULL ) AS 

BEGIN TRY 
BEGIN TRANSACTION 


	DECLARE @ErrMsg nvarchar(4000) = 'Inventory.ReplacementDelete:', @ErrSeverity int = 16

		 IF @delete = 1 
		 BEGIN 
	 DELETE FROM [Inventory].[Replacement] WHERE ( Replacement_Pk= @Replacement_Pk ) 
		 END 
	IF @@ROWCOUNT <= 0 
	BEGIN
		SET @ErrMsg += 'No Records Found Matching the Search Criteria'
		RAISERROR ( @ErrMsg, @ErrSeverity, 1 );
	END

COMMIT 
END TRY 
BEGIN CATCH 
		IF @@TRANCOUNT > 0 ROLLBACK 
		SELECT @ErrMsg = 
			'Message: '+ ERROR_MESSAGE() 
			+ ', Error ' + CONVERT(VARCHAR(50), ERROR_NUMBER()) 
			+ ', Severity ' + CONVERT(VARCHAR(5), ERROR_SEVERITY()) 
			+ ', State ' + CONVERT(VARCHAR(5), ERROR_STATE()) 
			+ ', Line ' + CONVERT(VARCHAR(5), ERROR_LINE()); 
		SELECT @ErrSeverity = ERROR_SEVERITY() 
		RAISERROR(@ErrMsg, @ErrSeverity, 1) 
END CATCH 

GO

SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO


 

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'Inventory.StockGet') AND type in (N'P', N'PC')) 
	DROP PROCEDURE Inventory.StockGet 
GO 

CREATE PROCEDURE Inventory.StockGet ( 
	@Inventory_Pk AS int  = NULL  OUTPUT 
	, @Item_Fk AS int  = NULL  
	, @CurrentAmount AS int  = NULL  
	, @LastUpdatedDate AS datetime  = NULL  
) AS 


	DECLARE @ErrMsg nvarchar(4000) = 'Inventory.StockGet:', @ErrSeverity int = 16


	 SELECT 
			[Stock].[Inventory_Pk] 
 			, [Stock].[Item_Fk] 
 			, [Stock].[CurrentAmount] 
 			, [Stock].[LastUpdatedDate] 
 	 FROM [Inventory].[Stock] 
	 WHERE 
			 ( [Stock].[Inventory_Pk] = @Inventory_Pk OR @Inventory_Pk IS NULL ) 
 			AND  ( [Stock].[Item_Fk] = @Item_Fk OR @Item_Fk IS NULL ) 
 			AND  ( [Stock].[CurrentAmount] = @CurrentAmount OR @CurrentAmount IS NULL ) 
 			AND  ( [Stock].[LastUpdatedDate] = @LastUpdatedDate OR @LastUpdatedDate IS NULL ) 
 
	IF @@ROWCOUNT <= 0 
	BEGIN
		SET @ErrMsg += 'No Records Found Matching the Search Criteria'
		RAISERROR ( @ErrMsg, @ErrSeverity, 1 );
	END

SET  @Inventory_Pk=SCOPE_IDENTITY()

GO

SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'Inventory.StockCreate') AND type in (N'P', N'PC')) 
	DROP PROCEDURE Inventory.StockCreate 
GO 

CREATE PROCEDURE Inventory.StockCreate ( 
	@Inventory_Pk AS int  OUTPUT 
	, @Item_Fk AS int  
	, @CurrentAmount AS int  
	, @LastUpdatedDate AS datetime  
) AS 

BEGIN TRY 
BEGIN TRANSACTION 


	DECLARE @ErrMsg nvarchar(4000) = 'Inventory.StockCreate:', @ErrSeverity int = 16

		 INSERT INTO [Inventory].[Stock] ( 
			Item_Fk 
			, CurrentAmount 
			, LastUpdatedDate 
		 ) 
		 VALUES ( 
			 @Item_Fk 
			,  @CurrentAmount 
			,  @LastUpdatedDate 
		 ) 

		SET  @Inventory_Pk=SCOPE_IDENTITY()

COMMIT 
END TRY 
BEGIN CATCH 
		IF @@TRANCOUNT > 0 ROLLBACK 
		SELECT @ErrMsg = 
			'Message: '+ ERROR_MESSAGE() 
			+ ', Error ' + CONVERT(VARCHAR(50), ERROR_NUMBER()) 
			+ ', Severity ' + CONVERT(VARCHAR(5), ERROR_SEVERITY()) 
			+ ', State ' + CONVERT(VARCHAR(5), ERROR_STATE()) 
			+ ', Line ' + CONVERT(VARCHAR(5), ERROR_LINE()); 
		SELECT @ErrSeverity = ERROR_SEVERITY() 
		RAISERROR(@ErrMsg, @ErrSeverity, 1) 
END CATCH 

GO

SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'Inventory.StockUpdate') AND type in (N'P', N'PC')) 
	DROP PROCEDURE Inventory.StockUpdate 
GO 

CREATE PROCEDURE Inventory.StockUpdate ( 
	@Inventory_Pk AS int  = NULL  OUTPUT 
	, @Item_Fk AS int  = NULL  
	, @CurrentAmount AS int  = NULL  
	, @LastUpdatedDate AS datetime  = NULL  
) AS 

BEGIN TRY 
BEGIN TRANSACTION 


	DECLARE @ErrMsg nvarchar(4000) = 'Inventory.StockUpdate:', @ErrSeverity int = 16

		 UPDATE [Inventory].[Stock] 
	 SET 
		 Item_Fk = CASE 
	 WHEN NOT @Item_Fk IS NULL THEN @Item_Fk 
	 ELSE Item_Fk 
	 END 
	,  CurrentAmount = CASE 
	 WHEN NOT @CurrentAmount IS NULL THEN @CurrentAmount 
	 ELSE CurrentAmount 
	 END 
	,  LastUpdatedDate = CASE 
	 WHEN NOT @LastUpdatedDate IS NULL THEN @LastUpdatedDate 
	 ELSE LastUpdatedDate 
	 END 
	 WHERE Inventory_Pk = @Inventory_Pk 
	IF @@ROWCOUNT <= 0 
	BEGIN
		SET @ErrMsg += 'No Records Found Matching the Search Criteria'
		RAISERROR ( @ErrMsg, @ErrSeverity, 1 );
	END

COMMIT 
END TRY 
BEGIN CATCH 
		IF @@TRANCOUNT > 0 ROLLBACK 
		SELECT @ErrMsg = 
			'Message: '+ ERROR_MESSAGE() 
			+ ', Error ' + CONVERT(VARCHAR(50), ERROR_NUMBER()) 
			+ ', Severity ' + CONVERT(VARCHAR(5), ERROR_SEVERITY()) 
			+ ', State ' + CONVERT(VARCHAR(5), ERROR_STATE()) 
			+ ', Line ' + CONVERT(VARCHAR(5), ERROR_LINE()); 
		SELECT @ErrSeverity = ERROR_SEVERITY() 
		RAISERROR(@ErrMsg, @ErrSeverity, 1) 
END CATCH 

GO

SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'Inventory.StockDelete') AND type in (N'P', N'PC')) 
	DROP PROCEDURE Inventory.StockDelete 
GO 

CREATE PROCEDURE Inventory.StockDelete ( 
	@Inventory_Pk AS int  OUTPUT 
	, 	@delete AS BIT = NULL ) AS 

BEGIN TRY 
BEGIN TRANSACTION 


	DECLARE @ErrMsg nvarchar(4000) = 'Inventory.StockDelete:', @ErrSeverity int = 16

		 IF @delete = 1 
		 BEGIN 
	 DELETE FROM [Inventory].[Stock] WHERE ( Inventory_Pk= @Inventory_Pk ) 
		 END 
	IF @@ROWCOUNT <= 0 
	BEGIN
		SET @ErrMsg += 'No Records Found Matching the Search Criteria'
		RAISERROR ( @ErrMsg, @ErrSeverity, 1 );
	END

COMMIT 
END TRY 
BEGIN CATCH 
		IF @@TRANCOUNT > 0 ROLLBACK 
		SELECT @ErrMsg = 
			'Message: '+ ERROR_MESSAGE() 
			+ ', Error ' + CONVERT(VARCHAR(50), ERROR_NUMBER()) 
			+ ', Severity ' + CONVERT(VARCHAR(5), ERROR_SEVERITY()) 
			+ ', State ' + CONVERT(VARCHAR(5), ERROR_STATE()) 
			+ ', Line ' + CONVERT(VARCHAR(5), ERROR_LINE()); 
		SELECT @ErrSeverity = ERROR_SEVERITY() 
		RAISERROR(@ErrMsg, @ErrSeverity, 1) 
END CATCH 

GO

SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO


 

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'Orders.OrderGet') AND type in (N'P', N'PC')) 
	DROP PROCEDURE Orders.OrderGet 
GO 

CREATE PROCEDURE Orders.OrderGet ( 
	@Order_Pk AS int  = NULL  OUTPUT 
	, @Customer_Fk AS int  = NULL  
	, @ShipTo_Fk AS int  = NULL  
	, @Date AS datetime  = NULL  
	, @Complete AS varchar (1)  = NULL  
	, @CustomerNote AS varchar (2000)  = NULL  
) AS 


	DECLARE @ErrMsg nvarchar(4000) = 'Orders.OrderGet:', @ErrSeverity int = 16


	 SELECT 
			[Order].[Order_Pk] 
 			, [Order].[Customer_Fk] 
 			, [Order].[ShipTo_Fk] 
 			, [Order].[Date] 
 			, [Order].[Complete] 
 			, [Order].[CustomerNote] 
 	 FROM [Orders].[Order] 
	 WHERE 
			 ( [Order].[Order_Pk] = @Order_Pk OR @Order_Pk IS NULL ) 
 			AND  ( [Order].[Customer_Fk] = @Customer_Fk OR @Customer_Fk IS NULL ) 
 			AND  ( [Order].[ShipTo_Fk] = @ShipTo_Fk OR @ShipTo_Fk IS NULL ) 
 			AND  ( [Order].[Date] = @Date OR @Date IS NULL ) 
 			AND  ( [Order].[Complete] = @Complete OR @Complete IS NULL ) 
 			AND  ( [Order].[CustomerNote] = @CustomerNote OR @CustomerNote IS NULL ) 
 
	IF @@ROWCOUNT <= 0 
	BEGIN
		SET @ErrMsg += 'No Records Found Matching the Search Criteria'
		RAISERROR ( @ErrMsg, @ErrSeverity, 1 );
	END

SET  @Order_Pk=SCOPE_IDENTITY()

GO

SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'Orders.OrderCreate') AND type in (N'P', N'PC')) 
	DROP PROCEDURE Orders.OrderCreate 
GO 

CREATE PROCEDURE Orders.OrderCreate ( 
	@Order_Pk AS int  OUTPUT 
	, @Customer_Fk AS int  
	, @ShipTo_Fk AS int  
	, @Date AS datetime  
	, @Complete AS varchar (1)  
	, @CustomerNote AS varchar (2000)  
) AS 

BEGIN TRY 
BEGIN TRANSACTION 


	DECLARE @ErrMsg nvarchar(4000) = 'Orders.OrderCreate:', @ErrSeverity int = 16

		 INSERT INTO [Orders].[Order] ( 
			Customer_Fk 
			, ShipTo_Fk 
			, Date 
			, Complete 
			, CustomerNote 
		 ) 
		 VALUES ( 
			 @Customer_Fk 
			,  @ShipTo_Fk 
			,  @Date 
			,  @Complete 
			,  @CustomerNote 
		 ) 

		SET  @Order_Pk=SCOPE_IDENTITY()

COMMIT 
END TRY 
BEGIN CATCH 
		IF @@TRANCOUNT > 0 ROLLBACK 
		SELECT @ErrMsg = 
			'Message: '+ ERROR_MESSAGE() 
			+ ', Error ' + CONVERT(VARCHAR(50), ERROR_NUMBER()) 
			+ ', Severity ' + CONVERT(VARCHAR(5), ERROR_SEVERITY()) 
			+ ', State ' + CONVERT(VARCHAR(5), ERROR_STATE()) 
			+ ', Line ' + CONVERT(VARCHAR(5), ERROR_LINE()); 
		SELECT @ErrSeverity = ERROR_SEVERITY() 
		RAISERROR(@ErrMsg, @ErrSeverity, 1) 
END CATCH 

GO

SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'Orders.OrderUpdate') AND type in (N'P', N'PC')) 
	DROP PROCEDURE Orders.OrderUpdate 
GO 

CREATE PROCEDURE Orders.OrderUpdate ( 
	@Order_Pk AS int  = NULL  OUTPUT 
	, @Customer_Fk AS int  = NULL  
	, @ShipTo_Fk AS int  = NULL  
	, @Date AS datetime  = NULL  
	, @Complete AS varchar (1)  = NULL  
	, @CustomerNote AS varchar (2000)  = NULL  
) AS 

BEGIN TRY 
BEGIN TRANSACTION 


	DECLARE @ErrMsg nvarchar(4000) = 'Orders.OrderUpdate:', @ErrSeverity int = 16

		 UPDATE [Orders].[Order] 
	 SET 
		 Customer_Fk = CASE 
	 WHEN NOT @Customer_Fk IS NULL THEN @Customer_Fk 
	 ELSE Customer_Fk 
	 END 
	,  ShipTo_Fk = CASE 
	 WHEN NOT @ShipTo_Fk IS NULL THEN @ShipTo_Fk 
	 ELSE ShipTo_Fk 
	 END 
	,  Date = CASE 
	 WHEN NOT @Date IS NULL THEN @Date 
	 ELSE Date 
	 END 
	,  Complete = CASE 
	 WHEN NOT @Complete IS NULL THEN @Complete 
	 ELSE Complete 
	 END 
	,  CustomerNote = CASE 
	 WHEN NOT @CustomerNote IS NULL THEN @CustomerNote 
	 ELSE CustomerNote 
	 END 
	 WHERE Order_Pk = @Order_Pk 
	IF @@ROWCOUNT <= 0 
	BEGIN
		SET @ErrMsg += 'No Records Found Matching the Search Criteria'
		RAISERROR ( @ErrMsg, @ErrSeverity, 1 );
	END

COMMIT 
END TRY 
BEGIN CATCH 
		IF @@TRANCOUNT > 0 ROLLBACK 
		SELECT @ErrMsg = 
			'Message: '+ ERROR_MESSAGE() 
			+ ', Error ' + CONVERT(VARCHAR(50), ERROR_NUMBER()) 
			+ ', Severity ' + CONVERT(VARCHAR(5), ERROR_SEVERITY()) 
			+ ', State ' + CONVERT(VARCHAR(5), ERROR_STATE()) 
			+ ', Line ' + CONVERT(VARCHAR(5), ERROR_LINE()); 
		SELECT @ErrSeverity = ERROR_SEVERITY() 
		RAISERROR(@ErrMsg, @ErrSeverity, 1) 
END CATCH 

GO

SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'Orders.OrderDelete') AND type in (N'P', N'PC')) 
	DROP PROCEDURE Orders.OrderDelete 
GO 

CREATE PROCEDURE Orders.OrderDelete ( 
	@Order_Pk AS int  OUTPUT 
	, 	@delete AS BIT = NULL ) AS 

BEGIN TRY 
BEGIN TRANSACTION 


	DECLARE @ErrMsg nvarchar(4000) = 'Orders.OrderDelete:', @ErrSeverity int = 16

		 IF @delete = 1 
		 BEGIN 
	 DELETE FROM [Orders].[Order] WHERE ( Order_Pk= @Order_Pk ) 
		 END 
	IF @@ROWCOUNT <= 0 
	BEGIN
		SET @ErrMsg += 'No Records Found Matching the Search Criteria'
		RAISERROR ( @ErrMsg, @ErrSeverity, 1 );
	END

COMMIT 
END TRY 
BEGIN CATCH 
		IF @@TRANCOUNT > 0 ROLLBACK 
		SELECT @ErrMsg = 
			'Message: '+ ERROR_MESSAGE() 
			+ ', Error ' + CONVERT(VARCHAR(50), ERROR_NUMBER()) 
			+ ', Severity ' + CONVERT(VARCHAR(5), ERROR_SEVERITY()) 
			+ ', State ' + CONVERT(VARCHAR(5), ERROR_STATE()) 
			+ ', Line ' + CONVERT(VARCHAR(5), ERROR_LINE()); 
		SELECT @ErrSeverity = ERROR_SEVERITY() 
		RAISERROR(@ErrMsg, @ErrSeverity, 1) 
END CATCH 

GO

SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO


 

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'Orders.OrderDetailGet') AND type in (N'P', N'PC')) 
	DROP PROCEDURE Orders.OrderDetailGet 
GO 

CREATE PROCEDURE Orders.OrderDetailGet ( 
	@OrderDetail_Pk AS int  = NULL  OUTPUT 
	, @Order_Fk AS int  = NULL  
	, @Customer_Fk AS int  = NULL  
	, @Item_Fk AS int  = NULL  
	, @Quantity AS int  = NULL  
	, @Amount AS money  = NULL  
	, @DetailNo AS int  = NULL  
	, @Complete AS varchar (1)  = NULL  
) AS 


	DECLARE @ErrMsg nvarchar(4000) = 'Orders.OrderDetailGet:', @ErrSeverity int = 16


	 SELECT 
			[OrderDetail].[OrderDetail_Pk] 
 			, [OrderDetail].[Order_Fk] 
 			, [OrderDetail].[Customer_Fk] 
 			, [OrderDetail].[Item_Fk] 
 			, [OrderDetail].[Quantity] 
 			, [OrderDetail].[Amount] 
 			, [OrderDetail].[DetailNo] 
 			, [OrderDetail].[Complete] 
 	 FROM [Orders].[OrderDetail] 
	 WHERE 
			 ( [OrderDetail].[OrderDetail_Pk] = @OrderDetail_Pk OR @OrderDetail_Pk IS NULL ) 
 			AND  ( [OrderDetail].[Order_Fk] = @Order_Fk OR @Order_Fk IS NULL ) 
 			AND  ( [OrderDetail].[Customer_Fk] = @Customer_Fk OR @Customer_Fk IS NULL ) 
 			AND  ( [OrderDetail].[Item_Fk] = @Item_Fk OR @Item_Fk IS NULL ) 
 			AND  ( [OrderDetail].[Quantity] = @Quantity OR @Quantity IS NULL ) 
 			AND  ( [OrderDetail].[Amount] = @Amount OR @Amount IS NULL ) 
 			AND  ( [OrderDetail].[DetailNo] = @DetailNo OR @DetailNo IS NULL ) 
 			AND  ( [OrderDetail].[Complete] = @Complete OR @Complete IS NULL ) 
 
	IF @@ROWCOUNT <= 0 
	BEGIN
		SET @ErrMsg += 'No Records Found Matching the Search Criteria'
		RAISERROR ( @ErrMsg, @ErrSeverity, 1 );
	END

SET  @OrderDetail_Pk=SCOPE_IDENTITY()

GO

SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'Orders.OrderDetailCreate') AND type in (N'P', N'PC')) 
	DROP PROCEDURE Orders.OrderDetailCreate 
GO 

CREATE PROCEDURE Orders.OrderDetailCreate ( 
	@OrderDetail_Pk AS int  OUTPUT 
	, @Order_Fk AS int  
	, @Customer_Fk AS int  
	, @Item_Fk AS int  
	, @Quantity AS int  
	, @Amount AS money  
	, @DetailNo AS int  
	, @Complete AS varchar (1)  
) AS 

BEGIN TRY 
BEGIN TRANSACTION 


	DECLARE @ErrMsg nvarchar(4000) = 'Orders.OrderDetailCreate:', @ErrSeverity int = 16

		 INSERT INTO [Orders].[OrderDetail] ( 
			Order_Fk 
			, Customer_Fk 
			, Item_Fk 
			, Quantity 
			, Amount 
			, DetailNo 
			, Complete 
		 ) 
		 VALUES ( 
			 @Order_Fk 
			,  @Customer_Fk 
			,  @Item_Fk 
			,  @Quantity 
			,  @Amount 
			,  @DetailNo 
			,  @Complete 
		 ) 

		SET  @OrderDetail_Pk=SCOPE_IDENTITY()

COMMIT 
END TRY 
BEGIN CATCH 
		IF @@TRANCOUNT > 0 ROLLBACK 
		SELECT @ErrMsg = 
			'Message: '+ ERROR_MESSAGE() 
			+ ', Error ' + CONVERT(VARCHAR(50), ERROR_NUMBER()) 
			+ ', Severity ' + CONVERT(VARCHAR(5), ERROR_SEVERITY()) 
			+ ', State ' + CONVERT(VARCHAR(5), ERROR_STATE()) 
			+ ', Line ' + CONVERT(VARCHAR(5), ERROR_LINE()); 
		SELECT @ErrSeverity = ERROR_SEVERITY() 
		RAISERROR(@ErrMsg, @ErrSeverity, 1) 
END CATCH 

GO

SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'Orders.OrderDetailUpdate') AND type in (N'P', N'PC')) 
	DROP PROCEDURE Orders.OrderDetailUpdate 
GO 

CREATE PROCEDURE Orders.OrderDetailUpdate ( 
	@OrderDetail_Pk AS int  = NULL  OUTPUT 
	, @Order_Fk AS int  = NULL  
	, @Customer_Fk AS int  = NULL  
	, @Item_Fk AS int  = NULL  
	, @Quantity AS int  = NULL  
	, @Amount AS money  = NULL  
	, @DetailNo AS int  = NULL  
	, @Complete AS varchar (1)  = NULL  
) AS 

BEGIN TRY 
BEGIN TRANSACTION 


	DECLARE @ErrMsg nvarchar(4000) = 'Orders.OrderDetailUpdate:', @ErrSeverity int = 16

		 UPDATE [Orders].[OrderDetail] 
	 SET 
		 Order_Fk = CASE 
	 WHEN NOT @Order_Fk IS NULL THEN @Order_Fk 
	 ELSE Order_Fk 
	 END 
	,  Customer_Fk = CASE 
	 WHEN NOT @Customer_Fk IS NULL THEN @Customer_Fk 
	 ELSE Customer_Fk 
	 END 
	,  Item_Fk = CASE 
	 WHEN NOT @Item_Fk IS NULL THEN @Item_Fk 
	 ELSE Item_Fk 
	 END 
	,  Quantity = CASE 
	 WHEN NOT @Quantity IS NULL THEN @Quantity 
	 ELSE Quantity 
	 END 
	,  Amount = CASE 
	 WHEN NOT @Amount IS NULL THEN @Amount 
	 ELSE Amount 
	 END 
	,  DetailNo = CASE 
	 WHEN NOT @DetailNo IS NULL THEN @DetailNo 
	 ELSE DetailNo 
	 END 
	,  Complete = CASE 
	 WHEN NOT @Complete IS NULL THEN @Complete 
	 ELSE Complete 
	 END 
	 WHERE OrderDetail_Pk = @OrderDetail_Pk 
	IF @@ROWCOUNT <= 0 
	BEGIN
		SET @ErrMsg += 'No Records Found Matching the Search Criteria'
		RAISERROR ( @ErrMsg, @ErrSeverity, 1 );
	END

COMMIT 
END TRY 
BEGIN CATCH 
		IF @@TRANCOUNT > 0 ROLLBACK 
		SELECT @ErrMsg = 
			'Message: '+ ERROR_MESSAGE() 
			+ ', Error ' + CONVERT(VARCHAR(50), ERROR_NUMBER()) 
			+ ', Severity ' + CONVERT(VARCHAR(5), ERROR_SEVERITY()) 
			+ ', State ' + CONVERT(VARCHAR(5), ERROR_STATE()) 
			+ ', Line ' + CONVERT(VARCHAR(5), ERROR_LINE()); 
		SELECT @ErrSeverity = ERROR_SEVERITY() 
		RAISERROR(@ErrMsg, @ErrSeverity, 1) 
END CATCH 

GO

SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'Orders.OrderDetailDelete') AND type in (N'P', N'PC')) 
	DROP PROCEDURE Orders.OrderDetailDelete 
GO 

CREATE PROCEDURE Orders.OrderDetailDelete ( 
	@OrderDetail_Pk AS int  OUTPUT 
	, 	@delete AS BIT = NULL ) AS 

BEGIN TRY 
BEGIN TRANSACTION 


	DECLARE @ErrMsg nvarchar(4000) = 'Orders.OrderDetailDelete:', @ErrSeverity int = 16

		 IF @delete = 1 
		 BEGIN 
	 DELETE FROM [Orders].[OrderDetail] WHERE ( OrderDetail_Pk= @OrderDetail_Pk ) 
		 END 
	IF @@ROWCOUNT <= 0 
	BEGIN
		SET @ErrMsg += 'No Records Found Matching the Search Criteria'
		RAISERROR ( @ErrMsg, @ErrSeverity, 1 );
	END

COMMIT 
END TRY 
BEGIN CATCH 
		IF @@TRANCOUNT > 0 ROLLBACK 
		SELECT @ErrMsg = 
			'Message: '+ ERROR_MESSAGE() 
			+ ', Error ' + CONVERT(VARCHAR(50), ERROR_NUMBER()) 
			+ ', Severity ' + CONVERT(VARCHAR(5), ERROR_SEVERITY()) 
			+ ', State ' + CONVERT(VARCHAR(5), ERROR_STATE()) 
			+ ', Line ' + CONVERT(VARCHAR(5), ERROR_LINE()); 
		SELECT @ErrSeverity = ERROR_SEVERITY() 
		RAISERROR(@ErrMsg, @ErrSeverity, 1) 
END CATCH 

GO

SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO


 

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'Orders.PaymentGet') AND type in (N'P', N'PC')) 
	DROP PROCEDURE Orders.PaymentGet 
GO 

CREATE PROCEDURE Orders.PaymentGet ( 
	@Payment_PK AS int  = NULL  OUTPUT 
	, @Order_Fk AS int  = NULL  
	, @Customer_Fk AS int  = NULL  
	, @Amount AS money  = NULL  
	, @TransactionType AS varchar (50)  = NULL  
	, @Method_Fk AS int  = NULL  
	, @CCNumber AS varchar (50)  = NULL  
	, @CCName AS varchar (255)  = NULL  
	, @CCExpireation AS varchar (50)  = NULL  
	, @SecurityNo AS varchar (8)  = NULL  
	, @Online AS bit  = NULL  
) AS 


	DECLARE @ErrMsg nvarchar(4000) = 'Orders.PaymentGet:', @ErrSeverity int = 16


	 SELECT 
			[Payment].[Payment_PK] 
 			, [Payment].[Order_Fk] 
 			, [Payment].[Customer_Fk] 
 			, [Payment].[Amount] 
 			, [Payment].[TransactionType] 
 			, [Payment].[Method_Fk] 
 			, [Payment].[CCNumber] 
 			, [Payment].[CCName] 
 			, [Payment].[CCExpireation] 
 			, [Payment].[SecurityNo] 
 			, [Payment].[Online] 
 	 FROM [Orders].[Payment] 
	 WHERE 
			 ( [Payment].[Payment_PK] = @Payment_PK OR @Payment_PK IS NULL ) 
 			AND  ( [Payment].[Order_Fk] = @Order_Fk OR @Order_Fk IS NULL ) 
 			AND  ( [Payment].[Customer_Fk] = @Customer_Fk OR @Customer_Fk IS NULL ) 
 			AND  ( [Payment].[Amount] = @Amount OR @Amount IS NULL ) 
 			AND  ( [Payment].[TransactionType] = @TransactionType OR @TransactionType IS NULL ) 
 			AND  ( [Payment].[Method_Fk] = @Method_Fk OR @Method_Fk IS NULL ) 
 			AND  ( [Payment].[CCNumber] = @CCNumber OR @CCNumber IS NULL ) 
 			AND  ( [Payment].[CCName] = @CCName OR @CCName IS NULL ) 
 			AND  ( [Payment].[CCExpireation] = @CCExpireation OR @CCExpireation IS NULL ) 
 			AND  ( [Payment].[SecurityNo] = @SecurityNo OR @SecurityNo IS NULL ) 
 			AND  ( [Payment].[Online] = @Online OR @Online IS NULL ) 
 
	IF @@ROWCOUNT <= 0 
	BEGIN
		SET @ErrMsg += 'No Records Found Matching the Search Criteria'
		RAISERROR ( @ErrMsg, @ErrSeverity, 1 );
	END

SET  @Payment_PK=SCOPE_IDENTITY()

GO

SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'Orders.PaymentCreate') AND type in (N'P', N'PC')) 
	DROP PROCEDURE Orders.PaymentCreate 
GO 

CREATE PROCEDURE Orders.PaymentCreate ( 
	@Payment_PK AS int  OUTPUT 
	, @Order_Fk AS int  
	, @Customer_Fk AS int  
	, @Amount AS money  
	, @TransactionType AS varchar (50)  
	, @Method_Fk AS int  
	, @CCNumber AS varchar (50)  
	, @CCName AS varchar (255)  
	, @CCExpireation AS varchar (50)  
	, @SecurityNo AS varchar (8)  
	, @Online AS bit  
) AS 

BEGIN TRY 
BEGIN TRANSACTION 


	DECLARE @ErrMsg nvarchar(4000) = 'Orders.PaymentCreate:', @ErrSeverity int = 16

		 INSERT INTO [Orders].[Payment] ( 
			Order_Fk 
			, Customer_Fk 
			, Amount 
			, TransactionType 
			, Method_Fk 
			, CCNumber 
			, CCName 
			, CCExpireation 
			, SecurityNo 
			, Online 
		 ) 
		 VALUES ( 
			 @Order_Fk 
			,  @Customer_Fk 
			,  @Amount 
			,  @TransactionType 
			,  @Method_Fk 
			,  @CCNumber 
			,  @CCName 
			,  @CCExpireation 
			,  @SecurityNo 
			,  @Online 
		 ) 

		SET  @Payment_PK=SCOPE_IDENTITY()

COMMIT 
END TRY 
BEGIN CATCH 
		IF @@TRANCOUNT > 0 ROLLBACK 
		SELECT @ErrMsg = 
			'Message: '+ ERROR_MESSAGE() 
			+ ', Error ' + CONVERT(VARCHAR(50), ERROR_NUMBER()) 
			+ ', Severity ' + CONVERT(VARCHAR(5), ERROR_SEVERITY()) 
			+ ', State ' + CONVERT(VARCHAR(5), ERROR_STATE()) 
			+ ', Line ' + CONVERT(VARCHAR(5), ERROR_LINE()); 
		SELECT @ErrSeverity = ERROR_SEVERITY() 
		RAISERROR(@ErrMsg, @ErrSeverity, 1) 
END CATCH 

GO

SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'Orders.PaymentUpdate') AND type in (N'P', N'PC')) 
	DROP PROCEDURE Orders.PaymentUpdate 
GO 

CREATE PROCEDURE Orders.PaymentUpdate ( 
	@Payment_PK AS int  = NULL  OUTPUT 
	, @Order_Fk AS int  = NULL  
	, @Customer_Fk AS int  = NULL  
	, @Amount AS money  = NULL  
	, @TransactionType AS varchar (50)  = NULL  
	, @Method_Fk AS int  = NULL  
	, @CCNumber AS varchar (50)  = NULL  
	, @CCName AS varchar (255)  = NULL  
	, @CCExpireation AS varchar (50)  = NULL  
	, @SecurityNo AS varchar (8)  = NULL  
	, @Online AS bit  = NULL  
) AS 

BEGIN TRY 
BEGIN TRANSACTION 


	DECLARE @ErrMsg nvarchar(4000) = 'Orders.PaymentUpdate:', @ErrSeverity int = 16

		 UPDATE [Orders].[Payment] 
	 SET 
		 Order_Fk = CASE 
	 WHEN NOT @Order_Fk IS NULL THEN @Order_Fk 
	 ELSE Order_Fk 
	 END 
	,  Customer_Fk = CASE 
	 WHEN NOT @Customer_Fk IS NULL THEN @Customer_Fk 
	 ELSE Customer_Fk 
	 END 
	,  Amount = CASE 
	 WHEN NOT @Amount IS NULL THEN @Amount 
	 ELSE Amount 
	 END 
	,  TransactionType = CASE 
	 WHEN NOT @TransactionType IS NULL THEN @TransactionType 
	 ELSE TransactionType 
	 END 
	,  Method_Fk = CASE 
	 WHEN NOT @Method_Fk IS NULL THEN @Method_Fk 
	 ELSE Method_Fk 
	 END 
	,  CCNumber = CASE 
	 WHEN NOT @CCNumber IS NULL THEN @CCNumber 
	 ELSE CCNumber 
	 END 
	,  CCName = CASE 
	 WHEN NOT @CCName IS NULL THEN @CCName 
	 ELSE CCName 
	 END 
	,  CCExpireation = CASE 
	 WHEN NOT @CCExpireation IS NULL THEN @CCExpireation 
	 ELSE CCExpireation 
	 END 
	,  SecurityNo = CASE 
	 WHEN NOT @SecurityNo IS NULL THEN @SecurityNo 
	 ELSE SecurityNo 
	 END 
	,  Online = CASE 
	 WHEN NOT @Online IS NULL THEN @Online 
	 ELSE Online 
	 END 
	 WHERE Payment_PK = @Payment_PK 
	IF @@ROWCOUNT <= 0 
	BEGIN
		SET @ErrMsg += 'No Records Found Matching the Search Criteria'
		RAISERROR ( @ErrMsg, @ErrSeverity, 1 );
	END

COMMIT 
END TRY 
BEGIN CATCH 
		IF @@TRANCOUNT > 0 ROLLBACK 
		SELECT @ErrMsg = 
			'Message: '+ ERROR_MESSAGE() 
			+ ', Error ' + CONVERT(VARCHAR(50), ERROR_NUMBER()) 
			+ ', Severity ' + CONVERT(VARCHAR(5), ERROR_SEVERITY()) 
			+ ', State ' + CONVERT(VARCHAR(5), ERROR_STATE()) 
			+ ', Line ' + CONVERT(VARCHAR(5), ERROR_LINE()); 
		SELECT @ErrSeverity = ERROR_SEVERITY() 
		RAISERROR(@ErrMsg, @ErrSeverity, 1) 
END CATCH 

GO

SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'Orders.PaymentDelete') AND type in (N'P', N'PC')) 
	DROP PROCEDURE Orders.PaymentDelete 
GO 

CREATE PROCEDURE Orders.PaymentDelete ( 
	@Payment_PK AS int  OUTPUT 
	, 	@delete AS BIT = NULL ) AS 

BEGIN TRY 
BEGIN TRANSACTION 


	DECLARE @ErrMsg nvarchar(4000) = 'Orders.PaymentDelete:', @ErrSeverity int = 16

		 IF @delete = 1 
		 BEGIN 
	 DELETE FROM [Orders].[Payment] WHERE ( Payment_PK= @Payment_PK ) 
		 END 
	IF @@ROWCOUNT <= 0 
	BEGIN
		SET @ErrMsg += 'No Records Found Matching the Search Criteria'
		RAISERROR ( @ErrMsg, @ErrSeverity, 1 );
	END

COMMIT 
END TRY 
BEGIN CATCH 
		IF @@TRANCOUNT > 0 ROLLBACK 
		SELECT @ErrMsg = 
			'Message: '+ ERROR_MESSAGE() 
			+ ', Error ' + CONVERT(VARCHAR(50), ERROR_NUMBER()) 
			+ ', Severity ' + CONVERT(VARCHAR(5), ERROR_SEVERITY()) 
			+ ', State ' + CONVERT(VARCHAR(5), ERROR_STATE()) 
			+ ', Line ' + CONVERT(VARCHAR(5), ERROR_LINE()); 
		SELECT @ErrSeverity = ERROR_SEVERITY() 
		RAISERROR(@ErrMsg, @ErrSeverity, 1) 
END CATCH 

GO

SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO


 

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'Orders.ShippedGet') AND type in (N'P', N'PC')) 
	DROP PROCEDURE Orders.ShippedGet 
GO 

CREATE PROCEDURE Orders.ShippedGet ( 
	@Shipping_Pk AS int  = NULL  OUTPUT 
	, @Customer_Fk AS int  = NULL  
	, @Order_Fk AS int  = NULL  
	, @ShipTo_Fk AS int  = NULL  
	, @CompleteDate AS datetime  = NULL  
	, @Complete AS varchar (1)  = NULL  
) AS 


	DECLARE @ErrMsg nvarchar(4000) = 'Orders.ShippedGet:', @ErrSeverity int = 16


	 SELECT 
			[Shipped].[Shipping_Pk] 
 			, [Shipped].[Customer_Fk] 
 			, [Shipped].[Order_Fk] 
 			, [Shipped].[ShipTo_Fk] 
 			, [Shipped].[CompleteDate] 
 			, [Shipped].[Complete] 
 	 FROM [Orders].[Shipped] 
	 WHERE 
			 ( [Shipped].[Shipping_Pk] = @Shipping_Pk OR @Shipping_Pk IS NULL ) 
 			AND  ( [Shipped].[Customer_Fk] = @Customer_Fk OR @Customer_Fk IS NULL ) 
 			AND  ( [Shipped].[Order_Fk] = @Order_Fk OR @Order_Fk IS NULL ) 
 			AND  ( [Shipped].[ShipTo_Fk] = @ShipTo_Fk OR @ShipTo_Fk IS NULL ) 
 			AND  ( [Shipped].[CompleteDate] = @CompleteDate OR @CompleteDate IS NULL ) 
 			AND  ( [Shipped].[Complete] = @Complete OR @Complete IS NULL ) 
 
	IF @@ROWCOUNT <= 0 
	BEGIN
		SET @ErrMsg += 'No Records Found Matching the Search Criteria'
		RAISERROR ( @ErrMsg, @ErrSeverity, 1 );
	END

SET  @Shipping_Pk=SCOPE_IDENTITY()

GO

SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'Orders.ShippedCreate') AND type in (N'P', N'PC')) 
	DROP PROCEDURE Orders.ShippedCreate 
GO 

CREATE PROCEDURE Orders.ShippedCreate ( 
	@Shipping_Pk AS int  OUTPUT 
	, @Customer_Fk AS int  
	, @Order_Fk AS int  
	, @ShipTo_Fk AS int  
	, @CompleteDate AS datetime  
	, @Complete AS varchar (1)  
) AS 

BEGIN TRY 
BEGIN TRANSACTION 


	DECLARE @ErrMsg nvarchar(4000) = 'Orders.ShippedCreate:', @ErrSeverity int = 16

		 INSERT INTO [Orders].[Shipped] ( 
			Customer_Fk 
			, Order_Fk 
			, ShipTo_Fk 
			, CompleteDate 
			, Complete 
		 ) 
		 VALUES ( 
			 @Customer_Fk 
			,  @Order_Fk 
			,  @ShipTo_Fk 
			,  @CompleteDate 
			,  @Complete 
		 ) 

		SET  @Shipping_Pk=SCOPE_IDENTITY()

COMMIT 
END TRY 
BEGIN CATCH 
		IF @@TRANCOUNT > 0 ROLLBACK 
		SELECT @ErrMsg = 
			'Message: '+ ERROR_MESSAGE() 
			+ ', Error ' + CONVERT(VARCHAR(50), ERROR_NUMBER()) 
			+ ', Severity ' + CONVERT(VARCHAR(5), ERROR_SEVERITY()) 
			+ ', State ' + CONVERT(VARCHAR(5), ERROR_STATE()) 
			+ ', Line ' + CONVERT(VARCHAR(5), ERROR_LINE()); 
		SELECT @ErrSeverity = ERROR_SEVERITY() 
		RAISERROR(@ErrMsg, @ErrSeverity, 1) 
END CATCH 

GO

SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'Orders.ShippedUpdate') AND type in (N'P', N'PC')) 
	DROP PROCEDURE Orders.ShippedUpdate 
GO 

CREATE PROCEDURE Orders.ShippedUpdate ( 
	@Shipping_Pk AS int  = NULL  OUTPUT 
	, @Customer_Fk AS int  = NULL  
	, @Order_Fk AS int  = NULL  
	, @ShipTo_Fk AS int  = NULL  
	, @CompleteDate AS datetime  = NULL  
	, @Complete AS varchar (1)  = NULL  
) AS 

BEGIN TRY 
BEGIN TRANSACTION 


	DECLARE @ErrMsg nvarchar(4000) = 'Orders.ShippedUpdate:', @ErrSeverity int = 16

		 UPDATE [Orders].[Shipped] 
	 SET 
		 Customer_Fk = CASE 
	 WHEN NOT @Customer_Fk IS NULL THEN @Customer_Fk 
	 ELSE Customer_Fk 
	 END 
	,  Order_Fk = CASE 
	 WHEN NOT @Order_Fk IS NULL THEN @Order_Fk 
	 ELSE Order_Fk 
	 END 
	,  ShipTo_Fk = CASE 
	 WHEN NOT @ShipTo_Fk IS NULL THEN @ShipTo_Fk 
	 ELSE ShipTo_Fk 
	 END 
	,  CompleteDate = CASE 
	 WHEN NOT @CompleteDate IS NULL THEN @CompleteDate 
	 ELSE CompleteDate 
	 END 
	,  Complete = CASE 
	 WHEN NOT @Complete IS NULL THEN @Complete 
	 ELSE Complete 
	 END 
	 WHERE Shipping_Pk = @Shipping_Pk 
	IF @@ROWCOUNT <= 0 
	BEGIN
		SET @ErrMsg += 'No Records Found Matching the Search Criteria'
		RAISERROR ( @ErrMsg, @ErrSeverity, 1 );
	END

COMMIT 
END TRY 
BEGIN CATCH 
		IF @@TRANCOUNT > 0 ROLLBACK 
		SELECT @ErrMsg = 
			'Message: '+ ERROR_MESSAGE() 
			+ ', Error ' + CONVERT(VARCHAR(50), ERROR_NUMBER()) 
			+ ', Severity ' + CONVERT(VARCHAR(5), ERROR_SEVERITY()) 
			+ ', State ' + CONVERT(VARCHAR(5), ERROR_STATE()) 
			+ ', Line ' + CONVERT(VARCHAR(5), ERROR_LINE()); 
		SELECT @ErrSeverity = ERROR_SEVERITY() 
		RAISERROR(@ErrMsg, @ErrSeverity, 1) 
END CATCH 

GO

SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'Orders.ShippedDelete') AND type in (N'P', N'PC')) 
	DROP PROCEDURE Orders.ShippedDelete 
GO 

CREATE PROCEDURE Orders.ShippedDelete ( 
	@Shipping_Pk AS int  OUTPUT 
	, 	@delete AS BIT = NULL ) AS 

BEGIN TRY 
BEGIN TRANSACTION 


	DECLARE @ErrMsg nvarchar(4000) = 'Orders.ShippedDelete:', @ErrSeverity int = 16

		 IF @delete = 1 
		 BEGIN 
	 DELETE FROM [Orders].[Shipped] WHERE ( Shipping_Pk= @Shipping_Pk ) 
		 END 
	IF @@ROWCOUNT <= 0 
	BEGIN
		SET @ErrMsg += 'No Records Found Matching the Search Criteria'
		RAISERROR ( @ErrMsg, @ErrSeverity, 1 );
	END

COMMIT 
END TRY 
BEGIN CATCH 
		IF @@TRANCOUNT > 0 ROLLBACK 
		SELECT @ErrMsg = 
			'Message: '+ ERROR_MESSAGE() 
			+ ', Error ' + CONVERT(VARCHAR(50), ERROR_NUMBER()) 
			+ ', Severity ' + CONVERT(VARCHAR(5), ERROR_SEVERITY()) 
			+ ', State ' + CONVERT(VARCHAR(5), ERROR_STATE()) 
			+ ', Line ' + CONVERT(VARCHAR(5), ERROR_LINE()); 
		SELECT @ErrSeverity = ERROR_SEVERITY() 
		RAISERROR(@ErrMsg, @ErrSeverity, 1) 
END CATCH 

GO

SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO


 

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'Orders.ShipToGet') AND type in (N'P', N'PC')) 
	DROP PROCEDURE Orders.ShipToGet 
GO 

CREATE PROCEDURE Orders.ShipToGet ( 
	@ShipTo_Pk AS int  = NULL  OUTPUT 
	, @Customer_Fk AS int  = NULL  
	, @LastName AS varchar (50)  = NULL  
	, @FirstName AS varchar (50)  = NULL  
	, @Address AS varchar (255)  = NULL  
	, @Address2 AS varchar (255)  = NULL  
	, @City AS varchar (50)  = NULL  
	, @State AS varchar (50)  = NULL  
	, @Zip AS varchar (15)  = NULL  
) AS 


	DECLARE @ErrMsg nvarchar(4000) = 'Orders.ShipToGet:', @ErrSeverity int = 16


	 SELECT 
			[ShipTo].[ShipTo_Pk] 
 			, [ShipTo].[Customer_Fk] 
 			, [ShipTo].[LastName] 
 			, [ShipTo].[FirstName] 
 			, [ShipTo].[Address] 
 			, [ShipTo].[Address2] 
 			, [ShipTo].[City] 
 			, [ShipTo].[State] 
 			, [ShipTo].[Zip] 
 	 FROM [Orders].[ShipTo] 
	 WHERE 
			 ( [ShipTo].[ShipTo_Pk] = @ShipTo_Pk OR @ShipTo_Pk IS NULL ) 
 			AND  ( [ShipTo].[Customer_Fk] = @Customer_Fk OR @Customer_Fk IS NULL ) 
 			AND  ( [ShipTo].[LastName] = @LastName OR @LastName IS NULL ) 
 			AND  ( [ShipTo].[FirstName] = @FirstName OR @FirstName IS NULL ) 
 			AND  ( [ShipTo].[Address] = @Address OR @Address IS NULL ) 
 			AND  ( [ShipTo].[Address2] = @Address2 OR @Address2 IS NULL ) 
 			AND  ( [ShipTo].[City] = @City OR @City IS NULL ) 
 			AND  ( [ShipTo].[State] = @State OR @State IS NULL ) 
 			AND  ( [ShipTo].[Zip] = @Zip OR @Zip IS NULL ) 
 
	IF @@ROWCOUNT <= 0 
	BEGIN
		SET @ErrMsg += 'No Records Found Matching the Search Criteria'
		RAISERROR ( @ErrMsg, @ErrSeverity, 1 );
	END

SET  @ShipTo_Pk=SCOPE_IDENTITY()

GO

SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'Orders.ShipToCreate') AND type in (N'P', N'PC')) 
	DROP PROCEDURE Orders.ShipToCreate 
GO 

CREATE PROCEDURE Orders.ShipToCreate ( 
	@ShipTo_Pk AS int  OUTPUT 
	, @Customer_Fk AS int  
	, @LastName AS varchar (50)  
	, @FirstName AS varchar (50)  
	, @Address AS varchar (255)  
	, @Address2 AS varchar (255)  
	, @City AS varchar (50)  
	, @State AS varchar (50)  
	, @Zip AS varchar (15)  
) AS 

BEGIN TRY 
BEGIN TRANSACTION 


	DECLARE @ErrMsg nvarchar(4000) = 'Orders.ShipToCreate:', @ErrSeverity int = 16

		 INSERT INTO [Orders].[ShipTo] ( 
			Customer_Fk 
			, LastName 
			, FirstName 
			, Address 
			, Address2 
			, City 
			, State 
			, Zip 
		 ) 
		 VALUES ( 
			 @Customer_Fk 
			,  @LastName 
			,  @FirstName 
			,  @Address 
			,  @Address2 
			,  @City 
			,  @State 
			,  @Zip 
		 ) 

		SET  @ShipTo_Pk=SCOPE_IDENTITY()

COMMIT 
END TRY 
BEGIN CATCH 
		IF @@TRANCOUNT > 0 ROLLBACK 
		SELECT @ErrMsg = 
			'Message: '+ ERROR_MESSAGE() 
			+ ', Error ' + CONVERT(VARCHAR(50), ERROR_NUMBER()) 
			+ ', Severity ' + CONVERT(VARCHAR(5), ERROR_SEVERITY()) 
			+ ', State ' + CONVERT(VARCHAR(5), ERROR_STATE()) 
			+ ', Line ' + CONVERT(VARCHAR(5), ERROR_LINE()); 
		SELECT @ErrSeverity = ERROR_SEVERITY() 
		RAISERROR(@ErrMsg, @ErrSeverity, 1) 
END CATCH 

GO

SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'Orders.ShipToUpdate') AND type in (N'P', N'PC')) 
	DROP PROCEDURE Orders.ShipToUpdate 
GO 

CREATE PROCEDURE Orders.ShipToUpdate ( 
	@ShipTo_Pk AS int  = NULL  OUTPUT 
	, @Customer_Fk AS int  = NULL  
	, @LastName AS varchar (50)  = NULL  
	, @FirstName AS varchar (50)  = NULL  
	, @Address AS varchar (255)  = NULL  
	, @Address2 AS varchar (255)  = NULL  
	, @City AS varchar (50)  = NULL  
	, @State AS varchar (50)  = NULL  
	, @Zip AS varchar (15)  = NULL  
) AS 

BEGIN TRY 
BEGIN TRANSACTION 


	DECLARE @ErrMsg nvarchar(4000) = 'Orders.ShipToUpdate:', @ErrSeverity int = 16

		 UPDATE [Orders].[ShipTo] 
	 SET 
		 Customer_Fk = CASE 
	 WHEN NOT @Customer_Fk IS NULL THEN @Customer_Fk 
	 ELSE Customer_Fk 
	 END 
	,  LastName = CASE 
	 WHEN NOT @LastName IS NULL THEN @LastName 
	 ELSE LastName 
	 END 
	,  FirstName = CASE 
	 WHEN NOT @FirstName IS NULL THEN @FirstName 
	 ELSE FirstName 
	 END 
	,  Address = CASE 
	 WHEN NOT @Address IS NULL THEN @Address 
	 ELSE Address 
	 END 
	,  Address2 = CASE 
	 WHEN NOT @Address2 IS NULL THEN @Address2 
	 ELSE Address2 
	 END 
	,  City = CASE 
	 WHEN NOT @City IS NULL THEN @City 
	 ELSE City 
	 END 
	,  State = CASE 
	 WHEN NOT @State IS NULL THEN @State 
	 ELSE State 
	 END 
	,  Zip = CASE 
	 WHEN NOT @Zip IS NULL THEN @Zip 
	 ELSE Zip 
	 END 
	 WHERE ShipTo_Pk = @ShipTo_Pk 
	IF @@ROWCOUNT <= 0 
	BEGIN
		SET @ErrMsg += 'No Records Found Matching the Search Criteria'
		RAISERROR ( @ErrMsg, @ErrSeverity, 1 );
	END

COMMIT 
END TRY 
BEGIN CATCH 
		IF @@TRANCOUNT > 0 ROLLBACK 
		SELECT @ErrMsg = 
			'Message: '+ ERROR_MESSAGE() 
			+ ', Error ' + CONVERT(VARCHAR(50), ERROR_NUMBER()) 
			+ ', Severity ' + CONVERT(VARCHAR(5), ERROR_SEVERITY()) 
			+ ', State ' + CONVERT(VARCHAR(5), ERROR_STATE()) 
			+ ', Line ' + CONVERT(VARCHAR(5), ERROR_LINE()); 
		SELECT @ErrSeverity = ERROR_SEVERITY() 
		RAISERROR(@ErrMsg, @ErrSeverity, 1) 
END CATCH 

GO

SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'Orders.ShipToDelete') AND type in (N'P', N'PC')) 
	DROP PROCEDURE Orders.ShipToDelete 
GO 

CREATE PROCEDURE Orders.ShipToDelete ( 
	@ShipTo_Pk AS int  OUTPUT 
	, 	@delete AS BIT = NULL ) AS 

BEGIN TRY 
BEGIN TRANSACTION 


	DECLARE @ErrMsg nvarchar(4000) = 'Orders.ShipToDelete:', @ErrSeverity int = 16

		 IF @delete = 1 
		 BEGIN 
	 DELETE FROM [Orders].[ShipTo] WHERE ( ShipTo_Pk= @ShipTo_Pk ) 
		 END 
	IF @@ROWCOUNT <= 0 
	BEGIN
		SET @ErrMsg += 'No Records Found Matching the Search Criteria'
		RAISERROR ( @ErrMsg, @ErrSeverity, 1 );
	END

COMMIT 
END TRY 
BEGIN CATCH 
		IF @@TRANCOUNT > 0 ROLLBACK 
		SELECT @ErrMsg = 
			'Message: '+ ERROR_MESSAGE() 
			+ ', Error ' + CONVERT(VARCHAR(50), ERROR_NUMBER()) 
			+ ', Severity ' + CONVERT(VARCHAR(5), ERROR_SEVERITY()) 
			+ ', State ' + CONVERT(VARCHAR(5), ERROR_STATE()) 
			+ ', Line ' + CONVERT(VARCHAR(5), ERROR_LINE()); 
		SELECT @ErrSeverity = ERROR_SEVERITY() 
		RAISERROR(@ErrMsg, @ErrSeverity, 1) 
END CATCH 

GO

SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO


 

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'Products.CatagoryGet') AND type in (N'P', N'PC')) 
	DROP PROCEDURE Products.CatagoryGet 
GO 

CREATE PROCEDURE Products.CatagoryGet ( 
	@Catagory_Pk AS int  = NULL  OUTPUT 
	, @Title AS nvarchar (100)  = NULL  
	, @Description AS nvarchar (1000)  = NULL  
) AS 


	DECLARE @ErrMsg nvarchar(4000) = 'Products.CatagoryGet:', @ErrSeverity int = 16


	 SELECT 
			[Catagory].[Catagory_Pk] 
 			, [Catagory].[Title] 
 			, [Catagory].[Description] 
 	 FROM [Products].[Catagory] 
	 WHERE 
			 ( [Catagory].[Catagory_Pk] = @Catagory_Pk OR @Catagory_Pk IS NULL ) 
 			AND  ( [Catagory].[Title] = @Title OR @Title IS NULL ) 
 			AND  ( [Catagory].[Description] = @Description OR @Description IS NULL ) 
 
	IF @@ROWCOUNT <= 0 
	BEGIN
		SET @ErrMsg += 'No Records Found Matching the Search Criteria'
		RAISERROR ( @ErrMsg, @ErrSeverity, 1 );
	END

SET  @Catagory_Pk=SCOPE_IDENTITY()

GO

SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'Products.CatagoryCreate') AND type in (N'P', N'PC')) 
	DROP PROCEDURE Products.CatagoryCreate 
GO 

CREATE PROCEDURE Products.CatagoryCreate ( 
	@Catagory_Pk AS int  OUTPUT 
	, @Title AS nvarchar (100)  
	, @Description AS nvarchar (1000)  
) AS 

BEGIN TRY 
BEGIN TRANSACTION 


	DECLARE @ErrMsg nvarchar(4000) = 'Products.CatagoryCreate:', @ErrSeverity int = 16

		 INSERT INTO [Products].[Catagory] ( 
			Title 
			, Description 
		 ) 
		 VALUES ( 
			 @Title 
			,  @Description 
		 ) 

		SET  @Catagory_Pk=SCOPE_IDENTITY()

COMMIT 
END TRY 
BEGIN CATCH 
		IF @@TRANCOUNT > 0 ROLLBACK 
		SELECT @ErrMsg = 
			'Message: '+ ERROR_MESSAGE() 
			+ ', Error ' + CONVERT(VARCHAR(50), ERROR_NUMBER()) 
			+ ', Severity ' + CONVERT(VARCHAR(5), ERROR_SEVERITY()) 
			+ ', State ' + CONVERT(VARCHAR(5), ERROR_STATE()) 
			+ ', Line ' + CONVERT(VARCHAR(5), ERROR_LINE()); 
		SELECT @ErrSeverity = ERROR_SEVERITY() 
		RAISERROR(@ErrMsg, @ErrSeverity, 1) 
END CATCH 

GO

SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'Products.CatagoryUpdate') AND type in (N'P', N'PC')) 
	DROP PROCEDURE Products.CatagoryUpdate 
GO 

CREATE PROCEDURE Products.CatagoryUpdate ( 
	@Catagory_Pk AS int  = NULL  OUTPUT 
	, @Title AS nvarchar (100)  = NULL  
	, @Description AS nvarchar (1000)  = NULL  
) AS 

BEGIN TRY 
BEGIN TRANSACTION 


	DECLARE @ErrMsg nvarchar(4000) = 'Products.CatagoryUpdate:', @ErrSeverity int = 16

		 UPDATE [Products].[Catagory] 
	 SET 
		 Title = CASE 
	 WHEN NOT @Title IS NULL THEN @Title 
	 ELSE Title 
	 END 
	,  Description = CASE 
	 WHEN NOT @Description IS NULL THEN @Description 
	 ELSE Description 
	 END 
	 WHERE Catagory_Pk = @Catagory_Pk 
	IF @@ROWCOUNT <= 0 
	BEGIN
		SET @ErrMsg += 'No Records Found Matching the Search Criteria'
		RAISERROR ( @ErrMsg, @ErrSeverity, 1 );
	END

COMMIT 
END TRY 
BEGIN CATCH 
		IF @@TRANCOUNT > 0 ROLLBACK 
		SELECT @ErrMsg = 
			'Message: '+ ERROR_MESSAGE() 
			+ ', Error ' + CONVERT(VARCHAR(50), ERROR_NUMBER()) 
			+ ', Severity ' + CONVERT(VARCHAR(5), ERROR_SEVERITY()) 
			+ ', State ' + CONVERT(VARCHAR(5), ERROR_STATE()) 
			+ ', Line ' + CONVERT(VARCHAR(5), ERROR_LINE()); 
		SELECT @ErrSeverity = ERROR_SEVERITY() 
		RAISERROR(@ErrMsg, @ErrSeverity, 1) 
END CATCH 

GO

SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'Products.CatagoryDelete') AND type in (N'P', N'PC')) 
	DROP PROCEDURE Products.CatagoryDelete 
GO 

CREATE PROCEDURE Products.CatagoryDelete ( 
	@Catagory_Pk AS int  OUTPUT 
	, 	@delete AS BIT = NULL ) AS 

BEGIN TRY 
BEGIN TRANSACTION 


	DECLARE @ErrMsg nvarchar(4000) = 'Products.CatagoryDelete:', @ErrSeverity int = 16

		 IF @delete = 1 
		 BEGIN 
	 DELETE FROM [Products].[Catagory] WHERE ( Catagory_Pk= @Catagory_Pk ) 
		 END 
	IF @@ROWCOUNT <= 0 
	BEGIN
		SET @ErrMsg += 'No Records Found Matching the Search Criteria'
		RAISERROR ( @ErrMsg, @ErrSeverity, 1 );
	END

COMMIT 
END TRY 
BEGIN CATCH 
		IF @@TRANCOUNT > 0 ROLLBACK 
		SELECT @ErrMsg = 
			'Message: '+ ERROR_MESSAGE() 
			+ ', Error ' + CONVERT(VARCHAR(50), ERROR_NUMBER()) 
			+ ', Severity ' + CONVERT(VARCHAR(5), ERROR_SEVERITY()) 
			+ ', State ' + CONVERT(VARCHAR(5), ERROR_STATE()) 
			+ ', Line ' + CONVERT(VARCHAR(5), ERROR_LINE()); 
		SELECT @ErrSeverity = ERROR_SEVERITY() 
		RAISERROR(@ErrMsg, @ErrSeverity, 1) 
END CATCH 

GO

SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO


 

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'Products.FeatureGet') AND type in (N'P', N'PC')) 
	DROP PROCEDURE Products.FeatureGet 
GO 

CREATE PROCEDURE Products.FeatureGet ( 
	@Feature_Pk AS int  = NULL  OUTPUT 
	, @FeatureSet_Fk AS int  = NULL  
	, @Name AS nvarchar (100)  = NULL  
	, @Description AS nvarchar (1000)  = NULL  
	, @Active AS bit  = NULL  
) AS 


	DECLARE @ErrMsg nvarchar(4000) = 'Products.FeatureGet:', @ErrSeverity int = 16


	 SELECT 
			[Feature].[Feature_Pk] 
 			, [Feature].[FeatureSet_Fk] 
 			, [Feature].[Name] 
 			, [Feature].[Description] 
 			, [Feature].[Active] 
 	 FROM [Products].[Feature] 
	 WHERE 
			 ( [Feature].[Feature_Pk] = @Feature_Pk OR @Feature_Pk IS NULL ) 
 			AND  ( [Feature].[FeatureSet_Fk] = @FeatureSet_Fk OR @FeatureSet_Fk IS NULL ) 
 			AND  ( [Feature].[Name] = @Name OR @Name IS NULL ) 
 			AND  ( [Feature].[Description] = @Description OR @Description IS NULL ) 
 			AND  ( [Feature].[Active] = @Active OR @Active IS NULL ) 
 
	IF @@ROWCOUNT <= 0 
	BEGIN
		SET @ErrMsg += 'No Records Found Matching the Search Criteria'
		RAISERROR ( @ErrMsg, @ErrSeverity, 1 );
	END

SET  @Feature_Pk=SCOPE_IDENTITY()

GO

SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'Products.FeatureCreate') AND type in (N'P', N'PC')) 
	DROP PROCEDURE Products.FeatureCreate 
GO 

CREATE PROCEDURE Products.FeatureCreate ( 
	@Feature_Pk AS int  OUTPUT 
	, @FeatureSet_Fk AS int  
	, @Name AS nvarchar (100)  
	, @Description AS nvarchar (1000)  
	, @Active AS bit  
) AS 

BEGIN TRY 
BEGIN TRANSACTION 


	DECLARE @ErrMsg nvarchar(4000) = 'Products.FeatureCreate:', @ErrSeverity int = 16

		 INSERT INTO [Products].[Feature] ( 
			FeatureSet_Fk 
			, Name 
			, Description 
			, Active 
		 ) 
		 VALUES ( 
			 @FeatureSet_Fk 
			,  @Name 
			,  @Description 
			,  @Active 
		 ) 

		SET  @Feature_Pk=SCOPE_IDENTITY()

COMMIT 
END TRY 
BEGIN CATCH 
		IF @@TRANCOUNT > 0 ROLLBACK 
		SELECT @ErrMsg = 
			'Message: '+ ERROR_MESSAGE() 
			+ ', Error ' + CONVERT(VARCHAR(50), ERROR_NUMBER()) 
			+ ', Severity ' + CONVERT(VARCHAR(5), ERROR_SEVERITY()) 
			+ ', State ' + CONVERT(VARCHAR(5), ERROR_STATE()) 
			+ ', Line ' + CONVERT(VARCHAR(5), ERROR_LINE()); 
		SELECT @ErrSeverity = ERROR_SEVERITY() 
		RAISERROR(@ErrMsg, @ErrSeverity, 1) 
END CATCH 

GO

SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'Products.FeatureUpdate') AND type in (N'P', N'PC')) 
	DROP PROCEDURE Products.FeatureUpdate 
GO 

CREATE PROCEDURE Products.FeatureUpdate ( 
	@Feature_Pk AS int  = NULL  OUTPUT 
	, @FeatureSet_Fk AS int  = NULL  
	, @Name AS nvarchar (100)  = NULL  
	, @Description AS nvarchar (1000)  = NULL  
	, @Active AS bit  = NULL  
) AS 

BEGIN TRY 
BEGIN TRANSACTION 


	DECLARE @ErrMsg nvarchar(4000) = 'Products.FeatureUpdate:', @ErrSeverity int = 16

		 UPDATE [Products].[Feature] 
	 SET 
		 FeatureSet_Fk = CASE 
	 WHEN NOT @FeatureSet_Fk IS NULL THEN @FeatureSet_Fk 
	 ELSE FeatureSet_Fk 
	 END 
	,  Name = CASE 
	 WHEN NOT @Name IS NULL THEN @Name 
	 ELSE Name 
	 END 
	,  Description = CASE 
	 WHEN NOT @Description IS NULL THEN @Description 
	 ELSE Description 
	 END 
	,  Active = CASE 
	 WHEN NOT @Active IS NULL THEN @Active 
	 ELSE Active 
	 END 
	 WHERE Feature_Pk = @Feature_Pk 
	IF @@ROWCOUNT <= 0 
	BEGIN
		SET @ErrMsg += 'No Records Found Matching the Search Criteria'
		RAISERROR ( @ErrMsg, @ErrSeverity, 1 );
	END

COMMIT 
END TRY 
BEGIN CATCH 
		IF @@TRANCOUNT > 0 ROLLBACK 
		SELECT @ErrMsg = 
			'Message: '+ ERROR_MESSAGE() 
			+ ', Error ' + CONVERT(VARCHAR(50), ERROR_NUMBER()) 
			+ ', Severity ' + CONVERT(VARCHAR(5), ERROR_SEVERITY()) 
			+ ', State ' + CONVERT(VARCHAR(5), ERROR_STATE()) 
			+ ', Line ' + CONVERT(VARCHAR(5), ERROR_LINE()); 
		SELECT @ErrSeverity = ERROR_SEVERITY() 
		RAISERROR(@ErrMsg, @ErrSeverity, 1) 
END CATCH 

GO

SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'Products.FeatureDelete') AND type in (N'P', N'PC')) 
	DROP PROCEDURE Products.FeatureDelete 
GO 

CREATE PROCEDURE Products.FeatureDelete ( 
	@Feature_Pk AS int  OUTPUT 
	, 	@delete AS BIT = NULL ) AS 

BEGIN TRY 
BEGIN TRANSACTION 


	DECLARE @ErrMsg nvarchar(4000) = 'Products.FeatureDelete:', @ErrSeverity int = 16

		 IF @delete = 1 
		 BEGIN 
	 DELETE FROM [Products].[Feature] WHERE ( Feature_Pk= @Feature_Pk ) 
		 END 
	IF @@ROWCOUNT <= 0 
	BEGIN
		SET @ErrMsg += 'No Records Found Matching the Search Criteria'
		RAISERROR ( @ErrMsg, @ErrSeverity, 1 );
	END

COMMIT 
END TRY 
BEGIN CATCH 
		IF @@TRANCOUNT > 0 ROLLBACK 
		SELECT @ErrMsg = 
			'Message: '+ ERROR_MESSAGE() 
			+ ', Error ' + CONVERT(VARCHAR(50), ERROR_NUMBER()) 
			+ ', Severity ' + CONVERT(VARCHAR(5), ERROR_SEVERITY()) 
			+ ', State ' + CONVERT(VARCHAR(5), ERROR_STATE()) 
			+ ', Line ' + CONVERT(VARCHAR(5), ERROR_LINE()); 
		SELECT @ErrSeverity = ERROR_SEVERITY() 
		RAISERROR(@ErrMsg, @ErrSeverity, 1) 
END CATCH 

GO

SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO


 

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'Products.FeatureSetGet') AND type in (N'P', N'PC')) 
	DROP PROCEDURE Products.FeatureSetGet 
GO 

CREATE PROCEDURE Products.FeatureSetGet ( 
	@FeatureSet_Pk AS int  = NULL  OUTPUT 
	, @Item_Fk AS int  = NULL  
	, @Title AS nvarchar (100)  = NULL  
	, @Description AS nvarchar (1000)  = NULL  
	, @Active AS bit  = NULL  
) AS 


	DECLARE @ErrMsg nvarchar(4000) = 'Products.FeatureSetGet:', @ErrSeverity int = 16


	 SELECT 
			[FeatureSet].[FeatureSet_Pk] 
 			, [FeatureSet].[Item_Fk] 
 			, [FeatureSet].[Title] 
 			, [FeatureSet].[Description] 
 			, [FeatureSet].[Active] 
 	 FROM [Products].[FeatureSet] 
	 WHERE 
			 ( [FeatureSet].[FeatureSet_Pk] = @FeatureSet_Pk OR @FeatureSet_Pk IS NULL ) 
 			AND  ( [FeatureSet].[Item_Fk] = @Item_Fk OR @Item_Fk IS NULL ) 
 			AND  ( [FeatureSet].[Title] = @Title OR @Title IS NULL ) 
 			AND  ( [FeatureSet].[Description] = @Description OR @Description IS NULL ) 
 			AND  ( [FeatureSet].[Active] = @Active OR @Active IS NULL ) 
 
	IF @@ROWCOUNT <= 0 
	BEGIN
		SET @ErrMsg += 'No Records Found Matching the Search Criteria'
		RAISERROR ( @ErrMsg, @ErrSeverity, 1 );
	END

SET  @FeatureSet_Pk=SCOPE_IDENTITY()

GO

SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'Products.FeatureSetCreate') AND type in (N'P', N'PC')) 
	DROP PROCEDURE Products.FeatureSetCreate 
GO 

CREATE PROCEDURE Products.FeatureSetCreate ( 
	@FeatureSet_Pk AS int  OUTPUT 
	, @Item_Fk AS int  
	, @Title AS nvarchar (100)  
	, @Description AS nvarchar (1000)  
	, @Active AS bit  
) AS 

BEGIN TRY 
BEGIN TRANSACTION 


	DECLARE @ErrMsg nvarchar(4000) = 'Products.FeatureSetCreate:', @ErrSeverity int = 16

		 INSERT INTO [Products].[FeatureSet] ( 
			Item_Fk 
			, Title 
			, Description 
			, Active 
		 ) 
		 VALUES ( 
			 @Item_Fk 
			,  @Title 
			,  @Description 
			,  @Active 
		 ) 

		SET  @FeatureSet_Pk=SCOPE_IDENTITY()

COMMIT 
END TRY 
BEGIN CATCH 
		IF @@TRANCOUNT > 0 ROLLBACK 
		SELECT @ErrMsg = 
			'Message: '+ ERROR_MESSAGE() 
			+ ', Error ' + CONVERT(VARCHAR(50), ERROR_NUMBER()) 
			+ ', Severity ' + CONVERT(VARCHAR(5), ERROR_SEVERITY()) 
			+ ', State ' + CONVERT(VARCHAR(5), ERROR_STATE()) 
			+ ', Line ' + CONVERT(VARCHAR(5), ERROR_LINE()); 
		SELECT @ErrSeverity = ERROR_SEVERITY() 
		RAISERROR(@ErrMsg, @ErrSeverity, 1) 
END CATCH 

GO

SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'Products.FeatureSetUpdate') AND type in (N'P', N'PC')) 
	DROP PROCEDURE Products.FeatureSetUpdate 
GO 

CREATE PROCEDURE Products.FeatureSetUpdate ( 
	@FeatureSet_Pk AS int  = NULL  OUTPUT 
	, @Item_Fk AS int  = NULL  
	, @Title AS nvarchar (100)  = NULL  
	, @Description AS nvarchar (1000)  = NULL  
	, @Active AS bit  = NULL  
) AS 

BEGIN TRY 
BEGIN TRANSACTION 


	DECLARE @ErrMsg nvarchar(4000) = 'Products.FeatureSetUpdate:', @ErrSeverity int = 16

		 UPDATE [Products].[FeatureSet] 
	 SET 
		 Item_Fk = CASE 
	 WHEN NOT @Item_Fk IS NULL THEN @Item_Fk 
	 ELSE Item_Fk 
	 END 
	,  Title = CASE 
	 WHEN NOT @Title IS NULL THEN @Title 
	 ELSE Title 
	 END 
	,  Description = CASE 
	 WHEN NOT @Description IS NULL THEN @Description 
	 ELSE Description 
	 END 
	,  Active = CASE 
	 WHEN NOT @Active IS NULL THEN @Active 
	 ELSE Active 
	 END 
	 WHERE FeatureSet_Pk = @FeatureSet_Pk 
	IF @@ROWCOUNT <= 0 
	BEGIN
		SET @ErrMsg += 'No Records Found Matching the Search Criteria'
		RAISERROR ( @ErrMsg, @ErrSeverity, 1 );
	END

COMMIT 
END TRY 
BEGIN CATCH 
		IF @@TRANCOUNT > 0 ROLLBACK 
		SELECT @ErrMsg = 
			'Message: '+ ERROR_MESSAGE() 
			+ ', Error ' + CONVERT(VARCHAR(50), ERROR_NUMBER()) 
			+ ', Severity ' + CONVERT(VARCHAR(5), ERROR_SEVERITY()) 
			+ ', State ' + CONVERT(VARCHAR(5), ERROR_STATE()) 
			+ ', Line ' + CONVERT(VARCHAR(5), ERROR_LINE()); 
		SELECT @ErrSeverity = ERROR_SEVERITY() 
		RAISERROR(@ErrMsg, @ErrSeverity, 1) 
END CATCH 

GO

SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'Products.FeatureSetDelete') AND type in (N'P', N'PC')) 
	DROP PROCEDURE Products.FeatureSetDelete 
GO 

CREATE PROCEDURE Products.FeatureSetDelete ( 
	@FeatureSet_Pk AS int  OUTPUT 
	, 	@delete AS BIT = NULL ) AS 

BEGIN TRY 
BEGIN TRANSACTION 


	DECLARE @ErrMsg nvarchar(4000) = 'Products.FeatureSetDelete:', @ErrSeverity int = 16

		 IF @delete = 1 
		 BEGIN 
	 DELETE FROM [Products].[FeatureSet] WHERE ( FeatureSet_Pk= @FeatureSet_Pk ) 
		 END 
	IF @@ROWCOUNT <= 0 
	BEGIN
		SET @ErrMsg += 'No Records Found Matching the Search Criteria'
		RAISERROR ( @ErrMsg, @ErrSeverity, 1 );
	END

COMMIT 
END TRY 
BEGIN CATCH 
		IF @@TRANCOUNT > 0 ROLLBACK 
		SELECT @ErrMsg = 
			'Message: '+ ERROR_MESSAGE() 
			+ ', Error ' + CONVERT(VARCHAR(50), ERROR_NUMBER()) 
			+ ', Severity ' + CONVERT(VARCHAR(5), ERROR_SEVERITY()) 
			+ ', State ' + CONVERT(VARCHAR(5), ERROR_STATE()) 
			+ ', Line ' + CONVERT(VARCHAR(5), ERROR_LINE()); 
		SELECT @ErrSeverity = ERROR_SEVERITY() 
		RAISERROR(@ErrMsg, @ErrSeverity, 1) 
END CATCH 

GO

SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO


 

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'Products.ItemGet') AND type in (N'P', N'PC')) 
	DROP PROCEDURE Products.ItemGet 
GO 

CREATE PROCEDURE Products.ItemGet ( 
	@Item_Pk AS int  = NULL  OUTPUT 
	, @Name AS varchar (100)  = NULL  
	, @Description AS varchar (1000)  = NULL  
	, @Line_Fk AS int  = NULL  
	, @Type_Fk AS int  = NULL  
	, @Price AS money  = NULL  
) AS 


	DECLARE @ErrMsg nvarchar(4000) = 'Products.ItemGet:', @ErrSeverity int = 16


	 SELECT 
			[Item].[Item_Pk] 
 			, [Item].[Name] 
 			, [Item].[Description] 
 			, [Item].[Line_Fk] 
 			, [Item].[Type_Fk] 
 			, [Item].[Price] 
 	 FROM [Products].[Item] 
	 WHERE 
			 ( [Item].[Item_Pk] = @Item_Pk OR @Item_Pk IS NULL ) 
 			AND  ( [Item].[Name] = @Name OR @Name IS NULL ) 
 			AND  ( [Item].[Description] = @Description OR @Description IS NULL ) 
 			AND  ( [Item].[Line_Fk] = @Line_Fk OR @Line_Fk IS NULL ) 
 			AND  ( [Item].[Type_Fk] = @Type_Fk OR @Type_Fk IS NULL ) 
 			AND  ( [Item].[Price] = @Price OR @Price IS NULL ) 
 
	IF @@ROWCOUNT <= 0 
	BEGIN
		SET @ErrMsg += 'No Records Found Matching the Search Criteria'
		RAISERROR ( @ErrMsg, @ErrSeverity, 1 );
	END

SET  @Item_Pk=SCOPE_IDENTITY()

GO

SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'Products.ItemCreate') AND type in (N'P', N'PC')) 
	DROP PROCEDURE Products.ItemCreate 
GO 

CREATE PROCEDURE Products.ItemCreate ( 
	@Item_Pk AS int  OUTPUT 
	, @Name AS varchar (100)  
	, @Description AS varchar (1000)  
	, @Line_Fk AS int  
	, @Type_Fk AS int  
	, @Price AS money  
) AS 

BEGIN TRY 
BEGIN TRANSACTION 


	DECLARE @ErrMsg nvarchar(4000) = 'Products.ItemCreate:', @ErrSeverity int = 16

		 INSERT INTO [Products].[Item] ( 
			Name 
			, Description 
			, Line_Fk 
			, Type_Fk 
			, Price 
		 ) 
		 VALUES ( 
			 @Name 
			,  @Description 
			,  @Line_Fk 
			,  @Type_Fk 
			,  @Price 
		 ) 

		SET  @Item_Pk=SCOPE_IDENTITY()

COMMIT 
END TRY 
BEGIN CATCH 
		IF @@TRANCOUNT > 0 ROLLBACK 
		SELECT @ErrMsg = 
			'Message: '+ ERROR_MESSAGE() 
			+ ', Error ' + CONVERT(VARCHAR(50), ERROR_NUMBER()) 
			+ ', Severity ' + CONVERT(VARCHAR(5), ERROR_SEVERITY()) 
			+ ', State ' + CONVERT(VARCHAR(5), ERROR_STATE()) 
			+ ', Line ' + CONVERT(VARCHAR(5), ERROR_LINE()); 
		SELECT @ErrSeverity = ERROR_SEVERITY() 
		RAISERROR(@ErrMsg, @ErrSeverity, 1) 
END CATCH 

GO

SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'Products.ItemUpdate') AND type in (N'P', N'PC')) 
	DROP PROCEDURE Products.ItemUpdate 
GO 

CREATE PROCEDURE Products.ItemUpdate ( 
	@Item_Pk AS int  = NULL  OUTPUT 
	, @Name AS varchar (100)  = NULL  
	, @Description AS varchar (1000)  = NULL  
	, @Line_Fk AS int  = NULL  
	, @Type_Fk AS int  = NULL  
	, @Price AS money  = NULL  
) AS 

BEGIN TRY 
BEGIN TRANSACTION 


	DECLARE @ErrMsg nvarchar(4000) = 'Products.ItemUpdate:', @ErrSeverity int = 16

		 UPDATE [Products].[Item] 
	 SET 
		 Name = CASE 
	 WHEN NOT @Name IS NULL THEN @Name 
	 ELSE Name 
	 END 
	,  Description = CASE 
	 WHEN NOT @Description IS NULL THEN @Description 
	 ELSE Description 
	 END 
	,  Line_Fk = CASE 
	 WHEN NOT @Line_Fk IS NULL THEN @Line_Fk 
	 ELSE Line_Fk 
	 END 
	,  Type_Fk = CASE 
	 WHEN NOT @Type_Fk IS NULL THEN @Type_Fk 
	 ELSE Type_Fk 
	 END 
	,  Price = CASE 
	 WHEN NOT @Price IS NULL THEN @Price 
	 ELSE Price 
	 END 
	 WHERE Item_Pk = @Item_Pk 
	IF @@ROWCOUNT <= 0 
	BEGIN
		SET @ErrMsg += 'No Records Found Matching the Search Criteria'
		RAISERROR ( @ErrMsg, @ErrSeverity, 1 );
	END

COMMIT 
END TRY 
BEGIN CATCH 
		IF @@TRANCOUNT > 0 ROLLBACK 
		SELECT @ErrMsg = 
			'Message: '+ ERROR_MESSAGE() 
			+ ', Error ' + CONVERT(VARCHAR(50), ERROR_NUMBER()) 
			+ ', Severity ' + CONVERT(VARCHAR(5), ERROR_SEVERITY()) 
			+ ', State ' + CONVERT(VARCHAR(5), ERROR_STATE()) 
			+ ', Line ' + CONVERT(VARCHAR(5), ERROR_LINE()); 
		SELECT @ErrSeverity = ERROR_SEVERITY() 
		RAISERROR(@ErrMsg, @ErrSeverity, 1) 
END CATCH 

GO

SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'Products.ItemDelete') AND type in (N'P', N'PC')) 
	DROP PROCEDURE Products.ItemDelete 
GO 

CREATE PROCEDURE Products.ItemDelete ( 
	@Item_Pk AS int  OUTPUT 
	, 	@delete AS BIT = NULL ) AS 

BEGIN TRY 
BEGIN TRANSACTION 


	DECLARE @ErrMsg nvarchar(4000) = 'Products.ItemDelete:', @ErrSeverity int = 16

		 IF @delete = 1 
		 BEGIN 
	 DELETE FROM [Products].[Item] WHERE ( Item_Pk= @Item_Pk ) 
		 END 
	IF @@ROWCOUNT <= 0 
	BEGIN
		SET @ErrMsg += 'No Records Found Matching the Search Criteria'
		RAISERROR ( @ErrMsg, @ErrSeverity, 1 );
	END

COMMIT 
END TRY 
BEGIN CATCH 
		IF @@TRANCOUNT > 0 ROLLBACK 
		SELECT @ErrMsg = 
			'Message: '+ ERROR_MESSAGE() 
			+ ', Error ' + CONVERT(VARCHAR(50), ERROR_NUMBER()) 
			+ ', Severity ' + CONVERT(VARCHAR(5), ERROR_SEVERITY()) 
			+ ', State ' + CONVERT(VARCHAR(5), ERROR_STATE()) 
			+ ', Line ' + CONVERT(VARCHAR(5), ERROR_LINE()); 
		SELECT @ErrSeverity = ERROR_SEVERITY() 
		RAISERROR(@ErrMsg, @ErrSeverity, 1) 
END CATCH 

GO

SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO


 

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'Products.LineGet') AND type in (N'P', N'PC')) 
	DROP PROCEDURE Products.LineGet 
GO 

CREATE PROCEDURE Products.LineGet ( 
	@Line_Pk AS int  = NULL  OUTPUT 
	, @Title AS nvarchar (100)  = NULL  
	, @Description AS nvarchar (1000)  = NULL  
) AS 


	DECLARE @ErrMsg nvarchar(4000) = 'Products.LineGet:', @ErrSeverity int = 16


	 SELECT 
			[Line].[Line_Pk] 
 			, [Line].[Title] 
 			, [Line].[Description] 
 	 FROM [Products].[Line] 
	 WHERE 
			 ( [Line].[Line_Pk] = @Line_Pk OR @Line_Pk IS NULL ) 
 			AND  ( [Line].[Title] = @Title OR @Title IS NULL ) 
 			AND  ( [Line].[Description] = @Description OR @Description IS NULL ) 
 
	IF @@ROWCOUNT <= 0 
	BEGIN
		SET @ErrMsg += 'No Records Found Matching the Search Criteria'
		RAISERROR ( @ErrMsg, @ErrSeverity, 1 );
	END

SET  @Line_Pk=SCOPE_IDENTITY()

GO

SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'Products.LineCreate') AND type in (N'P', N'PC')) 
	DROP PROCEDURE Products.LineCreate 
GO 

CREATE PROCEDURE Products.LineCreate ( 
	@Line_Pk AS int  OUTPUT 
	, @Title AS nvarchar (100)  
	, @Description AS nvarchar (1000)  
) AS 

BEGIN TRY 
BEGIN TRANSACTION 


	DECLARE @ErrMsg nvarchar(4000) = 'Products.LineCreate:', @ErrSeverity int = 16

		 INSERT INTO [Products].[Line] ( 
			Title 
			, Description 
		 ) 
		 VALUES ( 
			 @Title 
			,  @Description 
		 ) 

		SET  @Line_Pk=SCOPE_IDENTITY()

COMMIT 
END TRY 
BEGIN CATCH 
		IF @@TRANCOUNT > 0 ROLLBACK 
		SELECT @ErrMsg = 
			'Message: '+ ERROR_MESSAGE() 
			+ ', Error ' + CONVERT(VARCHAR(50), ERROR_NUMBER()) 
			+ ', Severity ' + CONVERT(VARCHAR(5), ERROR_SEVERITY()) 
			+ ', State ' + CONVERT(VARCHAR(5), ERROR_STATE()) 
			+ ', Line ' + CONVERT(VARCHAR(5), ERROR_LINE()); 
		SELECT @ErrSeverity = ERROR_SEVERITY() 
		RAISERROR(@ErrMsg, @ErrSeverity, 1) 
END CATCH 

GO

SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'Products.LineUpdate') AND type in (N'P', N'PC')) 
	DROP PROCEDURE Products.LineUpdate 
GO 

CREATE PROCEDURE Products.LineUpdate ( 
	@Line_Pk AS int  = NULL  OUTPUT 
	, @Title AS nvarchar (100)  = NULL  
	, @Description AS nvarchar (1000)  = NULL  
) AS 

BEGIN TRY 
BEGIN TRANSACTION 


	DECLARE @ErrMsg nvarchar(4000) = 'Products.LineUpdate:', @ErrSeverity int = 16

		 UPDATE [Products].[Line] 
	 SET 
		 Title = CASE 
	 WHEN NOT @Title IS NULL THEN @Title 
	 ELSE Title 
	 END 
	,  Description = CASE 
	 WHEN NOT @Description IS NULL THEN @Description 
	 ELSE Description 
	 END 
	 WHERE Line_Pk = @Line_Pk 
	IF @@ROWCOUNT <= 0 
	BEGIN
		SET @ErrMsg += 'No Records Found Matching the Search Criteria'
		RAISERROR ( @ErrMsg, @ErrSeverity, 1 );
	END

COMMIT 
END TRY 
BEGIN CATCH 
		IF @@TRANCOUNT > 0 ROLLBACK 
		SELECT @ErrMsg = 
			'Message: '+ ERROR_MESSAGE() 
			+ ', Error ' + CONVERT(VARCHAR(50), ERROR_NUMBER()) 
			+ ', Severity ' + CONVERT(VARCHAR(5), ERROR_SEVERITY()) 
			+ ', State ' + CONVERT(VARCHAR(5), ERROR_STATE()) 
			+ ', Line ' + CONVERT(VARCHAR(5), ERROR_LINE()); 
		SELECT @ErrSeverity = ERROR_SEVERITY() 
		RAISERROR(@ErrMsg, @ErrSeverity, 1) 
END CATCH 

GO

SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'Products.LineDelete') AND type in (N'P', N'PC')) 
	DROP PROCEDURE Products.LineDelete 
GO 

CREATE PROCEDURE Products.LineDelete ( 
	@Line_Pk AS int  OUTPUT 
	, 	@delete AS BIT = NULL ) AS 

BEGIN TRY 
BEGIN TRANSACTION 


	DECLARE @ErrMsg nvarchar(4000) = 'Products.LineDelete:', @ErrSeverity int = 16

		 IF @delete = 1 
		 BEGIN 
	 DELETE FROM [Products].[Line] WHERE ( Line_Pk= @Line_Pk ) 
		 END 
	IF @@ROWCOUNT <= 0 
	BEGIN
		SET @ErrMsg += 'No Records Found Matching the Search Criteria'
		RAISERROR ( @ErrMsg, @ErrSeverity, 1 );
	END

COMMIT 
END TRY 
BEGIN CATCH 
		IF @@TRANCOUNT > 0 ROLLBACK 
		SELECT @ErrMsg = 
			'Message: '+ ERROR_MESSAGE() 
			+ ', Error ' + CONVERT(VARCHAR(50), ERROR_NUMBER()) 
			+ ', Severity ' + CONVERT(VARCHAR(5), ERROR_SEVERITY()) 
			+ ', State ' + CONVERT(VARCHAR(5), ERROR_STATE()) 
			+ ', Line ' + CONVERT(VARCHAR(5), ERROR_LINE()); 
		SELECT @ErrSeverity = ERROR_SEVERITY() 
		RAISERROR(@ErrMsg, @ErrSeverity, 1) 
END CATCH 

GO

SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO


 

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'Profile.CustomerGet') AND type in (N'P', N'PC')) 
	DROP PROCEDURE Profile.CustomerGet 
GO 

CREATE PROCEDURE Profile.CustomerGet ( 
	@Customer_Pk AS int  = NULL  OUTPUT 
	, @AspNet_UserId AS uniqueidentifier  = NULL  
	, @Email AS varchar (50)  = NULL  
	, @LastName AS varchar (50)  = NULL  
	, @FirstName AS varchar (50)  = NULL  
	, @Prefix AS varchar (3)  = NULL  
	, @Address AS varchar (255)  = NULL  
	, @Address2 AS varchar (255)  = NULL  
	, @City AS varchar (50)  = NULL  
	, @State AS varchar (50)  = NULL  
	, @Zip AS varchar (15)  = NULL  
	, @PrimaryPhone AS varchar (15)  = NULL  
	, @AltPhone AS varchar (15)  = NULL  
	, @Memo AS varchar (MAX)  = NULL  
	, @Password AS varchar (10)  = NULL  
	, @Active AS bit  = NULL  
) AS 


	DECLARE @ErrMsg nvarchar(4000) = 'Profile.CustomerGet:', @ErrSeverity int = 16


	 SELECT 
			[Customer].[Customer_Pk] 
 			, [Customer].[AspNet_UserId] 
 			, [Customer].[Email] 
 			, [Customer].[LastName] 
 			, [Customer].[FirstName] 
 			, [Customer].[Prefix] 
 			, [Customer].[Address] 
 			, [Customer].[Address2] 
 			, [Customer].[City] 
 			, [Customer].[State] 
 			, [Customer].[Zip] 
 			, [Customer].[PrimaryPhone] 
 			, [Customer].[AltPhone] 
 			, [Customer].[Memo] 
 			, [Customer].[Password] 
 			, [Customer].[Active] 
 	 FROM [Profile].[Customer] 
	 WHERE 
			 ( [Customer].[Customer_Pk] = @Customer_Pk OR @Customer_Pk IS NULL ) 
 			AND  ( [Customer].[AspNet_UserId] = @AspNet_UserId OR @AspNet_UserId IS NULL ) 
 			AND  ( [Customer].[Email] = @Email OR @Email IS NULL ) 
 			AND  ( [Customer].[LastName] = @LastName OR @LastName IS NULL ) 
 			AND  ( [Customer].[FirstName] = @FirstName OR @FirstName IS NULL ) 
 			AND  ( [Customer].[Prefix] = @Prefix OR @Prefix IS NULL ) 
 			AND  ( [Customer].[Address] = @Address OR @Address IS NULL ) 
 			AND  ( [Customer].[Address2] = @Address2 OR @Address2 IS NULL ) 
 			AND  ( [Customer].[City] = @City OR @City IS NULL ) 
 			AND  ( [Customer].[State] = @State OR @State IS NULL ) 
 			AND  ( [Customer].[Zip] = @Zip OR @Zip IS NULL ) 
 			AND  ( [Customer].[PrimaryPhone] = @PrimaryPhone OR @PrimaryPhone IS NULL ) 
 			AND  ( [Customer].[AltPhone] = @AltPhone OR @AltPhone IS NULL ) 
 			AND  ( [Customer].[Memo] = @Memo OR @Memo IS NULL ) 
 			AND  ( [Customer].[Password] = @Password OR @Password IS NULL ) 
 			AND  ( [Customer].[Active] = @Active OR @Active IS NULL ) 
 
	IF @@ROWCOUNT <= 0 
	BEGIN
		SET @ErrMsg += 'No Records Found Matching the Search Criteria'
		RAISERROR ( @ErrMsg, @ErrSeverity, 1 );
	END

SET  @Customer_Pk=SCOPE_IDENTITY()

GO

SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'Profile.CustomerCreate') AND type in (N'P', N'PC')) 
	DROP PROCEDURE Profile.CustomerCreate 
GO 

CREATE PROCEDURE Profile.CustomerCreate ( 
	@Customer_Pk AS int  OUTPUT 
	, @AspNet_UserId AS uniqueidentifier  
	, @Email AS varchar (50)  
	, @LastName AS varchar (50)  
	, @FirstName AS varchar (50)  
	, @Prefix AS varchar (3)  
	, @Address AS varchar (255)  
	, @Address2 AS varchar (255)  
	, @City AS varchar (50)  
	, @State AS varchar (50)  
	, @Zip AS varchar (15)  
	, @PrimaryPhone AS varchar (15)  
	, @AltPhone AS varchar (15)  
	, @Memo AS varchar (MAX)  
	, @Password AS varchar (10)  
	, @Active AS bit  
) AS 

BEGIN TRY 
BEGIN TRANSACTION 


	DECLARE @ErrMsg nvarchar(4000) = 'Profile.CustomerCreate:', @ErrSeverity int = 16

		 INSERT INTO [Profile].[Customer] ( 
			AspNet_UserId 
			, Email 
			, LastName 
			, FirstName 
			, Prefix 
			, Address 
			, Address2 
			, City 
			, State 
			, Zip 
			, PrimaryPhone 
			, AltPhone 
			, Memo 
			, Password 
			, Active 
		 ) 
		 VALUES ( 
			 @AspNet_UserId 
			,  @Email 
			,  @LastName 
			,  @FirstName 
			,  @Prefix 
			,  @Address 
			,  @Address2 
			,  @City 
			,  @State 
			,  @Zip 
			,  @PrimaryPhone 
			,  @AltPhone 
			,  @Memo 
			,  @Password 
			,  @Active 
		 ) 

		SET  @Customer_Pk=SCOPE_IDENTITY()

COMMIT 
END TRY 
BEGIN CATCH 
		IF @@TRANCOUNT > 0 ROLLBACK 
		SELECT @ErrMsg = 
			'Message: '+ ERROR_MESSAGE() 
			+ ', Error ' + CONVERT(VARCHAR(50), ERROR_NUMBER()) 
			+ ', Severity ' + CONVERT(VARCHAR(5), ERROR_SEVERITY()) 
			+ ', State ' + CONVERT(VARCHAR(5), ERROR_STATE()) 
			+ ', Line ' + CONVERT(VARCHAR(5), ERROR_LINE()); 
		SELECT @ErrSeverity = ERROR_SEVERITY() 
		RAISERROR(@ErrMsg, @ErrSeverity, 1) 
END CATCH 

GO

SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'Profile.CustomerUpdate') AND type in (N'P', N'PC')) 
	DROP PROCEDURE Profile.CustomerUpdate 
GO 

CREATE PROCEDURE Profile.CustomerUpdate ( 
	@Customer_Pk AS int  = NULL  OUTPUT 
	, @AspNet_UserId AS uniqueidentifier  = NULL  
	, @Email AS varchar (50)  = NULL  
	, @LastName AS varchar (50)  = NULL  
	, @FirstName AS varchar (50)  = NULL  
	, @Prefix AS varchar (3)  = NULL  
	, @Address AS varchar (255)  = NULL  
	, @Address2 AS varchar (255)  = NULL  
	, @City AS varchar (50)  = NULL  
	, @State AS varchar (50)  = NULL  
	, @Zip AS varchar (15)  = NULL  
	, @PrimaryPhone AS varchar (15)  = NULL  
	, @AltPhone AS varchar (15)  = NULL  
	, @Memo AS varchar (MAX)  = NULL  
	, @Password AS varchar (10)  = NULL  
	, @Active AS bit  = NULL  
) AS 

BEGIN TRY 
BEGIN TRANSACTION 


	DECLARE @ErrMsg nvarchar(4000) = 'Profile.CustomerUpdate:', @ErrSeverity int = 16

		 UPDATE [Profile].[Customer] 
	 SET 
		 AspNet_UserId = CASE 
	 WHEN NOT @AspNet_UserId IS NULL THEN @AspNet_UserId 
	 ELSE AspNet_UserId 
	 END 
	,  Email = CASE 
	 WHEN NOT @Email IS NULL THEN @Email 
	 ELSE Email 
	 END 
	,  LastName = CASE 
	 WHEN NOT @LastName IS NULL THEN @LastName 
	 ELSE LastName 
	 END 
	,  FirstName = CASE 
	 WHEN NOT @FirstName IS NULL THEN @FirstName 
	 ELSE FirstName 
	 END 
	,  Prefix = CASE 
	 WHEN NOT @Prefix IS NULL THEN @Prefix 
	 ELSE Prefix 
	 END 
	,  Address = CASE 
	 WHEN NOT @Address IS NULL THEN @Address 
	 ELSE Address 
	 END 
	,  Address2 = CASE 
	 WHEN NOT @Address2 IS NULL THEN @Address2 
	 ELSE Address2 
	 END 
	,  City = CASE 
	 WHEN NOT @City IS NULL THEN @City 
	 ELSE City 
	 END 
	,  State = CASE 
	 WHEN NOT @State IS NULL THEN @State 
	 ELSE State 
	 END 
	,  Zip = CASE 
	 WHEN NOT @Zip IS NULL THEN @Zip 
	 ELSE Zip 
	 END 
	,  PrimaryPhone = CASE 
	 WHEN NOT @PrimaryPhone IS NULL THEN @PrimaryPhone 
	 ELSE PrimaryPhone 
	 END 
	,  AltPhone = CASE 
	 WHEN NOT @AltPhone IS NULL THEN @AltPhone 
	 ELSE AltPhone 
	 END 
	,  Memo = CASE 
	 WHEN NOT @Memo IS NULL THEN @Memo 
	 ELSE Memo 
	 END 
	,  Password = CASE 
	 WHEN NOT @Password IS NULL THEN @Password 
	 ELSE Password 
	 END 
	,  Active = CASE 
	 WHEN NOT @Active IS NULL THEN @Active 
	 ELSE Active 
	 END 
	 WHERE Customer_Pk = @Customer_Pk 
	IF @@ROWCOUNT <= 0 
	BEGIN
		SET @ErrMsg += 'No Records Found Matching the Search Criteria'
		RAISERROR ( @ErrMsg, @ErrSeverity, 1 );
	END

COMMIT 
END TRY 
BEGIN CATCH 
		IF @@TRANCOUNT > 0 ROLLBACK 
		SELECT @ErrMsg = 
			'Message: '+ ERROR_MESSAGE() 
			+ ', Error ' + CONVERT(VARCHAR(50), ERROR_NUMBER()) 
			+ ', Severity ' + CONVERT(VARCHAR(5), ERROR_SEVERITY()) 
			+ ', State ' + CONVERT(VARCHAR(5), ERROR_STATE()) 
			+ ', Line ' + CONVERT(VARCHAR(5), ERROR_LINE()); 
		SELECT @ErrSeverity = ERROR_SEVERITY() 
		RAISERROR(@ErrMsg, @ErrSeverity, 1) 
END CATCH 

GO

SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'Profile.CustomerDelete') AND type in (N'P', N'PC')) 
	DROP PROCEDURE Profile.CustomerDelete 
GO 

CREATE PROCEDURE Profile.CustomerDelete ( 
	@Customer_Pk AS int  OUTPUT 
	, 	@delete AS BIT = NULL ) AS 

BEGIN TRY 
BEGIN TRANSACTION 


	DECLARE @ErrMsg nvarchar(4000) = 'Profile.CustomerDelete:', @ErrSeverity int = 16

		 IF @delete = 1 
		 BEGIN 
	 DELETE FROM [Profile].[Customer] WHERE ( Customer_Pk= @Customer_Pk ) 
		 END 
	IF @@ROWCOUNT <= 0 
	BEGIN
		SET @ErrMsg += 'No Records Found Matching the Search Criteria'
		RAISERROR ( @ErrMsg, @ErrSeverity, 1 );
	END

COMMIT 
END TRY 
BEGIN CATCH 
		IF @@TRANCOUNT > 0 ROLLBACK 
		SELECT @ErrMsg = 
			'Message: '+ ERROR_MESSAGE() 
			+ ', Error ' + CONVERT(VARCHAR(50), ERROR_NUMBER()) 
			+ ', Severity ' + CONVERT(VARCHAR(5), ERROR_SEVERITY()) 
			+ ', State ' + CONVERT(VARCHAR(5), ERROR_STATE()) 
			+ ', Line ' + CONVERT(VARCHAR(5), ERROR_LINE()); 
		SELECT @ErrSeverity = ERROR_SEVERITY() 
		RAISERROR(@ErrMsg, @ErrSeverity, 1) 
END CATCH 

GO

SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO


 
