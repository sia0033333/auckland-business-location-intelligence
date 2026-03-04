-- ==========================================================
-- Step 90: Performance Validation 
-- Description: Verify GiST index usage for spatial queries
-- ==========================================================

-- Demo: spatial window query (NZTM / EPSG:2193)
EXPLAIN ANALYZE
SELECT *
FROM feat_sa2_metrics
WHERE ST_Intersects(
  geom,
  ST_MakeEnvelope(1740000, 5900000, 1750000, 5910000, 2193)
);
