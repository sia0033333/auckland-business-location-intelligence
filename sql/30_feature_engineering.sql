-- ==========================================================
-- Step 30: Feature Engineering
-- Description: Build SA2 metrics (area, population, population density)
-- ==========================================================

-- Rebuild feature table to keep the pipeline deterministic
DROP TABLE IF EXISTS feat_sa2_metrics;

CREATE TABLE feat_sa2_metrics AS
SELECT
  s.sa22018_v1::text                                AS sa2_code,
  s.geom                                            AS geom,
  ST_Area(s.geom) / 1e6                             AS area_km2,
  p.population                                      AS population,
  p.population / NULLIF(ST_Area(s.geom) / 1e6, 0)   AS pop_density
FROM dim_sa2 s
JOIN fact_population_2018 p
  ON s.sa22018_v1::text = p.sa2_code;

-- Primary key constraint
ALTER TABLE feat_sa2_metrics
  ADD CONSTRAINT feat_sa2_metrics_pkey PRIMARY KEY (sa2_code);
