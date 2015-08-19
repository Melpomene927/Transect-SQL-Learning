-- Check Exist
IF Exists (
	Select * From [sys].[databases] 
	Where name = N'TSQL_Exam'
)Drop Database [TSQL_Exam]

-- Create
Create Database [TSQL_Exam]
Go

-- Options
ALTER DATABASE [TSQL_Exam] SET RECOVERY SIMPLE ;
ALTER DATABASE [TSQL_Exam] SET COMPATIBILITY_LEVEL = 90;
