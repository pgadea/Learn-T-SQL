
/*
The DELETE statement is used to delete record(s) in a table
The Truncate commands deletes all the rows at once
Using the same caution as an update, when deleting rows from a table, use the where clause.
A safe way to insure that you are deleting only the rows you want to delete, is first do a select statement for that delete,
and if you’re satisfied with the result set, then use the delete command.

*/

 
--Backup table

Select * Into  [AdventureWorks2012].[Person].[Person_062715] 
FROM [AdventureWorks2012].[Person].[Person]
--(19972 row(s) affected)

--Run an order by to view how many records you are about to delete

Select * from [AdventureWorks2012].[Person].[Person_062715]
Order By firstName

--Delete all records with the name Aaron

DELETE FROM [AdventureWorks2012].[Person].[Person_062715]
WHERE FirstName = 'Aaron'
--(56 row(s) affected)

--Deleting on a condition using a subquery

--Backup table

select * Into [AdventureWorks2012].[Sales].[SalesOrderDetail_062715]
From [AdventureWorks2012].[Sales].[SalesOrderDetail]
--(121317 row(s) affected)

SELECT [SalesOrderID]
      ,[SalesOrderDetailID]
      ,[CarrierTrackingNumber]
      ,[OrderQty]
      ,[ProductID]
      ,[SpecialOfferID]
      ,[UnitPrice]
      ,[UnitPriceDiscount]
      ,[LineTotal]
      ,[rowguid]
      ,[ModifiedDate]
  FROM [AdventureWorks2012].[Sales].[SalesOrderDetail_062715]
  WHERE UnitPrice = 1.374
  Order By UnitPrice

Delete 
FROM [AdventureWorks2012].[Sales].[SalesOrderDetail_062715]
WHERE CarrierTrackingNumber = 'EBDE-4A71-8E' 
and 
UnitPrice IN (SELECT UnitPrice FROM [AdventureWorks2012].[Sales].[SalesOrderDetail_062715]   
                     WHERE UnitPrice = 1.374) --<< Condition

--Deleting all the rows in a table without deleting the table:

DELETE FROM [AdventureWorks2012].[Sales].[SalesOrderDetail_062715];

/*
With the delete command you have the option to delete all rows at once, or when using the where clause, delete specified rows 
This action does not free the space containing the table
This TRUNCATE command is used to delete all the rows from the table and free the space containing the table 
*/

--Truncate example:

Truncate Table [AdventureWorks2012].[Sales].[SalesOrderDetail_062715] --<< deletes all the data at once.  Cannot filter using the where clause

Select * from [AdventureWorks2012].[Sales].[SalesOrderDetail_062715]


 --Clean Up

DROP TABLE [AdventureWorks2012].[Person].[Person_062715]
DROP TABLE [AdventureWorks2012].[Sales].[SalesOrderDetail_062715]

