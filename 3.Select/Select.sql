--How to use Data Manipulation Language (DML)

--Data Manipulation Language (DML): SELECT
--The most commonly used command in T-SQL is the SELECT statement. 
--It is used to query or retrieve data from a table or multiple tables.
--To create a simple select query, you can use the specifics columns or retrieve all columns by using the �*� wildcard.

--EXAMPLES OF SELECT COMMAND

USE AdventureWorks2012
GO

--select all columns using the '*'

SELECT *
FROM HumanResources.Department

--select specific columns

SELECT DepartmentID,Name,GroupName
FROM HumanResources.Department
 
--using calculated fields are two or more fields joined to produce a result

SELECT *
FROM [AdventureWorks2012].[Sales].[SalesOrderDetail]

SELECT 
[SalesOrderID],[OrderQty],[UnitPrice],[OrderQty]*[UnitPrice]AS TotalPrice,[ModifiedDate]
FROM [AdventureWorks2012].[Sales].[SalesOrderDetail]

--using concatenation of two or more columns and naming a column

SELECT *
FROM [AdventureWorks2012].[Person].[Person]

SELECT[FirstName],[MiddleName],[LastName],[FirstName]  + ', ' +[MiddleName] + ', ' +[LastName] AS FullName
FROM [AdventureWorks2012].[Person].[Person]

--select statement that returns all rows eliminating duplicates


--create table and populate with duplicate data

Use Master
Go

CREATE DATABASE TSQL

Create Table Vendors
(VendorCity varchar (20),
VendorState varchar (20))

Insert Into Vendors Values ('NewYork','NY')
Insert Into Vendors Values ('NewYork','NY')
Insert Into Vendors Values ('Irvine','CA')
Insert Into Vendors Values ('Irvine','CA')
Insert Into Vendors Values ('Georgetown','DC')
Insert Into Vendors Values ('Georgetown','DC')

Select * from Vendors

SELECT DISTINCT VendorCity, VendorState
FROM Vendors

--using the TOP clause

USE AdventureWorks2012
GO

SELECT Top 5 DepartmentID,Name,GroupName
FROM HumanResources.Department

--using the TOP with PERCENT clause

SELECT TOP 5 PERCENT DepartmentID,Name,GroupName
FROM HumanResources.Department


 


