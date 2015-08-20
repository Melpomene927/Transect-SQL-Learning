-- 切換資料庫
USE TSQL_PRACTICE
GO


-- MSDN: 內建函數
--   https://msdn.microsoft.com/zh-tw/library/ms174318(v=sql.120).aspx

--================================================================================
-- 練習 : 組態函數 Configuration Functions
--================================================================================
-- 取得每週第一天(預設值為7即星期日), 資料庫伺服器名稱, 執行個體名稱, 版本資訊
SELECT @@DATEFIRST AS [BeginDayOfWeek]
	  ,@@SERVERNAME AS [SQL Server Name]
	  ,@@SERVICENAME AS [Service Name]
	  ,@@VERSION AS [SQL Server Version]

-- Reference: https://msdn.microsoft.com/zh-tw/library/ms173823(v=sql.120).aspx

--================================================================================
-- 練習 : 日期與時間函數
-- Summary: GETDATE, DATENAME, DATEPART, DATEADD, DATEDIFF
-- 
--================================================================================
--================================================================================
-- 練習 : GETDATE, GETUTCDATE
--================================================================================

-- 取得目前系統的日期時間及格林威治標準的日期時間
SELECT GETDATE() AS [Date of Current Time Zone]
	  ,GETUTCDATE() AS [Date of Coordinated Universal Time]

-- 練習 : YEAR, MONTH, DAY
-- 取得今天的年份, 月份及日期
SELECT GETDATE() AS [The Date Type Data] 
	  ,YEAR(GETDATE()) AS [Year Part of Date type]
	  ,MONTH(GETDATE()) AS [Month Part of Date Type]
	  ,DAY(GETDATE()) AS [Day Part of Date type]

-- 取得指定日期的年份, 月份及日期
SELECT YEAR('2010/5/29'),MONTH('2010/5/29'),DAY('2010/5/29')

--Reference: https://msdn.microsoft.com/zh-tw/library/ms186724.aspx

--================================================================================
-- 練習 : DATENAME (回傳 "字串" )
--================================================================================

-- 取得指定日期之 [年份]
SELECT DATENAME(YEAR,GETDATE())
	  ,DATENAME(YYYY,GETDATE())
	  ,DATENAME(YY,GETDATE())

-- 取得指定日期之 [季別]
SELECT DATENAME(QUARTER,GETDATE())
	  ,DATENAME(QQ,GETDATE())
	  ,DATENAME(Q,GETDATE())

-- 取得指定日期之 [月份]
SELECT DATENAME(MONTH,GETDATE())
	  ,DATENAME(MM,GETDATE())
	  ,DATENAME(M,GETDATE())

-- 取得指定日期之 [日期]
SELECT DATENAME(DAY,GETDATE())
	  ,DATENAME(DD,GETDATE())
	  ,DATENAME(D,GETDATE())

-- 取得指定日期之 [一年第幾天] ***
SELECT DATENAME(DAYOFYEAR,GETDATE())
	  ,DATENAME(DY,GETDATE())
	  ,DATENAME(Y,GETDATE())

-- 取得指定日期之 [一年第幾週: Week number]
SELECT DATENAME(WEEK,GETDATE())
	  ,DATENAME(WK,GETDATE())
	  ,DATENAME(WW,GETDATE())

-- 取得指定日期之 [星期幾: Mon, Tue, Wed...]
SELECT DATENAME(WEEKDAY,GETDATE())
	  ,DATENAME(DW,GETDATE())
	  ,DATENAME(W,GETDATE())

-- 取得指定日期之 [時間 hour]
SELECT DATENAME(HOUR,GETDATE())
	  ,DATENAME(HH,GETDATE())

-- 取得指定日期之 [分鐘 minute]
SELECT DATENAME(MINUTE,GETDATE())
	  ,DATENAME(MI,GETDATE())
	  ,DATENAME(N,GETDATE())

-- 取得指定日期之 [秒鐘 second]
SELECT DATENAME(SECOND,GETDATE())
	  ,DATENAME(SS,GETDATE())
	  ,DATENAME(S,GETDATE())

-- 取得指定日期之 [毫秒 milliseconf]
SELECT DATENAME(MILLISECOND,GETDATE())
	  ,DATENAME(MS,GETDATE())

--================================================================================
-- 練習 : DATEPART (回傳 "整數" )
--================================================================================

-- 取得指定日期之 [年份]
SELECT DATEPART(YEAR,GETDATE())
	  ,DATEPART(YYYY,GETDATE())
	  ,DATEPART(YY,GETDATE())

