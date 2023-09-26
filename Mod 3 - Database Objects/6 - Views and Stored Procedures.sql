--Exercise 1 Task 1:

WHERE c.Country = 'UK'

--Exercise 1 Task 2:

SELECT * FROM dbo.Invoices
WHERE Country = 'UK'

--Exercise 2 Task 2:

CREATE VIEW dbo.ContactDirectory
AS

SELECT CompanyName, ContactName, Phone
FROM   dbo.Customers
UNION ALL
SELECT CompanyName, ContactName, Phone
FROM   dbo.Suppliers
UNION ALL
SELECT 'Northwind Traders',
       FirstName + ' ' + LastName,	Extension
FROM   dbo.Employees

--Exercise 2 Task 3:

SELECT * FROM dbo.ContactDirectory
WHERE ContactName LIKE 'A%'

--Exercise 3 Task 1:

EXEC dbo.CustOrderHist 'ALFKI'

--Exercise 3 Task 2:

EXEC dbo.SalesByCategory
     @OrdYear = 1997, @CategoryName = 'Seafood'
