-- Try to find salespeople with over 150 customers (fails with error)
SELECT Salesperson, COUNT(CustomerID) Customers
FROM SalesLT.Customer
WHERE COUNT(CustomerID) > 100
GROUP BY Salesperson
ORDER BY Salesperson;

--Need to use HAVING clause to filter based on aggregate
SELECT Salesperson, COUNT(CustomerID) Customers
FROM SalesLT.Customer
GROUP BY Salesperson
HAVING COUNT(CustomerID) > 100
ORDER BY Salesperson;


SELECT ProductID, SUM(sod.OrderQty) AS Quantity
FROM SalesLT.SalesOrderDetail AS sod
JOIN SalesLT.SalesOrderHeader AS soh
ON sod.SalesOrderID = soh.SalesOrderID
WHERE YEAR (soh.OrderDate) = 2008  --AND SUM(sod.OrderQty)>50
GROUP BY ProductID


--HAVING SUM(sod.OrderQty)>50

