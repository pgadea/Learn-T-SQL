

--Occasionally, you may have to change the data type the column has been assigned to another data type so as to allow reports or queries that have calculated fields.
--This can be achieved using two key commands: cast and convert. The syntax for command:

--CAST (expression AS data type)
--CONVERT (data type, expression, style)


--Examples of CAST

--Create test table

Use TSQL
Go


Create Table Items
(ItemID int Identity (1, 1),
ItemName varchar (25) Null,
Price Money,
PurchaseDate date)

Select * from Items

--Insert records

Insert Into Items
Values 
('Bike', 399,'03-10-15'),
('Motorbike', 2399,'02-10-15')

Select * from Items

--We will use the CAST function to convert the Price column from type Money to Integer, eliminating the 2 zeroes.  (Integers can only be whole numbers)
--Note: the underlying data is not changed


SELECT ItemName, CAST (Price AS Int) AS Int_Price 
FROM Items;

--We used the CAST function to convert the ItemName column from type varchar to char (3), thus limiting vales to 3 characters
--Note: the underlying data is not changed

Select * from Items

SELECT ItemName, CAST (ItemName AS char (3)) AS Char_ItemName 
FROM Items;

--Examples of CONVERT

--The CONVERT is very similar to the CAST function, but allows the style to be changed

Select * from Items

--Changing the style of the purchasedate column

SELECT ItemName, PurchaseDate, CONVERT (varchar (20), PurchaseDate, 101) AS varchar_PurchaseDate --<<Style 101 from dashes to forward slash
FROM Items;

SELECT ItemName, PurchaseDate, CONVERT (varchar (20), PurchaseDate, 111) AS varchar_PurchaseDate --<<Style 111 changing the order of the year
FROM Items;

SELECT ItemName, PurchaseDate, CONVERT (varchar (20), PurchaseDate, 112) AS varchar_PurchaseDate --<<Style 112 eliminating all dashes
FROM Items;

 --For different styles go to the hyperlink below:

 http://www.experts-exchange.com/Database/MS-SQL-Server/A_12315-SQL-Server-Date-Styles-formats-using-CONVERT.html




 DROP TABLE Items

 


 

 

 

 

 

