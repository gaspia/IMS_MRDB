USE AdventureWorksLT

-- CAST
SELECT CAST(ProductID AS varchar(5)) + ': ' + Name As ProductName
FROM SalesLT.Product;

-- CONVERT
SELECT CONVERT(varchar(5), ProductID) + ': ' + Name As ProductName
FROM SalesLT.Product;

-- Convert dates
SELECT SellStartDate,
		CONVERT(nvarchar(30), SellStartDate) AS Convertedate,
		CONVERT(nvarchar(30), SellStartDate, 126) AS ISO8601FormatDate
FROM SalesLT.Product;

-- https://docs.microsoft.com/en-us/sql/t-sql/functions/cast-and-convert-transact-sql

-- Cast
SELECT Name, CAST (Size AS Integer) AS NumericSize
FROM SalesLT.Product;


-- Try to Cast
SELECT Name, TRY_CAST (Size AS Integer) AS NumericSize
FROM SalesLT.Product;