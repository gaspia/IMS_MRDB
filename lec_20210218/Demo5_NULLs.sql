USE AdventureWorksLT

-- NULL numbers = 0
SELECT Name, ISNULL(TRY_CAST (Size AS Integer),0) AS NumericSize
FROM SalesLT.Product;

-- NULL strings = blank string
SELECT Name, NULLIF(Color, 'Multi') AS SingleColor
FROM SalesLT.Product;

-- find first non-null date
SELECT Name, COALESCE(DiscontinuedDate, SellEndDate, SellStartDate) AS LastActivity
FROM SalesLT.Product;

--Searched case
SELECT Name,
		CASE
			WHEN SellEndDate IS NULL THEN 'On Sale'
			ELSE 'Discontinued'
		END AS SaleStatus
FROM SalesLT.Product;

--Simple case
SELECT Name,
		CASE Size
			WHEN 'S' THEN 'Small'
			WHEN 'M' THEN 'Medium'
			WHEN 'L' THEN 'Large'
			WHEN 'XL' THEN 'Extra-Large'
			ELSE ISNULL(Size, 'n/a')
		END AS ProductSize
FROM SalesLT.Product;