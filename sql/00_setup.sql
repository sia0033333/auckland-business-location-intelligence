-- =============================================
-- Project: Auckland Business Location Intelligence
-- Step 0: Database Setup
-- =============================================

-- Enable required extensions
CREATE EXTENSION IF NOT EXISTS postgis;
CREATE EXTENSION IF NOT EXISTS postgis_topology;

-- Verify PostGIS installation
SELECT PostGIS_Version() AS postgis_version;
