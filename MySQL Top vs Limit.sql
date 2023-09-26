USE NORTHWIND;

SELECT OrderID, UnitPrice, Quantity
FROM `Orders Details`
ORDER BY UnitPrice DESC, Quantity DESC 
LIMIT 10;

SELECT  OrderID, UnitPrice, Quantity
FROM `Order Details`
ORDER BY UnitPrice DESC, Quantity DESC 
LIMIT 8;

USE NORTHWIND;

-- No MySQL Equivalent to With Ties so you have to be creative: 
SELECT a.OrderID, a.UnitPrice, a.Quantity
FROM `Order Details` a
join (select distinct OrderID, UnitPrice, Quantity from `Order Details` order by  OrderID, UnitPrice, Quantity desc limit 12) b
     on a.Quantity = b.Quantity AND a.UnitPrice = b.UnitPrice AND a.OrderID = b.OrderID
ORDER BY a.UnitPrice DESC, a.Quantity DESC;

/*
SELECT PERCENT OrderID, UnitPrice, Quantity
FROM `Order Details`
ORDER BY UnitPrice DESC, Quantity DESC 
LIMIT 10 PERCENT;
*/