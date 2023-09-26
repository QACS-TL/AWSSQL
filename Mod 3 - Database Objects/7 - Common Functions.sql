--Exercise 1 Task 1:

SELECT
	CompanyName,
	CHARINDEX(' ', ContactName),
	ContactName,
	Phone
FROM
	dbo.Customers

--Exercise 1 Task 2:

SELECT CompanyName,
       LEFT(ContactName, CHARINDEX(' ', ContactName))
         AS FirstName,
       SUBSTRING(ContactName,
         CHARINDEX(' ', ContactName) + 1, 50)
         AS LastName,
	  Phone
FROM   dbo.Customers
UNION ALL
SELECT CompanyName,
       LEFT(ContactName, CHARINDEX(' ', ContactName))
         AS FirstName,
       SUBSTRING(ContactName,
         CHARINDEX(' ', ContactName) + 1, 50)
         AS LastName,
	  Phone
FROM   dbo.Suppliers
UNION ALL
SELECT 'Northwind Traders', FirstName,
       LastName, Extension
FROM   dbo.Employees

--Exercise 1 Task 3:

ORDER BY LastName

 
--Exercise 2 Task 1:

SELECT  c.CompanyName, COUNT(o.OrderID) AS NumOrders,
        MIN(o.OrderDate) AS MinDate
FROM      dbo.Customers AS c
LEFT JOIN dbo.Orders AS o
ON        o.CustomerID = c.CustomerID
WHERE     YEAR(o.OrderDate) = 1996
GROUP BY  c.CompanyName
ORDER BY  NumOrders

--Exercise 3 Task 1:

SELECT  c.CompanyName, COUNT(o.OrderID) AS NumOrders,
       ISNULL(MIN(o.OrderDate), 'None placed') AS MinDate
FROM      dbo.Customers AS c
LEFT JOIN dbo.Orders AS o
ON        o.CustomerID = c.CustomerID
GROUP BY  c.CompanyName
ORDER BY  NumOrders

--Exercise 3 Task 2:

SELECT  c.CompanyName, COUNT(o.OrderID) AS NumOrders,
       ISNULL(
         CONVERT(
           VARCHAR(20),
           MIN(o.OrderDate),
           106),
         'None placed') AS MinDate
FROM      dbo.Customers AS c
LEFT JOIN dbo.Orders AS o
ON        o.CustomerID = c.CustomerID
GROUP BY  c.CompanyName
ORDER BY  NumOrders

 
