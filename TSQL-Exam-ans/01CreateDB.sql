-- �إ߸�Ʈw "TSQL_Exam"
IF  EXISTS 
(
	SELECT * FROM sys.databases 
	WHERE NAME=N'TSQL_Exam'
) DROP DATABASE [TSQL_Exam]
CREATE DATABASE [TSQL_Exam]
GO
ALTER DATABASE [TSQL_Exam] SET RECOVERY SIMPLE WITH NO_WAIT
GO
ALTER DATABASE [TSQL_Exam] SET COMPATIBILITY_LEVEL = 100
GO
