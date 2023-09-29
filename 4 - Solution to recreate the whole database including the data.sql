USE [master]
GO

CREATE DATABASE AWSCustomers
GO

-- Connect to the Database --

USE [AWSCustomers]
GO

-- Customers Table --


CREATE TABLE [dbo].[Customers](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](100) NOT NULL,
	[LastName] [varchar](100) NULL,
	[BirthDate] [date] NOT NULL,
	[MobileNumber] [varchar](20) NULL,
	[City] [varchar](100) NOT NULL,
	[Country] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
) ON [PRIMARY]
)
GO


-- Products Table --


CREATE TABLE [dbo].[Products](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Description] [varchar](2000) NOT NULL,
	[WebUrl] [varchar](300) NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
) ON [PRIMARY]
)
GO


-- Regions Table --

CREATE TABLE [dbo].[Regions](
	[RegionID] [smallint] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](40) NOT NULL,
	[RegionCode] [varchar](30) NOT NULL,
	[CountryCode] [char](3) NOT NULL,
 CONSTRAINT [PK_Regions] PRIMARY KEY CLUSTERED 
(
	[RegionID] ASC
) ON [PRIMARY]
)
GO



-- Orders Table --

CREATE TABLE [dbo].[Orders](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[RegionID] [smallint] NOT NULL,
	[OrderAmount] [money] NOT NULL,
	[OrderDate] [date] NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
) ON [PRIMARY]
)
GO

-- Create the Foreign Keys --


-- Orders to Customers Table --

ALTER TABLE [dbo].[Orders]
WITH CHECK
ADD CONSTRAINT [FK_Orders_Customers] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO

-- Orders to Products Table --

