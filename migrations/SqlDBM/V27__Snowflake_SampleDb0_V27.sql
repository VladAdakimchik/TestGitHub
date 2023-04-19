-- ******************************** SqlDBM: Snowflake *******************************
-- * Generated by SqlDBM: Snowflake SampleDb0, v27 by a4vlad4a+enterprise@gmail.com *


CREATE FILE FORMAT CsvFileFormat
 TYPE = CSV
 COMPRESSION = BROTLI;

CREATE FILE FORMAT InlineJsonFileFormat
 TYPE = JSON;

-- ************************************** products
CREATE TABLE products
(
 product_id  int NOT NULL AUTOINCREMENT START 1 INCREMENT 1,
 name        varchar(255) NOT NULL,
 description varchar(10000) NOT NULL,
 price       numeric(10,2) NOT NULL,
 image_url   varchar(255) NOT NULL,
 in_stock    int NOT NULL
);

-- ************************************** order_coupons
CREATE TABLE order_coupons
(
 order_coupon_id int NOT NULL AUTOINCREMENT START 1 INCREMENT 1,
 order_id        int NOT NULL,
 coupon_id       int NOT NULL
);

-- ************************************** Dim_Supplier
CREATE TABLE Dim_Supplier
(
 SupplierId  int NOT NULL,
 CompanyName string NOT NULL,
 Phone       string,

 CONSTRAINT PK_Dim_Supplier PRIMARY KEY ( SupplierId )
)
STAGE_FILE_FORMAT = 
(
 FORMAT_NAME = 'CsvFileFormat'
);

-- ************************************** Dim_Product
CREATE TABLE Dim_Product
(
 ProductId      int NOT NULL,
 ProductName    string NOT NULL,
 IsDiscontinued boolean NOT NULL,

 CONSTRAINT PK_Product PRIMARY KEY ( ProductId )
)
STAGE_FILE_FORMAT = 
(
 FORMAT_NAME = 'InlineJsonFileFormat'
);

-- ************************************** Dim_Order
CREATE TABLE Dim_Order
(
 OrderId     int NOT NULL,
 OrderNumber string NOT NULL,

 CONSTRAINT PK_DIm_Oreder PRIMARY KEY ( OrderId )
)
STAGE_FILE_FORMAT = 
(
 FORMAT_NAME = 'CsvFileFormat'
);

-- ************************************** Dim_Date
CREATE TABLE Dim_Date
(
 DateId int NOT NULL,
 Date   datetime NOT NULL,
 Day    int NOT NULL,
 Week   int NOT NULL,
 Month  int NOT NULL,
 Year   int NOT NULL,

 CONSTRAINT PK_Dim_Date PRIMARY KEY ( DateId )
)
STAGE_FILE_FORMAT = 
(
 FORMAT_NAME = 'CsvFileFormat'
);

-- ************************************** Dim_Customer
CREATE TRANSIENT TABLE Dim_Customer
(
 CustomerId   int NOT NULL,
 CustomerName string NOT NULL,
 Phone        string,

 CONSTRAINT PK_table_2 PRIMARY KEY ( CustomerId )
)
STAGE_FILE_FORMAT = 
(
 FORMAT_NAME = 'CsvFileFormat'
)
STAGE_COPY_OPTIONS = 
( 
 ON_ERROR = CONTINUE
 PURGE = TRUE
 TRUNCATECOLUMNS = TRUE
 FORCE = TRUE
);

-- ************************************** customers
CREATE TABLE customers
(
 customer_id   int NOT NULL AUTOINCREMENT START 1 INCREMENT 1,
 first_name    varchar(255) NOT NULL,
 last_name     varchar(255) NOT NULL,
 email         varchar(255) NOT NULL,
 password      varchar(255) NOT NULL,
 creation_date timestamp_ltz NOT NULL
);

