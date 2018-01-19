
--SQL has many built-in functions for performing calculations on data
--SQL aggregate functions return a single value, calculated from values in a column
--Note: the SUM and AVG function must result in a numeric value, while the MIN, MAX, and COUNT can result in numeric, string or date.


--This video will discuss and illustrate how to use aggregate functions such as:
--SUM – provides the total non - null value
--AVG – provides the average non - null value
--MIN – provides the lowest non - null value
--MAX – provides the maximum non - null value
--COUNT – provides the number non - null value
--COUNT (*) – provides the number of rows
 
 USE TSQL
 GO

 --Create table for testing

 Create Table Books
 (BooksID int Identity (1,1) Not Null Primary Key,
 BookTitle varchar (50) Null,
 BookAuthor varchar (50) Null,
 BookQuantity int Null,
 SoldDate Datetime Null)
 
SELECT * FROM Books

--Insert data into table

Insert Into Books
Values
('The Great Gatsby 2','F Scott Fitzgerald',32325,'02-10/11'),
('Pride and Prejudice','Jane Austen',32,'03-10/15'),
('The Lord of the Rings','JRR Tolkien',555,'03-10/15'),
('Jane Eyre','Charlotte Bronte',3454,'03-10/15'),
('Harry Potter series','JK Rowling',5434,'02-10/15'),
('To Kill a Mockingbird','Harper Lee',866,'02-10/15'),
('Wuthering Heights','Emily Bronte',45646,'02-10/15'),
('Nineteen Eighty Four','George Orwell',34523,'01-10/15'),
('His Dark Materials','Philip Pullman',45453,'01-10/15'),
('Great Expectations','Charles Dickens',23432,'01-10/15'),
('Little Women','Louisa M Alcott',34234,'03-10/14'),
('Tess of the D’,Urbervilles', 'Thomas Hardy',234234,'03-10/14'),
('Catch 22','Joseph Heller',2343,'03-10/13'),
('Rebecca','Daphne Du Maurier',24342,'03-10/13'),
('The Hobbit','JRR Tolkien',342343,'03-10/13'),
('Birdsong','Sebastian Faulk',23432,'03-10/13'),
('Catcher in the Rye','JD Salinger',5756,'02-10/12'),
('The Time Traveler’s Wife','Audrey Niffenegger',7564,'02-10/11'),
('Middlemarch','George Eliot',909090,'02-10/11'),
('Gone With The Wind','Margaret Mitchell',8844,'02-10/11'),
('The Great Gatsby','F Scott Fitzgerald',90494,'02-10/11')

SELECT * FROM Books

--How many total books were sold?  Use SUM command

SELECT SUM (BookQuantity) AS TotalBooksSold
FROM books

SELECT *
FROM Books
ORDER BY SoldDate

--How many books where sold in year 2011?

SELECT max (BookQuantity) AS ProductTotal, SoldDate
FROM Books
WHERE SoldDate = '2011-02-10 00:00:00.000'
Group by SoldDate --<< when using aggregates, we MUST use the group by clause and use every column that is not an aggregate!

--What was the total number of books sold by F Scott Fitzgerald?

Select BookAuthor, SUM(BookQuantity) AS TotalBooksSold--<< Use an alias for column title
FROM Books
WHERE BookAuthor = 'F Scott Fitzgerald'
GROUP BY BookAuthor


USE TSQL
GO


CREATE TABLE EmpSales
(EmpSalesID int Identity (1,1) Not Null Primary Key,
Fname varchar (20) Null,
Lname varchar (20) Null,
Sales Money Null,
PercentCommission varchar (10) Null)

Select * from EmpSales

Insert Into EmpSales
values
('Tom','Smith',453000,'.002'),
('Stan','Brimes',7686,'.10'),
('Roger','Fuller',34834,'.003'),
('Ralph','Knowes',96675,'.007'),
('Andy','Mattews',21193,'.10')


--What is the bonus of each rep? (Using SUM with multiple columns)

Select Fname,Lname,Sales,PercentCommission,AVG(Sales * PercentCommission) AS TotalBonus
from EmpSales
group by Fname,Lname,Sales,PercentCommission --<< since we are using an aggregate, we MUST use the group by clause with all the columns except the aggregate!

--Using the AVG function.  What is the average sales?

Use AdventureWorks2012
Go

SELECT Name, StandardCost ,*
FROM [Production].[Product]
Order By 2

SELECT Name, StandardCost ,*
FROM [Production].[Product]
WHERE StandardCost>

(SELECT AVG(StandardCost) --<< the average cost is: 258.60
FROM [Production].[Product])

Order By 2

--Who has the highest Sales?

Use TSQL
Go

Select fname,lname, MAX(Sales) AS HighestSales
From EmpSales
GROUP BY fname,lname
ORDER BY HighestSales DESC --<< Note. Using the alias as column name in the Order By clause

--Who has the lowest Sales?

Select fname,lname, MIN(Sales) AS LowestSalary
From EmpSales
GROUP BY fname,lname
ORDER BY 3 --<< using the column number instead of the column name 


-- Count() examples:

USE [AdventureWorks2012]
GO

SELECT *
  FROM [Production].[WorkOrder]
 --WHERE ProductID = 3
ORDER BY ProductID
GO

--The COUNT(*) function returns the number of records in a table:

SELECT COUNT(*) FROM [Production].[WorkOrder]
--72591 records

--The COUNT(column_name) function returns the number aggregates for the column

Select SUM (orderqty) AS [Total Qty], Count(OrderQty) AS [ProdID 3 Total] --<< notice that brackets are used for the alias as spaces are used for naming column
From [Production].[WorkOrder]
Where ProductID = 3
Group By ProductID



Drop Table EmpSales
Drop Table Books












