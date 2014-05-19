-- Operacje na danych geograficznych

-- Stworzenie tabeli, wprowadzenie danych
DROP TABLE geographies;

CREATE TABLE geographies (
    name varchar,
    geog geography
);

INSERT INTO geographies VALUES
    ('Gdansk', 'POINT(18.666667 54.35)'),
    ('Seattle', 'POINT(-122.33 47.606)'),
    ('Reykjavik', 'POINT(-21.96 64.15)'),
    ('London', 'POINT(0.0 51.5)');
    
-- Find distances (in kilometers) to Reykjavik and London from a flight between Gdansk and Seattle

SELECT name, ST_Distance(
    ST_GeographyFromText('LINESTRING(18.666667 54.35, -122.33 47.606)'),
    geog
) / 1000
FROM geographies
WHERE name != 'Gdansk' AND name != 'Seattle';
