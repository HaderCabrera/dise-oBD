-- TEMA IF
select name, population
from country
where region = "";

-- Calcular la densidad de la poblacion de los paises de America
-- Si la densidad de la poblacion es mayor al 60% entonces mostrar que esta super-poblado,
-- SI esta entre 30 y 60% mostrar que esta poblado 
-- Si esta entre el 10 y 30% que esta poco poblado 
-- Y si esta en menos del 10% mostrar que esta despoblado.
	select name, format(C.population, 0), (C.Population / C.SurfaceArea) as densidad,
    if((C.Population / C.SurfaceArea) < 10 , 'Despoblado', 
    if(10 < (C.Population / C.SurfaceArea) < 20, 'Poco Poblado',
    if( 20 < (C.Population / C.SurfaceArea) < 30 , 'Poblado', 'Super poblado'))) as poblacion
    
	from world.country as C
	where C.Continent = "North America" or C.Continent = "South America"
    order by densidad desc;
    
-- SOLUCION A EJERCICIOS SECTION 4 MYSQL
	-- 1.1 Seleccione los nombres de todos los gatos machos que no tienen un juguete favorito. 
    select name
    from veterinaria
    where sex = 'M' and fac_toy is null;
    
    -- 1.2 Seleccione el ID, el nombre, la raza y la coloración de todos los gatos que son  hembras, 
	-- que adicionalmente les gusten los juguetes provocadores y que no sean de  raza persa o siamesa.
    select id, name, breed, coloration
    from veterinaria
    where sex = 'H' and fac_toy = 'provocadores' and breed <> 'siamesa' or breed <> 'persa';
    
    -- 2.1 Cual es el idioma con el nombre más largo hablado en el mundo. 
    -- También indique  que países hablan ese idioma. El listado debe estar ordenado alfabéticamente por  nombre de país. 
    
	select * from countrylanguage;
    select * from country;
    select L.Language, L.CountryCode as codigoPais,
    length(L.Language) as tamaño
    from world.countrylanguage as L
    order by tamaño desc
    limit 20;
			-- -----------
			select P.Name as ECNOTNRE
            from world.country as P
            where P.Code = (
				select L.CountryCode as codigoPais
				from world.countrylanguage as L
                where L.CountryCode = 'DEU'
                limit 1
            );
    
    
    -- 2.2 Muestre un listado del año de independencia de cada país. Si aún no se ha  independizado muestre el vano “N/A”
    
    -- EJERCICIO QUE PASO EL PROFESOR POR DISCOR
    select
        if(locate(" ", seg_nombre) = 0, 
                seg_nombre,
                substr(seg_nombre, 1, locate(" ", seg_nombre)-1) ) as segundo_nombre
		from
			(select substr(name, locate(" ", name) + 1) as seg_nombre
			from world.country
			where Continent = "Europe" and locate(" ", name) > 0) as S;
    
    
    
    
    
    
    
    
    
    
    
    
    
    