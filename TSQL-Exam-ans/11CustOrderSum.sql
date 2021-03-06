﻿-- 取得客戶代碼
DECLARE @CUSTID NVARCHAR(10)
SELECT @CUSTID=ID FROM CS WHERE NAME=N'松栢'

-- 取得客戶 2014 去年度所有產品的訂貨總量及總金額
SELECT O.PRODID,
ISNULL(P.NAME,'MISSING') PRODNAME,
COALESCE(C.NAME,P.CATEID,'MISSING') CATENAME,
SUM(O.QTY) TOTALQTY,
SUM(O.AMOUNT) TOTALAMOUNT
FROM ORDERS O
LEFT JOIN PRODUCT P
ON O.PRODID=P.ID
LEFT JOIN PRODUCTCATEGORY C
ON P.CATEID=C.ID
WHERE COMPID='G'
AND CUSTID=@CUSTID
AND ORDERDATE BETWEEN '20140101' AND '20141231'
GROUP BY 
O.PRODID,
ISNULL(P.NAME,'MISSING'),
COALESCE(C.NAME,P.CATEID,'MISSING')
ORDER BY 
O.PRODID
