#!/bin/bash


# get current working directory
MY_CWD=$(pwd)


# download the data
if [ ! -f "../data/StormEvents_details-ftp_v1.0_d2016_c20170317.csv" ]; then
  echo "Downloading data file";
  curl -O https://www1.ncdc.noaa.gov/pub/data/swdi/stormevents/csvfiles/StormEvents_details-ftp_v1.0_d2016_c20170317.csv.gz
  gzip -d  StormEvents_details-ftp_v1.0_d2016_c20170317.csv.gz
else
  echo "Data file exists, not downloading";
fi

# unzip the data
#unzip -d ./tmp ./tmp/medicare_data.zip



# tail files to remove first linewidth
ORIG_STORM_EVENTS_2016="../data/StormEvents_details-ftp_v1.0_d2016_c20170317.csv"
NEW_STORM_EVENTS_2016="../data/storms_2016.csv"


# OLD_EFFECITVE="./tmp/Timely and Effective Care - Hospital.csv"
# NEW_EFFECTIVE="./tmp/effective_care.csv"
#
# OLD_READMIT="./tmp/Readmissions and Deaths - Hospital.csv"
# NEW_READMIT="./tmp/readmissions.csv"
#
# OLD_MEASURE="./tmp/Measure Dates.csv"
# NEW_MEASURE="./tmp/Measures.csv"
#
# OLD_SURVEY="./tmp/hvbp_hcahps_05_28_2015.csv"
# NEW_SURVEY="./tmp/surveys_responses.csv"

tail -n +2 $ORIG_STORM_EVENTS_2016 > $NEW_STORM_EVENTS_2016
# tail -n +2 "$OLD_EFFECITVE" > $NEW_EFFECTIVE
# tail -n +2 "$OLD_READMIT" > $NEW_READMIT
# tail -n +2 "$OLD_MEASURE" > $NEW_MEASURE
# tail -n +2 "$OLD_SURVEY" > $NEW_SURVEY




## make sure directory doesn't exist
hdfs dfs -rm -r /w205/data/final_project/storms_2016/

# 2016
hdfs dfs -mkdir -p /w205/data/final_project/storms_2016/
hdfs dfs -put $NEW_STORM_EVENTS_2016 /w205/data/final_project/storms_2016/

##
echo "List of HDFS files"
hdfs dfs -ls -R /w205/data/final_project/storms_2016/

# clean-up
rm -rf ../data/StormEvents_details-ftp_v1.0_d2016_c20170317.csv

# change directory back to where we started
# cd $MY_CDW

#clean exit
# exit
