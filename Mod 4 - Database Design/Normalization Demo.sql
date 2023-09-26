/*******************************************************************************************************
Normalization Demo

Starting from Normal Form - 0, work your way through this script and create each form - one step
at a time, while considering the purpose of the normalization process.

Also consider the questions that are being asked.

*******************************************************************************************************/

USE master 
CREATE DATABASE Normalization
GO

USE Normalization
GO

CREATE TABLE [dbo].[sales_0NF]
(
	[salesid] [int] IDENTITY(1,1) NOT NULL,
	[salesperson] [nchar](50) NOT NULL,
	[productid] [int] NOT NULL,
	[product] [nchar](50) NOT NULL,
	[productcost] [decimal](18, 0) NOT NULL,
	[category] [nchar](50) NOT NULL,
	[location] [nchar](50) NOT NULL,
 CONSTRAINT [PK_sales_0NF] PRIMARY KEY CLUSTERED ([salesid] ASC)
) ON [PRIMARY]
GO

INSERT INTO dbo.sales_0NF 
VALUES('John Richards',2,'DAB Radio',99.5,'Electrical','Princess Street')

INSERT INTO dbo.sales_0NF 
VALUES('Susan Penny',1,'LCD 37 inch Television',450.0,'Electrical','Fields Lock')

INSERT INTO dbo.sales_0NF 
VALUES('Morgan Jones',5,'Mens XL Rain Coat Green',125.0,'Clothing','Princess Street')

INSERT INTO dbo.sales_0NF 
VALUES('John Richards',4,'15.4 Core 2 Duo Notebook',375.99,'Electrical','Princess Street')

INSERT INTO dbo.sales_0NF
VALUES('Maria Marques',3,'Italian Silk Tie',55.0,'Clothing','Morley Road')

INSERT INTO dbo.sales_0NF 
VALUES('Morgan Jones',6,'Set of Five Cooking Pans',97.0,'Kitchenware','Fields Lock')

SELECT * FROM dbo.sales_0NF

/*********************************************************************************

  1NF (First Normal Form) - Designed to eliminate the 'unnecessary' complexity of queries

- Eliminate duplication of row data
  This requires that each row has a unique identity value associated with it
- Data values should be 'atomic' - not a list or similar
- The table should have no repeating Columns - or a table within a table.
  This means that you should not have multiple items of the same column type
  in your table, such as more than one telephone number column or product names
  as with our example.


Questions

1. Can we add a new product to the Sales table without affecting the other columns?
2. Can we delete a product from the database table without affecting the other columns?
3. If a new Salesperson joins the company, can we add their name?
   What product/s have they sold?  What category of goods should be added?

*********************************************************************************/


CREATE TABLE [dbo].[salesperson_1NF]
(
	[salespersonid] [int] IDENTITY(1,1) NOT NULL,
	[salesperson] [nchar](50) NOT NULL,
	[category] [nchar](50) NOT NULL,
	[location] [nchar](50) NOT NULL,
 CONSTRAINT [PK_salesperson_1NF] PRIMARY KEY CLUSTERED ([salespersonid] ASC)
) ON [PRIMARY]
GO


