
DROP TABLE storms_alltime_clean_aggregate;
CREATE EXTERNAL TABLE IF NOT EXISTS storms_alltime_clean_aggregate
(
  end_quarter STRING,
  end_year STRING,
  state_fips STRING,
  state STRING,
  count_events INT,
  sum_injuries_direct INT,
  sum_injuries_indirect INT,
  sum_deaths_direct INT,
  sum_deaths_indirect INT,
  sum_damage_property INT,
  sum_damage_crops INT
)
  ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
  WITH SERDEPROPERTIES
(
    "serialization.null.format" = '',
    "separatorChar" = ",",
    "quoteChar" = '"',
    "escapeChar" = '\\'
)
  STORED AS TEXTFILE
  LOCATION '/user/w205/data/final_project/storms_alltime_clean_aggregate/';
