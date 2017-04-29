DROP TABLE storms_2007;
CREATE EXTERNAL TABLE IF NOT EXISTS storms_2007
(
  begin_yearmonth STRING,
  begin_day STRING,
  begin_time STRING,
  end_yearmonth	STRING,
  end_day	STRING,
  end_time STRING,
  episode_id STRING,
  event_id STRING,
  state	STRING,
  state_fips	STRING,
  year	STRING,
  month_name	STRING,
  event_type	STRING,
  cz_type	STRING,
  cz_fips	STRING,
  cz_name	STRING,
  wfo	STRING,
  begin_date_time	STRING,
  cz_timezone	STRING,
  end_date_time	STRING,
  injuries_direct	STRING,
  injuries_indirect	STRING,
  deaths_direct	STRING,
  deaths_indirect	STRING,
  damage_property	STRING,
  damage_crops	STRING,
  source	STRING,
  magnitude	STRING,
  magnitude_type	STRING,
  flood_cause	STRING,
  category	STRING,
  tor_f_scale	STRING,
  tor_length	STRING,
  tor_width	STRING,
  tor_other_wfo	STRING,
  tor_other_cz_state	STRING,
  tor_other_cz_fips	STRING,
  tor_other_cz_name	STRING,
  begin_range	STRING,
  begin_azimuth	STRING,
  begin_location	STRING,
  end_range	STRING,
  end_azimuth	STRING,
  end_location	STRING,
  begin_lat	STRING,
  begin_lon	STRING,
  end_lat	STRING,
  end_lon	STRING,
  episode_narrative	STRING,
  event_narrative	STRING,
  data_source STRING
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
  LOCATION '/w205/data/final_project/2007/storms_2007';

DROP TABLE all_states_2007;
CREATE EXTERNAL TABLE IF NOT EXISTS all_states_2007
(
  area_fips STRING,
	own_code	INT,
	industry_code	INT,
	agglvl_code	INT,
	size_code	INT,
	year	INT,
	qtr	TINYINT,
	disclosure_code	STRING,
	area_title	STRING,
	own_title	STRING,
	industry_title	STRING,
	agglvl_title	STRING,
	size_title	STRING,
	qtrly_estabs_count	BIGINT,
	month1_emplvl	BIGINT,
	month2_emplvl	BIGINT,
	month3_emplvl	BIGINT,
	total_qtrly_wages	BIGINT,
	taxable_qtrly_wages	BIGINT,
	qtrly_contributions	BIGINT,
	avg_wkly_wage	BIGINT,
	lq_disclosure_code	STRING,
	lq_qtrly_estabs_count	DOUBLE,
	lq_month1_emplvl DOUBLE,
	lq_month2_emplvl	DOUBLE,
  lq_month3_emplvl	DOUBLE,
	lq_total_qtrly_wages	DOUBLE,
	lq_taxable_qtrly_wages	DOUBLE,
	lq_qtrly_contributions	DOUBLE,
	lq_avg_wkly_wage	DOUBLE,
	oty_disclosure_code	BIGINT,
	oty_qtrly_estabs_count_chg	BIGINT,
	oty_qtrly_estabs_count_pct_chg	DOUBLE,
	oty_month1_emplvl_chg	BIGINT,
	oty_month1_emplvl_pct	DOUBLE,
	oty_month2_emplvl_chg	BIGINT,
	oty_month2_emplvl_pct	DOUBLE,
	oty_month3_emplvl_chg	BIGINT,
	oty_month3_emplvl_pct	DOUBLE,
	oty_total_qtrly_wages_chg	BIGINT,
	oty_total_qtrly_wages_pct	DOUBLE,
	oty_taxable_qtrly_wages_chg	BIGINT,
	oty_taxable_qtrly_wages_pct	DOUBLE,
	oty_qtrly_contributions_chg	BIGINT,
	oty_qtrly_contributions_pct	DOUBLE,
	oty_avg_wkly_wage_chg	BIGINT,
	oty_avg_wkly_wage_pct DOUBLE
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
LOCATION '/w205/data/final_project/2007/all_states_2007';

select * from storms_2007 limit 5;
select * from all_states_2007 limit 5;
