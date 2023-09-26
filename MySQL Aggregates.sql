-- Exercise 1 Task 1:

USE Northwind;

SELECT COUNT(*) as NumberOfOrders
FROM	Orders;

-- Exercise 1 Task 2:

SELECT
  COUNT(*) as NumberOfOrders,
  MIN(OrderDate) as EarliestOrder,
  MAX(OrderDate) as LatestOrder
FROM	Orders;

-- Exercise 1 Task 3:

SELECT COUNT(*) as NumberOfOrders,
  MIN(OrderDate) as EarliestOrder, MAX(OrderDate) as LatestOrder
FROM	Orders
WHERE EmployeeID = 1;

-- Exercise 2 Task 1:

USE Northwind;

SELECT COUNT(OrderID) AS NumberOfOrders
FROM Orders;

-- Exercise 2 Task 2:

SELECT CustomerID, COUNT(OrderID) AS NumberOfOrders
FROM	Orders
GROUP BY CustomerID;

-- Exercise 2 Task 3:

SELECT CustomerID, COUNT(OrderID) AS NumberOfOrders
FROM	Orders
GROUP BY CustomerID
ORDER BY NumberOfOrders DESC;


-- Exercise 3 Task 1:

USE Northwind;

SELECT ProductID, SUM(Quantity) AS TotalSold
FROM	`Order Details`
GROUP BY ProductID;

-- Exercise 3 Task 2:

SELECT ProductID, SUM(Quantity * UnitPrice) AS TotalValue
FROM	`Order Details`
GROUP BY ProductID
ORDER BY TotalValue DESC;

-- Exercise 3 Task 3:

SELECT ProductID, SUM(Quantity * UnitPrice) AS TotalValue
FROM	`Order Details`
GROUP BY ProductID
HAVING SUM(Quantity * UnitPrice) <= 5000
ORDER BY TotalValue DESC;


