-- 切換資料庫
USE TSQL_PRACTICE
GO

-- 練習 : NULL運算式
-- 使用=NULL無法找出類別為NULL的產品 (CATEGORYID=NULL運算結果為UNKNOWN)
SELECT * FROM PRODUCT WHERE CATEGORYID=NULL
-- 使用IS NULL運算式找出類別為NULL的產品
SELECT * FROM PRODUCT WHERE CATEGORYID IS NULL
-- 使用IS NOT NULL運算式找出類別不為NULL的產品
SELECT * FROM PRODUCT WHERE CATEGORYID IS NOT NULL

-- 練習 : LIKE運算式
-- 練習 : % 萬用字元 (代表零個字元長度以上的任何字元)
-- 找出產品名稱由 A 開頭的產品
SELECT * FROM PRODUCT WHERE PRODUCTNAME LIKE 'a%'
-- 找出產品名稱由 入門 結尾的產品
SELECT * FROM PRODUCT WHERE PRODUCTNAME LIKE '%入門'
SELECT * FROM PRODUCT WHERE PRODUCTNAME LIKE 'a%入門'
-- 找出產品名稱中有 A 的產品
SELECT * FROM PRODUCT WHERE PRODUCTNAME LIKE '%a%'
-- 練習 : _ 萬用字元 (代表一個字元長度以上的任何字元)
-- 找出產品名稱由 IBM X 開頭, 同時長度為7個字元的產品
SELECT * FROM PRODUCT WHERE PRODUCTNAME LIKE 'IBM X__'
-- 練習 : [] 萬用字元 (代表包含於中括號中的任何一個字元)
-- 找出採購人員名稱由 英文字母 A ~ J或Y 開頭的
SELECT * FROM PURCHASEPERSON WHERE PURCHASENAME LIKE '[a-jy]%'
-- 練習 : [^] 萬用字元 (代表不包含於中括號中的任何一個字元)
-- 找出採購人員名稱不由 英文字母 A ~ J或Y 開頭的
SELECT * FROM PURCHASEPERSON WHERE PURCHASENAME LIKE '[^a-jy]%'
-- 使用 NOT LIKE 搭配 [] 萬用字元亦可達到上述結果 
SELECT * FROM PURCHASEPERSON WHERE PURCHASENAME NOT LIKE '[a-jy]%'

-- 練習 : IN運算式
-- 找出折扣是 5 折, 7 折和 9.5 折的產品
SELECT * FROM PRODUCT WHERE DISCOUNT IN (5,7,9.5)
-- 找出單位是 片 , 隻 和 台 的產品
SELECT * FROM PRODUCT WHERE UNIT IN ('片','隻','台')
-- 找出折扣不是 5 折, 7 折和 9.5 折的產品
SELECT * FROM PRODUCT WHERE DISCOUNT NOT IN (5,7,9.5)

-- 練習 : BETWEEN運算式
-- 找出庫存量介於 1000 到 3000 之間的產品
SELECT * FROM PRODUCT WHERE QTY BETWEEN 1000 AND 3000
-- 須注意前值須小於等於後值. 因此敍述無法傳回資料列, 於應用面來看屬無效敍述
SELECT * FROM PRODUCT WHERE QTY BETWEEN 3000 AND 1000
-- 找出採購人員名稱介於 A 到 S 之間的員工
SELECT * FROM PURCHASEPERSON WHERE PURCHASENAME BETWEEN 'A' AND 'S'
-- 找出採購人員名稱介於 A 到 S(包含所有S開頭) 之間的員工
SELECT * FROM PURCHASEPERSON WHERE PURCHASENAME BETWEEN 'A' AND 'SZZZZZZZZZZZZZZ'
