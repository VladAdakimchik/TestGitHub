-- ***************************** SqlDBM: Snowflake *****************************
-- * Generated by SqlDBM: Snowflake SampleDb0 by a4vlad4a+enterprise@gmail.com *
-- ************************************** TABLEWITHCLUSTER
CREATE TRANSIENT TABLE TABLEWITHCLUSTER
(
 A number(38,0),
 B number(38,0)
)
CLUSTER BY ( A );
