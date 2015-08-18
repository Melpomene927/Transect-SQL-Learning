USE TSQL_PRACTICE
GO
--------------------------------------------------------------------------------
--1.	找出2009, 2010兩年都有下訂單的客戶清單. 輸出欄位 : 客戶代號, 客戶名稱
--------------------------------------------------------------------------------
SELECT COALESCE(o.CUSTOMERID, c.CUSTOMERID) AS 客戶代號, c.CUSTOMERNAME AS 客戶名稱
FROM CUSTOMERS AS c
RIGHT JOIN ORDERS AS o
ON c.CUSTOMERID = o.CUSTOMERID
WHERE DATENAME(YEAR,o.ORDERDATE) = '2009'
INTERSECT
SELECT COALESCE(o.CUSTOMERID, c.CUSTOMERID) AS 客戶代號, c.CUSTOMERNAME AS 客戶名稱
FROM CUSTOMERS AS c
RIGHT JOIN ORDERS AS o
ON c.CUSTOMERID = o.CUSTOMERID
WHERE YEAR(o.ORDERDATE) = '2010'


SELECT DISTINCT c.CUSTOMERID, c.CUSTOMERNAME FROM CUSTOMERS AS c
WHERE EXISTS (SELECT * FROM ORDERS AS oi WHERE c.CUSTOMERID = oi.CUSTOMERID AND YEAR(oi.ORDERDATE)='2009') 
AND EXISTS (SELECT * FROM ORDERS AS oi WHERE c.CUSTOMERID = oi.CUSTOMERID AND YEAR(oi.ORDERDATE)='2010') 


SELECT DISTINCT o.CUSTOMERID, c.CUSTOMERNAME FROM CUSTOMERS AS c
RIGHT JOIN ORDERS AS o
ON o.CUSTOMERID = c.CUSTOMERID
WHERE EXISTS (SELECT * FROM ORDERS AS oi WHERE o.CUSTOMERID = oi.CUSTOMERID AND YEAR(oi.ORDERDATE)='2009') 
AND EXISTS (SELECT * FROM ORDERS AS oi WHERE o.CUSTOMERID = oi.CUSTOMERID AND YEAR(oi.ORDERDATE)='2010') 

--------------------------------------------------------------------------------
--2.	找出2009有下訂單但2010沒有的客戶清單. 輸出欄位 : 客戶代號, 客戶名稱
--------------------------------------------------------------------------------
SELECT COALESCE(o.CUSTOMERID, c.CUSTOMERID) AS 客戶代號, c.CUSTOMERNAME AS 客戶名稱
FROM CUSTOMERS AS c
RIGHT JOIN ORDERS AS o
ON c.CUSTOMERID = o.CUSTOMERID
WHERE YEAR(o.ORDERDATE) = '2009'
EXCEPT
SELECT COALESCE(o.CUSTOMERID, c.CUSTOMERID) AS 客戶代號, c.CUSTOMERNAME AS 客戶名稱
FROM CUSTOMERS AS c
RIGHT JOIN ORDERS AS o
ON c.CUSTOMERID = o.CUSTOMERID
WHERE YEAR(o.ORDERDATE) = '2010'

SELECT DISTINCT c.CUSTOMERID, c.CUSTOMERNAME FROM CUSTOMERS AS c
WHERE EXISTS (SELECT * FROM ORDERS AS oi WHERE c.CUSTOMERID = oi.CUSTOMERID AND YEAR(oi.ORDERDATE)='2009') 
AND NOT EXISTS (SELECT * FROM ORDERS AS oi WHERE c.CUSTOMERID = oi.CUSTOMERID AND YEAR(oi.ORDERDATE)='2010') 

--------------------------------------------------------------------------------
--3.	找出2010有下訂單但2009沒有的客戶清單. 輸出欄位 : 客戶代號, 客戶名稱
--------------------------------------------------------------------------------
SELECT COALESCE(o.CUSTOMERID, c.CUSTOMERID) AS 客戶代號, c.CUSTOMERNAME AS 客戶名稱
FROM CUSTOMERS AS c
RIGHT JOIN ORDERS AS o
ON c.CUSTOMERID = o.CUSTOMERID
WHERE YEAR(o.ORDERDATE) = '2010'
EXCEPT
SELECT COALESCE(o.CUSTOMERID, c.CUSTOMERID) AS 客戶代號, c.CUSTOMERNAME AS 客戶名稱
FROM CUSTOMERS AS c
RIGHT JOIN ORDERS AS o
ON c.CUSTOMERID = o.CUSTOMERID
WHERE YEAR(o.ORDERDATE) = '2009'

