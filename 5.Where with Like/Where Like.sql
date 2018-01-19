
--Using the where clause with LIKE operator examples:
--The like operator is used with the Where clause to find patterns


Select *
FROM [AdventureWorks2012].[Production].[Product]

--filter the data using the column names

Select Name, ProductNumber, Color, ListPrice
FROM [AdventureWorks2012].[Production].[Product]


--Name of product starting with the letter "s":--<< the like operator is enclosed in open apostrophes with the percent sign

SELECT * FROM [AdventureWorks2012].[Production].[Product]
WHERE Name LIKE 's%';


--Name of product ending with the letter "s":

SELECT * FROM [AdventureWorks2012].[Production].[Product]
WHERE Name LIKE '%s';


--Name of product containing the pattern 'end'

SELECT * FROM [AdventureWorks2012].[Production].[Product]
WHERE Name LIKE '%end%';


--Name of product NOT containing the pattern 'end'

SELECT * FROM [AdventureWorks2012].[Production].[Product]
WHERE Name NOT LIKE '%end%';


--Name of product starting with 'dec'

SELECT * FROM [AdventureWorks2012].[Production].[Product]
WHERE Name LIKE 'dec%';

 
--selects all products with a name starting with "a", "b", or "m":

SELECT * FROM [AdventureWorks2012].[Production].[Product]
WHERE Name LIKE '[abm]%'; 


--selects all products with a name NOT starting with "a", "b", or "m" using the hyphen

SELECT * FROM [AdventureWorks2012].[Production].[Product]
WHERE Name NOT LIKE '[abm]%';


--selects all products starting with any character, followed by 'lat'

SELECT * FROM [AdventureWorks2012].[Production].[Product]
WHERE Name LIKE '_lat%';



