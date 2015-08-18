﻿-- 切換資料庫
USE TSQL_PRACTICE
GO

-- 練習 : 連結運算子
-- 找出所有產品資料中的 產品類別+' / '+產品名稱 及 單價 欄位
-- (因類別有NULL值, 搭配連結運算子與其他欄位做運算, 結果會是NULL值)
SELECT CATEGORYID+' / '+PRODUCTNAME 產品,PRICE 價格 FROM PRODUCT

-- 練習 : 比較運算子, 邏輯運算子
-- 找出價格低於30000元以下的產品
SELECT * FROM PRODUCT WHERE PRICE<30000
SELECT * FROM PRODUCT WHERE NOT PRICE>=30000
-- 找出價格低於30000元的所有產品. 這些產品的類別代碼必須等於1或庫存量小於300
SELECT * FROM PRODUCT WHERE PRICE<30000 AND (CATEGORYID='1' OR QTY<300)

-- 練習 : 算術運算子
-- 算出產品打折後的售價 (Columns : RODUCTNAME,PRICE,DISCOUNT,優惠價)
SELECT PRODUCTNAME,PRICE,DISCOUNT,PRICE*DISCOUNT/10 優惠價 FROM PRODUCT

-- 練習 : UNION集合運算子 (用來執行聯集運算)
-- 注意 : 每個敍述取得的欄位總數及欄位對應的資料型態必須相同,
-- 使用UNION自動移除重覆性的資料, 使用UNION ALL會保留所有的資料
-- 合併庫存量>2000及庫存量>3000的兩個結果集
SELECT CATEGORYID,PRODUCTNAME,QTY FROM PRODUCT
WHERE QTY>2000
UNION ALL
SELECT CATEGORYID,PRODUCTNAME,QTY FROM PRODUCT
WHERE QTY>3000
-- 由採購人員, 銷售人員與盤點人員中找出所有員工
SELECT PURCHASENAME FROM PURCHASEPERSON
UNION --ALL
SELECT SALESNAME FROM SALESPERSON
UNION --ALL
SELECT STOCKNAME FROM STOCKPERSON

-- 練習 : INTERSECT集合運算子 (用來執行交集運算)
-- 找出同時兼任採購與銷售的員工
SELECT PURCHASENAME FROM PURCHASEPERSON
INTERSECT
SELECT SALESNAME FROM SALESPERSON

-- 練習 : EXCEPT集合運算子 (用來執行差集運算)
-- 找出只負責採購的員工
SELECT PURCHASENAME FROM PURCHASEPERSON
EXCEPT
SELECT SALESNAME FROM SALESPERSON
EXCEPT
SELECT STOCKNAME FROM STOCKPERSON
-- 找出只負責銷售的員工
SELECT SALESNAME FROM SALESPERSON
EXCEPT
SELECT PURCHASENAME FROM PURCHASEPERSON
EXCEPT
SELECT STOCKNAME FROM STOCKPERSON

-- 練習 : INTERSECT, EXCEPT同時使用
-- 注意 : INTERSECT順序優先於EXCEPT, 所以下列敍述執行結果為
-- 找出盤點人員並未同時兼任採購與銷售的員工
SELECT STOCKNAME FROM STOCKPERSON
EXCEPT
SELECT PURCHASENAME FROM PURCHASEPERSON
INTERSECT
SELECT SALESNAME FROM SALESPERSON
--找出盤點人員未兼任採購但兼任銷售的員工(方式一)
(SELECT STOCKNAME FROM STOCKPERSON
EXCEPT
SELECT PURCHASENAME FROM PURCHASEPERSON)
INTERSECT
SELECT SALESNAME FROM SALESPERSON
--找出盤點人員未兼任採購但兼任銷售的員工(方式二)
SELECT STOCKNAME FROM STOCKPERSON
INTERSECT
SELECT SALESNAME FROM SALESPERSON
EXCEPT
SELECT PURCHASENAME FROM PURCHASEPERSON