-- ************************************** coupons
CREATE TABLE coupons
(
 coupon_id  int NOT NULL AUTOINCREMENT START 1 INCREMENT 1,
 code       varchar(255) NOT NULL,
 discount   numeric(10,2) NOT NULL,
 start_date timestamp_ltz NOT NULL,
 end_date   timestamp_ltz NOT NULL
);

-- ************************************** wishlists
CREATE TABLE wishlists
(
 wishlist_id int NOT NULL AUTOINCREMENT START 1 INCREMENT 1,
 customer_id int NOT NULL,
 product_id  int NOT NULL
);

-- ************************************** product_reviews
CREATE TABLE product_reviews
(
 review_id   int NOT NULL AUTOINCREMENT START 1 INCREMENT 1,
 customer_id int NOT NULL,
 product_id  int NOT NULL,
 rating      int NOT NULL,
 review      varchar(10000) NOT NULL,
 review_date timestamp_ltz NOT NULL
);

-- ************************************** orders
CREATE TABLE orders
(
 order_id    int NOT NULL AUTOINCREMENT START 1 INCREMENT 1,
 customer_id int NOT NULL,
 order_date  timestamp_ltz NOT NULL
);

-- ************************************** order_items
CREATE TABLE order_items
(
 order_item_id int NOT NULL AUTOINCREMENT START 1 INCREMENT 1,
 order_id      int NOT NULL,
 product_id    int NOT NULL,
 quantity      int NOT NULL
);

-- ************************************** Fact_Customer_Orders
CREATE TABLE Fact_Customer_Orders
(
 CustomerId int NOT NULL,
 OrderId    int NOT NULL,
 DateId     int NOT NULL,
 SupplierId int NOT NULL,
 ProductId  int NOT NULL,
 Price      decimal NOT NULL,
 Quantity   int NOT NULL,
 Profit     decimal NOT NULL,

 CONSTRAINT PK_Fact_Customer_Orders PRIMARY KEY ( CustomerId, OrderId, DateId, SupplierId, ProductId ),
 CONSTRAINT FK_Fact_Customer_Orders_CustomerId FOREIGN KEY ( CustomerId ) REFERENCES Dim_Customer ( CustomerId ),
 CONSTRAINT FK_Fact_Customer_Orders_DateId FOREIGN KEY ( DateId ) REFERENCES Dim_Date ( DateId ),
 CONSTRAINT FK_Fact_Customer_Orders_OrderId FOREIGN KEY ( OrderId ) REFERENCES Dim_Order ( OrderId ),
 CONSTRAINT FK_Fact_Customer_Orders_ProductId FOREIGN KEY ( ProductId ) REFERENCES Dim_Product ( ProductId ),
 CONSTRAINT FK_Fact_Customer_Orders_SupplierId FOREIGN KEY ( SupplierId ) REFERENCES Dim_Supplier ( SupplierId )
)
STAGE_FILE_FORMAT = 
(
 FORMAT_NAME = 'CsvFileFormat'
);

-- ************************************** addresses
CREATE TABLE addresses
(
 address_id     int NOT NULL AUTOINCREMENT START 1 INCREMENT 1,
 customer_id    int NOT NULL,
 address_line_1 varchar(255) NOT NULL,
 address_line_2 varchar(255) NOT NULL,
 city           varchar(255) NOT NULL,
 state          varchar(255) NOT NULL,
 zip_code       varchar(255) NOT NULL,
 country        varchar(255) NOT NULL
);

-- ************************************** view_2
CREATE VIEW view_2

  Comment = 'No Comment Provided'

AS
(
  -- Please type View Definition here

);

-- ************************************** order_coupons_view
CREATE VIEW order_coupons_view AS
  SELECT
    orders.order_id,
    orders.customer_id,
    coupons.code,
    coupons.discount,
    coupons.start_date,
    coupons.end_date
  FROM orders
  JOIN order_coupons
    ON orders.order_id = order_coupons.order_id
  JOIN coupons
    ON order_coupons.coupon_id = coupons.coupon_id;

