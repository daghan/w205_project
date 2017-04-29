#!/bin/bash





MY_CWD=$(pwd)


cd ../data/

FILES="StormEvents_details-ftp_v1.0_d2006_c20170405.csv
StormEvents_details-ftp_v1.0_d2007_c20160223.csv
StormEvents_details-ftp_v1.0_d2008_c20160223.csv
StormEvents_details-ftp_v1.0_d2009_c20160223.csv
StormEvents_details-ftp_v1.0_d2010_c20160223.csv
StormEvents_details-ftp_v1.0_d2011_c20160223.csv
StormEvents_details-ftp_v1.0_d2012_c20160223.csv
StormEvents_details-ftp_v1.0_d2013_c20160223.csv
StormEvents_details-ftp_v1.0_d2014_c20161118.csv
StormEvents_details-ftp_v1.0_d2015_c20170216.csv
StormEvents_details-ftp_v1.0_d2016_c20170317.csv"

BASE_URL="https://www1.ncdc.noaa.gov/pub/data/swdi/stormevents/csvfiles/"
for f in $FILES
do
  if [ ! -f "./$f" ]; then
    echo "Downloading weather data file $f";
    FULL_URL=$BASE_URL$f.gz
    curl -O $FULL_URL
    gzip -d $f.gz
  else
    echo "Data file $f exists, not downloading";
  fi
  if [[ $f =~ d(20[0-9][0-9]) ]]; then
    year=${BASH_REMATCH[1]}
    f2=storms_$year.csv
    tail -n +2 $f > $f2
    hdfs dfs -rm -r /w205/data/final_project/$year/storms_$year/
    hdfs dfs -mkdir -p /w205/data/final_project/$year/storms_$year/
    hdfs dfs -put $f2 /w205/data/final_project/$year/storms_$year/
  else
      echo "Error in matching $f"
  fi
done

echo "List of HDFS files"
hdfs dfs -ls -R /w205/data/final_project




cd $MY_CWD
