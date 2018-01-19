
 --   The subquery can be nested inside a SELECT, INSERT, UPDATE, or DELETE statement.
 --   A subquery is usually added within the WHERE Clause of another SQL SELECT statement.
 --   The inner query executes first before its outer query.
 --   What is the difference between a join and a subquery?  Both get the same results, but joins are faster in terms of performance.(Another course)

-- Anatomy of a subquery

--SELECT list_columns <<-- Outer Query
--FROM table1

--WHERE operator

--(SELECT list_columns   <<-- Inner Query will execute first
--FROM table2);         


USE TSQL
GO

CREATE TABLE PRODUCTS
(
PRODUCTID INT IDENTITY PRIMARY KEY NOT NULL,
PRODUCT_NAME VARCHAR (100) NULL,
PRODUCT_DESCRIPTION VARCHAR (125) NULL)

CREATE TABLE SALES
(
SALESID INT IDENTITY PRIMARY KEY NOT NULL,
PRODUCTID INT FOREIGN KEY REFERENCES PRODUCTS (PRODUCTID),
PRODUCT_PRICE INT NULL,
PRODUCT_QTY INT NULL)

SELECT * FROM PRODUCTS
SELECT * FROM SALES


INSERT INTO PRODUCTS
VALUES
('HARLEY DAVIDSON','HARLEY BIKE THAT HAS TOP SPEED OF 180 MPH'),
('AUSTIN MARTIN','TOP JAMES BOND MODEL OF CHOICE'),
('SESNA','SINGLE ENGINE PLANE, EASY TO FLY')

INSERT INTO SALES (PRODUCTID, PRODUCT_PRICE, PRODUCT_QTY)
VALUES
(2, 125000, 15),
(3, 155000, 11),
(2, 125000, 55),
(3, 125000, 32),
(2, 125000, 14)

SELECT * FROM PRODUCTS
SELECT * FROM SALES

--FIND ALL THE ITEMS THAT HAVE NOT BEEN SOLD?

--First look at the sales table and observe that we do not see any productid for item 1 (Harley Davidson), thus we know no Harleys were sold
--Lets break down how the subquery works


--Part 1 - Outer query- provides us with all results of products table 
SELECT PRODUCTID, PRODUCT_DESCRIPTION, PRODUCT_NAME --<< Outer query
FROM PRODUCTS

--Part 2 - THEN the condition asks, give me all the	PRODUCTID OF PRODUCT TABLE NOT IN the inner/subquery
WHERE PRODUCTID NOT IN 

--Part 3 - Inner query or subquery that executes first

(SELECT DISTINCT PRODUCTID FROM SALES)  --<< Inner query OR SUBQUERY (When using the where clause, it should contain only one column (productid))

--USING A JOIN

Select p.PRODUCTID, PRODUCT_DESCRIPTION, PRODUCT_NAME 
From PRODUCTS p
LEFT JOIN SALES s
ON p.PRODUCTID = s.SALESID
Where P.PRODUCTID NOT IN (2,3)


--Give the total quantities sold of each product?

SELECT * FROM PRODUCTS
SELECT * FROM SALES


 --Which product sold 30 or more quantities?

 SELECT PRODUCTID, PRODUCT_NAME, PRODUCT_DESCRIPTION
 FROM PRODUCTS P --<< THIS QUERY PROVIDES THE PRODUCT NAME AND DESCRIPTION FROM THE PRODUCTS TABLE

 WHERE PRODUCTID IN --<< THIS WHERE CLAUSE STATES, FIND THE PRODUCTID IN THE SALES TABLE

 (SELECT PRODUCTID
  FROM SALES S
  WHERE PRODUCT_QTY >= 30) --<< THIS QUERY PROVIDES THE PRODUCTID THAT HAS SOLD 5 OR MORE (IN THIS CASE 2)


SELECT * FROM PRODUCTS
SELECT * FROM SALES


  --Delete example using a subquery

  Delete From SALES
  Where PRODUCTID In 
  (Select PRODUCTID From PRODUCTS Where PRODUCTID = 2)--<< DELETE ALL AUSTIN MARTINS SALES

  
SELECT * FROM PRODUCTS
SELECT * FROM SALES

DROP TABLE PRODUCTS
DROP TABLE SALES





 


