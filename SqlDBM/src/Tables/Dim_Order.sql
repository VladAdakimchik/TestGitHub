-- ******************************* SqlDBM: Snowflake *******************************
-- * Generated by SqlDBM: TestAutotestProject+7010 by alexey.litvinenko@sqldbm.com *

-- ************************************** Dim_Order
CREATE TABLE Dim_Order
(
 OrderId     int NOT NULL,
 OrderNumber string NOT NULL,

 CONSTRAINT PK_DIm_Order PRIMARY KEY ( OrderId )
)
STAGE_FILE_FORMAT = 
(
 FORMAT_NAME = 'CsvFileFormat'
);
