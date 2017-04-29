
--
-- DROP TABLE storms_2016_clean;
-- CREATE TABLE storms_2016_clean AS
-- SELECT  episode_id,
--         end_day,
--         QUARTER(from_unixtime(unix_timestamp(end_date_time,'dd-MMM-yy'))) as end_quarter,
--         MONTH(from_unixtime(unix_timestamp(end_date_time,'dd-MMM-yy'))) as end_month,
--         year as end_year,
--         state, state_fips,   cz_type, cz_fips, cz_name,
--         event_id, event_type,source, magnitude, magnitude_type,
--         injuries_direct, injuries_indirect, deaths_direct, deaths_indirect, damage_property, damage_crops,
--         begin_range, begin_azimuth	, begin_location, end_range, end_azimuth	, end_location,
--         begin_lat, begin_lon, end_lat, end_lon
-- FROM storms_2016;
--
-- ALTER TABLE storms_2016_clean
-- SET SERDEPROPERTIES ('serialization.null.format' = '');
--
-- -- DROP TABLE storms_2016_clean_parquet;
-- -- CREATE TABLE storms_2016_clean_parquet LIKE storms_2016_clean STORED AS PARQUET;


DROP TABLE all_states_2016_clean;
CREATE TABLE all_states_2016_clean AS
SELECT  regexp_extract(area_fips, '.* (.*) -- .*:"(\\d\\d).*', 1) AS state,
        cast(regexp_extract(area_fips, '.*:"(\\d\\d).*', 1) AS INT)  AS state_fips,
        year, qtr, qtrly_contributions,total_qtrly_wages,
        oty_total_qtrly_wages_chg, oty_total_qtrly_wages_pct
FROM all_states_2016;
ALTER TABLE all_states_2016_clean
SET SERDEPROPERTIES ('serialization.null.format' = '');


--
-- DROP TABLE storms_2016_clean_aggregate;
-- CREATE TABLE storms_2016_clean_aggregate AS
-- SELECT end_quarter, end_year,
--         max(state_fips) AS state_fips, state,
--         count(event_id) AS count_events,
--         sum(COALESCE(injuries_direct,0)) AS sum_injuries_direct,
--         sum(COALESCE(injuries_indirect,0)) AS sum_injuries_indirect,
--         sum(COALESCE(deaths_direct,0)) AS sum_deaths_direct,
--         sum(COALESCE(deaths_indirect,0)) AS sum_deaths_indirect,
--         sum(COALESCE(damage_property,0)) AS sum_damage_property,
--         sum(COALESCE(damage_crops,0)) AS sum_damage_crops
-- FROM storms_2016_clean
-- GROUP BY end_quarter, end_year, state
-- ORDER BY state, end_quarter,end_year;
--
--
-- select count(*) from storms_2016_clean_aggregate;
select count(*) from all_states_2016_clean;
