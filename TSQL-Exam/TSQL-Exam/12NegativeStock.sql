USE TSQL_Exam 
GO

--================================================================================
--Query:
--		���o "�t�w�s���~"�C
--		����X�G���~�N�X�B���~�W�١B�t�ӦW�١B����B�w�s�q�B���
--		�ƧǡG�w�s�q
--================================================================================

SELECT p.ID AS [���~�N�X]
	  ,p.NAME AS [���~�W��]
	  ,spl.NAME AS [�t�ӦW��]
	  ,p.UPRICE AS [���]
	  ,p.QTY AS [�w�s�q]
	  ,p.UNIT AS [���]
FROM PRODUCT AS p
LEFT JOIN CS AS spl
ON p.SUPPLIERID = spl.ID
WHERE p.QTY < 0 AND spl.DTYPE = 2
ORDER BY p.QTY