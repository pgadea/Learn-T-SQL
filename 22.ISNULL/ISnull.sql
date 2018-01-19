
--Use of ISNULL

--The purpose of ISNULL() is to replace a NULL value with another value


SELECT  [AddressID]
, [AddressLine1]
, [AddressLine2]
, [City]
, [StateProvinceID]
, [PostalCode]
FROM [AdventureWorks2012]. [Person]. [Address]
Order by AddressLine2

--Using ISNULL command

SELECT [AddressID]
, [AddressLine1]
, ISNULL (AddressLine2,'UNKNOWN') AS ISNULLVALUE
, [City]
, [StateProvinceID]
, [PostalCode]
FROM [AdventureWorks2012]. [Person]. [Address]
Order by AddressLine2

--Use ISNULL multiple times in the same SQL statement for different columns

SELECT [BusinessEntityID]
, [PersonType]
, [NameStyle]
, [Title]
, [FirstName]
, [MiddleName]
, [LastName]
, [Suffix]
FROM [AdventureWorks2012]. [Person]. [Person]

--Using ISNULL to replace nulls with blanks

SELECT [BusinessEntityID]
, [PersonType]
, [NameStyle]
, ISNULL (Title,'') AS 'BLANK'--<< two single quotes equals blank
, [FirstName]
, [MiddleName]
, [LastName]
, ISNULL (Suffix,'') AS 'BLANK'--<< two single quotes equals blank
FROM [AdventureWorks2012]. [Person]. [Person]
Order By 8 --<< Note, I used a numeric for the position of the column



























































--The COALESCE function bypasses ALL the NULL values and returns the FIRST NON-NULL value

--Examples:

--backup copy of table
--select * into [AdventureWorks2012]. [Person]. [Person_040215]
--from [AdventureWorks2012]. [Person]. [Person]

--The COALESCE function will go through the first row (column by column) looking for Null values; WHEN IT DOES FIND A NULL, it will move to the next column
--and select the data and display the result and stops

--To allow changes to the table go to tools - options - designer - uncheck prevent changes that require table re-creation

--update [AdventureWorks2012]. [Person]. [Person_040215]
--set Title = Null,
--FirstName = Null,
--MiddleName = Null
--where BusinessEntityID = 4


--SELECT Top 100 [BusinessEntityID]
--, [PersonType]
--, [NameStyle]
--, [Title]
--, [FirstName]
--, [MiddleName]
--, [LastName]
--, [Suffix]
--FROM [AdventureWorks2012]. [Person]. [Person_040215]


--SELECT
--Top 100 [BusinessEntityID]
--, COALESCE
--([Title]
--, [FirstName]
--, [MiddleName]
--, [LastName]
--, [Suffix]) AS FIND_FIRST_NON_NULL_VALUE
--FROM [AdventureWorks2012]. [Person]. [Person_040215]

----SAME AS ABOVE

--SELECT
--Top 100 [BusinessEntityID],
--CASE
--WHEN (Title IS NOT NULL)      THEN TITLE
--WHEN (FirstName IS NOT NULL) THEN FirstName
--WHEN (MiddleName IS NOT NULL) THEN MiddleName
--WHEN (LastName IS NOT NULL)   THEN LastName
--ELSE NULL
--END AS  FIND_FIRST_NON_NULL_VALUE
--FROM [AdventureWorks2012]. [Person]. [Person_040215]








