
/*

The GROUP BY clause will collect all of the rows together that are specified in the select statement (columns)
and will then allow aggregate functions to be performed on the one or more columns

The SQL GROUP BY clause is used in together with the SELECT statement to arrange identical data into groups; 

HAVING clause is only used in SELECT queries, which contains aggregate function or group by clause

If both WHERE and HAVING clause is used in a SELECT query with aggregate function or GROUP  BY clause, it will execute before HAVING clause
Syntax:

The HAVING clause enables you to filter which group results appear in the final results


*/

Use TSQL
Go

create Table GroupBy
(Fname varchar (20), BaseBallCards int, CardsSold date)

Insert Into GroupBy
Values
('Tom', 30, '09/06/15'),
('Sam', 323, '10/06/15'),
('Matt', 123, '1/06/15'),
('Tom', 23, '09/06/15'),
('Sam', 34, '12/06/15'),
('Bob', 567, '01/06/15'),
('Tom', 23, '09/06/15'),
('Bob', 23, '02/06/15')


Select * From GroupBy
Order By Fname

--Group the data by fname
Select fname 
From GroupBy 
Group By fname

--Find the sum of cards sold per person
Select fname, SUM(baseballcards) AS TotalSold
From GroupBy
Group By fname

--Count the number of time the user sold his baseball cards
Select fname, SUM(baseballcards) AS TotalSold, Count(fname) As TimesFnameSoldCards
From GroupBy
Group By fname

--Filter the Group By results further byt the Having Clause
Select fname, SUM(baseballcards) as TotalSold
From GroupBy
Group By fname
Having SUM(baseballcards) > 124
-- should get 2 results

Drop Table GroupBy


--EXAMPLES OF GROUP BY CLAUSE

SELECT [SalesOrderID]
      , [CarrierTrackingNumber]
      , [OrderQty]
      , [ProductID]
      , [UnitPrice]
      , [UnitPriceDiscount]
      , [LineTotal]
  FROM [AdventureWorks2012]. [Sales]. [SalesOrderDetail]--<<why did this query execute even though it states Joins DB? because I used the 'FQN'
  --121317 rows
  --Notice, we have many different SalesOrderID values

  --Filter the query with a specific SalesOrderID 

  SELECT [SalesOrderID]
      , [CarrierTrackingNumber]
      , [OrderQty]
      , [ProductID]
      , [UnitPrice]
      , [UnitPriceDiscount]
      , [LineTotal]
  FROM [AdventureWorks2012]. [Sales]. [SalesOrderDetail]
  Where SalesOrderID = '43659'
  --12 rows
  --26 OrderQty

--What was the total quantity ordered for this sales order?  Use the group by command to group the salesorderid and its Qty totals

SELECT [SalesOrderID], SUM ([OrderQty]) AS 'Total Qty'
FROM [AdventureWorks2012]. [Sales]. [SalesOrderDetail]
Where SalesOrderID = '43659' --<< when using the where clause with the Group By clause, the where clause is executed first
GROUP BY [SalesOrderID]
ORDER BY [SalesOrderID]

--How many SalesOrders were there for this Order?  -- Use the Count function!

SELECT [SalesOrderID], SUM ([OrderQty]) AS 'Total Qty', COUNT (SalesOrderID) as TotalOrders
FROM [AdventureWorks2012]. [Sales]. [SalesOrderDetail]
WHERE [SalesOrderID] IN (43659)
GROUP BY [SalesOrderID]
ORDER BY [SalesOrderID]

--How many SalesOrders were there for every Order?  -- Use the Count function!

SELECT [SalesOrderID], SUM ([OrderQty]) AS 'Total Qty', COUNT (*) as TotalOrders
FROM [AdventureWorks2012]. [Sales]. [SalesOrderDetail]
--WHERE [SalesOrderID] IN (43659, 43660, 43661, 43662)
GROUP BY [SalesOrderID]
ORDER BY [SalesOrderID]

--Once the query has grouped by Total Qty and Total Orders, we want to ask the question; of the grouped totals, can we filter the group by statement.
--Answer: Use the Having clause
--Further filtering the GROUP BY clause by using the HAVING clause. 

--Example of Having

SELECT [SalesOrderID], SUM ([OrderQty]) AS 'Total Qty', COUNT (*) as TotalOrders
FROM [AdventureWorks2012]. [Sales]. [SalesOrderDetail]
--WHERE [SalesOrderID] IN (43659, 43660, 43661, 43662)
GROUP BY [SalesOrderID]
HAVING COUNT (*) > 25 --<< Having clause when executed, will filter the GROUP BY results based on this condition
ORDER BY [SalesOrderID]




