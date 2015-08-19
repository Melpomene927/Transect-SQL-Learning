-- 切換資料庫
USE TSQL_PRACTICE
GO

-- 建立純量值的使用者自訂函數
-- 練習 : 建立 udf_SumPurchases 使用者自訂函數, 取得指定產品的採購總額
IF OBJECT_ID(N'dbo.udf_SumPurchases', N'FN') IS NOT NULL
   DROP FUNCTION dbo.udf_SumPurchases
GO
CREATE FUNCTION dbo.udf_SumPurchases
(
	@PRODUCTID NVARCHAR(10)
)
RETURNS NUMERIC(25,4)
AS
BEGIN
	DECLARE @SUM NUMERIC(25,4)

	SELECT @SUM=ISNULL(SUM(PC.QTY*P.PRICE),0) FROM PURCHASES PC
	INNER JOIN PRODUCT P
	ON PC.PRODUCTID=P.PRODUCTID
	WHERE PC.PRODUCTID=@PRODUCTID

	RETURN @SUM
END
GO
-- 執行1 : 取得產品代號 1 的採購總金額
SELECT dbo.udf_SumPurchases('1') 採購總金額
--SELECT dbo.udf_SumPurchases('A1') 採購總金額
GO
-- 執行2 : 取得採購總金額大於 100萬 的所有產品
SELECT PRODUCTID,PRODUCTNAME,dbo.udf_SumPurchases(PRODUCTID) 採購總金額
FROM PRODUCT
WHERE dbo.udf_SumPurchases(PRODUCTID)>1000000
;
-- 比較使用者自訂函數與連結的效能
SELECT P.PRODUCTID,P.PRODUCTNAME,SUM(PC.QTY*P.PRICE) FROM PRODUCT P
LEFT JOIN PURCHASES PC
ON PC.PRODUCTID=P.PRODUCTID
GROUP BY P.PRODUCTID,P.PRODUCTNAME
HAVING SUM(PC.QTY*P.PRICE)>1000000
GO

-- 建立內嵌資料表值的使用者自訂函數
-- 練習 : 建立 udf_PurchasesDetail 使用者自訂函數, 取得指定採購日期範圍的採購資料
IF OBJECT_ID (N'dbo.udf_PurchasesDetail', N'IF') IS NOT NULL
   DROP FUNCTION dbo.udf_PurchasesDetail
GO
CREATE FUNCTION dbo.udf_PurchasesDetail
(	
	@PURCHASEDATEs NVARCHAR(8),
	@PURCHASEDATEe NVARCHAR(8)
)
RETURNS TABLE 
AS
RETURN 
(
	SELECT PURCHASEDATE,CUSTOMERID,PRODUCTID,QTY FROM PURCHASES
	WHERE PURCHASEDATE BETWEEN @PURCHASEDATEs AND @PURCHASEDATEe
)
GO
-- 執行 : 取得採購日期介於 20100101 ~ 20100630 之間的採購資料
SELECT * FROM dbo.udf_PurchasesDetail('20100101','20100630')
GO

-- 建立多重敍述資料表值的使用者自訂函數
-- 練習 : 建立 udf_DiscountPriceofProduct 使用者自訂函數, 取得產品指定折扣數時的產品售價清單
IF OBJECT_ID (N'dbo.udf_DiscountPriceofProduct', N'TF') IS NOT NULL
   DROP FUNCTION dbo.udf_DiscountPriceofProduct
GO
CREATE FUNCTION dbo.udf_DiscountPriceofProduct
(
	@DISCOUNT NUMERIC(25,4)
)
RETURNS 
@tblProduct TABLE 
(
	PRODUCTID NVARCHAR(10),
	PRODUCTNAME NVARCHAR(100),
	SALESPRICE NUMERIC(25,4)
)
AS
BEGIN
	INSERT INTO @tblProduct
	SELECT PRODUCTID,PRODUCTNAME,PRICE*@DISCOUNT/10 FROM PRODUCT
	RETURN
END
GO
-- 執行 : 取得產品打 9.5 折時的產品售價
SELECT * FROM dbo.udf_DiscountPriceofProduct(9.5)
GO
