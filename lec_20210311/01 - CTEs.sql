--Using a CTE
WITH ProductsByCategory (ProductID, ProductName, Category)
AS
(
	SELECT p.ProductID, p.Name, c.Name AS Category
	 FROM SalesLT.Product AS p
	 JOIN SalesLT.ProductCategory AS c
	 ON p.ProductCategoryID = c.ProductCategoryID
)

SELECT Category, COUNT(ProductID) AS Products
FROM ProductsByCategory
GROUP BY Category
ORDER BY Category;


-- Recursive CTE


Create Table OrganizationalStructures (
 BusinessUnitID smallint identity(1,1),
 BusinessUnit varchar(100) Not Null,
 ParentUnitID smallint
)
insert into OrganizationalStructures values
('Adventure Works Cycle',NULL),
('Customer Care',1),
('Service',1),
('Channel Sales & Marketing',1),
('Customer Support',2),
('OEM Support',2),
('Central Region',3),
('Eastern Region',3),
('Western Region',3),
('OEM',4),
('Channel Marketing',4),
('National Accounts',4),
('Channel Field Sales',4),
('National Channel Marketing',11),
('Retail Channel Marketing',11),
('Central Region',13),
('Eastern Region',13),
('Western Region',13),
('Bicycles',15),
('Bicycle Parts',15)
/*
insert into OrganizationalStructures values
('Adventure Works Cycle',NULL),
('Customer Care',1),
('Service',1),
('Channel Sales & Marketing',1),
('Customer Support',2),
('OEM Support',2),
('Central Region',3),
('Eastern Region',3),
('Western Region',3),
('OEM',4),
('Channel Marketing',4),
('National Accounts',4),
('Channel Field Sales',4),
('National Channel Marketing',11),
('Retail Channel Marketing',11),
('Central Region',13),
('Eastern Region',13),
('Western Region',13),
('Bicycles',15),
('Bicycle Parts',15)*/


select * from OrganizationalStructures;

WITH Recursive_CTE AS (

 -- Anchor query
 SELECT child.BusinessUnitID, child.BusinessUnit, CAST(child.ParentUnitID as SmallInt) ParentUnitID, CAST(NULL as varchar(100)) ParentUnit
 FROM OrganizationalStructures child
 WHERE BusinessUnitID = 1

 UNION ALL

 -- Recursive query
 SELECT child.BusinessUnitID,  child.BusinessUnit,  child.ParentUnitID, parent.BusinessUnit ParentUnit
 FROM Recursive_CTE parent
 INNER JOIN OrganizationalStructures child ON child.ParentUnitID = parent.BusinessUnitID
)

SELECT * FROM Recursive_CTE 


drop table OrganizationalStructures