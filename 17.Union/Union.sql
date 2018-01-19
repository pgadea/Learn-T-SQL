
--Similar to a join, the UNION operator combines the result set from two or more tables

--However, there are caveats that must be followed when combining data and they are as follows:

--The UNION must have the same number of columns
--The columns must also have similar data types
--The columns in each SELECT statement must be in the same order
--The UNION operator selects only distinct values by default. So, to allow duplicate values, use the ALL keyword with UNION
--ORDER BY command must be used in the last SELECT statement if sorting is used

--The EXCEPT command EXCLUDES data from two or more tables that exist in both tables

--The INTERSECT command INCLUDES data from two or more tables that exist in both tables

--Both the EXCEPT and INTERSECT commands follow the same rules as the UNION.

--Examples of Union, Except, Intersect

USE TSQL
GO

--CREATE NEW TABLE

CREATE TABLE dbo.Buyer
(BuyID int IDENTITY (1,1) NOT NULL PRIMARY KEY,--<<Primary Key
BuyFname varchar (20) NULL,
BuyLname varchar (20) NULL,
Age char (3) NULL)
 
--INSERT DATA

INSERT INTO dbo.Buyer
VALUES
('BOB', 'SMITH','35'),
('TOM', 'JONES','25'),
('MIKE', 'COBAL','15'),
('DREW', 'SHAFFER','75'),
('HENRY', 'WILLIS','37'),
('SAM', 'WILSON','35')--<< This row will exists in both tables for our demo

Select * from dbo.Buyer
 
--CREATE 2nd TABLE

CREATE TABLE dbo.Supplier
(SuppID int IDENTITY (1,1) NOT NULL PRIMARY KEY, --<<Primary Key
SuppFname varchar (20) NULL,
SuppLname varchar (20) NULL,
Age char (3) NULL)
 
--INSERT DATA

INSERT INTO dbo.Supplier
VALUES
('Jack', 'Supplies','35'),
('Mike', 'Supplies','25'),
('Jessy', 'Supplies','15'),
('DREW', 'Supplies','75'),
('John', 'Supplies','37'),
('Mary', 'Supplies','35'),
('SAM', 'WILSON','35') --<<Duplicate value shared by both tables

Select * from dbo.Supplier
 
--USE OF UNION operator combines the result set from two or more tables.The UNION operator selects only distinct values by default

SELECT [BuyFname],[BuyLname]
FROM [dbo].[Buyer]
UNION
SELECT [SuppFname],[SuppLname]
FROM [dbo].[Supplier]
-- 12 Records

--USE OF UNION with ALL. To allow duplicate values, use the ALL keyword with UNION


SELECT [BuyFname],[BuyLname]
FROM [dbo].[Buyer]
UNION
ALL --<< Using ALL Keyword to view duplicate records between the tables
SELECT [SuppFname],[SuppLname]
FROM [dbo].[Supplier]
ORDER BY BuyFname --<< ORDER BY USED IN THE LAST SELECT STATEMENT
-- 13 Records (SAM WILSON is displayed twice because of ALL Keyword)

--USE OF EXCEPT. Exclude data from two or more tables that exist in both tables

SELECT [BuyFname],[BuyLname]
FROM [dbo].[Buyer]
EXCEPT
SELECT [SuppFname],[SuppLname]
FROM [dbo].[Supplier]
--Note SAM WILSON is NOT INCLUDED in the results as it exists in both tables

--USE OF INTERSECT. Command INCLUDED data from two or more tables that exist in both tables

SELECT [BuyFname],[BuyLname]
FROM [dbo].[Buyer]
INTERSECT
SELECT [SuppFname],[SuppLname]
FROM [dbo].[Supplier]
--Note SAM WILSON IS included in the results as it exists in both tables
 
--CLEANING UP

DROP TABLE Supplier
DROP TABLE Buyer

