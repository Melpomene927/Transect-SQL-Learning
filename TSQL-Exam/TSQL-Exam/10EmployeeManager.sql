USE TSQL_Exam 
GO

--================================================================================
--Query:
--		取得每個 "員工" 的 "主管"，沒有主管顯示 "空字串"。
--		欄位輸出：員工代碼、員工名稱、部門名稱、主管名稱
--================================================================================

SELECT e.ID AS [員工代碼]
	  ,e.NAME AS [員工名稱]
	  ,ISNULL(d.NAME,'') AS [部門名稱]
	  ,ISNULL(eb.NAME,'') AS [主管名稱]
FROM EMPLOYEE AS e
LEFT JOIN DEPARTMENT AS d
ON e.DEPTID = d.ID
LEFT JOIN EMPLOYEE AS eb
ON d.MANAGERID = eb.ID
ORDER BY e.ID