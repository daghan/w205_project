-- DROP TABLE storms_alltime_clean;
-- CREATE TABLE storms_alltime_clean AS
-- SELECT * FROM (
--     SELECT * FROM storms_2006_clean
--     UNION ALL
--     SELECT * FROM storms_2007_clean
--     UNION ALL
--     SELECT * FROM storms_2008_clean
--     UNION ALL
--     SELECT * FROM storms_2009_clean
--     UNION ALL
--     SELECT * FROM storms_2010_clean
--     UNION ALL
--     SELECT * FROM storms_2011_clean
--     UNION ALL
--     SELECT * FROM storms_2012_clean
--     UNION ALL
--     SELECT * FROM storms_2013_clean
--     UNION ALL
--     SELECT * FROM storms_2013_clean
--     UNION ALL
--     SELECT * FROM storms_2014_clean
--     UNION ALL
--     SELECT * FROM storms_2015_clean
--     UNION ALL
--     SELECT * FROM storms_2016_clean
-- ) tmp;


-- DROP TABLE storms_alltime_clean_aggregate;
-- CREATE TABLE storms_alltime_clean_aggregate AS
-- SELECT * FROM (
--     SELECT * FROM storms_2006_clean_aggregate
--     UNION ALL
--     SELECT * FROM storms_2007_clean_aggregate
--     UNION ALL
--     SELECT * FROM storms_2008_clean_aggregate
--     UNION ALL
--     SELECT * FROM storms_2009_clean_aggregate
--     UNION ALL
--     SELECT * FROM storms_2010_clean_aggregate
--     UNION ALL
--     SELECT * FROM storms_2011_clean_aggregate
--     UNION ALL
--     SELECT * FROM storms_2012_clean_aggregate
--     UNION ALL
--     SELECT * FROM storms_2013_clean_aggregate
--     UNION ALL
--     SELECT * FROM storms_2013_clean_aggregate
--     UNION ALL
--     SELECT * FROM storms_2014_clean_aggregate
--     UNION ALL
--     SELECT * FROM storms_2015_clean_aggregate
--     UNION ALL
--     SELECT * FROM storms_2016_clean_aggregate
-- ) tmp;



DROP TABLE states_alltime_clean_aggregate;
CREATE TABLE states_alltime_clean_aggregate AS
SELECT * FROM (
    SELECT * FROM all_states_2006_clean
    UNION ALL
    SELECT * FROM all_states_2007_clean
    UNION ALL
    SELECT * FROM all_states_2008_clean
    UNION ALL
    SELECT * FROM all_states_2009_clean
    UNION ALL
    SELECT * FROM all_states_2010_clean
    UNION ALL
    SELECT * FROM all_states_2011_clean
    UNION ALL
    SELECT * FROM all_states_2012_clean
    UNION ALL
    SELECT * FROM all_states_2013_clean
    UNION ALL
    SELECT * FROM all_states_2014_clean
    UNION ALL
    SELECT * FROM all_states_2015_clean
    UNION ALL
    SELECT * FROM all_states_2016_clean
) tmp1;

DROP TABLE merged_storm_econ_data;
CREATE TABLE merged_storm_econ_data AS
SELECT e.qtr AS quarter, e.year AS year,
      s.state AS state , s.state_fips AS state_fips,
      s.count_events AS storm_events,
      s.sum_injuries_direct AS direct_injuries,
      s.sum_injuries_indirect AS indirect_injuries,
      s.sum_deaths_direct AS direct_deaths,
      s.sum_deaths_indirect AS indirect_deaths,
      s.sum_damage_property AS property_damage,
      s.sum_damage_crops AS crop_damage,
      e.qtrly_contributions AS quarterly_contributions,
      e.total_qtrly_wages AS quarterly_wages,
      e.oty_total_qtrly_wages_chg AS quarterly_wage_changes,
      e.oty_total_qtrly_wages_pct AS quarterly_change_percentage
FROM storms_alltime_clean_aggregate s
JOIN states_alltime_clean_aggregate e
ON (s.state_fips = e.state_fips AND
    s.end_year = e.year AND
    s.end_quarter = e.qtr)
ORDER BY year, quarter, state_fips;
