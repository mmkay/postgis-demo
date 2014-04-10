-- basic postGIS geography functions

-- W/E first, N/S second

SELECT 'Inaccurate distances - without SRID';

-- wolfram says 30.25 km
SELECT 'Distance between Tczew and Gdańsk (km)', ST_Distance(
    ST_GeographyFromText('POINT(18.716667 54.1)'),
    ST_GeographyFromText('POINT(18.666667 54.35)')
) / 1000;

-- wolfram says 8556 km
SELECT 'Distance between Gdańsk and Tokyo (km)', ST_Distance(
    ST_GeographyFromText('POINT(18.666667 54.35)'),
    ST_GeographyFromText('POINT(139.6917 35.689506)')
) / 1000;


