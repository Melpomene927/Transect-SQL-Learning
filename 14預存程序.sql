-- 切換資料庫
USE TSQL_PRACTICE
GO

-- 建立無輸入參數, 回傳資料集的預存程序
-- 練習 : 建立 usp_SelectPurchasesByCurrentYear 預存程序, 取得當年度所有採購資料
IF OBJECT_ID(N'dbo.usp_SelectPurchasesByCurrentYear', N'P') IS NOT NULL
   DROP PROCEDURE dbo.usp_SelectPurchasesByCurrentYear
GO
CREATE PROCEDURE dbo.usp_SelectPurchasesByCurrentYear
AS
DECLARE @YEAR VARCHAR(4),@SDATE VARCHAR(8),@EDATE VARCHAR(8)
SET @YEAR=CAST(YEAR(GETDATE()) AS VARCHAR(4))
SET @SDATE=@YEAR+'0101'
SET @EDATE=@YEAR+'1231'
SELECT * FROM PURCHASES WHERE PURCHASEDATE BETWEEN @SDATE AND @EDATE
GO
-- 執行方式
EXEC usp_SelectPurchasesByCurrentYear

-- 建立輸入參數, 回傳資料集的預存程序
-- 練習 : 建立 usp_SelectPurchasesByYear 預存程序, 取得指定年度所有採購資料
IF OBJECT_ID(N'dbo.usp_SelectPurchasesByYear', N'P') IS NOT NULL
   DROP PROCEDURE dbo.usp_SelectPurchasesByYear
GO
CREATE PROCEDURE dbo.usp_SelectPurchasesByYear
	@intYEAR INT 
AS
DECLARE @YEAR VARCHAR(4),@SDATE VARCHAR(8),@EDATE VARCHAR(8)
SET @YEAR=LTRIM(STR(@intYEAR))
SET @SDATE=@YEAR+'0101'
SET @EDATE=@YEAR+'1231'
SELECT * FROM PURCHASES WHERE PURCHASEDATE BETWEEN @SDATE AND @EDATE
GO
-- 執行方式1
EXEC usp_SelectPurchasesByYear 2009
-- 執行方式2
EXEC usp_SelectPurchasesByYear @intYEAR=2010

-- 建立輸入參數, 回傳輸出參數的預存程序
-- 練習 : 建立 usp_InsertPurchases 預存程序, 新增一筆採購資料並輸出採購單號 
IF OBJECT_ID(N'dbo.usp_InsertPurchases', N'P') IS NOT NULL
   DROP PROCEDURE dbo.usp_InsertPurchases
GO
CREATE PROCEDURE dbo.usp_InsertPurchases
	@PURCHASEDATE NVARCHAR(8)='',
	@SUPPLIERID NVARCHAR(10)='',
	@CUSTOMERID NVARCHAR(10)='',
	@PRODUCTID NVARCHAR(10)='',
	@QTY NUMERIC(25,4)=0,
	@SID INT=0 OUTPUT
AS
INSERT INTO PURCHASES VALUES 
(
	@PURCHASEDATE,
	@SUPPLIERID,
	@CUSTOMERID,
	@PRODUCTID,
	@QTY
)
SET @SID=SCOPE_IDENTITY()
GO
-- 執行1 : 不承接輸出參數
usp_InsertPurchases '20101113','4','4','1',4
GO
-- 執行2 : 承接輸出參數
DECLARE @SID INT
EXEC usp_InsertPurchases '20101114','7','7','3',6,@SID OUTPUT
SELECT @SID 採購單號
GO
SELECT * FROM PURCHASES

-- 搭配RETURN回傳數值, 建立輸入參數, 回傳輸出參數的預存程序
-- 練習 : 建立 usp_InsertPurchases2 預存程序, 新增一筆採購資料並輸出採購單號. 利用RETURN值判斷新增是否成功 (-1:失敗 其它 : 影響資料筆數)
IF OBJECT_ID(N'dbo.usp_InsertPurchases2', N'P') IS NOT NULL
   DROP PROCEDURE dbo.usp_InsertPurchases2
GO
CREATE PROCEDURE dbo.usp_InsertPurchases2
	@PURCHASEDATE NVARCHAR(10)='',
	@SUPPLIERID NVARCHAR(10)='',
	@CUSTOMERID NVARCHAR(10)='',
	@PRODUCTID NVARCHAR(10)='',
	@QTY NUMERIC(25,4)=0,
	@SID INT=0 OUTPUT
AS
INSERT INTO PURCHASES VALUES 
(
	@PURCHASEDATE,
	@SUPPLIERID,
	@CUSTOMERID,
	@PRODUCTID,
	@QTY
)

IF @@ERROR>0
	RETURN -1
ELSE
	BEGIN
		SET @SID=SCOPE_IDENTITY()
		RETURN @@ROWCOUNT
	END
GO
-- 執行1 : 不承接輸出參數及RETURN值
usp_InsertPurchases2 '20101110','2','1','1',10
GO
-- 執行2 : 承接輸出參數
DECLARE @SID INT
EXEC usp_InsertPurchases2 '20101101','10','6','4',20,@SID OUTPUT
SELECT @SID 採購單號
GO
-- 執行3 : 承接輸出參數及RETURN值
DECLARE @SID INT,@RETURN INT
EXEC @RETURN = usp_InsertPurchases2 '20101111','9','3','4',8,@SID OUTPUT
--EXEC @RETURN = usp_InsertPurchases2 '200091111','9','3','4',8,@SID OUTPUT
IF @RETURN=-1
	PRINT '新增失敗'
ELSE
	PRINT '新增 '+CAST(@RETURN AS VARCHAR(10))+' 筆資料成功. 採購單號='+CAST(@SID AS VARCHAR(10)) 
SELECT @SID 採購單號
GO
