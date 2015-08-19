-- 切換資料庫
USE TSQL_PRACTICE
GO

--------------------------------------------------------------------------------
-- 練習 : 批次
-- 一個敍述一個批次, 所以第二個敍述語法錯誤, 不會影響第一個敍述, 還是會執行
SELECT * FROM PRODUCT
GO
SELECT * FROM ORDER
GO
-- 兩個敍述一個批次, 所以第二個敍述語法錯誤, 會影響第一個敍述不能執行
SELECT * FROM PRODUCT
SELECT * FROM ORDER
GO

--------------------------------------------------------------------------------
-- 練習 : 流程控制
-- 練習 : DECLARE, PRINT
-- 宣告變數I, 變數需以 @ 符號起頭
DECLARE @I INT
-- 設定初始值
--SET @I=0 
-- 設定變數值
SET @I=(SELECT COUNT(*) FROM EMPLOYEE)
-- 輸出資訊至SCREEN
PRINT '員工總人數 : '+CAST(@I AS VARCHAR(5))+' 人'
GO

--------------------------------------------------------------------------------
-- 練習 : IF ... ELSE
-- 依目前時間回傳上午或下午時段
DECLARE @CDATE DATETIME,@HOUR INT
SET @CDATE=GETDATE()
SET @HOUR=DATEPART(HOUR,@CDATE)
IF @HOUR>=0 AND @HOUR<12
	SELECT @CDATE '現在時間','上午' '時段'
ELSE
	SELECT @CDATE '現在時間','下午' '時段'
PRINT @HOUR
GO

--------------------------------------------------------------------------------
-- 練習 : BEGIN ... END
-- 依目前時段, 回傳產品售價
DECLARE @CDATE DATETIME,@HOUR INT
SET @CDATE=GETDATE()
SET @HOUR=DATEPART(HOUR,@CDATE)
IF @HOUR>=0 AND @HOUR<12
	BEGIN
		PRINT '上午時段產品售價依扣扣率計算'
		SELECT PRODUCTID,PRODUCTNAME,PRICE*DISCOUNT/10 PRICE FROM PRODUCT
	END
ELSE
	BEGIN
		PRINT '下午時段產品售價等於標準售價'
		SELECT PRODUCTID,PRODUCTNAME,PRICE FROM PRODUCT
	END
PRINT @HOUR
GO

--------------------------------------------------------------------------------
-- 練習 : WHILE
-- 計算 1 加到 100 的和
DECLARE @I INT,@SUM INT
SET @I=1
SET @SUM=0
WHILE @I<=100
	BEGIN
		SET @SUM=@SUM+@I
		SET @I=@I+1
	END
SELECT '1+2+...+100='+CAST(@SUM AS VARCHAR(5))
GO

--------------------------------------------------------------------------------
-- 練習 : BREAK
-- 利用無窮廻圈搭配BREAK指令, 計算 1 加到 100 的和
DECLARE @I INT,@SUM INT
SET @I=1
SET @SUM=0
WHILE 1=1
	BEGIN
		SET @SUM=@SUM+@I
		SET @I=@I+1
		IF @I>100 BREAK
	END
SELECT '1+2+...+100='+CAST(@SUM AS VARCHAR(5))
GO

-- 練習 : CONTINUE
-- 計算 1 到 100 的奇數和
DECLARE @I INT,@SUM INT
SET @I=0
SET @SUM=0
WHILE @I<100
	BEGIN
		SET @I=@I+1
		IF @I%2=0 CONTINUE
		SET @SUM=@SUM+@I
	END
SELECT '1+2+...+100='+CAST(@SUM AS VARCHAR(5))
GO

--------------------------------------------------------------------------------
-- 練習 : GOTO
-- 利用無窮廻圈搭配GOTO指令, 計算 1 加到 100 的偶數和
DECLARE @I INT,@SUM INT
SET @I=0
SET @SUM=0
WHILE 1=1
	BEGIN
		SET @I=@I+1
		IF @I%2=1 CONTINUE
		SET @SUM=@SUM+@I
		IF @I=100 GOTO PRINTOUT
	END

PRINTOUT:
SELECT '1+2+...+100='+CAST(@SUM AS VARCHAR(5))
GO

--------------------------------------------------------------------------------
-- 練習 : WAITFOR
-- 利用 WAITFOR DELAY 等待 3 秒鐘後, 再取得產品總筆數
SELECT GETDATE()
WAITFOR DELAY '00:00:03'
SELECT COUNT(*) FROM PRODUCT
SELECT GETDATE()
GO
-- 利用 WAITFOR TIME 指定執行時間, 時間到再取得產品總筆數
DECLARE @TIME DATETIME,@WTIME VARCHAR(10)
SELECT GETDATE()
SET @TIME=DATEADD(SECOND,3,GETDATE())
SELECT @TIME
SET @WTIME=DATENAME(HOUR,@TIME)+':'+DATENAME(MINUTE,@TIME)+':'+DATENAME(SECOND,@TIME)
SELECT @WTIME
WAITFOR TIME @WTIME
SELECT COUNT(*) FROM PRODUCT
SELECT GETDATE()
GO

--------------------------------------------------------------------------------
-- 練習 : CASE 
-- 利用 CASE ... WHEN, 取得訂單日期的季別
SELECT ORDERDATE,季別=
CASE DATEPART(QUARTER,ORDERDATE)
WHEN 1 THEN '第一季'
WHEN 2 THEN '第二季'
WHEN 3 THEN '第三季'
WHEN 4 THEN '第四季'
ELSE 'UNKNOWN'
END,PRODUCTID,CUSTOMERID,QTY
FROM ORDERS
GO
-- 利用 CASE WHEN, 取得產品價別
-- 高(>=3000), 中(>=800), 低(其它)
SELECT PRICE,價別=
CASE WHEN PRICE>=3000 THEN '高'
WHEN PRICE>=800 THEN '中'
ELSE '低'
END,PRODUCTID,PRODUCTNAME,QTY,DISCOUNT
FROM PRODUCT
