-- 切換資料庫
USE TSQL_PRACTICE
GO

--================================================================================
-- 練習 : 子查詢 (Nasted Select, Sub-Select, Subquery....)
--			分為 "簡單子查詢" (Simple Subquery)
--			  與 "相關子查詢" (Correlated Subquery)
--================================================================================
-- 出現在 "SELECT子句中" 的子查詢 (As Columns): 
--		找出每個 "產品" 的"訂貨總次數",並依 "訂貨總次數" 遞減 "排序"
--================================================================================

SELECT PRODUCTID
	  ,PRODUCTNAME
	  ,( SELECT COUNT(*) 
		 FROM ORDERS 
		 WHERE ORDERS.PRODUCTID = PRODUCT.PRODUCTID
	  )AS 訂貨總次數
FROM PRODUCT
ORDER BY 訂貨總次數 DESC

--================================================================================
-- 出現在 "WHERE子句" 中的子查詢 (As Where Clause):
--		找出產品折扣數大於 8 折的所有訂單
--================================================================================

SELECT * FROM ORDERS
WHERE PRODUCTID IN
	(SELECT PRODUCTID 
	 FROM PRODUCT 
	 WHERE DISCOUNT > 8)

-- 出現在WHERE子句中的子查詢 : 找出產品售價大於平均產品售價的所有訂單
SELECT ORDERS.*
	  ,PRODUCTNAME
	  ,PRICE 
FROM ORDERS
INNER JOIN PRODUCT 
ON ORDERS.PRODUCTID = PRODUCT.PRODUCTID
WHERE PRICE > 
	(SELECT AVG(PRICE)  -- 彙總函式(aggregation)輸出為單一筆, 可作為數值
	 FROM PRODUCT)		-- 是為簡單子查詢

--================================================================================
-- 練習 : 相關子查詢 (vs 簡單子查詢)
--
--
--================================================================================
-- 找出每項產品最大訂購量的所有訂單
--================================================================================

SELECT * FROM ORDERS S
WHERE QTY=(SELECT MAX(QTY) 
		   FROM ORDERS D 
		   WHERE D.PRODUCTID = S.PRODUCTID) 
ORDER BY PRODUCTID

-- 方式二 : 不使用相關子查詢
SELECT PRODUCTID
	  ,COUNT(*)
	  ,MAX(QTY) 
FROM ORDERS 
GROUP BY PRODUCTID
ORDER BY PRODUCTID

--================================================================================
-- 內、外查詢連接: 集合比對 (Set Compare)
--			EXISTS, SOME, ANY, ALL, CONTAINS, IN
--
--================================================================================
-- 練習 : EXISTS 
--================================================================================
-- 取得在 2010 年有訂單資料的產品資料
SELECT * FROM PRODUCT
WHERE EXISTS 
	(SELECT * FROM ORDERS
	 WHERE ORDERS.PRODUCTID=PRODUCT.PRODUCTID
	 AND ORDERS.ORDERDATE BETWEEN '20100101' AND '20101231')

--================================================================================
-- 練習 : ANY & SOME (一樣功能)
--================================================================================
-- 取得所有訂單日期大於任何一筆客戶代號 1 的訂單日期的訂單資料
SELECT * FROM ORDERS --ORDER BY ORDERDATE
WHERE ORDERDATE > ANY 
	(SELECT DISTINCT ORDERDATE 
	 FROM ORDERS 
	 WHERE CUSTOMERID = 1)

SELECT * FROM ORDERS --ORDER BY ORDERDATE
WHERE ORDERDATE > SOME 
	(SELECT DISTINCT ORDERDATE 
	 FROM ORDERS 
	 WHERE CUSTOMERID = 1)

--================================================================================
-- 練習 : ALL
--================================================================================
-- 取得所有訂單日期大於所有客戶代號 1 的訂單日期的訂單資料
SELECT * FROM ORDERS --ORDER BY ORDERDATE
WHERE ORDERDATE > ALL 
	(SELECT DISTINCT ORDERDATE 
	 FROM ORDERS 
	 WHERE CUSTOMERID = 1)

