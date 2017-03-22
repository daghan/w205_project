DROP TABLE storms_2016;
CREATE EXTERNAL TABLE IF NOT EXISTS storms_2016
(
  begin_yearmonth string,
  begin_day string,
  begin_time string,
  end_yearmonth	string,
  end_day	string,
  end_time string,
  episode_id string,
  event_id string,
  state	string,
  state_fips	string,
  year	string,
  month_name	string,
  event_type	string,
  cz_type	string,
  cz_fips	string,
  cz_name	string,
  wfo	string,
  begin_date_time	string,
  cz_timezone	string,
  end_date_time	string,
  injuries_direct	string,
  injuries_indirect	string,
  deaths_direct	string,
  deaths_indirect	string,
  damage_property	string,
  damage_crops	string,
  source	string,
  magnitude	string,
  magnitude_type	string,
  flood_cause	string,
  category	string,
  tor_f_scale	string,
  tor_length	string,
  tor_width	string,
  tor_other_wfo	string,
  tor_other_cz_state	string,
  tor_other_cz_fips	string,
  tor_other_cz_name	string,
  begin_range	string,
  begin_azimuth	string,
  begin_location	string,
  end_range	string,
  end_azimuth	string,
  end_location	string,
  begin_lat	string,
  begin_lon	string,
  end_lat	string,
  end_lon	string,
  episode_narrative	string,
  event_narrative	string,
  data_source string
)
  ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
  WITH SERDEPROPERTIES
(
    "separatorChar" = ",",
    "quoteChar" = '"',
    "escapeChar" = '\\'
)
  STORED AS TEXTFILE
  LOCATION '/user/w205/storms_2016';

SELECT * from storms_2016 limit 5;
