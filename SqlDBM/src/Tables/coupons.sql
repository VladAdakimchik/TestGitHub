-- ***************************** SqlDBM: Snowflake *****************************
-- * Generated by SqlDBM: Snowflake SampleDb0 by a4vlad4a+enterprise@gmail.com *
-- ************************************** coupons
CREATE TABLE coupons
(
 coupon_id  int NOT NULL AUTOINCREMENT START 1 INCREMENT 1,
 code       varchar(255) NOT NULL,
 discount   numeric(10,2) NOT NULL,
 start_date timestamp_ltz NOT NULL,
 end_date   timestamp_ltz NOT NULL
);
