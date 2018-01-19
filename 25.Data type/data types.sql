

--SQL DATA TYPES

/*

Data types determine what kind of information is to be stored in the intended column.
When developers create tables, they provide specific data types that can be inserted into those specific columns.
Thus, the purpose of a data type is to ensure the data inserted into the column is following the guidelines set by the developer;
And once the data type has been assigned to that column, no other format of data may enter that column

--There are four primary categories of data types and they are:

--Numeric data type:

Int: store whole numbers only (1, 45, 1005, -399)
Bit: integers with a value of either 1 or 0
Decimal: stores data with a decimal (23.4565)
Its precision and scale or in normal language, how many digits can a number have and how many digits do you want to have to the right of the decimal point.
Money: data with a decimal point up to four decimal places (1004.3459)

*/

--String data type:
--The primary difference between Standard and Unicode characters is the storage requirements.
--Standard uses a single byte of space and Unicode uses two bytes of space.

--Standard characters:
--char: holds fixed-length characters. Ex: (words or numbers)
--varchar: holds variable-length characters. Ex: (words or numbers)

--Unicode characters:
--nchar: holds fixed-length characters. Ex: (words or numbers)
--nvarchar: holds variable-length characters. Ex: (words or numbers)

--Date and time data type:
--Date: stores the type of date. Ex: (2013-11-29)
--Datetime: stores the type of date and time Ex: (2013-11-29 10:33:11.840)

--Large data type:
--binary Binary Value (max 8,000 bytes)
--varbinary Binary Value (max 8,000 bytes)
--images

 
--Examples:

USE TSQL
GO

 --When creating a table, set the data types for the columns as follows:

Create Table Employee2
(
Empid Int Identity (1, 1) Primary Key Not Null,--<<int for ID
Fnames Varchar (20) null,--<<varchar for Fname
Lnames Varchar (20) null,
EmpState Char (2) null,--<<char for EmpState (Fixed value - can only contain 2 values) If more than two characters inserted, it will error out
Age Int null,
Available Bit null,--<<integer with either 1 or 0 (yes and no)
StartingDate Date null,--<<date including the time
Salary Decimal (10, 3) null)--<<decimal for Salary with precision and scale

--Insert data into table

Insert into Employee2
Values ('Bob','Smith','NY','35', 1,'03/31/15', 70.55)

SELECT * FROM EMPLOYEE2

--Insert a text into integer data type (Will error out as the data type expects an integer and NOT a text value)

Insert into Employee2
Values ('Tom','Roland','CA','abc', 0,'01/31/15',81.55)--<<age column expects a number, not a text value as in 'abc'

--Will error out as the char data type size (char 2) can only hold 2 values

Insert into Employee2
Values('Bob','Smith','New York','35',1,'03/31/15',70.55)--<< Empstate column requires a max of 2 values (NY) not New York

--Quick way to view data type for table

Select COLUMN_NAME,DATA_TYPE,CHARACTER_MAXIMUM_LENGTH
From INFORMATION_SCHEMA.COLUMNS
Where table_name = 'EMPLOYEE2'

DROP TABLE Employee2








