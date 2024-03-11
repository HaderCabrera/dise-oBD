-- 1.1 Mostrar todas las ciudades de Colombia.
use world;
select C.Name
from world.country as P
inner join world.city as C on P.Code = C.CountryCode
where P.Code = 'COL';

-- 1.2 Mostrar la 5 ciudades más pobladas de América, Europa, Asia y África. Ordenar el
-- informe por Continente, luego descendentemente por ciudades.

drop table MASpOBLADAS;
CREATE TABLE MASpOBLADAS
AS
	(select *
	from (
		select C.Name, P.Continent as continente, C.Population as Poblacion
		from world.country as P
		inner join world.city as C on P.Code = C.CountryCode
		where P.Continent = 'Africa' 
		order by Poblacion desc
		limit 5
	)a
    
	union
    
	select *
	from (
		select C.Name, P.Continent as continente, C.Population as Poblacion
		from world.country as P
		inner join world.city as C on P.Code = C.CountryCode
		where P.Continent = 'Asia' 
		order by Poblacion desc
		limit 5
	)b
	union

	select *
	from (
		select C.Name, P.Continent as continente, C.Population as Poblacion
		from world.country as P
		inner join world.city as C on P.Code = C.CountryCode
		where P.Continent = 'Europe' 
		order by Poblacion desc
		limit 5
	) c
	union
	select *
	from (
		select C.Name, P.Continent as continente, C.Population as Poblacion
		from world.country as P
		inner join world.city as C on P.Code = C.CountryCode
		where P.Continent = 'North America' or P.Continent = 'South America' 
		order by Poblacion desc
		limit 5
	)d ) ;

select *
from MASpOBLADAS
order by MASpOBLADAS.continente, MASpOBLADAS.Name desc;
select * from city;
select * from country;

-- ----

DROP DATABASE IF EXISTS tienda;
CREATE DATABASE tienda CHARACTER SET utf8mb4;
USE tienda;
CREATE TABLE fabricante (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100) NOT NULL
);
CREATE TABLE producto (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
precio DOUBLE NOT NULL,
id_fabricante INT UNSIGNED NOT NULL,
FOREIGN KEY (id_fabricante) REFERENCES fabricante(id)
);
INSERT INTO fabricante VALUES(1, 'Asus');
INSERT INTO fabricante VALUES(2, 'Lenovo');
INSERT INTO fabricante VALUES(3, 'Hewlett-Packard');
INSERT INTO fabricante VALUES(4, 'Samsung');
INSERT INTO fabricante VALUES(5, 'Seagate');
INSERT INTO fabricante VALUES(6, 'Crucial');
INSERT INTO fabricante VALUES(7, 'Gigabyte');
INSERT INTO fabricante VALUES(8, 'Huawei');
INSERT INTO fabricante VALUES(9, 'Xiaomi');
INSERT INTO producto VALUES(1, 'Disco duro SATA3 1TB', 86.99, 5);
INSERT INTO producto VALUES(2, 'Memoria RAM DDR4 8GB', 120, 6);
INSERT INTO producto VALUES(3, 'Disco SSD 1 TB', 150.99, 4);
INSERT INTO producto VALUES(4, 'GeForce GTX 1050Ti', 185, 7);
INSERT INTO producto VALUES(5, 'GeForce GTX 1080 Xtreme', 755, 6);
INSERT INTO producto VALUES(6, 'Monitor 24 LED Full HD', 202, 1);
INSERT INTO producto VALUES(7, 'Monitor 27 LED Full HD', 245.99, 1);
INSERT INTO producto VALUES(8, 'Portátil Yoga 520', 559, 2);
INSERT INTO producto VALUES(9, 'Portátil Ideapd 320', 444, 2);
INSERT INTO producto VALUES(10, 'Impresora HP Deskjet 3720', 59.99, 3);
INSERT INTO producto VALUES(11, 'Impresora HP Laserjet Pro M26nw', 180, 3);

-- 2.1 Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los
-- productos de la base de datos.

	select P.Nombre, P.precio, F.nombre
	from tienda.producto as P
	inner join tienda.fabricante as F on P.id_fabricante = F.id;
    
	CREATE OR REPLACE VIEW infoProductos AS
	SELECT P.Nombre, P.precio, F.nombre AS Fabricante
    from tienda.producto as P
    join tienda.fabricante as F on P.id_fabricante = F.id;

-- 2.0 Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los
-- productos de la base de datos. Ordene el resultado por el nombre del fabricante, por orden
-- alfabético.

select T.nombre, T.precio, F.nombre as Fabricante
from tienda.producto as T
join tienda.fabricante as F on T.id_fabricante = F.id
order by Fabricante;




