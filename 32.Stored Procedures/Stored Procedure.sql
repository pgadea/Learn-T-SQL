/* 
What is a stored procedure?
How to create sprocs
The advantages of sprocs
Executing the sprocs
Modifying / Delete the sprocs
Example of sproc using parameters

--What is a stored procedure?
--A stored procedure is a collection of SQL statements that applications use to access and manipulate data in a database

--How to create sprocs
--We create a sproc using the key words CREATE PROCEDURE

--The advantages of sprocs
--There are several advantages to using sprocs and they are as follows:
--   1.they can be contained within a single location in the database (Programmability folder)
--	 2.stored procedures are cached on the server thus faster to retrieve and process
--   3.execution plans for the process are easily reviewable without having to run the application
--	 4.provides security by limiting direct access to tables

--Executing the sprocs
--You execute the sproc via the key word EXECUTE or EXEC then the sp name

--Modifying the sprocs
--You can modify the sproc using the key word ALTER PROCEDURE and to delete use the key word Delete 

Example of sproc using parameters:  user inputs parameters to sproc to retrieve limited data

*/

Use AdventureWorks2012
Go

--How to create sprocs

Create Procedure spSalesTerritory  --<< Use the 'sp' prefix to designate a stored procedure. Once created, it viewable in the SP folder under programmability folder
AS

BEGIN
	SELECT [TerritoryID]
		  ,[Name]
		  ,[CountryRegionCode]
		  ,[Group]
		  ,[SalesYTD]
		  ,[SalesLastYear]
		  ,[CostYTD]
		  ,[CostLastYear]
		  ,[rowguid]
		  ,[ModifiedDate]
	  FROM [AdventureWorks2012].[Sales].[SalesTerritory]
  END

  --Executing the sprocs. 

  EXECUTE spSalesTerritory 
  EXEC spSalesTerritory


  --Modifying the sprocs

ALTER Procedure [dbo].[spSalesTerritory]  --<< Use the ALTER PROCEDURE  modify and existing sproc
AS

BEGIN
	SELECT [TerritoryID]
		  ,[Name]
		  ,[CountryRegionCode]
		  ,[Group]
		  ,[SalesYTD]
		  ,[SalesLastYear]
		  ,[CostYTD]
		  ,[CostLastYear]
		  --,[rowguid]     --<< two columns omitted via commented out
	   --   ,[ModifiedDate] 
	  FROM [AdventureWorks2012].[Sales].[SalesTerritory]
END

EXECUTE spSalesTerritory 

--Delete the sproc

DROP PROCEDURE [dbo].[spSalesTerritory]
GO

--Example of sproc using parameters:  user inputs parameters to sproc to retrieve limited data

Create Proc spUseParameter  --<< Note that i am using Proc instead of Procedure key word
@BookAuthor varchar (20)    --<< when using parameters, you have to create a 'place holder' for the user's input of data
AS
BEGIN
	SELECT [BooksID]
		  ,[BookTitle]
		  ,[BookAuthor]
		  ,[BookQuantity]
		  ,[SoldDate]
	FROM [TSQL].[dbo].[Books]
	WHERE BookAuthor = @BookAuthor --<< the where clause for the parameter(S) must contain the 'place holder'
END


--F Scott Fitzgerald
--Jane Austen
--JRR Tolkien
--Charlotte Bronte


--Execute the sproc using the sp name with one parameter

spUseParameter 'Charlotte Bronte'


--Creating a stored procedure with multiple parameters

Create Proc spUseMultipleParameter  --<< Note that i am using Proc instead of Procedure key word
@BookAuthor varchar (20),   --<< when using multiple parameters, you have to create a 'place holder' for the user's input of data seperating with comma
@BookTitle varchar (20)

AS
BEGIN
	SELECT [BooksID]
		  ,[BookTitle]
		  ,[BookAuthor]
		  ,[BookQuantity]
		  ,[SoldDate]
	FROM [TSQL].[dbo].[Books]
	WHERE BookAuthor = @BookAuthor and BookTitle = @BookTitle  --<< Note the where clause has both the parameter(S) as 'place holder'
END

spUseMultipleParameter

'Margaret Mitchell','Gone With The Wind'

'Charlotte Bronte','Jane Eyre'


--Delete the sproc

DROP PROCEDURE [dbo].[spUseMultipleParameter]
GO