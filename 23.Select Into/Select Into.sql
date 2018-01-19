--Using the Select Into command to copy partial or entire data from one table to another

--Examples:

--Copying all the columns into the newly created table --<<Note, a new table is created

USE TSQL
GO


Select * from Department

Select * 
Into  [TSQL].[dbo].[Department_070615] --<< Name of newly created table with the suffix of today's date--<<Note, a new table is once created will error out if query reruns
FROM [TSQL].[dbo].[Department] --<< From the original table

Select * from [TSQL].[dbo].[Department_070615]

--Copying partial data to another table using specific columns

Select Department 
Into  [TSQL].[dbo].[Department_Partial_070615] --<< Name of newly created table with the suffix of today's date(only one column selected)
FROM [TSQL].[dbo].[Department] --<< From the original table

Select * from [TSQL].[dbo].[Department_Partial_070615]

--Copying partial data to another table using specific columns and the WHERE clause

Select * 
Into  [TSQL].[dbo].[Department_Partial_Where_070615] --<< Name of newly created table with the suffix of today's date(only one column selected)
FROM [TSQL].[dbo].[Department] --<< From the original table
Where NameID = 1

Select * from [TSQL].[dbo].[Department_Partial_Where_070615]


--Using SQL joins

USE AdventureWorks2012
GO

SELECT        
Sales.SalesOrderDetail.SalesOrderDetailID, 
Sales.SalesOrderDetail.OrderQty, 
Sales.SalesOrderHeader.OrderDate, 
Sales.SalesOrderHeader.[Status], 
Sales.SalesOrderHeader.AccountNumber, 
Sales.SalesOrderHeader.SubTotal, 
Sales.SalesOrderHeader.TotalDue
INTO SALESJOINEDTABLE_070615
FROM            
Sales.SalesOrderDetail 
INNER JOIN
Sales.SalesOrderHeader 
ON Sales.SalesOrderDetail.SalesOrderID = Sales.SalesOrderHeader.SalesOrderID
WHERE Sales.SalesOrderDetail.OrderQty  >= 30
ORDER BY Sales.SalesOrderDetail.OrderQty

--32 ROWS

SELECT * FROM SALESJOINEDTABLE_070615

--Clean up

Use TSQL
Go

Drop table [dbo].[Department_070615]
Drop table [dbo].[Department_Partial_070615]
Drop table [dbo].[Department_Partial_Where_070615]
Drop table [dbo].[Names_070615]

Use AdventureWorks2012
Go

Drop table [dbo].[SALESJOINEDTABLE_070615]

