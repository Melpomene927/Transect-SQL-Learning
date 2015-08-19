USE TSQL_Exam 
GO


---------------------------------------------------
--	Create table COMPANY
---------------------------------------------------
IF  EXISTS 
(
	SELECT * FROM sys.objects 
	WHERE object_id = OBJECT_ID(N'[dbo].[COMPANY]') 
	AND type in (N'U')
) DROP TABLE [dbo].[COMPANY]

Create table [COMPANY](
	ID nvarchar(2),
	NAME nvarchar(40)
)

---------------------------------------------------
--	Create table DEPARTMENT
---------------------------------------------------
IF  EXISTS 
(
	SELECT * FROM sys.objects 
	WHERE object_id = OBJECT_ID(N'[dbo].[DEPARTMENT]') 
	AND type in (N'U')
) DROP TABLE [dbo].[DEPARTMENT]

Create table [DEPARTMENT](
	ID nvarchar(6),
	NAME nvarchar(40),
	MANAGERID nvarchar(10)
)

---------------------------------------------------
--	Create table EMPLOYEE
---------------------------------------------------
IF  EXISTS 
(
	SELECT * FROM sys.objects 
	WHERE object_id = OBJECT_ID(N'[dbo].[EMPLOYEE]') 
	AND type in (N'U')
) DROP TABLE [dbo].[EMPLOYEE]

Create table [EMPLOYEE](
	ID nvarchar(10),
	NAME nvarchar(20),
	DEPTID nvarchar(6)
)

---------------------------------------------------
--	Create table CS
---------------------------------------------------
IF  EXISTS 
(
	SELECT * FROM sys.objects 
	WHERE object_id = OBJECT_ID(N'[dbo].[CS]') 
	AND type in (N'U')
) DROP TABLE [dbo].[CS]

Create table CS(
	ID nvarchar(10),
	NAME nvarchar(40),
	DTYPE nvarchar(1),
	SALES nvarchar(10)
)

---------------------------------------------------
--	Create table PRODUCTCATEGORY
---------------------------------------------------
IF  EXISTS 
(
	SELECT * FROM sys.objects 
	WHERE object_id = OBJECT_ID(N'[dbo].[PRODUCTCATEGORY]') 
	AND type in (N'U')
) DROP TABLE [dbo].[PRODUCTCATEGORY]

Create table PRODUCTCATEGORY(
	ID nvarchar(10),
	NAME nvarchar(40)
)

---------------------------------------------------
--	Create table PRODUCT
---------------------------------------------------
IF  EXISTS 
(
	SELECT * FROM sys.objects 
	WHERE object_id = OBJECT_ID(N'[dbo].[PRODUCT]') 
	AND type in (N'U')
) DROP TABLE [dbo].[PRODUCT]

Create table PRODUCT(
	ID nvarchar(10),
	NAME nvarchar(40),
	CATEID nvarchar(10),
	SUPPLIERID nvarchar(10),
	UPRICE numeric(25,4),
	QTY numeric(25,4),
	UNIT nvarchar(20)
)

---------------------------------------------------
--	Create table ORDERS
---------------------------------------------------
IF  EXISTS 
(
	SELECT * FROM sys.objects 
	WHERE object_id = OBJECT_ID(N'[dbo].[ORDERS]') 
	AND type in (N'U')
) DROP TABLE [dbo].[ORDERS]

Create table ORDERS(
	COMPID nvarchar(2),
	ORDERNO nvarchar(10),
	SNO numeric(25,4),
	ORDERDATE nvarchar(8),
	CUSTID nvarchar(10),
	PRODID nvarchar(10),
	QTY numeric(25,4),
	UPRICE numeric(25,4),
	AMOUNT numeric(25,4)
)


---------------------------------------------------
--	Create table ORDERS_LOG
---------------------------------------------------
IF  EXISTS 
(
	SELECT * FROM sys.objects 
	WHERE object_id = OBJECT_ID(N'[dbo].[ORDERS_LOG]') 
	AND type in (N'U')
) DROP TABLE [dbo].[ORDERS_LOG]

Create table ORDERS_LOG(
	[NO] numeric(25,0) IDENTITY(1,1) NOT NULL,
	TRANSDATE nvarchar(8),
	TRANSTIME nvarchar(9),
	TRANSWS nvarchar(100),
	TRANSUSER nvarchar(100),
	TRANSTYPE nvarchar(1),
	COMPID nvarchar(2),
	ORDERNO nvarchar(10),
	SNO numeric(25,4),
	[DATE] nvarchar(8),
	CUSTID nvarchar(10),
	PRODID nvarchar(10),
	QTY numeric(25,4),
	UPRICE numeric(25,4),
	AMOUNT numeric(25,4)
)

