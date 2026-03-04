-- ==========================================================
-- Step 21: Import Population Data (2018)
-- Description: Load cleaned Stats NZ population data
-- ==========================================================

-- Create staging table (raw structure from CSV)
CREATE TABLE IF NOT EXISTS stg_population_2018 (
  objectid INTEGER,
  sa22018_v1_00 TEXT,
  sa22018_v1_name TEXT,
  land_area_sq_km DOUBLE PRECISION,
  area_sq_km DOUBLE PRECISION,
  pop_total_2018 INTEGER
);

-- Clear staging for safe re-run
TRUNCATE stg_population_2018;

-- Load CSV into staging table
-- Replace the file path with your local CSV location
COPY stg_population_2018
FROM 'PATH_TO_CSV/2018-census-population-age-groups-by-sa22018_clean.csv'
DELIMITER ','
CSV HEADER;

-- Insert required fields into fact table
INSERT INTO fact_population_2018 (sa2_code, population)
SELECT 
  sa22018_v1_00,
  pop_total_2018
FROM stg_population_2018
ON CONFLICT (sa2_code)
DO UPDATE SET population = EXCLUDED.population;
