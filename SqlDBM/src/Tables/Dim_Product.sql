-- ***************************** SqlDBM: Snowflake *****************************
-- * Generated by SqlDBM: Snowflake SampleDb0 by a4vlad4a+enterprise@gmail.com *
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