-- 取得指定日期之 [季別]
SELECT DATEPART(QUARTER,GETDATE())
	  ,DATEPART(QQ,GETDATE())
	  ,DATEPART(Q,GETDATE())

-- 取得指定日期之 [月份]
SELECT DATEPART(MONTH,GETDATE())
	  ,DATEPART(MM,GETDATE())
	  ,DATEPART(M,GETDATE())

-- 取得指定日期之 [日期]
SELECT DATEPART(DAY,GETDATE())
	  ,DATEPART(DD,GETDATE())
	  ,DATEPART(D,GETDATE())

-- 取得指定日期之 [一年第幾天] ***
SELECT DATEPART(DAYOFYEAR,GETDATE())
	  ,DATEPART(DY,GETDATE())
	  ,DATEPART(Y,GETDATE())

-- 取得指定日期之 [一年第幾週: Week number]
SELECT DATEPART(WEEK,GETDATE())
	  ,DATEPART(WK,GETDATE())
	  ,DATEPART(WW,GETDATE())

-- 取得指定日期之 [星期幾: Mon, Tue, Wed...]
SELECT DATEPART(WEEKDAY,GETDATE())
	  ,DATEPART(DW,GETDATE())
	  ,DATEPART(W,GETDATE())

-- 取得指定日期之 [時間 hour]
SELECT DATEPART(HOUR,GETDATE())
	  ,DATEPART(HH,GETDATE())

-- 取得指定日期之 [分鐘 minute]
SELECT DATEPART(MINUTE,GETDATE())
	  ,DATEPART(MI,GETDATE())
	  ,DATEPART(N,GETDATE())

-- 取得指定日期之 [秒鐘 second]
SELECT DATEPART(SECOND,GETDATE())
	  ,DATEPART(SS,GETDATE())
	  ,DATEPART(S,GETDATE())

-- 取得指定日期之 [毫秒 milliseconf]
SELECT DATEPART(MILLISECOND,GETDATE())
	  ,DATEPART(MS,GETDATE())

--================================================================================
-- 練習 : DATEADD (回傳 "日期" )
--================================================================================

-- 取得指定日期 "加 1 年" 及 "減 1 年" 的日期
SELECT DATEADD(YEAR,1,GETDATE())
	  ,GETDATE()
	  ,DATEADD(YEAR,-1,GETDATE())

-- 取得指定日期 "加 1 季" 及 "減 1 季" 的日期
SELECT DATEADD(QUARTER,1,GETDATE())
	  ,GETDATE()
	  ,DATEADD(QUARTER,-1,GETDATE())

-- 取得指定日期加 1 月及減 1 月的日期
SELECT DATEADD(MONTH,1,GETDATE())
	  ,GETDATE()
	  ,DATEADD(MONTH,-1,GETDATE())

-- 取得指定日期 "加 1 日" 及 "減 1 日" 的日期
SELECT DATEADD(DAY,1,GETDATE())
	  ,GETDATE()
	  ,DATEADD(DAY,-1,GETDATE())
SELECT DATEADD(DAYOFYEAR,1,GETDATE())
	  ,GETDATE()
	  ,DATEADD(DAYOFYEAR,-1,GETDATE())
SELECT DATEADD(WEEKDAY,1,GETDATE())
	  ,GETDATE()
	  ,DATEADD(WEEKDAY,-1,GETDATE())

-- 取得指定日期 "加 1 週" 及 "減 1 週" 的日期
SELECT DATEADD(WEEK,1,GETDATE()),GETDATE(),DATEADD(WEEK,-1,GETDATE())

-- 取得指定日期 "加 1 小時" 及 "減 1 小時" 的日期
SELECT DATEADD(HOUR,1,GETDATE()),GETDATE(),DATEADD(HOUR,-1,GETDATE())

-- 取得指定日期 "加 1 分鐘" 及 "減 1 分鐘" 的日期
SELECT DATEADD(MINUTE,1,GETDATE()),GETDATE(),DATEADD(MINUTE,-1,GETDATE())

-- 取得指定日期 "加 1 秒鐘" 及 "減 1 秒鐘" 的日期
SELECT DATEADD(SECOND,1,GETDATE()),GETDATE(),DATEADD(SECOND,-1,GETDATE())

