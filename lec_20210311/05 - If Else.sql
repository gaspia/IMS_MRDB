--Simple logical test
If 'Yes'='No'
Print 'True'


--Change code based on a condition
UPDATE SalesLT.Product
SET DiscontinuedDate=getdate()
WHERE ProductID=1;   --try with 680

IF @@ROWCOUNT<1
BEGIN
	PRINT 'Product was not found'
END
ELSE
BEGIN
	PRINT 'Product Updated'
END
