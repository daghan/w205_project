#!/bin/bash

echo "hive -f transform_tables_2006.sql"
hive -f transform_tables_2006.sql

echo "hive -f transform_tables_2007.sql"
hive -f transform_tables_2007.sql

echo "hive -f transform_tables_2008.sql"
hive -f transform_tables_2008.sql

echo "hive -f transform_tables_2009.sql"
hive -f transform_tables_2009.sql

echo "hive -f transform_tables_2010.sql"
hive -f transform_tables_2010.sql

echo "hive -f transform_tables_2011.sql"
hive -f transform_tables_2011.sql

echo "hive -f transform_tables_2012.sql"
hive -f transform_tables_2012.sql

echo "hive -f transform_tables_2013.sql"
hive -f transform_tables_2013.sql

echo "hive -f transform_tables_2014.sql"
hive -f transform_tables_2014.sql

echo "hive -f transform_tables_2015.sql"
hive -f transform_tables_2015.sql

echo "hive -f transform_tables_2016.sql"
hive -f transform_tables_2016.sql

echo "workaround for the old hive version"
hive -f all_time_aggregage.sql

echo "hive -f merge_tables.sql"
hive -f merge_tables.sql
