--Create database SampleManu --- Used to create the database---

---Drop database SampleManu--- Used to delete the database
--- Modify an Existing database
--ALTER DATABASE SampleManu
--MODIFY NAME = FaiTrainingManu

-- -- is the stored procedures of SQL server used to get all the databases of the SQL server instance.

---sp_renamedb FaiTrainingManu , FaiTraining--- Stored proc for renaming an existing database.

Create table EmpTable
(
	EmpId int PRIMARY KEY IDENTITY(1,1),
	EmpName varchar(50) NOT NULL,
	EmpAddress varchar(500) NOT NULL,
	EmpSalary money NOT NULL,
)





Create table DeptTable
(
	DeptId int PRIMARY KEY IDENTITY(1,1),
	DeptName varchar(45) NOT NULL,
)

ALTER TABLE EmpTable
ADD DeptId int not null
references DeptTable(DeptId)

ALTER TABLE EmpTable
add DateOfBirth Date



Insert into DeptTable values('Training')
Insert into DeptTable values('HR')
Insert into DeptTable values('Production')
Insert into DeptTable values('IT')
Insert into DeptTable values('Operations')

sp_columns EmpTable
sp_columns DeptTable
Select * from DeptTable
Select Count(*) From DeptTable
Select Count(*) As NoOfDepts From DeptTable
Select Distinct DeptName From DeptTable
Select Count(Distinct DeptName) as DeptNames From DeptTable
Select DeptName from DeptTable WHERE DEPTID = 3

Insert into EmpTable values('Manojkumar','Bangalore',67000,1,'06-06-2000')
Insert into EmpTable values('Chandra','Pakistan',67000,1,'06-07-2001')
Insert into EmpTable values('Aditya','Mysore',67000,1,'05-08-2002')
Insert into EmpTable values('Chaithanya','Hyderabad',67000,1,'03-09-2003')
Insert into EmpTable values('Prabas','Bangalore',67000,1,'02-10-2004')
Insert into EmpTable values('Allu arjun','Mangalore',67000,1,'06-16-2005')

Select Count(*) from EmpTable
Select * from EmpTable

Select * from EmpTable WHERE EmpAddress = 'Bangalore'

Select Avg(EmpSalary) As AvgSalary from EmpTable WHERE EmpAddress = 'Bangalore'

Select SUM(EmpSalary) As TotalSalariesOfBLR from EmpTable WHERE EmpAddress = 'Bangalore'

Select MAX(EmpSalary) As MaxOfBLR from EmpTable WHERE EmpAddress = 'Bangalore'
Select MAX(EmpSalary) As MinOfBLR from EmpTable WHERE EmpAddress = 'Bangalore'

Select EmpTable.DeptId, Avg(EmpTable.EmpSalary) from EmpTable group By EmpTable.DeptId

Select EmpTable.EmpAddress, Avg(EmpSalary) as AvgSalary from EmpTable group By EmpTable.EmpAddress

--Using WHERE CLAUSE-----

SELECT * FROM EmpTable WHERE EmpName like '%mar%'

SELECT * FROM EmpTable WHERE EmpName LIKE 'A%'

SELECT EmpName,EmpAddress,EmpSalary FROM EmpTable where EmpAddress='Bangalore' AND EmpSalary <100000

Select EmpName,EmpAddress from EmpTable where EmpAddress='Bangalore' OR EmpAddress = 'Mysore'ORDER BY EmpAddress DESC

Select EmpName, EmpAddress,EmpSalary From EmpTable where NOT EmpAddress = 'Bangalore' AND (EmpSalary<50000 OR EmpSalary>100000) 

SELECT EmpName,EmpAddress from EmpTable order by EmpName, EmpAddress DESC

--JOINS------------------------------------------------------------

SELECT EmpTable.*, DeptName from EmpTable INNER JOIN DeptTable
ON EmpTable.DeptId = DeptTable.DeptId

--Left join---
SELECT EmpTable.*,DeptTable.DeptName from EmpTable Left JOIN DeptTable
ON EmpTable.DeptId = DeptTable.DeptId


Insert into DeptTable values('Transport')
Insert into DeptTable values('HouseKeeping')

--Right Join --

SELECT EmpTable.*,DeptTable.DeptName from EmpTable right JOIN DeptTable
ON EmpTable.DeptId = DeptTable.DeptId where DeptTable.DeptId >=1

SELECT EmpTable.*,DeptTable.DeptName from EmpTable full JOIN DeptTable
ON EmpTable.DeptId = DeptTable.DeptId where DeptTable.DeptId >=1

-----Self join---

Select E.EmpName As EmployeeName, B.EmpName as EmployeeName2, E.EmpAddress
From EmpTable E,EmpTable B
where E.EmpId<> B.EmpId
AND E.EmpAddress = B.EmpAddress
Order By B.EmpAddress


Select * INTO EmpRecords From EmpTable where EmpAddress = 'Bangalore'





Update EmpRecords Set DeptId = 4 where DeptId IS NULL

Select * FROM 








