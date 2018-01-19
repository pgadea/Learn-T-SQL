
--Aliases are used to rename a table or a column
--The reason we use aliases is to provide clarity when two or more columns of the same name are used in a join query
--If a column name is used with a space, then we must enclose the column name in brackets

SELECT [DepartmentID]
      ,[Name]
      ,[GroupName]
      ,[ModifiedDate]
  FROM [AdventureWorks2012].[HumanResources].[Department]


--Using aliases with brackets to rename columns

SELECT Name AS DeptName, GroupName AS [Area of Expertise]--<< Note the brackets needed because of space between column alias
FROM [AdventureWorks2012].[HumanResources].[Department];

--Using aliases with concatenation

SELECT [DepartmentID]
      ,[Name]
      ,[GroupName]
	  ,[Name]+', '+[GroupName] AS ConcatenateFields--<< Concatinating fields
FROM [AdventureWorks2012].[HumanResources].[Department];

--Create 2 tables for testing aliases

Use TSQL
Go

Create Table Orders
(OrderID int,
OrderNumber Varchar (20),
ProductName varchar (30),
Quantity int
)


Create Table Product
(ProductID int,
ProductNumber Varchar (20),
ProductName varchar (30),
Quantity int
)


select * from Orders
select * from Product

--Insert records

Insert Into  Orders
Values 
(1,555666,'Ball',10),
(2,777222,'Pen',103),
(3,333252,'Bat',5),
(4,251414,'Book',77),
(5,956212,'Towel',89)

Insert Into  Product
Values 
(1,434,'Ball',333),
(2,565,'Pen',5666),
(3,234,'Bat',3),
(4,678,'Book',7789),
(5,789,'Towel',33)

--Using aliases to rename columns and tables for efficiency and distinguishing fields

--Original join without table aliases

SELECT         
Product.ProductName, 
Product.Quantity, 
Orders.Quantity AS OrderQuantity, 
Orders.ProductName AS OrderProductName
FROM            
Product 
INNER JOIN
Orders 
ON Product.ProductID = Orders.OrderID

--Join with column and table aliases (substituting o. for Orders fields and p. for Products fields. Shorten the SQL)

SELECT    
o.OrderID, 
p.ProductName, 
o.Quantity, 
p.Quantity AS ProductQuantity
FROM            
Orders as o --<< Note that for the table alias, we use the key word AS followed by the alias
INNER JOIN
Product as p --<< Note that for the table alias, we use the key word AS followed by the alias
ON o.OrderID = p.ProductID

Drop Table Orders
Drop Table Product
