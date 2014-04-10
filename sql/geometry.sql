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
