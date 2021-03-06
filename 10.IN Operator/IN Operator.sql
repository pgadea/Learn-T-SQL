
--The IN operator allows you to specify multiple values in a WHERE clause.
--Using the IN Operator. Rather than filtering the firstname one by one, place the firstname in an IN operator.

SELECT [BusinessEntityID]
      ,[PersonType]
      ,[NameStyle]
      ,[Title]
      ,[FirstName]
      ,[MiddleName]
      ,[LastName]
      ,[Suffix]
      ,[EmailPromotion]
      ,[AdditionalContactInfo]
      ,[Demographics]
      ,[rowguid]
      ,[ModifiedDate]
  FROM [AdventureWorks2012].[Person].[Person]
  Where 
  FirstName = 'Ken' OR
  FirstName = 'Terri' OR
  FirstName = 'Rob'
  Order By FirstName





  --Using the IN Operator for more efficient query

  SELECT [BusinessEntityID]
      ,[PersonType]
      ,[NameStyle]
      ,[Title]
      ,[FirstName]
      ,[MiddleName]
      ,[LastName]
      ,[Suffix]
      ,[EmailPromotion]
      ,[AdditionalContactInfo]
      ,[Demographics]
      ,[rowguid]
      ,[ModifiedDate]
  FROM [AdventureWorks2012].[Person].[Person]
  Where 
  FirstName IN ('Ken','Terri','Rob')
  Order By FirstName



