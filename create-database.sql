--
-- This schema file is used to create a database and a user login for mysql for use with
-- the test data generation utility called "generatedata", from the eponymous web site,
-- generatedata.com.
-- 
-- This example creates a database called "customers" and also creates a login username
-- that can be used to access the database.
--
-- We chose the database name = "customers", username = gd_user, and password = gd_password.
--
-- maintainer:  jfield@gopivotal.com
-- date: May 28, 2014
-- version: 0.1


create database customers;

create user 'gd_user' identified by 'gd_password';

grant all on customers.* to 'gd_user'@'%' with grant option;


