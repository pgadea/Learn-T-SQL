--SQL STRING FUNCTIONS
--What is an SQL function?
--SQL functions are primarily used to manipulate and/or format the data within a column.

--Examples of functions:

USE TSQL
GO

--Create table for testing

CREATE TABLE FUNCTIONS
(FuncID int IDENTITY (1, 1) PRIMARY KEY NOT NULL,
Fname varchar (50) NULL,
Lname varchar (50) NULL,
DOB datetime NULL,
Phone varchar (30) NULL,
Zipcode varchar (10) Null,
HireDate datetime NULL,
Salary decimal (18, 4) NULL,
Sports varchar (200) NULL)

SELECT * FROM FUNCTIONS

--INSERT RECORDS INTO TABLE

INSERT INTO FUNCTIONS
VALUES
('    BOB ','  SMITH ','02/01/80','NULL','92618','06/18/11',71000.251,'the sport i like is tennis'), --<< Notice spaces being added both in front and back of fname and lname
(' SAM ',' JONES ','04/11/87','555-555-6666','92518','07/22/10',90000.524,'the SPORT i like is running'),
('     BRAD    ', 'MICHELS ','02/01/80 ',' 555-555-1212','32618','06/18/12',30000.554,'the sport i like is golf'),
('   SUE     ','   DARBY ',' 07/01/68','555-666-1212 ','92677','08/13/08', 32000.000,'the sport i like is football'),
(' frank  ','book              ','12/10/86','NULL','92225','09/18/08',1000000.587 ,'the sport i LIKE is cycling'),
(' REED','READ     ','02/01/80','555-555-2222','cs ad 35','06/18/11',712.621,'the sport i like is cycling')

SELECT * FROM FUNCTIONS

--EXAMPLES OF STRING FUNCTIONS

--LEN(EXPRESSION) --<<  COUNTS THE CHARACTERS (INCLUDING THE FRONT SPACES!)

SELECT FNAME,LEN(FNAME)AS FIRSTNAME --<< COUNT THE NUMBER OF CHARACTERS PLUS THE STARTING SPACES (TO THE LEFT OF NAME)
FROM FUNCTIONS

SELECT Lname, LEN(Lname)AS LASTNAME --<< COUNT THE NUMBER OF CHARACTERS PLUS THE STARTING SPACES (NOT INCLUDING THE ENDING SPACES!)
FROM FUNCTIONS
 
--LTRIM(EXPRESSION): removes front spaces

SELECT FNAME,LTRIM(FNAME)AS FIRSTNAME 
FROM FUNCTIONS

--RTRIM(EXPRESSION): removes ending spaces

SELECT LNAME,RTRIM(LNAME)AS LASTNAME 
FROM FUNCTIONS

--CONFIRMING THAT THE RIGHT SPACES ARE REMOVE

SELECT LNAME,(LTRIM(LNAME)) + 'X'AS LASTNAME --<< CONCATINATING LNAME WITH AN 'X' TO SHOW SPACES TO THE RIGHT!
FROM FUNCTIONS

SELECT LNAME,RTRIM(LTRIM(LNAME)) + 'X'AS LASTNAME --<< FIRST LTRIMS TRIMS THE SPACES TO THE LEFT, THEN RTRIM TRIMS THE SPACES TO THE RIGHT, AND THEN THE 'X' IS CONCATENATED
FROM FUNCTIONS                                    --<< WHEN YOU HAVE NESTED KEY WORDS, THEY WORK FROM THE INSIDE OUT!

--LEFT(EXPRESSION,LENGTH): counts the left most number of characters as specified

SELECT * FROM FUNCTIONS

SELECT FNAME,LEFT(FNAME,4) AS LEFTNAME --<< notice that it counts the front spaces first!
FROM FUNCTIONS

--RIGHT(EXPRESSION,LENGTH): counts the right most number of characters as specified
SELECT * FROM FUNCTIONS

SELECT FNAME,RIGHT(FNAME,3)AS RIGHTNAME --<< notice that it DOES counts the ending first!
FROM FUNCTIONS

