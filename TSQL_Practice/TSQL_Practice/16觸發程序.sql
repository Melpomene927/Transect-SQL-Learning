﻿-- 切換資料庫
USE TSQL_PRACTICE
GO

--================================================================================
-- 建立I1表格新增資料時的觸發程序
-- 當新增一筆I1表格資料時, 會自動寫一筆資料到I2表格
IF OBJECT_ID (N'dbo.trg_I1Insert', N'TR') IS NOT NULL
   DROP TRIGGER dbo.trg_I1Insert
GO
CREATE TRIGGER dbo.trg_I1Insert
ON dbo.I1 
AFTER INSERT
AS
	DECLARE @I101 NUMERIC(25,0)
	DECLARE @I102 NVARCHAR(50)
	DECLARE @I103 NUMERIC(25,4)
	SELECT @I101=I101,@I102=I102,@I103=I103 FROM INSERTED
	INSERT INTO I2 VALUES ('ADD',@I101,@I102,@I103)
	--INSERT INTO I2 SELECT 'ADD',I101,I102,I103 FROM INSERTED
GO

-- 執行1 : 新增資料到I1資料表
SELECT * FROM I1
SELECT * FROM I2
-- 新增第一筆資料(I102='1', I103=1)
INSERT INTO I1 VALUES ('1',1)
-- 新增第一筆資料(I102='2', I103=2)
INSERT INTO I1 VALUES ('2',2)
-- 新增第一筆資料(I102='3', I103=3)
INSERT INTO I1 VALUES ('3',3)
-- 新增第一筆資料(I102='4', I103=4)
INSERT INTO I1 VALUES ('4',4)
SELECT * FROM I1
SELECT * FROM I2

-- 執行2 : 新增資料到I1資料表, 觀察 SCOPE_IDENTITY, @@IDENTITY 及 Ident_Current 內建函數的值
-- 新增第五筆資料(I102='5', I103=5)
INSERT INTO I1 VALUES ('5',5)
-- 取得目前敍述範圍最後一次取得的序號, 系統最後一次取得的序號, I1及I2資料表最後一次取得的序號
SELECT SCOPE_IDENTITY() [SCOPE_IDENTITY],
@@IDENTITY [@@IDENTITY],
Ident_Current('I1') [Ident_Current('I1')],
Ident_Current('I2') [Ident_Current('I2')] 
SELECT * FROM I1
SELECT * FROM I2
GO

-- 建立I1表格修改資料時的觸發程序
-- 當修改一筆I1表格資料時, 會自動寫入修改前與修改後的資料到I2表格
IF OBJECT_ID (N'dbo.trg_I1Update', N'TR') IS NOT NULL
   DROP TRIGGER dbo.trg_I1Update
GO
CREATE TRIGGER dbo.trg_I1Update
ON dbo.I1 
AFTER UPDATE
AS
DECLARE @I101 NUMERIC(25,0)
DECLARE @I102 NVARCHAR(50)
DECLARE @I103 NUMERIC(25,4)
SELECT @I101=I101,@I102=I102,@I103=I103 FROM DELETED
INSERT INTO I2 VALUES ('UPDATE BEFORE',@I101,@I102,@I103)
SELECT @I101=I101,@I102=I102,@I103=I103 FROM INSERTED
INSERT INTO I2 VALUES ('AFTER UPDATE',@I101,@I102,@I103)
GO
-- 執行 : 修改I1資料表資料
SELECT * FROM I1
SELECT * FROM I2
-- 修改 I101=1 資料列中的I102欄位值字串後加上 A 字元, I103欄位值加 100 
UPDATE I1 SET I102=I102+'A',I103=I103+100 WHERE I101=1
SELECT * FROM I1
SELECT * FROM I2
GO

-- 建立I1表格刪除資料時的觸發程序
-- 當刪除一筆I1表格資料時, 會自動寫入刪除的資料到I2表格
IF OBJECT_ID (N'dbo.trg_I1Delete', N'TR') IS NOT NULL
   DROP TRIGGER dbo.trg_I1Delete
GO
CREATE TRIGGER dbo.trg_I1Delete
ON dbo.I1 
AFTER DELETE
AS
DECLARE @I101 NUMERIC(25,0)
DECLARE @I102 NVARCHAR(50)
DECLARE @I103 NUMERIC(25,4)
SELECT @I101=I101,@I102=I102,@I103=I103 FROM DELETED
INSERT INTO I2 VALUES ('DELETE',@I101,@I102,@I103)
GO
-- 執行 : 刪除I1資料表資料
SELECT * FROM I1
SELECT * FROM I2
-- 刪除 I101=5 的資料列
DELETE FROM I1 WHERE I101=5
SELECT * FROM I1
SELECT * FROM I2
GO




-- Other example
CREATE TRIGGER [dbo].[trCustomers_UPDATE_INSERT_DELETE] ON [dbo].[Customers] AFTER UPDATE,INSERT,DELETE
AS
BEGIN    
	DECLARE @record XML   
	DECLARE @IsType TINYINT
	SET @IsType=''
	IF EXISTS(SELECT 1 FROM inserted) AND NOT EXISTS(SELECT 1 FROM deleted)
		SET @IsType = 1    --Insert
  
	IF EXISTS(SELECT 1 FROM inserted) AND EXISTS(SELECT 1 FROM deleted)
		SET @IsType = 2    --Update
 
	IF NOT EXISTS(SELECT 1 FROM inserted) AND EXISTS(SELECT 1 FROM deleted)
		SET @IsType = 3    --Delete
     
	--只想記錄 UPDATE 事件更新資料前的舊資料
	IF (@IsType = 1)    
		SET @record=(SELECT * FROM inserted FOR XML RAW('Customers'), ELEMENTS,ROOT)
	ELSE
		SET @record=(SELECT * FROM deleted FOR XML RAW('Customers'), ELEMENTS,ROOT)
 
	IF (@IsType <>'')
	BEGIN
		INSERT INTO [log]([dbname],[recoder],[istype])VALUES('Customers',@record  ,@IsType) 
	END
END