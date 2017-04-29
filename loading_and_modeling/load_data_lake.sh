#!/bin/bash


echo "################################################"
echo "##  Downloading hive because the default one is too old"
echo "################################################"

wget http://apache.claz.org/hive/hive-2.1.1/apache-hive-2.1.1-bin.tar.gz
tar xzvf apache-hive-2.1.1-bin.tar.gz

######################################
## Setting up the environment
######################################
MY_CWD=$(pwd)
export PATH="$MY_CWD/apache-hive-2.1.1-bin/bin:$PATH"


export HIVE_HOME="$MY_CWD/apache-hive-2.1.1-bin"
export CLASSPATH="$HIVE_HOME/lib"


#export PYTHONPATH=$SPARK_HOME/python:$SPARK_HOME/python/build:$SPARK_HOME/python/lib/py4j-0.10.4-src.zip:$PYTHONPATH:/anaconda/lib/python3.4/site-packages

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