SELECT DISTINCT c.CUSTOMERID, c.CUSTOMERNAME FROM CUSTOMERS AS c
WHERE NOT EXISTS (SELECT * FROM ORDERS AS oi WHERE c.CUSTOMERID = oi.CUSTOMERID AND YEAR(oi.ORDERDATE)='2009') 
AND EXISTS (SELECT * FROM ORDERS AS oi WHERE c.CUSTOMERID = oi.CUSTOMERID AND YEAR(oi.ORDERDATE)='2010') 

--------------------------------------------------------------------------------
--4.	使用允許跳號取號方式, 將產品資料表依售價高至低排名, 並取出排行前十名的產品, 
--      且同時列出與第十名有相同售價的產品. 輸出欄位 : 產品代號, 產品名稱, 售價, 名次
--------------------------------------------------------------------------------
SELECT TOP 10 WITH TIES p.PRODUCTID, p.PRODUCTNAME, p.PRICE,
RANK() OVER (ORDER BY p.PRICE DESC) AS 'RANK'
FROM PRODUCT AS p
ORDER BY p.PRICE DESC

--------------------------------------------------------------------------------
--5.	找出距今半年內有下訂單的客戶清單. 輸出欄位 : 客戶代號, 客戶名稱
--------------------------------------------------------------------------------
SELECT DISTINCT o.CUSTOMERID AS 客戶代號,
	c.CUSTOMERNAME AS 客戶名稱
FROM CUSTOMERS AS c
RIGHT JOIN ORDERS AS o
ON c.CUSTOMERID = o.CUSTOMERID
WHERE DATEDIFF(MONTH,o.ORDERDATE,'20100812') < 6

--EXAMING CORRECTNESS
SELECT o.CUSTOMERID, c.CUSTOMERNAME,o.ORDERDATE FROM CUSTOMERS AS c
RIGHT JOIN ORDERS AS o
ON c.CUSTOMERID = o.CUSTOMERID

--------------------------------------------------------------------------------
--6.	找出距今一年以上沒下訂單的客戶清單. 輸出欄位 : 客戶代號, 客戶名稱
--------------------------------------------------------------------------------
SELECT c.CUSTOMERID, c.CUSTOMERNAME FROM CUSTOMERS AS c
EXCEPT
SELECT c.CUSTOMERID, c.CUSTOMERNAME FROM CUSTOMERS AS c
LEFT JOIN ORDERS AS o
ON c.CUSTOMERID = o.CUSTOMERID
WHERE DATEDIFF(DAY,o.ORDERDATE,'20101231') < 365



-- examing the latest ordered date from the customers
SELECT o.*, c.CUSTOMERNAME FROM CUSTOMERS AS c
LEFT JOIN (
	SELECT  MAX(ORDERDATE) AS ORDERDATE ,CUSTOMERID  
	FROM ORDERS GROUP BY CUSTOMERID) AS o
ON c.CUSTOMERID = o.CUSTOMERID
WHERE DATEDIFF(DAY,o.ORDERDATE,'20101231') > 365


--------------------------------------------------------------------------------
--7.	取得所有客戶清單. 輸出欄位 : 客戶代號, 客戶名稱, 地址. 地址欄位以聯絡地址優先, 
--      聯絡地址不存在, 則顯示發票地址
--------------------------------------------------------------------------------
SELECT c.CUSTOMERID, c.CUSTOMERNAME, 
	(CASE c.CONTACTADDRESS WHEN ''THEN c.INVOICEADDRESS 
	ELSE c.CONTACTADDRESS END) AS ADDRESSES
FROM CUSTOMERS AS c

