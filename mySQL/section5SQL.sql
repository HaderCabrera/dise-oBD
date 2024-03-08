-- ---------------------------------
-- SECTION 5 - indices
-- ---------------------------------
-- 5.0 Borrar indice
drop index idx_name on country;
-- 5.1 Creacion de un indice
	-- crear indice para el nombre de un pais
	use world;
	CREATE index idx_name
	on country(name);
	
	-- 5.2 Indices compuestos
	

	-- 5.3 Indices unicos
	-- Indice unico sobre el mismo pais
	create unique index idx_unq_name on contry(name);
    
    -- 5.4 Indices de textos completos
    create fulltext index idx_article_content ON articles(content);
    
-- ---------------------------------
-- SECTION 5 - vistas
-- ---------------------------------

-- USO1: Mostrar tabla de usuario con datos combinados de dos tablas
CREATE VIEW  vista_detalle_usuario  AS
    select *
        from (
            select Name as cityName, Population, CountryCode
            from city
            order by Population desc
        ) as ciudades

        inner join (
            select Code, Name as CountryName, Continent
                from country
        ) as countryFilter on ciudades.CountryCode = countryFilter.Code

        where Continent <> 'Oceania' and Continent <> 'Antarctica';
        
        select *
    from (
        select *
        from (
            select Code, CountryName, CityName, Continent, format(Population, 0) as PopulationCity
            from vista_detalle_usuario
            where Continent = 'South America' or Continent = 'North America'
            order by Population desc
            limit 5
        ) as PopulationCitiesAmerica

        union

        select *
            from (
                select Code, CountryName, CityName, Continent, format(Population, 0) as PopulationCity
                from vista_detalle_usuario
                where Continent = 'Europe'
                order by Population desc
                limit 5
            ) as PopulationCitiesEurope

        union

        select *
            from (
                select Code, CountryName, CityName, Continent, format(Population, 0) as PopulationCity
                from vista_detalle_usuario
                where Continent = 'Asia'
                order by Population desc
                limit 5
            ) as PopulationCitiesAsia

        union

        select * 
            from (
                select Code, CountryName, CityName, Continent, format(Population, 0) as PopulationCity
                from vista_detalle_usuario
                where Continent = 'Africa'
                order by Population desc
                limit 5
            ) as PopulationCitiesAfrica
    ) as orderCitiesPopulation
    order by Continent asc, CityName desc;
    
    -- Sintaxis de cambiar vista
    CREATE OR REPLACE VIEW vista_detalle_usuario AS
		SELECT columnas
        FROM tablas
        WHERE condiciones;
        
			-- CREAR FUNCIONES Y CON VISTA (TEMA PARA DESPUES, NO FUNCIONO)
				set @continent :='Asia';
				
			   CREATE OR REPLACE VIEW PopulationCitiesContinent AS
				SELECT *
				FROM (
						select Code, CountryName, CityName, Continent, format(Population, 0) as PopulationCity
						from vista_detalle_usuario
						where Continent = @continent
						order by Population desc
						limit 5
				);
			
        -- tOMAR LENGUAJES DE COLOMBIA
        select L.language, L.Percentage,
        if (L.IsOfficial = 'F', 'No oficial', 'Oficial') as Tipo,
			case
				when L.IsOfficial = 'F' then 'No oficial'
				else 'Oficial'
			end as Tipo2,
            
            case
				when L.Percentage < 0.3 then 'Poco hablado'
                when L.Percentage between 0.4 and 49 then 'Medianamente hablado'
                else 'Muy hablado'
			end as Frecuencia
        from world.countrylanguage  as L
        join world.country as P ON L.CountryCode = P.code
        where P.name = 'Colombia'
        
        
        
        