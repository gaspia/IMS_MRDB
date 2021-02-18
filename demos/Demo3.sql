SELECT 'Hello World';

USE AdventureWorks


SELECT * FROM Production.Product;


SELECT Name, ListPrice
FROM Production.Product

--dataset across network, table schema might change

SELECT Name AS Product, ListPrice * 0.9
FROM Production.Product


SELECT Name AS Product, ListPrice * 0.9 AS ScalePrice
FROM Production.Product

USE AdventureWorksLT

SELECT ProductID, Name, ListPrice, StandardCost
FROM SalesLT.Product;

SELECT ProductID, [Name], ListPrice, StandardCost, ListPrice - StandardCost
FROM SalesLT.Product;

SELECT ProductID, Name, ListPrice, StandardCost, ListPrice - StandardCost AS Margin, Color --,
FROM SalesLT.Product;

SELECT ProductID, Name, ListPrice, StandardCost, ListPrice - StandardCost AS Margin
FROM SalesLT.Product;

SELECT ProductID, Name, Color, Size, Color + Size AS Style
FROM SalesLT.Product; -- turma 1 / 2

-- NULL

SELECT ProductID, Name, Color, Size, ListPrice + Size
FROM SalesLT.Product;

SELECT ProductID, Name, Color, Size, ListPrice , Size
FROM SalesLT.Product;