CREATE TABLE [dbo].[product_1NF](
	[productid] [int] IDENTITY(1,1) NOT NULL,
	[product] [nchar](50) NOT NULL,
	[productcost] [money] NOT NULL,
	[salespersonid] [int] NOT NULL
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[product_1NF]  WITH CHECK 
ADD CONSTRAINT [FK_product_1NF_salesperson_1NF] FOREIGN KEY([salespersonid])
REFERENCES [dbo].[salesperson_1NF] ([salespersonid])
GO

INSERT INTO dbo.salesperson_1NF 
VALUES('John Richards','Electrical','Princess Street')

INSERT INTO dbo.salesperson_1NF 
VALUES('Susan Penny','Electrical','Fields Lock')

INSERT INTO dbo.salesperson_1NF 
VALUES('Morgan Jones','Clothing','Princess Street')

INSERT INTO dbo.salesperson_1NF 
VALUES('Maria Marques','Clothing','Morley Road')

INSERT INTO dbo.product_1NF
VALUES('DAB Radio',99.5,1)

INSERT INTO dbo.product_1NF
VALUES('LCD 37 inch Television',450.0,2)

INSERT INTO dbo.product_1NF
VALUES('Mens XL Rain Coat Green',125.0,3)

INSERT INTO dbo.product_1NF
VALUES('15.4 Core 2 Duo Notebook',375.99,1)

INSERT INTO dbo.product_1NF
VALUES('Italian Silk Tie',55.0,4)

INSERT INTO dbo.product_1NF
VALUES('Set of Five Cooking Pans',97.0,3)


SELECT * FROM dbo.salesperson_1NF 
SELECT * FROM dbo.product_1NF


/*********************************************************************************

  2NF (Second Normal Form) - Designed to further eliminate insert/update/delete anomalies

- Remove subsets of data that could lead to duplicates of data
  As per our example, for each salesperson who made a sale, this would be recorded
  in the products table. However, this would lead to duplicate entries being added
  to the table. This is because the product name (non-key column) is not dependent on
  its own key. The way to solve this is to separate the product details from the sale
  information.


Ask the same Questions again:

1. Can we add a new product to the Sales table without affecting the other columns?
2. Can we delete a product from the database Sales table without affecting the other columns?
3. If a new Salesperson joins the company, can we add their name?
   What product/s have they sold?  What category of goods should be added?

*********************************************************************************/


CREATE TABLE [dbo].[salesperson_2NF]
(
	[salespersonid] [int] IDENTITY(1,1) NOT NULL,
	[salesperson] [nchar](50) NOT NULL,
	[category] [nchar](50) NOT NULL,
	[location] [nchar](50) NOT NULL,
 CONSTRAINT [PK_salesperson_2NF] PRIMARY KEY CLUSTERED ([salespersonid] ASC)
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[product_2NF]
(
	[productid] [int]	IDENTITY(1,1),
	[productame]	[nchar](50)	NOT NULL,
	[productcost]	[money]	NOT NULL,
 CONSTRAINT [PK_product_2NF] PRIMARY KEY CLUSTERED ([productid] ASC )
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[sales_2NF]
(
	[productid] [int] NOT NULL,
	[salespersonid] [int] NOT NULL
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[sales_2NF]  WITH CHECK 
ADD CONSTRAINT [FK_sales_2NF_salesperson_2NF] FOREIGN KEY([salespersonid])
REFERENCES [dbo].[salesperson_2NF] ([salespersonid])
GO

ALTER TABLE [dbo].[sales_2NF]  WITH CHECK 
ADD CONSTRAINT [FK_sales_2NF_product_2NF] FOREIGN KEY([productid])
REFERENCES [dbo].[product_2NF] ([productid])
GO

INSERT INTO dbo.salesperson_2NF 
VALUES('John Richards','Electrical','Princess Street')

INSERT INTO dbo.salesperson_2NF 
VALUES('Susan Penny','Electrical','Fields Lock')

INSERT INTO dbo.salesperson_2NF 
VALUES('Morgan Jones','Clothing','Princess Street')

INSERT INTO dbo.salesperson_2NF 
VALUES('Maria Marques','Clothing','Morley Road')

INSERT INTO dbo.product_2NF
VALUES('DAB Radio',99.5)

INSERT INTO dbo.product_2NF
VALUES('LCD 37 inch Television',450.0)

INSERT INTO dbo.product_2NF
VALUES('Mens XL Rain Coat Green',125.0)

INSERT INTO dbo.product_2NF
VALUES('15.4 Core 2 Duo Notebook',375.99)

INSERT INTO dbo.product_2NF
VALUES('Italian Silk Tie',55.0)

INSERT INTO dbo.product_2NF
VALUES('Set of Five Cooking Pans',97.0)

INSERT INTO dbo.sales_2NF
VALUES(1,1)
INSERT INTO dbo.sales_2NF
VALUES(2,2)
INSERT INTO dbo.sales_2NF
VALUES(3,3)
INSERT INTO dbo.sales_2NF
VALUES(4,1)
INSERT INTO dbo.sales_2NF
VALUES(5,4)
INSERT INTO dbo.sales_2NF
VALUES(6,3)

SELECT * FROM salesperson_2NF
SELECT * FROM product_2NF
SELECT * FROM sales_2NF

/*********************************************************************************

  3NF (Third Normal Form) - Designed to further dissolve the possibility of any duplication/anomaly issues 

- Remove all non-key columns that do not fully depend on the table's primary key.
  To understand how to interpret 3NF we must look at the primary key tables and 
  decide which columns uniquely identify a row. For the salesperson table we
  can see that salespersonid and salesperson are used to uniquely identify a 
  sales person, but category and location do not. In fact the location 
  column makes the table vulnerable to logical inconsistencies as it is 
  possible that the category names can appear in different locations
  on different records

  PLEASE NOTE: This is one possible scenario where each location contains many
  salespeople, but it may be that the company wants to keep a record of the
  various locations the employee may have worked in, so the schema will be 
  different.


Ask the same Questions again:

1. Can we add a new product to the Sales table without affecting the other columns?
2. Can we delete a product from the database Sales table without affecting the other columns?
3. If a new Salesperson joins the company, can we add their name?
   What product/s have they sold?  What category of goods should be added?

*********************************************************************************/

CREATE TABLE [dbo].[location_3NF]
(
	[locationid]	[int]	IDENTITY(1,1) NOT NULL,
	[location] [nchar](50) NOT NULL,
CONSTRAINT [PK_location_3NF] PRIMARY KEY CLUSTERED ([locationid] ASC)
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[salesperson_3NF]
(
	[salespersonid] [int] IDENTITY(1,1) NOT NULL,
	[salesperson] [nchar](50) NOT NULL,
	[locationid]	[int]	NOT NULL,
 CONSTRAINT [PK_salesperson_3NF] PRIMARY KEY CLUSTERED ([salespersonid] ASC),
 CONSTRAINT [FK_location_3NF_salesperson_3NF] FOREIGN KEY ([locationid])
 REFERENCES [dbo].[location_3NF] ([locationid])
) ON [PRIMARY]
GO
 
CREATE TABLE [dbo].[category_3NF]
(
	[categoryid]	[int]	IDENTITY(1,1) NOT NULL,
	[category] [nchar](50) NOT NULL,
CONSTRAINT [PK_category_3NF] PRIMARY KEY CLUSTERED ([categoryid] ASC)
) ON [PRIMARY]	
GO

CREATE TABLE [dbo].[product_3NF]
(
	[productid] [int]	IDENTITY(1,1),
	[product]	[nchar](50)	NOT NULL,
	[productcost]	[money]	NOT NULL,
	[categoryid]	[int] NOT NULL,
 CONSTRAINT [PK_product_3NF] PRIMARY KEY CLUSTERED ([productid] ASC ),
 CONSTRAINT [FK_category_3NF_product_3NF] FOREIGN KEY ([categoryid])
 REFERENCES [dbo].[category_3NF] ([categoryid])
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[sales_3NF]
(
	[productid] [int] NOT NULL,
	[salespersonid] [int] NOT NULL
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[sales_3NF]  WITH CHECK 
ADD CONSTRAINT [FK_sales_3NF_salesperson_3NF] FOREIGN KEY([salespersonid])
REFERENCES [dbo].[salesperson_3NF] ([salespersonid])
GO
ALTER TABLE [dbo].[sales_3NF]  WITH CHECK 
ADD CONSTRAINT [FK_sales_3NF_product_3NF] FOREIGN KEY([productid])
REFERENCES [dbo].[product_3NF] ([productid])
GO


INSERT INTO location_3NF
VALUES('Princess Street')

INSERT INTO location_3NF
VALUES('Fields Lock')

INSERT INTO location_3NF
VALUES('Morley Road')


INSERT INTO dbo.salesperson_3NF 
VALUES('John Richards',1)

INSERT INTO dbo.salesperson_3NF 
VALUES('Susan Penny',2)

INSERT INTO dbo.salesperson_3NF 
VALUES('Morgan Jones',1)

INSERT INTO dbo.salesperson_3NF 
VALUES('Maria Marques',3)


INSERT INTO dbo.category_3NF
VALUES('Electrical')

INSERT INTO dbo.category_3NF
VALUES('Clothing')

INSERT INTO dbo.category_3NF
VALUES('Kitchenware')


INSERT INTO dbo.product_3NF
VALUES('DAB Radio',99.5,1)

INSERT INTO dbo.product_3NF
VALUES('LCD 37 inch Television',450.0,1)

INSERT INTO dbo.product_3NF
VALUES('Mens XL Rain Coat Green',125.0,2)

INSERT INTO dbo.product_3NF
VALUES('15.4 Core 2 Duo Notebook',375.99,1)

INSERT INTO dbo.product_3NF
VALUES('Italian Silk Tie',55.0,2)

INSERT INTO dbo.product_3NF
VALUES('Set of Five Cooking Pans',97.0,3)


INSERT INTO dbo.sales_3NF
VALUES(1,1)
INSERT INTO dbo.sales_3NF
VALUES(2,2)
INSERT INTO dbo.sales_3NF
VALUES(3,3)
INSERT INTO dbo.sales_3NF
VALUES(4,1)
INSERT INTO dbo.sales_3NF
VALUES(5,4)
INSERT INTO dbo.sales_3NF
VALUES(6,3)

SELECT * FROM Category_3NF
SELECT * FROM Product_3NF
SELECT * FROM Location_3NF
SELECT * FROM Salesperson_3NF
SELECT * FROM Sales_3NF


