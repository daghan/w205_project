#!/bin/bash
echo "hive -f transform_tables_2013.sql"
hive -f transform_tables_2013.sql

echo "hive -f transform_tables_2014.sql"
hive -f transform_tables_2014.sql

echo "hive -f transform_tables_2015.sql"
hive -f transform_tables_2015.sql

echo "hive -f transform_tables_2016.sql"
hive -f transform_tables_2016.sql

echo "hive -f merge_tables.sql"
hive -f merge_tables.sql
