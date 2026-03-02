-- ==========================================================
-- Step 10: Schema Definition
-- Description: Core spatial and population tables
-- ==========================================================

CREATE TABLE dim_sa2 (
  sa2_code TEXT PRIMARY KEY,
  geom geometry(MultiPolygon,2193)
);

CREATE TABLE fact_population_2018 (
  sa2_code TEXT PRIMARY KEY,
  population INTEGER
);

CREATE TABLE feat_sa2_metrics (
  sa2_code TEXT PRIMARY KEY,
  geom geometry(MultiPolygon,2193),
  area_km2 DOUBLE PRECISION,
  population INTEGER,
  pop_density DOUBLE PRECISION
);
