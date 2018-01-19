/*What is a temp table?

A Temp (Temporary) table, as the name suggests, is a 'temporary' table that is stored in the System Tempdb database 
with a prefix of # or ## depending upon if it's local or global temp table

A local temp table uses a # prefix, while a global uses two ##

Local temp tables are only available to the user who created the connection, 
and once the connection terminates, the temp table is automatically deleted

Can create local temp table with the SAME name, provided their different connections. 
This is because it's not technically the 'same  name'. SQL adds underscores with ending characters to the temp table name

On the other hand, a global temp table once created is available to any user by any connection 
It can only be deleted when all connections that have referenced to them have closed.

Temp tables can do the all the same operations that a normal table does, except the scope is limited
Scope refers to wheather the Temporary tables is bound to the current user or connection

Can use local temp table in a sproc (stored procedure). Note that once the sp is executed, the temp table is dropped automatically

We can also create indexes on the local temporary tables

We can also define constraints on the local temporary tables

When disconnecting from the server or restrating the services, all temp tables will be dropped

Note when creating Temporary tables in a the tempdb, this causes overhead and can causes performance issues 

*/


Use TSQL --<< Connect to TSQL database
Go

-- Create a local temp table with a single # sign
-- Note, even though I am setting the database to TSQL, when creating the temp table, it will automatically be created it the System Tempdb

CREATE TABLE #Temp1
(FName Varchar (20) Not Null, 
 LName Varchar (20))

 --Create an index on local temp table or a constraint just like a regular table

Create Index Ind_Temp1_Fname On #Temp1 (Fname)

Alter Table #Temp1 
Add Constraint Con_pk Primary Key (Fname) --<< To view the configurations of any table,press ALT + F1 keys

Insert Into #Temp1
Values ('Bob','Smith')

Select * From #Temp1

--Can create another local temp table with the SAME name but must be in a differnt connection! Will error out if used in the same connection
--Create a local temp table in another session

CREATE TABLE #Temp1
(FName Varchar (20), 
LName Varchar (20))

-- Create a local temp table using a Select Into example to insert data from another table

Select 
[Name],
[GroupName] 
Into #TempDept --<< Newly created local temp table using the Select Into command
From
[AdventureWorks2012].[HumanResources].[Department]
Where GroupName Like 'm%'

Select * from #TempDept --<< can only use this select statement WITHIN the connection it was created in as it's a local temp table

/*
Creating a Global Temp Table
Global Temporary tables name starts with two hashes ##. 
Once this table has been created by a connection, it is then available to any user by any connection. 
It's only deleted when the last connection that is accessing that table has disconnected.*/

--Create a Global Temp Table

CREATE TABLE ##GlobalTempTable(
ID int,
FName varchar(50), 
Lname varchar(50))

/*
As with the local temp table, the global temp table is created in the tempdb database. 
and we can treat it as a regular table by inserting data
*/

--Insert into globale temp table data

Insert Into ##GlobalTempTable 
Values ( 1, 'Bob','Smith');

Select * from ##GlobalTempTable --<< Note that the global temp table does not have an underscore followed by characters.

--Cannot create another global temp table with the same name in either connection 
--If we copy paste this to another connection, it will error out

CREATE TABLE ##GlobalTempTable(
ID int,
FName varchar(50), 
Lname varchar(50))

--However, this global temp table is available to another session.  If we copy paste this Select statement and execute, it will dispaly reults.

Select * from ##GlobalTempTable

--We can drop this global temp table with a Drop clause, ONLY if there are no other sessions connected to this global temp table!!

--Using local temp table in a sproc (stored procedure)

Use Tempdb
Go

Create Procedure spTempDept
AS
Begin
	Select 
	[Name],
	[GroupName] 
	Into ##TempDept --<< Newly created local temp table using the Select Into command
	From
	[AdventureWorks2012].[HumanResources].[Department]
	Where GroupName Like 'm%'

	Select * From ##TempDept
End

--Execute the sproc

Exec spTempDept

--Deleting global temp table

Drop Table ##TempDept

Select * From ##TempDept