-- 取得指定日期 "加 50 毫秒" 及 "減 50 毫秒" 的日期
SELECT DATEADD(MILLISECOND,50,GETDATE()),GETDATE(),DATEADD(MILLISECOND,-50,GETDATE())

--================================================================================
-- 練習 : DATEDIFF (依指定格式, 回傳兩個日期的差異值)
--================================================================================

-- 取得差異[年度]
SELECT DATEDIFF(YEAR,'2009/9/30 21:30:30',GETDATE())

-- 取得差異[季數]
SELECT DATEDIFF(QUARTER,'2009/9/30 21:30:30',GETDATE())

-- 取得差異[月份]
SELECT DATEDIFF(MONTH,'2009/9/30 21:30:30',GETDATE())
--SELECT DATEDIFF(MONTH,GETDATE(),'2009/9/30 21:30:30')

-- 取得差異[天數]
SELECT DATEDIFF(DAY,'2009/9/30 21:30:30',GETDATE())
SELECT DATEDIFF(DAYOFYEAR,'2009/9/30 21:30:30',GETDATE())

-- 取得差異[週數]
SELECT DATEDIFF(WEEK,'2009/9/30 21:30:30',GETDATE())

-- 取得差異[時間]
SELECT DATEDIFF(HOUR,'2009/9/30 21:30:30',GETDATE())

-- 取得差異[分鐘]
SELECT DATEDIFF(MINUTE,'2009/9/30 21:30:30',GETDATE())

-- 取得差異[秒鐘]
SELECT DATEDIFF(SECOND,'2009/9/30 21:30:30',GETDATE())

-- 取得差異[毫秒] (注意Overflow)
SELECT DATEDIFF(MILLISECOND,GETDATE(),'2010/10/1 21:30:30')

--================================================================================
-- 練習 : 數學函數
--================================================================================
-- 練習 : ABS		(傳回運算式的絶對值)
SELECT ABS(-500),ABS(0),ABS(500)

-- 練習 : SIGN		(傳回運算式的符號值[負數:-1 零:0 正數:1])
SELECT SIGN(-500),SIGN(0),SIGN(500)

-- 練習 : CEILING	(傳回大於或等於運算式的最小整數值)
SELECT CEILING(500),CEILING(500.2),CEILING(-500),CEILING(-500.2)

-- 練習 : FLOOR		(傳回小於或等於運算式的最大整數值)
SELECT FLOOR(500),FLOOR(500.2),FLOOR(-500),FLOOR(-500.2)

-- 練習 : SQRT		(傳回運算式的平方根)
SELECT SQRT(179),SQRT(16)

-- 練習 : SQUARE		(傳回運算式的平方)
SELECT SQUARE(8),SQUARE(12)

-- 練習 : POWER		(傳回運算式指定乘冪的值)
SELECT POWER(2,3),POWER(5,3)


-- 練習 : ROUND		(傳回運算式指定乘冪的值)
-- 四捨五入到整數個位數
SELECT ROUND(1.4, 0)
	  ,ROUND(1.5, 0)
	  ,ROUND(2.4, 0)
	  ,ROUND(2.5, 0)

-- 四捨五入到整數十位數, 百位數, 千位數
-- 長度為負值時, 若超過整數位數, 一律傳回0
SELECT ROUND(463.4, -1)
	  ,ROUND(463.4, -2)
	  ,ROUND(463.4, -3) --左3位四捨五入，超過原本長度
	  ,ROUND(463.4, -4)
-- BUG? OVERFLOW ERROR
SELECT ROUND(548.58,-3)

-- 無條件捨去小數位 (第三個參數若忽略, 預設為0即採四捨五入, 若輸入非0值即採捨去法)
SELECT ROUND(1.4, 0, 1)
	  ,ROUND(1.5, 0, 1)
	  ,ROUND(2.4, 0, 1)
	  ,ROUND(2.5, 0, 1)


-- 練習 : RAND (傳回0 ~ 1的隨機FLOAT值)
-- 沒有使用參數即未指定初始值, 則每次執行都會產生不同的結果
SELECT RAND()
-- 使用參數即指定初始值(Seed), 則每次執行都會產生相同的結果
SELECT RAND(200),RAND(200),RAND(),RAND()

--================================================================================
-- 練習 : 中繼資料函數
--================================================================================
-- 取得欄位定義長度(以 "位元組" 為單位)
SELECT Col_Length('PRODUCT','CATEGORYID')
	  ,Col_Length('PRODUCT','PRICE')
	  ,Col_Length('PRODUCT','UNIT')