ALTER TABLE [dbo].[Orders]
WITH CHECK
ADD CONSTRAINT [FK_Orders_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO

-- Orders to Regions Table --

ALTER TABLE [dbo].[Orders]
WITH CHECK
ADD CONSTRAINT [FK_Orders_Regions] FOREIGN KEY([RegionID])
REFERENCES [dbo].[Regions] ([RegionID])
GO



-- INSERT some Customer data --

INSERT [dbo].[Customers]
(FirstName, LastName, BirthDate, MobileNumber, City, Country)
VALUES ('Bob', 'Smith', '1970-1-5', '07123456789', 'London', 'United Kingdom')
GO

INSERT [dbo].[Customers]
(FirstName, LastName, BirthDate, MobileNumber, City, Country)
VALUES ('Sue', 'Jones', '1980-10-3', '07987654321', 'Wellington', 'New Zealand')
GO

INSERT [dbo].[Customers]
(FirstName, LastName, BirthDate, MobileNumber, City, Country)
VALUES ('Richard', 'James', '1975-7-22', '07987862321', 'Paris', 'France')
GO

INSERT [dbo].[Customers]
(FirstName, LastName, BirthDate, MobileNumber, City, Country)
VALUES ('Mia', 'Hunter', '2001-12-14', '07987862161', 'Canberra', 'Australia')
GO

INSERT [dbo].[Customers]
(FirstName, LastName, BirthDate, MobileNumber, City, Country)
VALUES ('Martin', 'Walsh', '1992-6-2', '07974922161', 'Cape Town', 'South Africa')
GO



-- INSERT some Product data --

INSERT [dbo].[Products]
(Name, Description, WebUrl)
VALUES ('Amazon EC2', 'Amazon Elastic Compute Cloud (Amazon EC2) offers the broadest and deepest compute platform, with over 600 instances and choice of the latest processor, storage, networking, operating system, and purchase model to help you best match the needs of your workload.', 'https://aws.amazon.com/ec2/?nc2=h_ql_prod_fs_ec2')
GO

INSERT [dbo].[Products]
(Name, Description, WebUrl)
VALUES ('Amazon Aurora', 'Amazon Aurora provides built-in security, continuous backups, serverless compute, up to 15 read replicas, automated multi-Region replication, and integrations with other AWS services.', 'https://aws.amazon.com/rds/aurora/?nc2=h_ql_prod_fs_aa')
GO

INSERT [dbo].[Products]
(Name, Description, WebUrl)
VALUES ('Amazon RDS', 'Amazon Relational Database Service (Amazon RDS) is a collection of managed services that makes it simple to set up, operate, and scale databases in the cloud.', 'https://aws.amazon.com/rds/?nc2=h_ql_prod_fs_rds')
GO

INSERT [dbo].[Products]
(Name, Description, WebUrl)
VALUES ('Amazon VPC', 'Amazon Virtual Private Cloud (Amazon VPC) gives you full control over your virtual networking environment, including resource placement, connectivity, and security.', 'https://aws.amazon.com/vpc/?nc2=h_ql_prod_fs_vpc')
GO

INSERT [dbo].[Products]
(Name, Description, WebUrl)
VALUES ('Amazon SageMaker', 'Build, train, and deploy machine learning (ML) models for any use case with fully managed infrastructure, tools, and workflows', 'https://aws.amazon.com/sagemaker/?nc2=h_ql_prod_fs_sgm')
GO



-- INSERT some Region data --

INSERT [dbo].[Regions]
(Name, RegionCode, CountryCode)
VALUES ('US East (Ohio)', 'us-east-2', 'USA')
GO

INSERT [dbo].[Regions]
(Name, RegionCode, CountryCode)
VALUES ('Africa (Cape Town)', 'af-south-1', 'ZAF')
GO

INSERT [dbo].[Regions]
(Name, RegionCode, CountryCode)
VALUES ('Asia Pacific (Hong Kong)', 'ap-east-1', 'HKG')
GO

INSERT [dbo].[Regions]
(Name, RegionCode, CountryCode)
VALUES ('Europe (London)', 'eu-west-2', 'GBR')
GO

INSERT [dbo].[Regions]
(Name, RegionCode, CountryCode)
VALUES ('Asia Pacific (Sydney)', 'ap-southeast-2', 'AUS')
GO



-- INSERT some Order data --

INSERT [dbo].[Orders]
(CustomerID, ProductID, RegionID, OrderAmount, OrderDate)
VALUES ('1', '2', '4', '562.30', '2023-6-10')
GO

INSERT [dbo].[Orders]
(CustomerID, ProductID, RegionID, OrderAmount, OrderDate)
VALUES ('2', '4', '5', '1600.10', '2023-7-3')
GO

INSERT [dbo].[Orders]
(CustomerID, ProductID, RegionID, OrderAmount, OrderDate)
VALUES ('3', '2', '4', '850.90', '2023-8-1')
GO

INSERT [dbo].[Orders]
(CustomerID, ProductID, RegionID, OrderAmount, OrderDate)
VALUES ('4', '2', '5', '3290.20', '2023-8-1')
GO

INSERT [dbo].[Orders]
(CustomerID, ProductID, RegionID, OrderAmount, OrderDate)
VALUES ('5', '2', '2', '562.30', '2023-8-2')
GO

INSERT [dbo].[Orders]
(CustomerID, ProductID, RegionID, OrderAmount, OrderDate)
VALUES ('1', '2', '4', '700.30', '2023-7-10')
GO

INSERT [dbo].[Orders]
(CustomerID, ProductID, RegionID, OrderAmount, OrderDate)
VALUES ('2', '4', '5', '1450.30', '2023-8-3')
GO

INSERT [dbo].[Orders]
(CustomerID, ProductID, RegionID, OrderAmount, OrderDate)
VALUES ('3', '2', '4', '820.90', '2023-9-1')
GO

INSERT [dbo].[Orders]
(CustomerID, ProductID, RegionID, OrderAmount, OrderDate)
VALUES ('4', '2', '5', '2590.20', '2023-9-1')
GO

INSERT [dbo].[Orders]
(CustomerID, ProductID, RegionID, OrderAmount, OrderDate)
VALUES ('5', '2', '2', '600.30', '2023-9-2')
GO




