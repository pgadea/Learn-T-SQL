
--There are many objects that we can use the ALTER statement against.

--The following examples will use ALTER statement against the table

--The alter specification value depends upon what we are trying to modify

--ALTER TABLE table_name ADD column_name datatype; 

--ALTER TABLE table_name MODIFY COLUMN column_name datatype;

--ALTER TABLE table_name DROP COLUMN column_name; 

--ALTER TABLE table_name
--ADD CONSTRAINT MyUniqueConstraint CHECK (CONDITION);

--ALTER TABLE table_name
--DROP CONSTRAINT MyUniqueConstraint;

USE TSQL
GO

Create Table Employee
(Fname varchar (20),
Lname varchar (20),
Age int)


Insert Into Employee
Values('Bob','Smith',34),
('Tom','Smith',22),
('Ben','Smith',45),
('Sam','Smith',21),
('Todd','Smith',33),
('Matt','Smith',56)

Select * From Employee

--Exmaples of ALTER command:
 
--USE ALTER TO ADD COLUMN 

ALTER TABLE Employee
ADD DateOfBirth date

-- Add multiple colums
ALTER TABLE employee
ADD Mname VARCHAR(50),
     Gender VARCHAR(40)

Select * From Employee

--USE ALTER CHANGE DATA TYPE

ALTER TABLE Employee
ALTER COLUMN DateOfBirth varchar(15)


--USE ALTER DROP COLUMN

ALTER TABLE Employee
DROP COLUMN DateOfBirth

--USE ALTER TO ADD CONSTRAINT

ALTER TABLE Employee
ADD CONSTRAINT ck_Employee_Age CHECK (Age >1 and Age <130); --<< cannot insert value less than 1 or greater than 130

--Verify:

Select Age from Employee

Insert Into Employee (Age) --<< as the age 30 is within the boundary of the check constraint, it will insert
Values (30)

Insert Into Employee (Age) --<< as the age 0 is out side the boundary of the check constraint, it will fail to insert
Values (0)

Insert Into Employee (Age) --<< as the age 131 is out side the boundary of the check constraint, it will fail to insert
Values (131)

--USE ALTER TO DROP CONSTRAINT

ALTER TABLE Employee
DROP CONSTRAINT ck_Employee_Age;

Drop Table Employee



 

 