--				   ↑Table    ↑Column

--Reference: https://msdn.microsoft.com/zh-tw/library/ms187812(v=sql.120).aspx
--================================================================================
-- 練習 : 安全性函數
--================================================================================
-- 取得登入帳號名稱
SELECT SUSER_NAME()
	  ,CURRENT_USER
	  ,USER_ID()
	  ,USER_NAME()  
	  ,SCHEMA_NAME()

--================================================================================
-- 練習 : 其他函數
--================================================================================
--================================================================================
-- 取得執行階段使用的工具名稱, 登入帳號名稱, 前端機器名稱
SELECT APP_NAME() AS [連線軟體]
	  ,SYSTEM_USER AS [登入使用者]
	  ,HOST_NAME() AS [主機名稱]


--================================================================================
-- 練習 : NULLIF (兩個運算式 "相等" 傳回NULL, 否則傳回 [第一個運算式的值] )
SELECT NULLIF(1,1)
	  ,NULLIF(2,1)
	  ,NULLIF('A','a')
	  ,NULLIF('B','C')

-- 練習 : COALESCE (回傳引數中第一個 [非NULL的運算值] )
SELECT COALESCE(
		 NULLIF(1, 1)
		,NULLIF('123', '123') 
		,NULLIF(10.7, 1)
	)

SELECT COALESCE(
		 NULLIF(1, 1)
		,NULLIF('123', '123')
		,NULLIF(10.7, 10.70)
	)

-- 練習 : ISNULL (若[運算式]的值為NULL, 則傳回 [替代值] 否則傳回 [運算值] )
SELECT CATEGORYID
	  ,ISNULL(CATEGORYID,'無')
	  ,PRODUCTNAME 
FROM PRODUCT

SELECT ISNULL(CATEGORYID,'無')+' / '+PRODUCTNAME AS 產品
	  ,PRICE AS 價格 
FROM PRODUCT


-- 練習 : ISNUMERIC (回傳值=1表示運算式可轉換為數值資料型態,否則回傳0)
SELECT ISNUMERIC('123')
	  ,ISNUMERIC('123.5')
	  ,ISNUMERIC('12,345.4545')
	  ,ISNUMERIC('123ABCDEFG')  --非數值

-- 練習 : DATALENGTH (傳回運算式的位元組個數)
SELECT DATALENGTH('ASUS')  --英數算1個BYTE
	  ,DATALENGTH('電腦％') --中文及全形算2個BYTE

SELECT DATALENGTH(N'ASUS')  -- Unicode皆為2個BTYE
	  ,DATALENGTH(N'電腦％')

SELECT PRODUCTNAME
	  ,DATALENGTH(PRODUCTNAME) AS [Data Length]
FROM PRODUCT
							-- ? 都是兩個BYTE, 因欄位型態為NVARCHAR

--================================================================================
-- 練習 : IDENTITY (專為SELECT INTO子句提供自動取號的欄位)
--		  NEWID (建立 "UNIQUEIDENTIFIER類型" 的全球唯一值)
--		  @@ROWCOUNT (回傳上一個敍述影響的資料列筆數)

SELECT IDENTITY(INT,1,1) AS ID
	  ,NEWID() AS ID2
	  ,PRODUCTNAME 
INTO PRODUCT2 
FROM PRODUCT

SELECT '新增'+CAST(@@ROWCOUNT AS VARCHAR(10))+'筆資料.'
SELECT * FROM PRODUCT2
SELECT '取得'+CAST(@@ROWCOUNT AS VARCHAR(10))+'筆資料.'

--================================================================================
-- 練習 : @@ERROR (回傳最後敍述執行的錯誤代碼)
DROP TABLE PRODUCT2
SELECT * FROM PRODUCT2
GO
SELECT @@ERROR AS [Error Number]
GO

SELECT '影響'+@@ROWCOUNT+'筆資料.'
GO
SELECT @@ERROR AS [Error Number]
GO
--================================================================================
-- 練習 : CONVERT (轉換資料型態)
-- 利用CONVERT將日期字串轉成日期格式, 數值轉成文字型態, 文字轉成整數型態
SELECT CONVERT(DATETIME,'2010/11/9')
	  ,CONVERT(VARCHAR(5),12345)
	  ,CONVERT(INT,'12345')

