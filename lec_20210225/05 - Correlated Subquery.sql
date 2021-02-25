use AdventureWorks
go

--For each customer list all sales on the last day that they made a sale

SELECT CustomerID, SalesOrderID, OrderDate
FROM Sales.SalesOrderHeader AS SO1
ORDER BY CustomerID,OrderDate

SELECT CustomerID, SalesOrderID, OrderDate
FROM Sales.SalesOrderHeader AS SO1
WHERE orderdate =
(SELECT MAX(orderdate)
FROM Sales.SalesOrderHeader)


SELECT CustomerID, SalesOrderID, OrderDate
FROM Sales.SalesOrderHeader AS SO1
WHERE orderdate =
(SELECT MAX(orderdate)
FROM Sales.SalesOrderHeader AS SO2
WHERE SO2.CustomerID = SO1.CustomerID)
ORDER BY CustomerID

