use world;
select * from country;

-- mostrar elpais con mayor pblacion
	SELECT  Name, Population 
    FROM country
    order by Population desc
    limit 1;
-- motrar las ciudades con poblacion menor a 1millon de habitantes. EL listado debe estar ordenado por poblacion de menor 
-- a mayor y si hay dos ciudades con la misma poblacion mostrarlas en orden alfabetico
-- (HACER BIEN CON CIUDAD NO CON PAIS)
	SELECT  Name, Population 
    FROM country
	WHERE Population < 1000000
    order by Population, Name;
-- mostrar los tres paises con mayor poblacion de sur america
	SELECT  Name, Population, Region 
    FROM country
    where Region = "South America"
	order by Population desc
    limit 3;
-- mostrar los idiomas no oficiales hablados en Colombia. Los idiomas deben estar ordenados ascendentemente por el porcentaje de habla.alter
-- el codigo de colombia es "COL"
	SELECT  CountryCode, Percentage, IsOfficial 
    FROM countrylanguage
    where CountryCode = "COL" and IsOfficial = "F"
	order by Percentage desc;

-- mostrar los 5 paises de EUropa con menor expectativa de vida
	SELECT  Continent, LifeExpectancy, Name
    FROM country
    where Continent = "Europe" and LifeExpectancy <> "NULL"
	order by LifeExpectancy
    limit 5;