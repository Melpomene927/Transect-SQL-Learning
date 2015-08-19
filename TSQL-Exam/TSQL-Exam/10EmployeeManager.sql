USE TSQL_Exam 
GO

--================================================================================
--Query:
--		���o�C�� "���u" �� "�D��"�A�S���D����� "�Ŧr��"�C
--		����X�G���u�N�X�B���u�W�١B�����W�١B�D�ަW��
--================================================================================

SELECT e.ID AS [���u�N�X]
	  ,e.NAME AS [���u�W��]
	  ,ISNULL(d.NAME,'') AS [�����W��]
	  ,ISNULL(eb.NAME,'') AS [�D�ަW��]
FROM EMPLOYEE AS e
LEFT JOIN DEPARTMENT AS d
ON e.DEPTID = d.ID
LEFT JOIN EMPLOYEE AS eb
ON d.MANAGERID = eb.ID
ORDER BY e.ID