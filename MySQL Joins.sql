-- Exercise 1 Task 1:
USE Northwind; 

SELECT c.CustomerID, c.CompanyName, c.ContactName,
       c.City, o.OrderID, o.OrderDate
FROM   Customers AS c
JOIN   orders AS o
ON     c.CustomerID = o.CustomerID;

-- Exercise 1 Task 2:
USE Northwind; 
SELECT   c.CustomerID, c.CompanyName, c.ContactName,
         c.City, o.OrderID, o.OrderDate
FROM     Customers AS c
JOIN     orders AS o
ON       c.CustomerID = o.CustomerID
WHERE    c.Country = 'UK'
ORDER BY c.CompanyName, o.OrderDate;

-- Exercise 1 Task 3:
USE Northwind; 
SELECT   c.CustomerID, c.CompanyName, c.ContactName,
         o.OrderID, o.OrderDate, od.ProductID,
         p.ProductName, od.Quantity
FROM     Customers AS c
JOIN     orders AS o
ON       c.CustomerID = o.CustomerID
JOIN     `Order Details` AS od
ON       o.OrderID = od.OrderID
JOIN     Products AS p
ON       od.ProductID = p.ProductID
WHERE    c.Country = 'UK'
ORDER BY c.CompanyName, o.OrderDate;

-- Exercise 2 Task 1:

USE Northwind;

SELECT COUNT(*) FROM Customers;

-- Exercise 2 Task 2:
USE Northwind; 
SELECT   c.CompanyName, COUNT(o.OrderID) AS NumOrders
FROM	    Customers AS c
JOIN	    Orders AS o
ON	    o.CustomerID = c.CustomerID
GROUP BY c.CompanyName
ORDER BY NumOrders;

-- Exercise 2 Task 3:
USE Northwind; 
SELECT
	c.CompanyName, COUNT(o.OrderID) AS NumOrders,
	MIN(o.OrderDate) AS MinDate
FROM
	Orders AS o
RIGHT OUTER JOIN
	Customers AS c
ON
	o.CustomerID = c.CustomerID
GROUP BY
	c.CompanyName
ORDER BY
	NumOrders;

-- Exercise 3 Task 1:

USE Northwind; 

SELECT CompanyName,	ContactName, Phone
FROM	Customers;

-- Exercise 3 Task 2:
USE Northwind; 
SELECT CompanyName,	ContactName, Phone
FROM	Suppliers;

-- Exercise 3 Task 3:
USE Northwind; 
SELECT FirstName + ' ' + LastName,	Extension
FROM   Employees;


-- Exercise 3 Task 4:
USE Northwind; 

SELECT CompanyName, ContactName, Phone
FROM   Customers

UNION ALL

SELECT CompanyName, ContactName, Phone
FROM   Suppliers

UNION ALL

SELECT 'Northwind Traders',
       FirstName + ' ' + LastName,	Extension
FROM   Employees;