--------------------------------------------------------------------------------
--8.	取得所有客戶訂單的訂購次數, 訂購總額及最近訂貨日. 
--      輸出欄位 : 客戶代號, 客戶名稱, 訂貨次數, 訂貨總額, 最近訂貨日
--------------------------------------------------------------------------------

SELECT c.CUSTOMERID AS 客戶代號, 
	c.CUSTOMERNAME AS 客戶名稱,
	COUNT(o.ORDERDATE) AS 訂貨次數,
	SUM(o.QTY * p.PRICE * p.DISCOUNT/10) AS 訂貨總額,
	MAX(o.ORDERDATE) AS 最近訂貨日
FROM CUSTOMERS AS c
LEFT JOIN ORDERS AS o
ON c.CUSTOMERID = o.CUSTOMERID
LEFT JOIN PRODUCT AS p
ON o.PRODUCTID = p.PRODUCTID
GROUP BY c.CUSTOMERID, c.CUSTOMERNAME
ORDER BY c.CUSTOMERID



-- bad one
SELECT t1.*, od.ORDERDATE AS 最近訂貨日 FROM (
SELECT c.CUSTOMERID AS 客戶代號 ,
	c.CUSTOMERNAME AS 客戶名稱,
	SUM(o.OrderTimes) AS 訂貨次數,
	SUM(po.PRICE) AS 訂貨總額
FROM CUSTOMERS AS c
LEFT JOIN (
	SELECT oi.CUSTOMERID,
		p.PRICE * p.DISCOUNT AS PRICE,
		oi.PRODUCTID,
		COUNT(oi.ORDERDATE) AS OrderTimes
	FROM ORDERS AS oi
	INNER JOIN PRODUCT AS p
	ON oi.PRODUCTID = p.PRODUCTID
	GROUP BY oi.CUSTOMERID, p.PRICE,oi.PRODUCTID, p.DISCOUNT) AS o
ON c.CUSTOMERID = o.CUSTOMERID
LEFT JOIN PRODUCT AS po
ON po.PRODUCTID = o.PRODUCTID
GROUP BY c.CUSTOMERID, c.CUSTOMERNAME
) AS t1
LEFT JOIN (
	SELECT CUSTOMERID, MAX(ORDERDATE) AS ORDERDATE FROM ORDERS
	GROUP BY CUSTOMERID) AS od
ON t1.客戶代號 = od.CUSTOMERID
ORDER BY t1.客戶代號

--------------------------------------------------------------------------------
--9.	找出客戶代號1, 2, 7的最近一筆訂單資料. 
--      輸出欄位 : 最近訂貨日, 客戶代號, 客戶名稱, 產品代號, 產品名稱, 訂購數量
--------------------------------------------------------------------------------
SELECT oo.ORDERDATE AS 最近訂貨日,
	c.CUSTOMERID AS 客戶代號,
	c.CUSTOMERNAME AS 客戶名稱,
	p.PRODUCTID AS 產品代號,
	p.PRODUCTNAME AS 產品名稱,
	o.QTY AS 訂購數量
FROM CUSTOMERS AS c
LEFT JOIN ORDERS AS o
ON o.CUSTOMERID = c.CUSTOMERID
INNER JOIN PRODUCT AS p
ON p.PRODUCTID = o.PRODUCTID
INNER JOIN 
	(SELECT CUSTOMERID, MAX(ORDERDATE) AS ORDERDATE FROM ORDERS
	GROUP BY CUSTOMERID) AS oo
ON oo.ORDERDATE = o.ORDERDATE
WHERE c.CUSTOMERID IN ('1','2','7')
ORDER BY c.CUSTOMERID

--examination
SELECT * FROM ORDERS
ORDER BY CUSTOMERID
--------------------------------------------------------------------------------
--10.	使用ALTER指令修改訂單資料表
--甲、	加入一個序號欄位.
--欄位名稱 : SID
--欄位型態 : INT, 自動取號 (起始號 : 1000	累加值 : 10)
--乙、	修改數量欄位不允許存入NULL值.
--------------------------------------------------------------------------------
ALTER TABLE ORDERS
ADD [SID] INT IDENTITY(1000,10) NOT NULL

ALTER TABLE ORDERS
ALTER COLUMN QTY INT NOT NULL

ALTER TABLE ORDERS
DROP COLUMN [SID]