-- ***************************** SqlDBM: Snowflake *****************************
-- * Generated by SqlDBM: Snowflake SampleDb0 by a4vlad4a+enterprise@gmail.com *

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
