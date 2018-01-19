--What are indexes?

--An index is a data structure that can be viewed as special lookup table that the database search engine uses to speed up data retrieval. 
--Simply put, an index is a pointer to data in a table.  
--The purpose of the creating indexes on tables (columns) is to improve performance of data retrieval.
--Telephone book is example of a clustered index (all the last names are alphabetized and sorted from A to Z). as its sorted by lastname, we can only have one clustered index
--A book with an index at the back of the book is an example of non clustered index, it has NUMBER OF SEPERATE PAGES from the book (thus it requires more space) can have many
--non clustered indexes.

--Types of indexes

--Clustered - A clustered index stores the actual data rows at the leaf level of the index
--Nonclustered -  A nonclustered index contain only the values from the indexed columns and row locators that point to the actual data rows
--Composite Index - An index that contains more than one column
--Unique - An index that ensures the uniqueness of each value in the indexed column
--Columnstore 
--Spatial
--XML
--Full-text	

--Syntax for creating indexes

--Creation of simple one column clustered index on NAMES2 table
USE TSQL
GO

Select * from Names2
Order by State desc

--Notice that when we insert the 2 records below the Brian and Zach are not sorted alphabetically
--Delete Names2 where Fname in ('Brain','Zach')

Insert Into Names2
Values 
('Brain','Thomas','NV','Las Vegas',2500),
('Zach','Masters','MO','Clint',3500)


Select * from Names2

--We are  going to create a clusetered index on fname and view the data.  Observe at this time the fname column is NOT SORTED!


CREATE CLUSTERED INDEX [Clus_Ind_Names_Fname] --<< naming conventions states we mention the prefix, table name, and column name for clarity
ON [dbo].[Names2] --<< table name
(Fname ASC) --<< column(s) name ascending or desending

Select * from Names2

--After the creation of the clustered index on fname, notice that the fname column is now sorted in alphabetical order!
--And now when we insert records with fnames that are out of order, the clustered index will automatically sort the column for fname
--Delete Names2 where Fname in ('Nancy','Darren')

Insert Into Names2
Values 
('Nancy','Wines','NV','Las Vegas',5400),
('Darren','Jones','CT','Stamford',3500)

Select * from Names2
--Rather than nancy and darren being inserted in the next available rows, the are sorted!!

--If we delete the fname index, and insert data again, the inserts of records will again be at then next available rows!
--So this clearly demonstrates how a clustered index works on tables and colums

USE [TSQL]
GO

DROP INDEX [Clus_Ind_Names_Fname] 
ON [dbo].[Names2] 
GO

--Delete Names2 where Fname in ('Matt','Albert')
Insert Into Names2
Values 
('Matt','Smith','NV','Las Vegas',5400),
('Albert','Wedge','CT','Stamford',3500)

Select * from Names2

--recreate the dropped index for the next example!

CREATE CLUSTERED INDEX [Clus_Ind_Names_Fname] --<< naming conventions states we mention the prefix, table name, and column name for clarity
ON [dbo].[Names2] --<< table name
(Fname ASC) --<< column(s) name ascending or desending


--------------------------------------------------------------------------------

--Creation of simple two column index (Composite Index)
USE TSQL
GO

--Create a cluserted index using a composie index (on 2 columns)

CREATE CLUSTERED INDEX [Clus_Ind_Names_Fname_Lname] --<< will error out because we already have a clustered index (Cannot have two clustered indexes!!)
ON [dbo].[Names2]
([Fname] ASC,[Lname] ASC)

--drop clustered index

DROP INDEX [Clus_Ind_Names_Fname] 
ON [dbo].[Names2] 
GO

--Creation of an unique index


--Inserting a duplicate fname Danny
--Insert into Names2
--values ('Danny','Coors','VT','Pastel',2522)

USE [TSQL]
GO

CREATE UNIQUE CLUSTERED INDEX [Uniq_Clus_Ind_Names_Fname] --<< will error out as there is duplicate in Danny
ON [dbo].[Names2]
([Fname] ASC)

--Delete Names2 where Fname ='danny' and Lname = 'Coors' -- << after delete of duplicate danny, we can create index


--DROP INDEX [Uniq_Clus_Ind_Names_Fname] 
--ON [dbo].Names2 
--GO


--creation of a non clustered index on single columns
USE [TSQL]
GO

CREATE NONCLUSTERED INDEX [Non_Clus_Ind_Names_Fname] --<< note, even though we have a clustered index created on fname, we can create multiple NON clustered indexes!!!
ON [dbo].[Names2]
([Fname] ASC)
GO

--creation of a non clustered index on multiple columns
USE [TSQL]
GO

CREATE NONCLUSTERED INDEX [Non_Clust_Ind_Names_Fname_Lname] --<< another NON clustered index created!!!
ON [dbo].[Names2]
([Fname] ASC,[Lname] ASC)
GO


--view all indexes

select s.name, t.name, i.name, c.name
from sys.tables t
inner join sys.schemas s on t.schema_id = s.schema_id
inner join sys.indexes i on i.object_id = t.object_id
inner join sys.index_columns ic on ic.object_id = t.object_id
inner join sys.columns c on c.object_id = t.object_id and
ic.column_id = c.column_id
where i.index_id > 0    
and i.type in (1, 2) -- clustered & nonclustered only
and i.is_primary_key = 0 -- do not include PK indexes
and i.is_unique_constraint = 0 -- do not include UQ
and i.is_disabled = 0
and i.is_hypothetical = 0
and ic.key_ordinal > 0
order by ic.key_ordinal


CREATE CLUSTERED INDEX [Clus_Ind_Names_Fname] --<< naming conventions states we mention the prefix, table name, and column name for clarity
ON [dbo].[Names2] --<< table name
(Fname ASC) --<< column(s) name ascending or desending

USE TSQL;
GO
EXEC sp_helpindex N'dbo.names2';--<< use system sproc to view indexes for schema.table
GO












































































































--Creation of simple one column clustered index on BOOKS table
USE TSQL
GO

CREATE CLUSTERED INDEX [Clus_Ind_Books_BookTitle] 
ON [dbo].[Books]
(BookTitle ASC)


--Creation of simple one column clustered index
USE [TSQL]
GO

CREATE CLUSTERED INDEX [Clus_Ind_Names_Fname] 
ON [dbo].[Names]
([Fname] ASC)

--Creation of simple two column index (Composite Index)
USE TSQL
GO

CREATE CLUSTERED INDEX [Non_Clus_Ind_Names_Fname_Lname] 
ON [dbo].[Names]
([Fname] ASC,[Lname] ASC)

--Creation of an unique index
USE [TSQL]
GO

CREATE UNIQUE CLUSTERED INDEX [Uniq_Clus_Ind_Names_Fname] 
ON [dbo].[Names]
([NameID] ASC)


--creation of a non clustered index on single columns
USE [TSQL]
GO

CREATE NONCLUSTERED INDEX [Non_Clus_Ind_Names_Fname] 
ON [dbo].[Names]
([Fname] ASC)

GO

--creation of a non clustered index on multiple columns
USE [TSQL]
GO

CREATE NONCLUSTERED INDEX [Non_Clust_Ind_Names_Fname_Lname] 
ON [dbo].[Names]
([Fname] ASC,[Lname] ASC)

GO

--Drop indexes

USE [TSQL]
GO

DROP INDEX [Clus_Ind_Books_BookTitle] 
ON [dbo].[Books] 
GO