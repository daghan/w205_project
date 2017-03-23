# README  
This is my first project for W205
# w205_project   


## Requirements:
- HDFS
- hive
- spark

## To get started  
1- Go to loading_and_modeling directory and run: load_data_lake.sh  

2- Then run: hive -f hive_base_ddl.sql  

3- Then go to ../cleanup_and_transformations and run: hive -f ./transform_tables.sql  

4- Launch spark-sql  

5- Explore the tables with the command: show tables;  

6- Final parquet table for the cleaned up 2016 weather data is storms_2016_clean_parquet. Run the following command to inspect the fields: describe storms_2016_clean_parquet;  

7- Get a few lines as a sample data to inspect the table:  select \* from storms\_2016\_clean\_parquet limit 5;
