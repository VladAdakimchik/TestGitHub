-- ******************************* SqlDBM: Snowflake *******************************
-- * Generated by SqlDBM: TestAutotestProject+6743 by alexey.litvinenko@sqldbm.com *

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
