--Numeric functions

--SELECT ROUND (column,decimals) FROM table_name; : rounds the number to a specified length. requires 2 parameters


SELECT 
[SalesYTD],
[SalesLastYear]
FROM [AdventureWorks2012].[Sales].[SalesPerson]

SELECT 
[SalesYTD],Round([SalesYTD],3) as SalesYTDRounded,
[SalesLastYear],Round([SalesLastYear],2) as SalesLastYearRounded
FROM [AdventureWorks2012].[Sales].[SalesPerson]

--Drop table tblNumeric

Use TSQL
GO

Create Table tblNumeric
(tblNumericID int Identity (1,1) Primary Key,
Fname varchar (20),
Lname varchar (20),
[Address] varchar (50),
City varchar (50),
State char (2),
Zip varchar (20),
HireDate Date,
HourlyWages Decimal (4,2),
TotalSales int
)


Insert Into tblNumeric
Values 
('   Bob' ,'  Smith','123 Elm Street','Irvine','CA','92620','02/04/2012',15.15,22),
('Tom','  Jones','555 Elm Street','Irvine','CA','92620','03/01/2012',10.58,34),
('Ben','Hendal   ','767 Elm Street','Irvine','CA','92620','04/05/2012',15.23,567),
('    Sue','Woods   ','234 Elm Street','Irvine','CA','thezip','05/06/2012',20.45,98),
('Rob  ','Redford    ','664 Elm Street','Irvine','CA','926aaa','06/07/2012',45.00,987)

Select * from tblNumeric


--ISNUMERIC (EXPRESSION) - a Boolean value returning 1 if it’s a numeric, otherwise 0

SELECT ZIP, ISNUMERIC (ZIP) AS NUMERIC_OR_NOT, --<< Note that a value with partial text is 0 if it contains string
[Address], ISNUMERIC (Address) AS NUMERIC_OR_NOT
FROM tblNumeric

--Date/time tblNumeric:

SELECT * FROM tblNumeric

SELECT GETDATE () AS TODAYS_DATE --<< returns the current date and time

SELECT DAY (GETDATE ()) AS TODAYS_DAY --<< to extract the day from the current date use day

SELECT MONTH (GETDATE ()) AS TODAYS_MONTH --<< to extract the month from the current date use month

SELECT YEAR (GETDATE ()) AS TODAYS_YEAR --<< to extract the year from the current date use year


--The DATEADD () function adds or subtracts a specified time interval to a date.
--The syntax is : DATEADD(datepart,number,date)
--datepart is a date expression
--number is the number of interval you want to add, either plus or minus
--date is the value against the expression (column)

SELECT GETDATE()
SELECT DATEADD (MONTH, 1, GETDATE ()) AS ADD_MONTH  --<<ADD A MONTH TO THE CURRENT DATE

SELECT GETDATE()
SELECT DATEADD (MONTH,-1, GETDATE ()) AS SUBTRACT_MONTH  --<<SUBTRACT A MONTH TO THE CURRENT DATE

SELECT GETDATE()
SELECT DATEADD (DAY, 1, GETDATE ()) AS ADD_DAY --<<ADD A DAY TO THE CURRENT DATE

SELECT GETDATE()
SELECT DATEADD (DAY,-1, GETDATE ()) AS SUBTRACT_DAY  --<<SUBTRACT A DAY TO THE CURRENT DATE



--HOW MANY MONTHS HAVE EMPLOYEES WORKED FOR THE COMPANY?
--HOW MANY MONTHS HAS BOB WORKED FOR THE COMPANY?

--DATEDIFF (date): returns number of units between the two specified dates
--the syntax is: DATEDIFF(datepart,startdate,enddate)
--datepart is a date expression
--startdate is the first expression
--enddate is the second expression

SELECT
RTRIM(LTRIM(FNAME)) AS FirstName, --<< I have trimmed the fname using both ltrim and rtrim
RTRIM(LTRIM(LNAME)) AS LastName,  --<< I have trimmed the lname using both ltrim and rtrim
HIREDATE,
CONVERT (VARCHAR (27),DATEDIFF(MONTH,HireDate,GETDATE())) AS MONTHS_WORKED --<< gives the difference between the hiredate and present date (GETDATE())
FROM tblNumeric
WHERE FNAME LIKE '%BOB'

