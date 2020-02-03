----------------------------------------------------------

CREATE DATABASE MyDatabase2

----------------------------------------------------------

USE MyDatabase2

----------------------------------------------------------

CREATE TABLE Orders (
	OrderID int IDENTITY(1,1),
	CarID int,
	FirstName varchar(255),
	LastName varchar(255),
);

----------------------------------------------------------

CREATE TABLE Cars (
	OrderID int IDENTITY(100,1),
	CarID int,
	Make varchar(255),
	Model varchar(255),
	Year int
);

----------------------------------------------------------

INSERT INTO Orders (CarID, FirstName, LastName)
VALUES 
	(1000, 'Mike', 'Jones'),
	(1001, 'Shelby', 'Hacker'),
	(1002, 'Thomas', 'whicker');

----------------------------------------------------------

INSERT INTO Cars (CarID, Make, Model, Year)
VALUES
	(6349645, 'Toyota', '4Runner', 1999),
	(3876244, 'Nissan', 'Altima', 2007),
	(0970701, 'Chevrolet', 'Camaro', 2013);

----------------------------------------------------------

SELECT Orders.OrderID, Orders.CarID, Orders.FirstName, Orders.LastName, Cars.Make, Cars.Model
FROM Orders
INNER JOIN Cars ON Orders.OrderID=Cars.OrderID;
GO;

----------------------------------------------------------

CREATE PROCEDURE GetCars @Make nvarchar(30), @Year int
AS
SELECT * 
FROM Cars
WHERE Make = @Make AND Year = @Year

----------------------------------------------------------

EXEC GetCars @Make = 'Toyota', @Year = 1999;

----------------------------------------------------------

SELECT * FROM Orders
SELECT * FROM Cars

----------------------------------------------------------