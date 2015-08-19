USE TSQL_Exam 
GO

--================================================================================
--Query:
--		取得 "負庫存產品"。
--		欄位輸出：產品代碼、產品名稱、廠商名稱、單價、庫存量、單位
--		排序：庫存量
--================================================================================

SELECT p.ID AS [產品代碼]
	  ,p.NAME AS [產品名稱]
	  ,spl.NAME AS [廠商名稱]
	  ,p.UPRICE AS [單價]
	  ,p.QTY AS [庫存量]
	  ,p.UNIT AS [單位]
FROM PRODUCT AS p
LEFT JOIN CS AS spl
ON p.SUPPLIERID = spl.ID
WHERE p.QTY < 0 AND spl.DTYPE = 2
ORDER BY p.QTY