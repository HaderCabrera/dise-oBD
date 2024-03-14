
use tienda;

-- 1.1 Calcula el número total de productos que hay en la tabla productos.
-- Base de datos: tienda

select count(*) 
from tienda.producto;

-- 1.2 Calcula el número total de fabricantes que hay en la tabla fabricante.
select count(*) 
from tienda.fabricante;

-- 1.3 Calcula el número de valores distintos de identificador de fabricante aparecen en la tabla productos.
select count( distinct id_fabricante)
from tienda.producto;

-- 1.4 	Calcula la media del precio de todos los productos.
select avg(precio) as Media
from tienda.producto;

-- 1.5 Muestra el precio máximo, precio mínimo, precio medio y el número total de productos que tiene el fabricante Crucial.
select F.id as codigoFabricante, F.nombre as Fabricante, max(precio) as precio_mayor, avg(precio) as precio_promedio, min(precio) precio_menor, count(*) as cantidad
from tienda.fabricante as F
inner join tienda.producto as P on F.id = P.id_fabricante
where F.nombre = 'Crucial'
group by codigoFabricante
order by F.id;

-- 1.6 Muestra el número total de productos que tiene cada uno de los fabricantes. 
-- El listado también debe incluir los fabricantes que no tienen ningún producto. 
-- El resultado mostrará dos columnas, una con el nombre del fabricante y otra con el número de productos que tiene. 
-- Ordene el resultado descendentemente por el número de productos.

select F.nombre as Fabricante, count(precio) as cantidad
from tienda.fabricante as F
left join tienda.producto as P on F.id = P.id_fabricante
group by Fabricante
order by cantidad desc;

-- 1.7 Muestra el precio máximo, precio mínimo y precio medio de los productos de cada uno de los fabricantes. 
-- El resultado mostrará el nombre del fabricante junto con los datos que se solicitan.
select F.nombre as Fabricante, max(precio) as precio_mayor, min(precio) precio_menor, avg(precio) as precio_promedio,  count(*) as cantidad
from tienda.fabricante as F
inner join tienda.producto as P on F.id = P.id_fabricante
group by fabricante;

-- 1.8 Muestra el precio máximo, precio mínimo, precio medio y el número total de productos de los fabricantes 
-- que tienen un precio medio superior a 200€. No es necesario mostrar el nombre del fabricante, 
-- con el identificador del fabricante es suficiente.
select *
from (
select F.id, max(precio) as precio_mayor, min(precio) precio_menor, avg(precio) as precio_promedio,  count(*) as cantidad
from tienda.fabricante as F
inner join tienda.producto as P on F.id = P.id_fabricante
group by F.id) as estadisticasFabrica
where estadisticasFabrica.precio_promedio > 200 ;
-- integrar having (where del group by) para evitar subconsulta.

-- 1.9 Muestra el nombre de cada fabricante, junto con el precio máximo, precio mínimo, 
-- precio medio y el número total de productos de los fabricantes que tienen un precio medio superior a 200€. 
-- Es necesario mostrar el nombre del fabricante.
select *
from (
select F.id as idFab, F.nombre as nombreFab, max(precio) as valorMayor, min(precio) valorMenor, avg(precio) as valorpromedio,  count(*) as cant
from tienda.fabricante as F
inner join tienda.producto as P on F.id = P.id_fabricante
group by F.id) as estadisticasFabrica
where estadisticasFabrica.valorpromedio > 200 ;

-- 1.10 Calcula el número de productos que tienen un precio mayor o igual a 180€.
select count(*)
from tienda.producto P
where P.precio >= 180;

-- 1.11 Calcula el número de productos que tiene cada fabricante con un precio mayor o igual a 180€.











