#!/bin/bash


######################################
## Run Jupyter from the command line
######################################

jupyter nbconvert --to notebook --execute w205\ project.ipynb


######################################
## Run SQL query to show the results
######################################
echo "The regression coeff for each state"

hive -e "select * from regression_data;
