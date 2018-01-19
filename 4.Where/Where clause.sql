

/*
When writing scripts, it is best practice to filter the result set by using the WHERE clause which filters the rows returned
Also, minimize the result set by restricting the number of columns by using the columns names rather than the wildcard '*'.
*/

--Examples of using the WHERE clause:


SELECT *
From [AdventureWorks2012].[Sales].[SalesTerritory]  --<< Fully qualified name (Database.Schema.Table)

--Use the where clause to filter data based on rows data

SELECT *
From [AdventureWorks2012].[Sales].[SalesTerritory]
Where Name = 'Central'--<< Central is in single quotes as it�s a string (Text) 

--Use the where clause to filter data based on column data (Numeric)

SELECT *
From [AdventureWorks2012].[Sales].[SalesTerritory]
Where TerritoryID = 4 -- << Numeric data type do not need single quotes

--Using the AND operator in the where clause with multiple values (AND OPERATOR). Note, both criterion have to met

SELECT *
From [AdventureWorks2012].[Sales].[SalesTerritory]
Where Name = 'Central' AND [Group] = 'North America'

--Using the OR operator in the where clause with multiple values (OR OPERATOR). Note, if either criterion is met, then we get results

SELECT *
From [AdventureWorks2012].[Sales].[SalesTerritory]
Where Name = 'Central' OR Name = 'Canada'

--Using the where clause to combine AND and OR operators using parenthesis

SELECT *
From [AdventureWorks2012].[Sales].[SalesTerritory]
Where [Group] = 'North America'
AND (Name = 'Central' OR Name = 'Southwest')



