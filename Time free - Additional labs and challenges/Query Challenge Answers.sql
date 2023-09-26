
/****************************************************************************************

Module 7 - Query Answers

****************************************************************************************/

USE Normalization;



-- List each of the products by category and order the output by category.

SELECT c.categoryid, c.category, p.product
FROM category_3NF AS c
JOIN product_3NF AS p 
ON c.categoryid = p.categoryid
ORDER BY category

-- List each salesperson by their location and order the output by their location.

SELECT l.location, sp.salesperson
FROM location_3NF AS l
JOIN salesperson_3NF AS sp
ON l.locationid = sp.locationid
ORDER BY location

-- List the sales of each salesperson and order the output by the salesperson.

SELECT sp.salesperson, p.product, p.productcost
FROM salesperson_3NF AS sp
JOIN sale_3NF AS s
ON sp.salespersonid = s.salespersonid
JOIN product_3NF AS p
ON s.productid = p.productid
ORDER BY salesperson


-- List the total number of items each salesperson sold and order the output by highest number of sales.

SELECT sp.salesperson, COUNT(p.product) AS NumOfSales
FROM salesperson_3NF AS sp
JOIN sale_3NF AS s
ON sp.salespersonid = s.salespersonid
JOIN product_3NF AS p
ON s.productid = p.productid
GROUP BY sp.salesperson
ORDER BY NumOfSales DESC


-- List the total sales amount sold by each salesperson and order the output by the highest total sales.

SELECT sp.salesperson, SUM(p.productcost) AS TotalSales
FROM salesperson_3NF AS sp
JOIN sale_3NF AS s
ON sp.salespersonid = s.salespersonid
JOIN product_3NF AS p
ON s.productid = p.productid
GROUP BY sp.salesperson
ORDER BY TotalSales DESC


