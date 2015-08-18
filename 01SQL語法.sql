-- 切換資料庫
USE NETERP_DEV

-- 這是單行註解的方式
--SELECT * 
--FROM A01 

/*
這是
多行註解
的方式
*/
/*
SELECT * 
FROM A01 
*/

-- 基本的SQL敍述
-- 單行的SQL敍述, 可於完整敍述後加上分號與下個敍述做區隔
SELECT * FROM A01;
-- 多行的SQL敍述
SELECT * 
FROM A02 

-- 敍述中若有使用字串常數, 須於前後加上單引號符號
SELECT * FROM A01 WHERE A0101<'9'

-- 使用GO結束批次指令
SELECT * FROM A01
GO
SELECT * FROM A02

-- 使用四個節點方式存取物件
-- 存取其他資料庫中的物件
SELECT * FROM AdventureWorks.Production.Product

-- 存取遠端SQL SERVER中的物件 (須先建立Linked Server)
SELECT * FROM [10.100.0.68\SQL2005].NetERP_Dev.dbo.A01



