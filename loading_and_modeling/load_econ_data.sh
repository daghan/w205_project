#!/bin/bash

MY_CWD=$(pwd)

FILES="https://data.bls.gov/cew/data/files/2013/csv/2013_qtrly_by_area.zip
https://data.bls.gov/cew/data/files/2014/csv/2014_qtrly_by_area.zip
https://data.bls.gov/cew/data/files/2015/csv/2015_qtrly_by_area.zip
https://data.bls.gov/cew/data/files/2016/csv/2016_qtrly_by_area.zip"

cd ../data/


# BASE_URL="https://www1.ncdc.noaa.gov/pub/data/swdi/stormevents/csvfiles/"
for f in $FILES
# get the year

do

  if [[ $f =~ (20[0-9][0-9]) ]]; then
      YEAR=${BASH_REMATCH[1]}
      YEAR_FILE=$YEAR"_quarterly.zip"
      echo $YEAR_FILE
      if [ ! -f "./$YEAR_FILE" ]; then
        echo "Downloading econ data file $f";
        curl -o ./$YEAR_FILE $f
        unzip ./$YEAR_FILE
      else
        echo "Data file $YEAR_FILE exists, not downloading";
      fi
      ### Scan every statewide csv file
      ### but only get the private  sector & "Total, all industries" data
      ### q1-q* and not q1-q4 because 2016 has 3 quarters
      grep "Private" ./$YEAR.q1-q*.by_area/*Statewide.csv | grep "Total, all industries" > ./$YEAR.q1-q*.by_area/all_states.csv
      hdfs dfs -rm -r /w205/data/final_project/$YEAR/all_states_$YEAR
      hdfs dfs -mkdir -p /w205/data/final_project/$YEAR/all_states_$YEAR
      hdfs dfs -put ./$YEAR.q1-q*.by_area/all_states.csv /w205/data/final_project/$YEAR/all_states_$YEAR/all_states_$YEAR.csv

  else
    echo "Error in matching $f"
  fi
done




cd $MY_CWD