--GIVE BONUS OF 10 PERCENT TO AN EMPLOYEE WHO HAS WORKED GREATED THAN 40 MONTHS

SELECT
RTRIM(LTRIM(FNAME)) AS FirstName, --<< I have trimmed the fname using both ltrim and rtrim
RTRIM(LTRIM(LNAME)) AS LastName,  --<< I have trimmed the lname using both ltrim and rtrim
HIREDATE,
CONVERT (VARCHAR (27),DATEDIFF(MONTH,HireDate,GETDATE())) AS MONTHS_WORKED --<< gives the difference between the hiredate and present date (GETDATE())
FROM tblNumeric

SELECT
UPPER(RTRIM(LTRIM(FNAME))) AS FirstName,   --<< I have trimmed the fname using both ltrim and rtrim and made the result in upper case
LOWER(RTRIM(LTRIM(LNAME))) AS LastName,
CONVERT (VARCHAR,HIREDATE,101) AS HireDate,  --<< converted the hiredate with a different style (101)
CONVERT (VARCHAR (27),DATEDIFF(MONTH,HireDate,GETDATE())) AS MONTHS_WORKED,  --<<
HourlyWages,
Round(HourlyWages * .10,0) AS BONUS,
Round(HourlyWages * .10,0) + HourlyWages AS WAGESWITHBONUS
FROM tblNumeric
WHERE CONVERT (VARCHAR (27),DATEDIFF(MONTH,HireDate,GETDATE())) >= 40

--WHAT IS THE NAME OF THE MONTH AND DAY EACH EMPLOYEE STARTED WORKING?

--DATENAME(date): returns the name of the date specified as a character

SELECT
LTRIM(Fname) AS FirstName,
LTRIM(RTRIM(Lname)) AS LastName,
HireDate,
DATENAME(MONTH,HIREDATE) AS MONTH_HIRED, --<< provides the actual day info
DATENAME(DAY, HireDate) AS [DAY_DATE],
DATENAME(WEEKDAY,HIREDATE) AS [WEEKDAY]
FROM tblNumeric

--The DATEPART(EXPRESSION) function is used to return a single part of a date/time
--DATEPART(datepart,date)
--datepart is either year, month, day, or mins
--date is the expression (date column)

SELECT FNAME,tblNumericID, HireDate, 
DATEPART(yyyy, HireDate) AS Function_Year,
DATEPART(mm, HireDate) AS Function_Month,
DATEPART(dd, HireDate) AS Function_Day
FROM tblNumeric
WHERE tblNumericID In (1,2,3)

--Example of how to use date function. When is a holiday?  The following script will get CURRENT DATE and determine if it's a holiday.
--IS TODAY A HOLIDAY??

SELECT 
CASE 
WHEN (MONTH (GETDATE ()) = 7 AND DAY (GETDATE ()) = 4) OR -- July the 4th
     (MONTH (GETDATE ()) = 1 AND DAY (GETDATE ()) = 1) OR -- New Year's Day
     (MONTH (GETDATE ()) = 12 AND DAY (GETDATE ()) = 25) OR -- Christmas Day
     (MONTH (GETDATE ()) = 11 AND DAY (GETDATE ()) BETWEEN 22 AND 28
                            AND DATENAME (DW, GETDATE ()) = 'Thursday') OR -- Thanksgiving
     (MONTH (GETDATE ()) = 5 AND DAY (GETDATE ()) BETWEEN 25 AND 31
                            AND DATENAME (DW, GETDATE ()) = 'Monday') OR -- Memorial Day
     (MONTH (GETDATE ()) = 9 AND DAY (GETDATE ()) BETWEEN 1 AND 7
                            AND DATENAME (DW, GETDATE ()) = 'Monday') -- Labor Day
THEN 'Holiday'
ELSE 'Not a Holiday' 
END AS [Is US Holiday]








 


 

