-- Stworzenie tabeli przechowującej dane geometryczne

DROP TABLE geometries;
DROP TABLE impact_area;

CREATE TABLE geometries (
    name varchar, 
    geom geometry
);

CREATE TABLE impact_area (
    name varchar,
    geom geometry
);

-- Wprowadzenie przykładowych danych do tabeli przechowującej dane geometryczne

INSERT INTO geometries(name, geom) VALUES 
    ('Punkt 1', 'POINT(0 0)'),
    ('Punkt 2', 'POINT(-2 -2)'),
    ('Punkt 3', 'POINT(-3 -3)'),
    ('Punkt 4', 'POINT(2 12)'),
    ('Zbior odcinkow', 'LINESTRING(0 0, 2 0, 2 2)'),
    ('Wielokat', 'POLYGON((0 0, 3 0, 3 1, 2 1, 2 2, 0 2, 0 0))'),
    ('Kolekcja elementow', 'GEOMETRYCOLLECTION(
        LINESTRING(1 1, 1 4),
        POLYGON((2 3, 5 3, 5 6, 2 6, 2 3), (3 4, 4 4, 4 5, 3 5, 3 4))
    )'),
    ('Kolo', ST_Buffer('POINT(0 0)', 2))
;

-- Wprowadzenie przykładowej danej do tabeli przechowującej dane o promieniu wpływu

INSERT INTO impact_area(name, geom) VALUES
    ('Strefa dużego zagrożenia', ST_Buffer('POINT(0 0)', 1)),
    ('Strefa średniego zagrożenia', 
        ST_Difference(
            ST_Buffer('POINT(0 0)', 2), 
            ST_Buffer('POINT(0 0)', 1)
        )
    ),
    ('Strefa małego zagrożenia', 
        ST_Difference(
            ST_Buffer('POINT(0 0)', 3), 
            ST_Buffer('POINT(0 0)', 2)
        )
    ); 

-- Testowe wypisanie

SELECT ST_AsText(geom) FROM geometries;
