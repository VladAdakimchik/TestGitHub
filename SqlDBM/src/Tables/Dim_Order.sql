-- ***************************** SqlDBM: Snowflake *****************************
-- * Generated by SqlDBM: Snowflake SampleDb0 by a4vlad4a+enterprise@gmail.com *
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