--CONCAT(EXPRESSION,EXPRESSION): returns concatenated string
SELECT * FROM FUNCTIONS


SELECT FNAME,LNAME,CONCAT(FNAME,LNAME)AS CONCATNAME --joins first name and last name together WITH SPACES
FROM FUNCTIONS

--Result as above, but with right and left trimming of spaces with nested ltrim and rtrim
SELECT * FROM FUNCTIONS

SELECT FNAME, LNAME, LTRIM ((RTRIM (FNAME))) + ' ' + LTRIM ((RTRIM (LNAME))) AS CONCATNAME --joins first name and last name together
FROM FUNCTIONS                                        --<< REMEMBER THAT WHEN YOU HAVE NESTED KEYWORDS, THE INNER WORD IS EXECUTED FIRST!                                

--REVERSE (EXPRESSION): reverses the characters in a string
SELECT * FROM FUNCTIONS

SELECT SPORTS, REVERSE (SPORTS) AS REVERSESPORTS 
FROM FUNCTIONS

--REPLACE (EXPRESSION,'FIND STRING','REPLACE STRING'): replaces occurrences of a specified string
SELECT * FROM FUNCTIONS

SELECT SPORTS, REPLACE (SPORTS,'TENNIS', 'BOWLING') AS REPLACED --<<replaces a selected text
FROM FUNCTIONS

--SUBSTRING (EXPRESSION, START, TOTAL CHARACTERS)): returns the substring as specified
SELECT * FROM FUNCTIONS

SELECT SPORTS, UPPER (SUBSTRING (SPORTS, 5, 8)) AS [SUBSTRING] --<< select a word from a string in columns sports (5 indicates, count from left 5 characters, and then give the next 6 characters)
FROM FUNCTIONS                                                 --<< When nesting keywords, the inner most keyword is executed first!! (the substring)

--UPPER (EXPRESSION): converts string to upper case
SELECT * FROM FUNCTIONS

SELECT SPORTS, UPPER (SPORTS) AS UPPERSPORTS 
FROM FUNCTIONS

--LOWER (EXPRESSION): converts string to lower case
SELECT * FROM FUNCTIONS

SELECT SPORTS, LOWER (SPORTS) AS LOWERSPORTS 
FROM FUNCTIONS

--Formatted result set using string functions
SELECT * FROM FUNCTIONS

SELECT
FNAME,
LEN(Fname) AS FirstNameLEN, --<< Provides length of value in column
LTRIM(FNAME) AS FirstNameLTRIM, --<< trims left spaces
LTRIM(RTRIM(LNAME)) AS LastNameRTRIM, --<< trims both ends of spaces
DOB,
CONVERT(VARCHAR,DOB, 103) AS DOBCONVERT,--<< converts DOB with style
LEFT(FNAME,2) AS LEFTCOUNT, --<< counts from the left 2 characters including spaces
RIGHT(FNAME,3) AS RIGHTCOUNT, --<< counts from the right 3 characters including spaces
CONCAT(FNAME,LNAME) AS FULLNAME,FNAME + ',' + LNAME AS [FULL NAME CONCTENATED],--<< use of concat key word to join to columns
RTRIM(LTRIM(FNAME)) + ', ' + RTRIM(LTRIM(LNAME)) AS [FULL NAME CONCTENATED], --<< use of + ' ' + to join 2 columns
SPORTS,
REVERSE(SPORTS) AS REVERSESPORTS,--<< reverses the column values
REPLACE(SPORTS,'TENNIS','BOWLING') AS REPLACEBOWLING, --<< replaces one word from another in a text
RTRIM(LTRIM(SUBSTRING(SPORTS, 4, 6))) AS SUBSTRINGSPORTS,--<< extracts characters from column indicating start point and how many characters
LOWER(SPORTS) AS LOWERSPORTS,--<<lower use of case
UPPER (SPORTS) AS UPPERSPORTS --<<upper use of case
FROM FUNCTIONS


DROP TABLE FUNCTIONS