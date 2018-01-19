/*

NULL values permit entry of a blank data when the value at the time of entry is unknown.
The following example illustrates the Null values of social security when number is unknown by several employees.  
This columns is updated by an update statement after the creation of a table


NULL values represent a unknown value

NULL is not a zero 

By default, a column (s) can have a null value when creating a table

NULL is used when inserting data into a filed and the value of the column at that time is unknown

NULL acts a placeholder for the value of that column until its provided


*/

USE TSQL
GO

SELECT *
FROM TSQL.[dbo].[Names]

--Add a column after the creation of a table

ALTER TABLE NAMES
ADD Social_Security_Number CHAR (11)


SELECT *
FROM [TSQL].[dbo].[Names]

--Two Employees come in later to update their SSN

UPDATE Names
SET Social_Security_Number  = ('65-255-2514')
WHERE Fname = 'Bob'

UPDATE Names
SET Social_Security_Number  = ('34-255-5467')
WHERE Fname = 'Tom'

SELECT *
FROM [TSQL].[dbo].[Names]


--Return all rows where there is a Null value in the Social_Security_Number column

Select * from Names
Where Social_Security_Number IS NULL

--Return all rows where there is NOT a Null value in the Social_Security_Number column

Select * from Names
Where Social_Security_Number IS NOT NULL


--Drop column

ALTER TABLE NAMES DROP COLUMN Social_Security_Number;
