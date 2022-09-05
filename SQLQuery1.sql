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

sp_tables
sp_columns EmployeeKist
sp_rename EmployeeList, EmpTable

Drop table EmpTable

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

Drop table EmpTable
Drop table DeptTable

ALTER TABLE EmpTable











