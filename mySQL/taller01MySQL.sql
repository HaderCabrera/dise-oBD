select * from world.country;

-- 1.1 Cual es el idioma con el nombre más largo hablado en el mundo. También indique
-- que países hablan ese idioma. El listado debe estar ordenado alfabéticamente por nombre de país.

	-- VISTA PARA LENGUAJES ORDENADOR POR TAMAÑO DE NOMBRE
	CREATE OR REPLACE VIEW vista_detaller_lenguaje as 
	select length(L.Language) as Tamaño, L.Language as Lenguaje, C.Name as Pais, L.CountryCode as CodigoPais
	from world.countrylanguage as L
	join country as C on L.CountryCode = C.Code
	order by Tamaño desc ;
	-- SELECCIONAR LOS PAISES QUE HABLAR EL IDIOMA CON LA EL 'NOMBRE MAS LARGO'
	SELECT T.lenguaje as idioma, T.Pais
	FROM world.vista_detaller_lenguaje as T
	where T.Tamaño = (select max(Tamaño) from world.vista_detaller_lenguaje as TT);

-- 1.2 Muestre un listado del año de independencia de cada país. Si aún no se ha
-- independizado muestre el vano “N/A”
select ifnull(P.IndepYear, 'N/A' ) AS 'Año de independencia', P.Name as pais
from world.country as P;

-- 1.3 Muestre un listado con los países “recién independizado” y “antiguamente
-- independizados”. Es recién independizado si su fecha de independizado es
-- posterior a 1899.

select if(P.IndepYear > 1899 , 'Recien independizado', 'Antiguamente independizado') as Nuevidad, P.IndepYear
from world.country as P
where P.IndepYear is not null
order by P.IndepYear;

-- 1.4 Cual es el promedio de nivel de vida de los países africanos.
select avg(P.LifeExpectancy) as promedio
from world.country as P
where P.Continent = 'Africa';

-- 1.5 Cual es el pais con el menor nivel de vida.
select P.Name, P.LifeExpectancy
from world.country as P
where P.LifeExpectancy IS NOT NULL
order by P.LifeExpectancy
limit 1;

-- 1.6 Cuál es el país con mayor nivel de vida.
select P.Name, P.LifeExpectancy
from world.country as P
where P.LifeExpectancy is not null
order by P.LifeExpectancy desc
limit 1;

-- 1.7 Muestre un listado de los países de América y cuanta es la capacidad de repartir su
-- riqueza entre su densidad de población. GNP = PIB. El listado debe estar ordenado
-- descendentemente por capacidad de repartir riqueza, luego por nombre
-- ascendentemente. La capacidad de repartir riqueza debe mostrarse en separación
-- de miles y con dos decimales.
select P.Name, ((P.GNP) / ((P.Population)/(P.SurfaceArea))) as Riqueza, (select format (((P.GNP) / ((P.Population)/(P.SurfaceArea))), 2 )) as 'Riqueza en miles'
from world.country as P
where P.Continent = 'North America' or P.Continent = 'South America' and P.GNP IS NOT NULL
order by Riqueza desc, P.Name;

-- 1.8 Muestre los segundos nombres de los países de Europa. El listado debe estar
-- ordenado alfabéticamente por este segundo nombre.
select trim(P.Name) as NombreCompleto,
-- segundo intento de CONDIFIONALES
if(locate(' ', trim(P.Name)) > 0, if(locate(' ', trim(substring(P.name, locate(' ', trim(P.Name))))) > 0 , 
									substring(P.name, 
										locate(' ', trim(P.Name)),
                                        locate(' ', trim(substring(P.name, locate(' ', trim(P.Name)))))
                                        ), substring(P.name, locate(' ', trim(P.Name)))), P.name) as validacionUno
from world.country as P
where locate(' ', trim(P.Name)) <> 0 and P.Continent = 'Europe';

-- 1.9 Muestre un listado de los países America y la cantidad de veces que aparece la
-- letra “A” en ellos. El listado debe estar ordenado por la cantidad de veces que
-- aparece la letra A en el nombre del país.
select P.name, 
length(P.name) - length(replace(upper(P.Name), 'A', '')) as cantidadAs
from world.country as P
where P.Continent = 'North America' or P.Continent = 'South America'
order by cantidadAs desc;

-- 1.10 Muestre un listado de todos los países con un solo nombre que terminan en “bia”.
-- Ordene este listado alfabéticamente por el nombre del pais.
select P.name as Pais
from world.country as P
where locate(' ', trim(P.Name)) = 0 and locate('bia', P.name) > 0
order by P.name;


-- 2.1 Seleccionar los nombres de todas las orquestas que tengan la misma ciudad
-- de origen que alguna ciudad en la que se haya celebrado algún concierto en
-- 2013.

select O.name
from orchestras as O
inner join concerts as C on O.id = C.orchestra_id
where O.country_origin = C.country and C.year = 2013;

-- 2.2 Seleccionar los nombres y cargos (es decir, el instrumento que tocan) de
-- todos los miembros de orquesta que tengan más de 10 años de experiencia y
-- no pertenezcan a orquestas con una calificación inferior a 8,0.
select M.name, M.position as Cargo
from members as M
inner join orchestras as O on M.orchestra_id = O.id
where O.year > 2014 and O.tating > 8.0;

-- 2.3 Mostrar el nombre y el cargo de los miembros de la orquesta que ganan más
-- que el salario medio de todos los violinistas.
select M.name as Nombre, M.position as Cargo
from members as M
where M.wage > (select AVG(wage) from members);

-- 2.4 Mostrar los nombres de las orquestas que se crearon después de la
-- 'Orquesta de Cámara' y tienen una valoración superior a 7.5.

select O.name as Nombre, O.position as Cargo
from orchestras as O
where O.year > (
				select orchestras.year 
                from orchestras 
                where orchestras.name = 'Orquesta de Cámara'
                ) and O.rating > 7.5;
                















