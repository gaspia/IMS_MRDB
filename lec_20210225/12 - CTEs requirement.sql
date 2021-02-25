USE [AdventureWorksLT]
GO

CREATE TABLE [SalesLT].Employees(
	[EmployeeID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[EmployeeName] [dbo].[Name] NOT NULL,
	[ManagerID] [int] 
	CONSTRAINT [PK_Employees_EmployeeID] PRIMARY KEY CLUSTERED 
	(
		[EmployeeID] ASC
	)
)

INSERT INTO [SalesLT].Employees VALUES ('Peter',NULL)
INSERT INTO [SalesLT].Employees VALUES ('Linda',1)
INSERT INTO [SalesLT].Employees VALUES ('Nick',1)
INSERT INTO [SalesLT].Employees VALUES ('Cindy',3)
INSERT INTO [SalesLT].Employees VALUES ('John',4)


--DROP TABLE [SalesLT].Employees
--TRUNCATE TABLE [SalesLT].Employees
