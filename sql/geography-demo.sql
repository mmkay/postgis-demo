-- geography - more complicated example
-- save several cities and get distance from one to others as a result

CREATE TABLE cities (
    id serial primary key,
    name varchar(64),
    location GEOGRAPHY(POINT)
);

insert into cities (id, name, location) values
(1, 'Warszawa', 'POINT(21.020 52.260)'),
(2, 'Łódź', 'POINT(19.460 51.770)'),
(3, 'Kraków', 'POINT(19.960 50.060)'),
(4, 'Wrocław', 'POINT(17.030 51.110)'),
(5, 'Poznań', 'POINT(16.900 52.400)'),
(6, 'Gdańsk', 'POINT(18.640 54.360)');

select 
    name, 
    ST_Distance(
        location,
        ( select location from cities where name = 'Gdańsk' )
    )/1000 distance_km 
from cities
where name != 'Gdańsk'
order by distance_km asc;

drop table cities;
