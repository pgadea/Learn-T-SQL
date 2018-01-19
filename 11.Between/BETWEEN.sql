--The Between operator provides data within a specified range

--Between operator can be used with other operators such as:
--NOT
--IN
--TEXT VALUES
--DATES


--Examples of using the Between operator:

USE AdventureWorks2012
GO

--All data from product table in a descending order

SELECT *
FROM [AdventureWorks2012].[Production].[Product]
ORDER BY StandardCost DESC

--Using Between operator for standard cost range

SELECT [ProductID]
      ,[Name]
      ,[ProductNumber]
      ,[StandardCost]
      ,[ListPrice]
	  ,SellStartDate 
FROM [AdventureWorks2012].[Production].[Product]
WHERE [StandardCost] BETWEEN 10 AND 13 --<< Note that the query did not include the 13.  Some databases exclude the last value, as in this example
ORDER BY StandardCost DESC

--Using NOT BETWEEN operator for standard cost range.  This excludes everything but values 749 and 753

SELECT [ProductID]
      ,[Name]
      ,[ProductNumber]
      ,[StandardCost]
      ,[ListPrice]
	  ,SellStartDate  
FROM [AdventureWorks2012].[Production].[Product]
WHERE [ProductID] NOT BETWEEN 749 AND 753
ORDER BY StandardCost DESC

--Combining the BETWEEN and IN operator. 
--This will give all results except data for ProductID IN (749,750,751) and [StandardCost] BETWEEN 10 AND 13

SELECT [ProductID]
      ,[Name]
      ,[ProductNumber]
      ,[StandardCost]
      ,[ListPrice]
	  ,SellStartDate  
FROM [AdventureWorks2012].[Production].[Product]
WHERE [StandardCost] BETWEEN 10 AND 13 --<< Give data for this standardcost range
AND NOT ProductID IN (749,750,751); --<< Exclude

--Using Between for text range values

SELECT [ProductID]
      ,[Name]
      ,[ProductNumber]
      ,[StandardCost]
      ,[ListPrice]
	  ,SellStartDate  
FROM [AdventureWorks2012].[Production].[Product]
WHERE Name BETWEEN 'B' AND 'L'
ORDER BY NAME 

--Using NOT Between for text range values

SELECT [ProductID]
      ,[Name]
      ,[ProductNumber]
      ,[StandardCost]
      ,[ListPrice]
	  ,SellStartDate  
FROM [AdventureWorks2012].[Production].[Product]
WHERE Name NOT BETWEEN 'B' AND 'L'--<< Include all but data for B and L
ORDER BY NAME 

--Using Between for a date range

SELECT [ProductID]
      ,[Name]
      ,[ProductNumber]
      ,[StandardCost]
      ,[ListPrice]
	  ,SellStartDate  
FROM [AdventureWorks2012].[Production].[Product]
WHERE SellStartDate BETWEEN '2002-06-01 00:00:00.000' AND '2006-07-01 00:00:00.000'



