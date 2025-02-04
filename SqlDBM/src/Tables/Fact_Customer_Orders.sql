-- ******************************* SqlDBM: Snowflake *******************************
-- * Generated by SqlDBM: TestAutotestProject+6459 by alexey.litvinenko@sqldbm.com *

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