-- 利用CONVERT將 "日期時間型態轉" 換成 "指定格式" 的字串, 傳入第三個參數決定格式字串, 
-- 忽略傳回預設格式. 格式12及112為ISO格式. 12不含世紀, 112包含, 114取時間
SELECT CONVERT(VARCHAR(30),GETDATE())
	  ,CONVERT(VARCHAR(30),GETDATE(),12)
	  ,CONVERT(VARCHAR(30),GETDATE(),112)
	  ,CONVERT(VARCHAR(30),GETDATE(),114)


-- 練習 : CAST (轉換資料型態)
SELECT CAST('2010/11/9' AS DATETIME)
	  ,CAST(12345 AS VARCHAR(5))
	  ,CAST('12345' AS INT)

--================================================================================
-- 練習 : ROW_NUMBER (指定資料 "輸出的順序" , 由1開始自動編號. 亦可指定群組, 分群後再產生序號)
-- 將產品資料表依折扣數及產品名稱排序自動產生序號欄位

SELECT DISCOUNT
	  ,PRODUCTNAME
	  ,ROW_NUMBER() OVER (ORDER BY DISCOUNT,PRODUCTNAME) AS SNO 
FROM PRODUCT

-- 將產品資料表依折扣數及產品名稱排序, 並依產品類別劃分群組自動產生序號欄位

SELECT CATEGORYID
	  ,DISCOUNT
	  ,PRODUCTNAME
	  ,ROW_NUMBER() OVER (PARTITION BY CATEGORYID ORDER BY DISCOUNT,PRODUCTNAME) AS SNO 
FROM PRODUCT
--================================================================================
-- 排序函數 (Ranking)
--================================================================================

-- RANK() 
-- (指定資料 "輸出的順序" , 由1開始自動編號, 遇到 "相同資料" 使用 "相同的序號", 
-- 下一筆資料以 "跳號" 取得. 亦可指定群組, 分群後再產生序號)

-- DENSE_RANK() --> densely
-- (指定資料 "輸出的順序" , 由1開始自動編號, 遇到 "相同資料" 使用 "相同的序號",
-- 下一筆資料以 "連號" 取得. 亦可指定群組, 分群後再產生序號)

-- 將產品資料表依折扣數排序自動產生低折扣數的排名

SELECT DISCOUNT
	  ,PRODUCTNAME
	  ,RANK() OVER (ORDER BY DISCOUNT) AS [SNO USING RANK]
	  ,DENSE_RANK() OVER (ORDER BY DISCOUNT) AS [SNO USING DENSE_RANK]
FROM PRODUCT

-- 將產品資料表依折扣數排序, 並依產品類別劃分群組產生每個產品類別的低折扣數排名

SELECT CATEGORYID
	  ,DISCOUNT
	  ,PRODUCTNAME
	  ,RANK() OVER (PARTITION BY CATEGORYID ORDER BY DISCOUNT) AS [SNO USING RANK]
	  ,DENSE_RANK() OVER (PARTITION BY CATEGORYID ORDER BY DISCOUNT) AS [SNO USING DENSE_RANK]  
FROM PRODUCT

-- NTILE()
-- (指定資料 "輸出的順序" , 參數將指定資料 "分成多少群組", 將資料列 "平均分配" 到群組中)

-- 依產品編號排序, 將產品均分為3個群組
SELECT PRODUCTID
	  ,PRODUCTNAME
	  ,NTILE(3) OVER (ORDER BY PRODUCTID) AS [SNO]
FROM PRODUCT

-- 依產品價格排序, 將產品均分為3個群組
SELECT PRICE
	  ,PRODUCTID
	  ,PRODUCTNAME
	  ,NTILE(3) OVER (ORDER BY PRICE) AS [SNO]
FROM PRODUCT

--================================================================================
-- 練習 : 字串函數
--================================================================================

-- 練習 : ASCII (傳回字元左側的ASCII CODE)
SELECT ASCII('Z'),ASCII('A'),ASCII('XYZ'),ASCII('xyz')


-- 練習 : CHAR (傳回ASCII CODE字元)
SELECT CHAR(65),CHAR(97)


-- 練習 : UNICODE
-- (傳回字元在UNICODE CODE中的定義整數值)
SELECT UNICODE('A')		--en charactor: ASCII
	  ,UNICODE('一')		--special symbel: UNICODE
	  ,UNICODE(N'一')
	  ,UNICODE('栢')		--
	  ,UNICODE(N'栢')
	  ,UNICODE('堃')
	  ,UNICODE(N'堃')


