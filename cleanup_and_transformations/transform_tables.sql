DROP TABLE storms_2016_clean;
CREATE TABLE storms_2016_clean AS
SELECT  episode_id,
        end_day,
        QUARTER(from_unixtime(unix_timestamp(end_date_time,'dd-MMM-yy'))) as end_quarter,
        MONTH(from_unixtime(unix_timestamp(end_date_time,'dd-MMM-yy'))) as end_month,
        year as end_year,
        state, state_fips,   cz_type, cz_fips, cz_name,
        event_id, event_type,source, magnitude, magnitude_type,
        injuries_direct, injuries_indirect, deaths_direct, deaths_indirect, damage_property, damage_crops,
        begin_range, begin_azimuth	, begin_location, end_range, end_azimuth	, end_location,
        begin_lat, begin_lon, end_lat, end_lon
FROM storms_2016;

DROP TABLE storms_2016_clean_parquet;
CREATE TABLE storms_2016_clean_parquet LIKE storms_2016_clean STORED AS PARQUET;
