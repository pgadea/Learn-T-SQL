/*

What is a trigger?

A trigger is a special type of a procedure that 'fires' when an event such as INSERT, DELETE or UPDATE occurs
A trigger fires when we modify the data to the associated table by using one of the events INSERT, DELETE or UPDATE
Triggers are primarily used for referential integrity of data
DML triggers use the deleted and inserted logical (conceptual) tables and are not viewable via the select statement
Two typs of triggers in this demo. After and Instead Of
After triggers fire immediately after the event
Instead Of fires preventing the event from happening

*/


Use TSQL
Go

-- Select Grades table to put trigger on

SELECT [GRADEID]
      ,[FNAME]
      ,[GRADE]
  FROM [TSQL].[dbo].[GRADES]

-- Create a simple trigger to print a statement with current date concatinated when an Insert occurs

CREATE TRIGGER Trg_Grades_Insert --<< Trigger name
ON Grades                        --<< attaching the table with a trigger
AFTER INSERT                     --<< for this type of event (either insert, update or delete) Will run immediately AFTER the event has occured
AS
BEGIN
	PRINT 'Note that an insert has been made for grades' + ' ' + Convert(varchar (20),GETDATE(), 101) --<<  PRINT keyword prints whatever is in single quotes
	SELECT * FROM INSERTED
END
GO

--Insert values in grades table (this modification (event-INSERT) to the attached table will cause the trigger to fire (execute)

INSERT GRADES
VALUES ('Samson', 95)

--View insert via normal table

SELECT *
FROM [TSQL].[dbo].[GRADES]

-- When you need to alter the trigger, use the ALTER keyword.  EX: Changing the text

ALTER TRIGGER [dbo].[Trg_Grades_Insert]
ON [dbo].[GRADES]
AFTER INSERT
AS
BEGIN
	PRINT 'We have altered the print statement using ALTER' + ' - '   +  Convert(varchar (20),GETDATE(), 101) 
	SELECT * FROM INSERTED
END
GO
--Insert values in grades table (this modification (event-INSERT) to the attached table will cause the trigger to fire (execute)

INSERT GRADES VALUES ('Lucy', 56)

--View insert via normal table

SELECT *
FROM [TSQL].[dbo].[GRADES]

--Creating a trigger for all the events (Insert, Delete, Update) --<< Data definition language (DML)

CREATE TRIGGER Trg_Grades_Insert_Delete_Update --<< Trigger name
ON Grades                        --<< attaching the table with a trigger
AFTER INSERT,DELETE, UPDATE        --<< for type of event (insert, update or delete)  will fire for ANY type of modification to the table
AS
BEGIN
	PRINT 'You either had an insert, delete or an update against your table' + ' '  + Convert(varchar (20),GETDATE(), 101) --<< PRINT keyword prints whatever is in single quotes
	SELECT * FROM INSERTED
END
GO

--Inserting, updating and deleting from the Grades table

INSERT GRADES VALUES ('Jacqueline', 87)

--View insert via normal table

SELECT *
FROM [TSQL].[dbo].[GRADES]

UPDATE GRADES
SET GRADE = 91
WHERE FNAME = 'JACQUELINE'

DELETE GRADES
WHERE FNAME = 'JACQUELINE'

--View insert via normal table 

SELECT *
FROM [TSQL].[dbo].[GRADES]

--Using a Instead Of trigger. When using this trigger, note that no data has been inserted by the insert command!!

CREATE TRIGGER Trg_Grades_Insert_Delete_Updates --<< Trigger name
ON Grades                                  --<< attaching the table with a trigger
INSTEAD OF INSERT, UPDATE           --<< for type of event (insert, update or delete)  will fire for any type of modification to the table
AS
BEGIN
	RAISERROR ('You either had an insert, delete or an update against your table',16,1) --<< PRINT keyword prints whatever is in single quotes
END
GO


INSERT GRADES VALUES ('Jacqueline', 87) --<< this insert 'failed' to insert a record because of the Instead Of trigger

Select * from GRADES

--A little more detailed trigger
--This trigger prevents a row from being inserted in the Purchasing.PurchaseOrderHeader table
--when the credit rating of the specified vendor is set to 5 (below average).

Use Adventureworks2012
GO

CREATE TRIGGER Purchasing.LowCredit ON Purchasing.PurchaseOrderHeader
AFTER INSERT
AS
IF EXISTS (SELECT *
           FROM Purchasing.PurchaseOrderHeader AS p 
           JOIN inserted AS i 
           ON p.PurchaseOrderID = i.PurchaseOrderID 
           JOIN Purchasing.Vendor AS v 
           ON v.BusinessEntityID = p.VendorID
           WHERE v.CreditRating = 5
          )
BEGIN
RAISERROR ('A vendor''s credit rating is too low to accept new
purchase orders.', 16, 1);
ROLLBACK TRANSACTION;
RETURN 
END;
GO

-- This statement attempts to insert a row into the PurchaseOrderHeader table
-- for a vendor that has a below average credit rating.
-- The AFTER INSERT trigger is fired and the INSERT transaction is rolled back.

INSERT INTO Purchasing.PurchaseOrderHeader (RevisionNumber, Status, EmployeeID,
VendorID, ShipMethodID, OrderDate, ShipDate, SubTotal, TaxAmt, Freight)
VALUES (
2
,3
,261
,1652
,4
,GETDATE()
,GETDATE()
,44594.55
,3567.564
,1114.8638 );
GO



--Delete the trigger with the Drop keyword

DROP TRIGGER [dbo].[Trg_Grades_Insert]
GO

DROP TRIGGER Trg_Grades_Insert_Delete_Update
GO

DROP TRIGGER Trg_Grades_Insert_Delete_Updates


DROP TRIGGER Trg_Grades_Inserted_Table
GO

DROP Trg_Grades_Delete_Table
GO

USE AdventureWorks2012
GO

DROP TRIGGER Purchasing.LowCredit
GO

/*

Two system controlled tables called Inserted table and Deleted table is where all the records of inserts, deletes and updates are recorded by the system
you CANNOT directly query against the tables via a select statement as they are embedded in the system memory.  However, you can see the results of the
two inserted and deleted tables when 'encapsulated' in a trigger

*/


--Inserting a new record in the INSERTED table can be viewed using the trigger

CREATE TRIGGER Trg_Grades_Inserted_Table --<< Trigger name
ON Grades                                  --<< attaching the table with a trigger
AFTER INSERT        
AS
BEGIN
	SELECT * FROM INSERTED  --<< Select statement against the Inserted table (Runnning the Select statement itself causes an error)
END
GO


-- Insert a record

INSERT GRADES VALUES ('Jackie', 100)  --Note that when I run this insert statement, I see the result of the insert statement

--Deleteing a record in the DELETED table can be viewed using the trigger

SELECT * FROM GRADES --<< 13 RECORDS

CREATE TRIGGER Trg_Grades_Delete_Table --<< Trigger name
ON Grades                                  --<< attaching the table with a trigger
AFTER DELETE        
AS
BEGIN
	SELECT * FROM DELETED  --<< Select statement against the Inserted table (Runnning the Select statement itself causes an error)
END
GO

--Record Jackquline is deleted and is shown when running the trigger

DELETE GRADES
WHERE FNAME = 'Jackie'

SELECT * FROM GRADES --<< 12 RECORDS