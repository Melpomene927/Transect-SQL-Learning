USE TSQL_Exam 
GO

--================================================================================
--Query:
--		���o "G���q" 2014�~4�� �� ���~��2015�~3�� "�~��" ��
--		 "���~�q�f�`�q" �� "�`���B"�A�� "���`���B�ƦW"�C
--
--		*����X�G�~�ȥN�X�B�~�ȦW�١B���~�N�X�B���~�W�١B�`�ƶq�B�`���B�B�W��
--		*�W���G�̷~�ȥN�X���s�A�H�s�����o
--		�ƧǡG�~�ȥN�X
--================================================================================


SELECT e.ID AS [�~�ȥN�X]
	  ,e.NAME AS [�~�ȦW��]
	  ,orank.PRODID AS [���~�N�X]
	  ,orank.NAME AS [���~�W��]
	  ,sum(orank.cusCount) AS [�`�ƶq]
	  ,sum(orank.cusSum) AS [�`���B]
	  ,DENSE_RANK() OVER(partition by e.ID order by sum(orank.cusSum)DESC) AS [�W��]
FROM EMPLOYEE AS e
INNER JOIN CS AS cus
ON e.ID = cus.SALES AND e.DEPTID = N'001'
INNER JOIN
	(SELECT o.CUSTID
		  ,o.PRODID
		  ,p.NAME
		  ,Count(o.ORDERDATE) AS [cusCount]
		  ,Sum(o.AMOUNT) AS [cusSum]
	FROM ORDERS AS o
	INNER JOIN PRODUCT AS p
	ON o.PRODID = p.ID
	WHERE o.COMPID = N'G' AND o.ORDERDATE Between N'20140401' AND N'20150331'
	GROUP BY o.CUSTID
		  ,o.PRODID
		  ,p.NAME) AS orank
ON orank.CUSTID = cus.ID AND cus.DTYPE = N'1'
WHERE e.DEPTID = N'001'
GROUP BY e.ID 
	  ,e.NAME 
	  ,orank.PRODID
	  ,orank.NAME
ORDER BY e.ID