-- 練習 : NCHAR 
-- (傳回 UNICODE CODE 字元)
SELECT NCHAR(65)
	  ,NCHAR(97)
	  ,NCHAR(21894)
	  ,NCHAR(63)


-- 練習 : CHARINDEX 
-- (回傳指定字串的 "起始位置" )
SELECT PRODUCTNAME
	  ,CHARINDEX('入門',PRODUCTNAME,1) 
FROM PRODUCT 

SELECT PRODUCTNAME
	  ,CHARINDEX('S', PRODUCTNAME, 1)
	  ,CHARINDEX('S', PRODUCTNAME, CHARINDEX('S',PRODUCTNAME,1)+1) --下一個'S'
FROM PRODUCT 


-- 練習 : PATINDEX --> pattern index
-- (回傳指定運算式中的模式第一次出現的起始位置, 可搭配萬用字元使用)

SELECT PRODUCTNAME
	  ,PATINDEX('%入門%', PRODUCTNAME) 
FROM PRODUCT 

SELECT PRODUCTNAME
	  ,PATINDEX('%A%S%',  PRODUCTNAME)
	  ,PATINDEX('%A__S%', PRODUCTNAME) 
FROM PRODUCT 


-- 練習 : LEFT (由 "左邊取得" 指定位元數的字串)
--		  RIGHT (由 "右邊取得"指定位元數的字串)
SELECT PRODUCTNAME
	  ,LEFT(PRODUCTNAME,4)
	  ,RIGHT(PRODUCTNAME,4)
FROM PRODUCT 

-- 練習 : LEN (傳回字串的 "字元數")
SELECT PRODUCTNAME
	  ,LEN(PRODUCTNAME)
FROM PRODUCT 

-- 練習 : LOWER (字串轉小寫)
--		  UPPER (字串轉大寫)
SELECT PRODUCTNAME
	  ,LOWER(PRODUCTNAME)
	  ,UPPER(PRODUCTNAME)
FROM PRODUCT 

-- 練習 : LTRIM (從左邊移除空白字元)
--		  RTRIM (從右邊移除空白字元)
--		  REVERSE (反轉字串順序)
SELECT LTRIM('    123 ABC    ')+''''
	  ,RTRIM('    123 ABC    ')+''''
	  ,REVERSE('123 ABC')

-- 練習 : REPLACE (利用新字串取代指定字串)
SELECT REPLACE('123 456 789', ' ', 'x')

--	練習 : STUFF (從 "指定位置" 刪除 "指定長度" 的字串, 並 "加入指定字串")
SELECT STUFF('123456789', 4, 3, 'ABCD') --位置4開始刪除3個字元並插入'ABCD'

-- 練習 : REPLICATE ("重覆顯示" "指定次數" 的字元)
--		  SPACE (回傳 "指定次數" 的空白字元)
SELECT PRODUCTNAME, CAST(QTY AS VARCHAR(15))+REPLICATE('-',10)+UNIT FROM PRODUCT ;
SELECT PRODUCTNAME, CAST(QTY AS VARCHAR(15))+REPLICATE(SPACE(1),10)+UNIT FROM PRODUCT ;
SELECT PRODUCTNAME, CAST(QTY AS VARCHAR(15))+SPACE(10)+UNIT FROM PRODUCT ;

-- 練習 : STR (將數值轉換成字串, 忽略長度時預設值為10, "忽略小數位"時預設值為0)

SELECT STR(123.45)
UNION ALL
SELECT STR(12345)
UNION ALL
SELECT STR(1234567)
UNION ALL
SELECT STR(123456789)
UNION ALL
SELECT STR(1234567890)
UNION ALL
SELECT STR(12345678901)  --超過預設長度10,顯示*

--      預設字串長度↓  ↓不忽略小數
SELECT STR(123.45, 5, 1)
UNION ALL
SELECT STR(123.45, 6, 1)
UNION ALL
SELECT STR(123.45, 7, 1)
UNION ALL
SELECT STR(123.45, 8, 1)
UNION ALL
SELECT STR(123.45, 9, 1);

SELECT STR(123.45, 7, 4); -- 長度不夠時, 會截斷小數位數
SELECT STR(123.45, 2, 4); -- 長度小於整數長度時, 回傳值為**

-- 練習 : SUBSTRING (回傳 "指定位置" "指定長度" 的字串)
SELECT PRODUCTNAME
	  ,SUBSTRING(PRODUCTNAME, 8, 1)
	  ,SUBSTRING(PRODUCTNAME, 8, 10)
FROM PRODUCT
