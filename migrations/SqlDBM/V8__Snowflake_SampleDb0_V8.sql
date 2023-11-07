-- ************************ SqlDBM: Microsoft SQL Server ***********************
-- * Generated by SqlDBM: Snowflake SampleDb0 by a4vlad4a+enterprise@gmail.com *


-- ************************************** Dim_Supplier
CREATE TABLE Dim_Supplier
(
 SupplierId  int NOT NULL ,
 CompanyName string NOT NULL ,
 Phone       string NULL ,


 CONSTRAINT PK_Dim_Supplier PRIMARY KEY NONCLUSTERED (SupplierId ASC)
);
GO
-- ************************************** Dim_Product
CREATE TABLE Dim_Product
(
 ProductId      int NOT NULL ,
 ProductName    string NOT NULL ,
 IsDiscontinued boolean NOT NULL ,


 CONSTRAINT PK_Product PRIMARY KEY NONCLUSTERED (ProductId ASC)
);
GO
-- ************************************** Dim_Order
CREATE TABLE Dim_Order
(
 OrderId     int NOT NULL ,
 OrderNumber string NOT NULL ,


 CONSTRAINT PK_DIm_Oreder PRIMARY KEY NONCLUSTERED (OrderId ASC)
);
GO
-- ************************************** Dim_Date
CREATE TABLE Dim_Date
(
 DateId int NOT NULL ,
 [Date]   datetime NOT NULL ,
 [Day]    int NOT NULL ,
 Week   int NOT NULL ,
 [Month]  int NOT NULL ,
 [Year]   int NOT NULL ,


 CONSTRAINT PK_Dim_Date PRIMARY KEY NONCLUSTERED (DateId ASC)
);
GO
-- ************************************** Dim_Customer
CREATE TABLE Dim_Customer
(
 CustomerId   int NOT NULL ,
 CustomerName string NOT NULL ,
 Phone        string NULL ,


 CONSTRAINT PK_table_2 PRIMARY KEY NONCLUSTERED (CustomerId ASC)
);
GO
-- ************************************** table_76
CREATE TABLE table_76
(
 id     int NOT NULL ,
 DateId int NOT NULL ,


 CONSTRAINT PK_78 PRIMARY KEY NONCLUSTERED (id ASC, DateId ASC),
 CONSTRAINT FK_79 FOREIGN KEY (DateId)  REFERENCES Dim_Date(DateId)
);
GO


CREATE NONCLUSTERED INDEX FK_81 ON table_76 
 (
  DateId ASC
 )

GO
-- ************************************** Fact_Customer_Orders
CREATE TABLE Fact_Customer_Orders
(
 CustomerId int NOT NULL ,
 OrderId    int NOT NULL ,
 DateId     int NOT NULL ,
 SupplierId int NOT NULL ,
 ProductId  int NOT NULL ,
 Price      decimal NOT NULL ,
 Quantity   int NOT NULL ,
 Profit     decimal NOT NULL ,


 CONSTRAINT PK_Fact_Customer_Orders PRIMARY KEY NONCLUSTERED (CustomerId ASC, OrderId ASC, DateId ASC, SupplierId ASC, ProductId ASC),
 CONSTRAINT FK_Fact_Customer_Orders_CustomerId FOREIGN KEY (CustomerId)  REFERENCES Dim_Customer(CustomerId),
 CONSTRAINT FK_Fact_Customer_Orders_DateId FOREIGN KEY (DateId)  REFERENCES Dim_Date(DateId),
 CONSTRAINT FK_Fact_Customer_Orders_OrderId FOREIGN KEY (OrderId)  REFERENCES Dim_Order(OrderId),
 CONSTRAINT FK_Fact_Customer_Orders_ProductId FOREIGN KEY (ProductId)  REFERENCES Dim_Product(ProductId),
 CONSTRAINT FK_Fact_Customer_Orders_SupplierId FOREIGN KEY (SupplierId)  REFERENCES Dim_Supplier(SupplierId)
);
GO


CREATE NONCLUSTERED INDEX FK_Fact_Customer_Orders_CustomerId ON Fact_Customer_Orders 
 (
  CustomerId ASC
 )

GO

CREATE NONCLUSTERED INDEX FK_Fact_Customer_Orders_DateId ON Fact_Customer_Orders 
 (
  DateId ASC
 )

GO

CREATE NONCLUSTERED INDEX FK_Fact_Customer_Orders_OrderId ON Fact_Customer_Orders 
 (
  OrderId ASC
 )

GO

CREATE NONCLUSTERED INDEX FK_Fact_Customer_Orders_ProductId ON Fact_Customer_Orders 
 (
  ProductId ASC
 )

GO

CREATE NONCLUSTERED INDEX FK_Fact_Customer_Orders_SupplierId ON Fact_Customer_Orders 
 (
  SupplierId ASC
 )

GO
-- ************************************** view_83
CREATE VIEW view_83
AS SELECT
-- Please type View Definition below
NULL;
GO

-- ************************************** view_82
CREATE VIEW view_82
AS SELECT
-- Please type View Definition below
NULL;
GO

-- ************************************** function_88
Create Function function_88()
Returns -- Please specify return type
AS
BEGIN
  --Please provide function definition
END;
GO

-- ************************************** procedure_89
Create Procedure procedure_89 
AS
'Please type procedure definition';
GO

