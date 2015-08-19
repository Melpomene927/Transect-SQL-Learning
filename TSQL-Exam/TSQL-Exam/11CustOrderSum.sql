USE TSQL_Exam 
GO

--================================================================================
--Query:
--		以 "松栢" 客戶名稱取得 "G公司" 2014前年前度 "所有產品" 的 "訂貨總量" 及 "總金額"。
--		欄位輸出：產品代碼、產品名稱、類別名稱、總數量、總金額
--
--		*產品名稱：若產品代碼不存在，請顯示MISSING
--		*類別名稱：若類別代碼不存在，請顯示產品中的類別代碼，若產品代碼不存在，請顯示MISSING

--		排序：產品代碼使用ConnectionB建立12NegativeStock.sql新查詢。取得負庫存產品。
--		欄位輸出：產品代碼、產品名稱、廠商名稱、單價、庫存量、單位
--		排序：庫存量
--================================================================================

SELECT aggr.產品代碼 
	  ,ISNULL(po.NAME,'Missing') AS [產品名稱]
	  ,COALESCE(pc.NAME,ISNULL(po.CATEID,'Missing')) AS [類別名稱]
	  ,aggr.總金額
	  ,aggr.總數量
FROM PRODUCT AS po
RIGHT JOIN (
	SELECT o.PRODID AS [產品代碼]
		  ,COUNT(o.ORDERDATE) AS [總數量]
		  ,SUM(o.UPRICE) AS [總金額]
	FROM ORDERS AS o
	LEFT JOIN PRODUCT AS p
	ON o.PRODID = p.ID
	GROUP BY o.PRODID) AS aggr
ON aggr.產品代碼 = po.ID
LEFT JOIN PRODUCTCATEGORY AS pc
ON pc.ID = po.CATEID
ORDER BY aggr.產品代碼