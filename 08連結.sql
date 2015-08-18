-- 切換資料庫
USE TSQL_PRACTICE
GO
--------------------------------------------------------------------------------
-- 練習 : 內部連結 Inner Join, Nature Join
-- (找出資料表之間指定連結欄位具有相同欄位值的資料列進行欄位資料結合)
--------------------------------------------------------------------------------

-- 依客戶編號欄位結合訂單與客戶資料表, 再依產品代號欄位結合產品資料表, 
-- 並取得結合後的所有欄位
SELECT * FROM ORDERS 
INNER JOIN CUSTOMERS
ON ORDERS.CUSTOMERID=CUSTOMERS.CUSTOMERID
INNER JOIN PRODUCT
ON ORDERS.PRODUCTID=PRODUCT.PRODUCTID


-- 取得客戶在2010年的訂購總額
SELECT CUSTOMERNAME,SUM(ORDERS.QTY*PRODUCT.PRICE) TOTALPRICE FROM ORDERS 
INNER JOIN CUSTOMERS
ON ORDERS.CUSTOMERID=CUSTOMERS.CUSTOMERID
INNER JOIN PRODUCT
ON ORDERS.PRODUCTID=PRODUCT.PRODUCTID
WHERE ORDERDATE BETWEEN '20100101' AND '20101231'
GROUP BY CUSTOMERNAME

--------------------------------------------------------------------------------
-- 練習 : 外部連結 Outter Join
--        (以指定資料表的資料優先結合其他資料表, 
--		  即使沒有相同欄位值, 亦會將主要資料表的資料帶回)
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- 利用LEFT JOIN 以訂單資料為主, 依客戶編號欄位與客戶資料表結合, 
--------------------------------------------------------------------------------
-- 再依產品代號欄位結合產品資料表, 並取得結合後的所有欄位
SELECT * FROM ORDERS 
LEFT JOIN CUSTOMERS
ON ORDERS.CUSTOMERID=CUSTOMERS.CUSTOMERID
LEFT JOIN PRODUCT
ON ORDERS.PRODUCTID=PRODUCT.PRODUCTID

--------------------------------------------------------------------------------
-- 利用RIGHT JOIN 以訂單資料為主, 依客戶編號欄位與客戶資料表結合, 
--------------------------------------------------------------------------------
-- 再依產品代號欄位結合產品資料表, 並取得結合後的所有欄位
SELECT * FROM CUSTOMERS
RIGHT JOIN ORDERS 
ON ORDERS.CUSTOMERID=CUSTOMERS.CUSTOMERID
LEFT JOIN PRODUCT
ON ORDERS.PRODUCTID=PRODUCT.PRODUCTID


-- 找出沒有訂購資料的產品
SELECT PRODUCT.* FROM PRODUCT LEFT JOIN ORDERS
ON PRODUCT.PRODUCTID=ORDERS.PRODUCTID
WHERE ORDERDATE IS NULL


-- 找出有訂購資料的產品
SELECT DISTINCT PRODUCT.* FROM PRODUCT LEFT JOIN ORDERS
ON PRODUCT.PRODUCTID=ORDERS.PRODUCTID
WHERE ORDERDATE IS NOT NULL

--------------------------------------------------------------------------------
-- 利用FULL JOIN 找出所有客戶清單 
--------------------------------------------------------------------------------
-- Result Column : ORDERS(CUSTOMERID), CUSTOMERS(CUSTOMERID, CUSTOMERNAME)
SELECT DISTINCT O.CUSTOMERID [ORDER CUSTOMERID],C.CUSTOMERID ,C.CUSTOMERNAME 
FROM ORDERS  O
FULL JOIN CUSTOMERS C
ON O.CUSTOMERID=C.CUSTOMERID
ORDER BY C.CUSTOMERID

--------------------------------------------------------------------------------
-- 利用FULL JOIN 找出所有產品清單
--------------------------------------------------------------------------------
-- Result Column : ORDERS(PRODUCTID), PRODUCT(PRODUCTID, PRODUCTNAME)
SELECT DISTINCT O.PRODUCTID [ORDER PRODUCTID],P.PRODUCTID ,P.PRODUCTNAME 
FROM ORDERS  O
FULL JOIN PRODUCT P
ON O.PRODUCTID=P.PRODUCTID
ORDER BY P.PRODUCTID
-- Result Column : PRODUCTID, PRODUCTNAME
SELECT DISTINCT COALESCE(P.PRODUCTID,O.PRODUCTID) PRODUCTID,P.PRODUCTNAME 
FROM ORDERS O
FULL JOIN PRODUCT P
ON O.PRODUCTID=P.PRODUCTID
ORDER BY COALESCE(P.PRODUCTID,O.PRODUCTID)

--------------------------------------------------------------------------------
-- 練習 : 交叉連結 (取得資料表資料列的所有組合, 實用性低)
--------------------------------------------------------------------------------
-- 取得產品資料表與顏色資料表的所有可能組合 (總列數=產品資料表列數*顏色資料表列數)
SELECT * FROM PRODUCT CROSS JOIN COLOR

-- 練習 : 自我連結
-- 取得所有員工的主管人員
SELECT E.EMPLOYEENAME,M.EMPLOYEENAME MANAGER FROM EMPLOYEE E
LEFT JOIN EMPLOYEE M
ON E.MANAGERID=M.EMPLOYEEID
