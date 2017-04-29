#!/bin/bash


######################################
## Download and store storm data
######################################

./load_storm_data.sh


######################################
## Download and store econ data
######################################

./load_econ_data.sh

######################################
## Load data to hive
######################################
hive -f ./hive_base_ddl_2006.sql
hive -f ./hive_base_ddl_2007.sql
hive -f ./hive_base_ddl_2008.sql
hive -f ./hive_base_ddl_2009.sql
hive -f ./hive_base_ddl_2010.sql
hive -f ./hive_base_ddl_2011.sql
hive -f ./hive_base_ddl_2012.sql
hive -f ./hive_base_ddl_2013.sql
hive -f ./hive_base_ddl_2014.sql
hive -f ./hive_base_ddl_2015.sql
hive -f ./hive_base_ddl_2016.sql
