# ==========================================================
# Step 20: Import SA2 boundaries (Shapefile → PostGIS)
# ==========================================================

# Replace the path with your local file location
shp2pgsql -I -s 2193 "PATH_TO_SHP/auckland_sa2_2018_2193.shp" public.dim_sa2 \
  | psql -d auckland_bi -U postgres
