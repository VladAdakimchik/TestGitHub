-- ******************************** SqlDBM: Snowflake *******************************
-- * Generated by SqlDBM: TestAutotestProject+79798 by alexey.litvinenko@sqldbm.com *

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
