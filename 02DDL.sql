
--------------------------------------------------------------------------------
-- CREATE DATABASE
-- 建立資料庫 "TSQL_PRACTICE"
--------------------------------------------------------------------------------
IF  EXISTS 
(
	SELECT * FROM sys.databases 
	WHERE NAME=N'TSQL_PRACTICE'
) DROP DATABASE [TSQL_PRACTICE]

CREATE DATABASE TSQL_PRACTICE
GO

--------------------------------------------------------------------------------
-- 切換資料庫
--------------------------------------------------------------------------------
USE TSQL_PRACTICE
GO

--------------------------------------------------------------------------------
-- CREATE TABLE
-- 建立資料表 "DDL TABLE1"
-- 欄位 : T0101(文字,10), T0102(文字,10), T0103(文字,10), T0104(數值, 自動取號)
--------------------------------------------------------------------------------
CREATE TABLE [DDL TABLE1]
(
	T0101 NVARCHAR(10),
	T0102 NVARCHAR(10),
	T0103 NVARCHAR(10),
	T0104 NUMERIC(25,0) IDENTITY (1,1)
)
GO

--------------------------------------------------------------------------------
-- ALTER TABLE
-- 改變資料表的欄位長度
--------------------------------------------------------------------------------

-- 改變 T0102 欄位長度為 1
ALTER TABLE [DDL TABLE1] ALTER COLUMN T0102 NVARCHAR(1)
-- 改變 T0103 欄位長度為 100
ALTER TABLE [DDL TABLE1] ALTER COLUMN T0103 NVARCHAR(100)
GO

-- 在資料表中增加兩個欄位 T0105(文字,8), T0106(文字,不限定長度)
ALTER TABLE [DDL TABLE1] 
ADD T0105 NVARCHAR(8),T0106 NVARCHAR(MAX)
GO


-- 選取所有資料
SELECT * FROM [DDL TABLE1]
GO

-- 刪除資料表
DROP TABLE [DDL TABLE1]
GO

