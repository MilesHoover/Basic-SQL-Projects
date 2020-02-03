/* How to create stored procedure */

USE AdventureWorks2017
GO
CREATE PROCEDURE dbo.uspGetAddress @City nvarchar(30) = NULL, @AddressLine1 nvarchar(60) = NULL
AS
SELECT *
FROM Person.Address
WHERE City = ISNULL(@City,City)
AND AddressLine1 LIKE '%' + ISNULL(@AddressLine1 ,AddressLine1) + '%'
GO

/* How to call */

EXEC dbo.uspGetAddress @City = 'Calgary'