USE TSQL_Exam
GO

--================================================================================
--		刪除Z公司重覆的訂單資料
--================================================================================

--Create table #temp_ORDERS(
--	COMPID nvarchar(2),
--	ORDERNO nvarchar(10),
--	SNO numeric(25,4),
--	ORDERDATE nvarchar(8),
--	CUSTID nvarchar(10),
--	PRODID nvarchar(10),
--	QTY numeric(25,4),
--	UPRICE numeric(25,4),
--	AMOUNT numeric(25,4)
--	Primary key(COMPID, ORDERNO,SNO)
--)




SELECT DISTINCT o.* INTO #temp_ORDERS
FROM ORDERS AS o
LEFT JOIN ORDERS AS od
ON o.COMPID = od.COMPID AND od.ORDERNO = o.ORDERNO AND od.SNO = o.SNO
WHERE o.COMPID = N'Z'

DELETE FROM ORDERS
WHERE COMPID = N'Z'

INSERT INTO ORDERS SELECT * FROM #temp_ORDERS

Drop Table #temp_ORDERS



-- check out
--SELECT * FROM ORDERS
--WHERE COMPID = N'Z'

--SELECT *  FROM #temp_ORDERS

SELECT  o.* 
FROM ORDERS AS o
LEFT JOIN ORDERS AS od
ON o.COMPID = od.COMPID AND od.ORDERNO = o.ORDERNO AND od.SNO = o.SNO
WHERE o.COMPID = N'Z'