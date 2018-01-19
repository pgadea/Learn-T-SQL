
/*

What is an SQL view?

A view can be thought of as either a virtual table or a stored query which is stored in the database as a SELECT statement
A user can use this virtual table just as he/she would the same way a table
Views are created by defining the SELECT statement and then prefixing that statement with the CREATE VIEW command
The table that provide the data are called base tables
The view itself does not hold data. Since views are 'formed' from a base table, they can be queried, updated, and dropped
The view is essentially a dynamic SELECT query, and if any changes are made to the originating table(s),these changes will be reflected in the SQL VIEW automatically

Some of the ways and benefits of using a view are as follows:

• Restrict a user to specific rows in a table by filtering row data
• Restrict a user to specific columns by filtering column data
• Join columns from multiple tables so that they look like a single table.
• Hide complexity of the code
• Use as a security mechanism by giving permissions set on the view instead of the underlying tables.

*/

Use TSQL
Go

--Base table

SELECT [BooksID]
, [BookTitle]
, [BookAuthor]
, [BookQuantity]
, [SoldDate]
FROM [TSQL]. [dbo].[Books]
Order By BooksID

--Restrict a user to specific columns in a table by filtering columns

--Write the SELECT statement followed by the CREATE VIEW command omitting , [BookQuantity],[SoldDate] columns

Use TSQL
Go

CREATE VIEW vwBooks
AS
SELECT [BooksID]
,[BookTitle]
,[BookAuthor]
FROM [TSQL].[dbo].[Books] --<< note we have omitted various fields

--Viewing data from the view, just like the table

Select * from vwBooks
Order By BooksID

--Join columns from multiple tables so that they look like a single table.

USE AdventureWorks2012
GO

CREATE VIEW vwEmpEmail
AS

SELECT
Person.Person.FirstName, Person.Person.LastName, HumanResources.EmployeePayHistory.Rate, Person.EmailAddress.EmailAddress
FROM
Person. Person
INNER JOIN
HumanResources.EmployeePayHistory
ON Person.Person.BusinessEntityID = HumanResources.EmployeePayHistory.BusinessEntityID 
INNER JOIN
Person.EmailAddress
ON Person.Person.BusinessEntityID = Person.EmailAddress.BusinessEntityID

--Viewing data from the view, just like the table

Select * from vwEmpEmail

--Deleting and updating of views are propagated to the base table and vice versa

--Backup table

Use TSQL
Go

Select * Into [dbo].[Books_071515]
FROM [dbo].[Books]
--(20 row(s) affected)


--viewing the data in a base table

Use TSQL
Go

SELECT *
FROM [dbo].[Books]
Order By BooksID
--(20 row(s) affected)


--viewing the data in a view with limited columns
Select *
from [dbo].[vwBooks]
Order By BooksID
--(20 row(s) affected)

--Deleting from the VIEW two rows and it's propagated to the BASE table

Delete
From [dbo].[vwBooks]
Where BooksID IN (1,2)   --<< Must use the where clause, otherwise all data will be deleted

--BooksID	BookTitle	BookAuthor
--1	The Great Gatsby 2	F Scott Fitzgerald
--2	Pride and Prejudice	Jane Austen


--Note that the bookid 1 and 2 have been deleted in the Base table

SELECT *
FROM [dbo].[Books]
Order By BooksID
--19 rows


--viewing the data in a view. Note no bookid 1 or 2

Select *
From [dbo].[vwBooks]
Order By BooksID
--19 rows

--An insert statement against the BASE table inserts in the VIEW
--Insert rows in BASE TABLE and it’s propagated to VIEW

Insert Into dbo.[Books]
Values
(35,'Hubba Bubba', 'Steve Austen',32,	'2015-03-10 00:00:00.000'),
(36,'The Lord of the Rings','Tolkien ',555,'2015-03-10 00:00:00.000')


Select * from [Books]
Order By BooksID

--View is updated also with the insert in the BASE table

Select *
From [dbo].[vwBooks]
where BookTitle IN ('Hubba Bubba', 'The Lord of the Rings')

--PERMISSION TO VIEWS
--the DBA can control what user can do with a view, such as select, update, insert or delete.
--COURSE 2 (SECURITY AND PERMISSIONS)







