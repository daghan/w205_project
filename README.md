# README

## Requirements:
- HDFS
- hive
- spark

## To get started  
1- Go to loading_and_modeling directory and run: ./load_data_lake.sh  

2- Then go to ../cleanup_and_transformations and run: ./clean_and_transform.sh

3- Launch spark-sql (or hive) to inspect the final table:
select * from merged_storm_econ_data;
