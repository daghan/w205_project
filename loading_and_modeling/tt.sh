#!/bin/bash

MY_CWD=$(pwd)

FILES="https://data.bls.gov/cew/data/files/2005/csv/2005_qtrly_by_area.zip
https://data.bls.gov/cew/data/files/2006/csv/2006_qtrly_by_area.zip"


cd ../data/


# BASE_URL="https://www1.ncdc.noaa.gov/pub/data/swdi/stormevents/csvfiles/"
for f in $FILES
# get the year

do
  if [[ $f =~ (20[0-9][0-9]) ]]; then
      YEAR=${BASH_REMATCH[1]}
      YEAR_FILE=$YEAR"_quarterly.zip"
      CSV_FILE=$YEAR".all_states.csv"
      #echo $YEAR_FILE
      YEAR_DIR=$YEAR".q1-q4.by_area"
      #echo $YEAR_DIR
      if [ ! -f "./$CSV_FILE" ]; then
        echo "Downloading econ data file $f";
        curl -o ./$YEAR_FILE $f
        unzip ./$YEAR_FILE
        rm -rf ./$YEAR_FILE
      else
        echo "Data dir $CSV_FILE exists, not downloading";
      fi
      ### Scan every statewide csv file
      ### but only get the private  sector & "Total, all industries" data
      ### q1-q* and not q1-q4 because 2016 has 3 quarters
      grep "Private" ./$YEAR.q1-q*.by_area/*Statewide.csv | grep "Total, all industries" > ./$YEAR.all_states.csv
      hdfs dfs -rm -r /user/w205/data/final_project/$YEAR/all_states_$YEAR
      hdfs dfs -mkdir -p /user/w205/data/final_project/$YEAR/all_states_$YEAR
      hdfs dfs -put ./$YEAR.all_states.csv /user/w205/data/final_project/$YEAR/all_states_$YEAR/all_states_$YEAR.csv
  else
    echo "Error in matching $f"
  fi
done




cd $MY_CWD
