-- Geometria - odległości, długości, pola

-- Odległość pomiędzy dwoma punktami

SELECT ST_Distance(
    (SELECT geom FROM geometries WHERE name = 'Punkt 1'),
    (SELECT geom FROM geometries WHERE name = 'Punkt 2')
);

-- Odległość punktu 1 do każdego z punktów

SELECT name, ST_Distance(
    geom,
    (SELECT geom FROM geometries WHERE name = 'Punkt 1')
) FROM geometries WHERE name LIKE 'Punkt%';

-- Pola figur

SELECT name, ST_Area(geom) area
FROM geometries ORDER BY area DESC LIMIT 3;

-- Długości figur

SELECT name, ST_Length(geom) length
FROM geometries ORDER BY length DESC;

-- Pytanie - dlaczego tylko 2 elementy mają długość?
-- odpowiedź - bo długość mają tylko linestringi, obwód polygonu trzeba wydobywać przez ST_Length(ST_ExteriorRing(...

-- Pole części wspólnej dwóch figur

SELECT ST_Area(ST_Intersection(
    (SELECT geom FROM geometries WHERE name = 'Kolo'),
    (SELECT geom FROM geometries WHERE name = 'Wielokat')
));

-- Join pomiędzy figurami geometrycznymi i strefami zagrożenia
-- Nie możemy joinować geometrycollection

SELECT geometries.name, impact_area.name
FROM geometries JOIN impact_area
ON ST_Intersects(geometries.geom, impact_area.geom)
WHERE geometries.name NOT LIKE 'Kolekcja%';
