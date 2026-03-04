-- ==========================================================
-- Step 40: Indexes
-- Description: Create a GiST index on the geometry column for improved spatial query performance.
-- ==========================================================

-- GiST index on geometry column for spatial queries
CREATE INDEX IF NOT EXISTS feat_sa2_metrics_geom_idx
  ON feat_sa2_metrics
  USING GIST (geom);
