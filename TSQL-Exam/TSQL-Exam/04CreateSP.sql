USE TSQL_Exam 
GO
---------------------------------------------------------------
-- Create SP usp_InsertOrders
---------------------------------------------------------------
IF OBJECT_ID(N'dbo.usp_InsertOrders', N'P') IS NOT NULL
   DROP PROCEDURE dbo.usp_InsertOrders
GO
CREATE PROCEDURE dbo.usp_InsertOrders
	@COMPID		nvarchar(2),
	@ORDERNO	nvarchar(10),
	@SNO		numeric(25,4),
	@ORDERDATE	nvarchar(8),
	@CUSTID		nvarchar(10),
	@PRODID		nvarchar(10),
	@QTY		numeric(25,4),
	@UPRICE		numeric(25,4),
	@AMOUNT		numeric(25,4)
AS
	INSERT INTO [dbo].[ORDERS]
	VALUES(
		@COMPID,
		@ORDERNO,
		@SNO,
		@ORDERDATE,
		@CUSTID,
		@PRODID,
		@QTY,
		@UPRICE,
		@AMOUNT)

GO

---------------------------------------------------------------
-- Create SP usp_UpdateOrders
---------------------------------------------------------------
IF OBJECT_ID(N'dbo.usp_UpdateOrders', N'P') IS NOT NULL
   DROP PROCEDURE dbo.usp_UpdateOrders
GO
CREATE PROCEDURE dbo.usp_UpdateOrders
	@COMPID		nvarchar(2),
	@ORDERNO	nvarchar(10),
	@SNO		numeric(25,4),
	@ORDERDATE	nvarchar(8),
	@CUSTID		nvarchar(10),
	@PRODID		nvarchar(10),
	@QTY		numeric(25,4),
	@UPRICE		numeric(25,4),
	@AMOUNT		numeric(25,4)
AS
	UPDATE [dbo].[ORDERS]
	SET
		[COMPID]		= @COMPID,
		[ORDERNO]		= @ORDERNO,
		[SNO]			= @SNO,
		[ORDERDATE]		= @ORDERDATE,
		[CUSTID]		= @CUSTID,
		[PRODID]		= @PRODID,
		[QTY]			= @QTY,
		[UPRICE]		= @UPRICE,
		[AMOUNT]		= @AMOUNT
	WHERE [ORDERNO]	= @ORDERNO
		
GO

---------------------------------------------------------------
-- Create SP usp_DeleteOrders
---------------------------------------------------------------
IF OBJECT_ID(N'dbo.usp_DeleteOrders', N'P') IS NOT NULL
   DROP PROCEDURE dbo.usp_DeleteOrders
GO
CREATE PROCEDURE dbo.usp_DeleteOrders
	@COMPID		nvarchar(2),
	@ORDERNO	nvarchar(10)
AS
	DELETE FROM [dbo].[ORDERS]
	WHERE [ORDERNO] = @ORDERNO
GO