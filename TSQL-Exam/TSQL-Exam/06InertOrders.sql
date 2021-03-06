USE TSQL_Exam
GO

TRUNCATE TABLE ORDERS
GO
TRUNCATE TABLE ORDERS_LOG
GO

usp_InsertOrders 'G','O140110001',2,'20140110','1001','P001',3,33990,120000 
GO
usp_InsertOrders 'G','O140110001',3,'20140110','1001','P005',3,2700,9000 
GO
usp_InsertOrders 'G','O140110001',4,'20140110','1001','P010',2,1500,3000 
GO
usp_InsertOrders 'G','O150630001',1,'20150630','1001','P008',1,1100,1100 
GO
usp_InsertOrders 'G','O150630001',2,'20150630','1001','P009',2,3499,7000 
GO
usp_InsertOrders 'G','O150630002',1,'20150630','1002','P012',50,2500,125000 
GO
usp_InsertOrders 'G','O140710001',1,'20140710','1003','P012',10,2000,20000 
GO
usp_InsertOrders 'G','O140710001',2,'20140710','1003','P002',10,23900,239000 
GO
usp_InsertOrders 'G','O140710001',3,'20140710','1003','P011',4,2500,100000 
GO
usp_InsertOrders 'G','O150214001',1,'20150214','1003','P009',1,3288,4150 
GO
usp_InsertOrders 'G','O150214001',2,'20150214','1003','P005',1,2700,2850 
GO
usp_InsertOrders 'G','O140322001',2,'20140322','1005','P013',2,1880,7500 
GO
usp_InsertOrders 'G','O140322001',4,'20140322','1005','P001',2,34990,70000 
GO
usp_InsertOrders 'G','O140322001',6,'20140322','1005','P002',2,20900,42000 
GO
usp_InsertOrders 'G','O141105001',10,'20141105','1005','P004',20,3400,70000 
GO
usp_InsertOrders 'G','O141105001',20,'20141105','1005','P007',5,2588,13000 
GO
usp_InsertOrders 'G','O141105001',30,'20141105','1005','P009',40,3288,132000 
GO
usp_InsertOrders 'G','O141105001',40,'20141105','1005','P006',40,3990,159600 
GO
usp_InsertOrders 'G','O141105001',50,'20141105','1005','P099',1,132000,132000 
GO
usp_InsertOrders 'G','O150820099',1,'2015080','1005','P0111',11,28990,318890 
GO
usp_InsertOrders 'G','O140907001',1,'1030907','1006','P010',100,129,12900 
GO
usp_InsertOrders 'G','O141130002',1,'20141130','1006','P006',1,3990,3990 
GO
usp_InsertOrders 'G','O141130002',1,'20141130','1006','P009',2,3288,3288 
GO
usp_InsertOrders 'G','O141130002',1,'20141130','1006','P019',3,1880,7500 
GO
usp_InsertOrders 'G','O141130002',1,'20141130','1006','P001',4,34990,70000 
GO
usp_InsertOrders 'G','O991231099',1,'20991231','1006','P006',1,3990,3990 
GO
usp_InsertOrders 'G','O991231099',2,'20991231','1006','P009',1,3288,3288 
GO
usp_InsertOrders 'G','O991231099',3,'20991231','1006','P013',2,1880,7500 
GO
usp_InsertOrders 'G','O991231099',4,'20991231','1006','P001',2,34990,70000 
GO
usp_InsertOrders 'G','O141010013',1,'20141010','1007','P009',1,3288,3288 
GO
usp_InsertOrders 'G','O140430030',1,'20140430','1008','P012',7,2100,14100 
GO
usp_InsertOrders 'G','O140430030',2,'20140430','1008','P002',7,20900,147000 
GO
usp_InsertOrders 'G','O150918024',1,'20140918','1009','P013',30,700,21000 
GO
usp_InsertOrders 'G','O150918024',2,'20140918','1009','P001',30,33990,120000 
GO
usp_InsertOrders 'G','O150918024',3,'20140918','1009','P003',2,10900,22000 
GO
usp_InsertOrders 'G','O150918024',4,'20140918','1009','P006',30,4100,123000 
GO
usp_InsertOrders 'G','O150918024',5,'20140918','1009','P010',30,1300,39000 
GO
usp_InsertOrders 'G','O150320005',1,'20150320','1010','P008',5,1100,5500 
GO
usp_InsertOrders 'G','O150320005',2,'20150320','1010','P011',5,3100,15500 
GO
usp_InsertOrders 'G','O140321013',1,'20140321','1011','P011',10,2988,30000 
GO
usp_InsertOrders 'Z','O141105001',1,'20141105','1005','P004',20,3400,70000 
GO
usp_InsertOrders 'Z','O141105001',1,'20141105','1005','P004',20,3400,70000 
GO
usp_InsertOrders 'Z','O141105001',2,'20141105','1005','P007',5,2588,13000 
GO
usp_InsertOrders 'Z','O141105001',2,'20141105','1005','P007',5,2588,13000 
GO
usp_InsertOrders 'Z','O141105001',3,'20141105','1005','P009',40,3288,132000 
GO
usp_InsertOrders 'Z','O141105001',3,'20141105','1005','P009',40,3288,132000 
GO
usp_InsertOrders 'Z','O141105001',4,'20141105','1005','P006',40,3990,159600 
GO
usp_InsertOrders 'Z','O141105001',4,'20141105','1005','P006',40,3990,159600 
GO
usp_InsertOrders 'Z','O141105002',1,'20141105','1005','P004',1,3400,3400 
GO
usp_InsertOrders 'Z','O141105002',1,'20141105','1005','P004',1,3400,3400 
GO
usp_InsertOrders 'Z','O141105002',2,'20141105','1005','P007',1,2588,2588 
GO
usp_InsertOrders 'Z','O141105002',3,'20141105','1005','P009',1,3288,3288 
GO
usp_InsertOrders 'Z','O141105002',3,'20141105','1005','P009',1,3288,3288 
GO
usp_InsertOrders 'Z','O141105002',4,'20141105','1005','P006',1,3990,3990 
GO
usp_InsertOrders 'Z','O141105003',1,'20141105','1005','P009',1,3288,3288 
GO
usp_InsertOrders 'Z','O141105003',1,'20141105','1005','P009',1,1880,7500 
GO


