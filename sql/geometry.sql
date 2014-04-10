--basic PostGIS geometry functions

-- distance between two points

-- should be 24
SELECT 'Distance between 2 points', ST_Distance(
    ST_GeomFromText('POINT(-12 0)'),
    ST_GeomFromText('POINT(12 0)')
);

-- should be sqrt(2)
SELECT 'Distance - 2 points', ST_Distance(
    ST_GeomFromText('POINT(-0.5 -0.5)'),
    ST_GeomFromText('POINT(0.5 0.5)')
);

-- distance between point and a line

-- should be 1
SELECT 'Distance between point and a line', ST_Distance(
    ST_GeomFromText('LINESTRING(1 0, 1 1)'),
    ST_GeomFromText('POINT(0 0)')
);

-- should be sqrt(2)
SELECT 'Distance between point and a line', ST_Distance(
    ST_GeomFromText('LINESTRING(1 1, 1 2)'),
    ST_GeomFromText('POINT(0 0)')
);

-- do two lines intersect? other syntax, ::geometry
SELECT 'Do two lines intersect?', st_Intersects(
    'LINESTRING(-10 0, 10 0)'::geometry, 
    'LINESTRING(0 -10, 0 10)'::geometry
);

-- all available functions - http://postgis.org/docs/reference.html#Spatial_Relationships_Measurements
