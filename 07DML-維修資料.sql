-- 切換資料庫
USE TSQL_PRACTICE
GO

--==========================================================================================
-- 練習 : INSERT, UPDATE, DELETE , TRUNCATE, DROP
--
--
--==========================================================================================
-- SELECT ... INTO ... FROM... WHERE
-- & INSERT INTO ... VALUES ...
--==========================================================================================
-- 利用 SELECT INTO 產生 PRODUCT2 空白資料表
SELECT PRODUCTID,PRODUCTNAME,PRICE INTO PRODUCT2 FROM PRODUCT WHERE 0=1
SELECT * FROM PRODUCT2

-- 新增單筆產品資料
INSERT INTO PRODUCT2 VALUES ('1','Notebook',45000)
INSERT INTO PRODUCT2 (PRODUCTID) VALUES ('2')
INSERT INTO PRODUCT2 (PRODUCTNAME,PRODUCTID) VALUES ('KeyBoard','3')
SELECT * FROM PRODUCT2

--==========================================================================================
-- UPDATE... SET... WHERE
--==========================================================================================
-- 修改產品編號 3 的產品名稱 = "Wireless KeyBoard"
UPDATE PRODUCT2 SET PRODUCTNAME='Wireless KeyBoard' WHERE PRODUCTID='3'
-- 修改產品編號 2 的產品名稱 = "Mouse" 及售價 = 1200
UPDATE PRODUCT2 SET PRODUCTNAME='Mouse',PRICE=1200 WHERE PRODUCTID='2'
SELECT * FROM PRODUCT2

-- 修改所有產品價格比原價增加 100
UPDATE PRODUCT2 SET PRICE=PRICE+100
SELECT * FROM PRODUCT2
GO
UPDATE PRODUCT2 SET PRICE=ISNULL(PRICE,0)+100
SELECT * FROM PRODUCT2

--==========================================================================================
-- DELETE... FROM... WHERE...
--==========================================================================================
-- 刪除價格大於 1000 的產品
DELETE FROM PRODUCT2 WHERE PRICE>1000
SELECT * FROM PRODUCT2

-- 刪除所有產品
DELETE FROM PRODUCT2
SELECT * FROM PRODUCT2

--==========================================================================================
-- 合併子查詢 (Mix Nasted Select)
-- INSERT INTO ... SELECT xxx
--==========================================================================================
-- 在 PRODUCT2 資料表中新增所有 PRODUCT 資料表中的產品代號, 產品名稱及售價欄位的資料
INSERT INTO PRODUCT2 SELECT PRODUCTID,PRODUCTNAME,PRICE FROM PRODUCT;
SELECT * FROM PRODUCT2;

-- 在 PRODUCT2 資料表中新增所有 PRODUCT 資料表中的產品代號及產品名稱欄位的資料
DELETE FROM PRODUCT2
INSERT INTO PRODUCT2 (PRODUCTID,PRODUCTNAME) SELECT PRODUCTID,PRODUCTNAME FROM PRODUCT
SELECT * FROM PRODUCT2

--==========================================================================================
-- TRUNCATE vs. Delete vs. Drop
--==========================================================================================
-- 刪除所有產品資料 (不寫Log的方式)
TRUNCATE TABLE PRODUCT2
SELECT * FROM PRODUCT2

-- 刪除所有產品資料 (會寫Log)
DELETE FROM PRODUCT2

-- 刪除 PRODUCT2 資料表定義 (Schema)
DROP TABLE PRODUCT2
