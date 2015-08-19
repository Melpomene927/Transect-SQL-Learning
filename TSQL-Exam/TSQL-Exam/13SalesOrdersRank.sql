USE TSQL_Exam 
GO

--================================================================================
--Query:
--		取得 "G公司" 2014年4月 到 本年度2015年3月 "業務" 的
--		 "產品訂貨總量" 及 "總金額"，並 "依總金額排名"。
--
--		*欄位輸出：業務代碼、業務名稱、產品代碼、產品名稱、總數量、總金額、名次
--		*名次：依業務代碼分群，以連號取得
--		排序：業務代碼
--================================================================================


SELECT e.ID AS [業務代碼]
	  ,e.NAME AS [業務名稱]
	  ,orank.PRODID AS [產品代碼]
	  ,orank.NAME AS [產品名稱]
	  ,sum(orank.cusCount) AS [總數量]
	  ,sum(orank.cusSum) AS [總金額]
	  ,DENSE_RANK() OVER(partition by e.ID order by sum(orank.cusSum)DESC) AS [名次]
FROM EMPLOYEE AS e
INNER JOIN CS AS cus
ON e.ID = cus.SALES AND e.DEPTID = N'001'
INNER JOIN
	(SELECT o.CUSTID
		  ,o.PRODID
		  ,p.NAME
		  ,Count(o.ORDERDATE) AS [cusCount]
		  ,Sum(o.AMOUNT) AS [cusSum]
	FROM ORDERS AS o
	INNER JOIN PRODUCT AS p
	ON o.PRODID = p.ID
	WHERE o.COMPID = N'G' AND o.ORDERDATE Between N'20140401' AND N'20150331'
	GROUP BY o.CUSTID
		  ,o.PRODID
		  ,p.NAME) AS orank
ON orank.CUSTID = cus.ID AND cus.DTYPE = N'1'
WHERE e.DEPTID = N'001'
GROUP BY e.ID 
	  ,e.NAME 
	  ,orank.PRODID
	  ,orank.NAME
ORDER BY e.ID




