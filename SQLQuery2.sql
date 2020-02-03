-----------------------------------------------------------------------------------------------------

/* How to create stored procedure with two joins and two parameters */

USE AdventureWorks2017
GO

CREATE PROCEDURE dbo.uspGetAddress @City nvarchar(30) = NULL, @AddressLine1 nvarchar(60) = NULL
AS
SELECT Person.Person.FirstName, Person.Person.MiddleName, Person.Person.LastName, Person.Address.AddressLine1, Person.Address.City
FROM Person.Address join Person.BusinessEntity ON Person.Address.AddressID = Person.BusinessEntity.BusinessEntityID
join Person.Person ON Person.BusinessEntity.BusinessEntityID = Person.Person.BusinessEntityID
WHERE City = ISNULL(@City,City)
AND AddressLine1 LIKE '%' + ISNULL(@AddressLine1 ,AddressLine1) + '%'
GO

-----------------------------------------------------------------------------------------------------

/* How to call */

EXEC dbo.uspGetAddress @City = 'Calgary', @AddressLine1 = 'A'

-----------------------------------------------------------------------------------------------------
