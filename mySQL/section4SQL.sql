-- ---------------------------------
-- SECTION 4 - OPERACIONES DE COMBINACION DE TABLAS (JOINS)
-- ---------------------------------

-- excalydraw (pizarron onlione)
use world;

-- PRODUCTO CRUZ (PUNTO A PUNTO)
select C.countrycode , C.Name, D.ID, D.Name, D.Code
from country as C, city as D;

-- INTERSECCION ENTRE DOS TABLAS POR LLAVES PRIMARIAS
select P.name, C.name
from country as P
inner join city as C on P.code = C.countrycode
where P.name = 'COlombia';

-- LEFT JOIN (TODOS LOS ELEMENTOS DE A Y DONDE NO EXISTA LOS ELEMENTOS DE B ENTONCES ES NULL)
select * from countrylanguage;
select L.Language, P.name
from countrylanguage as L
left join country as P on L.CountryCode = P.Code
where L.Language = 'Spanish';

insert into countrylanguage (countrycode, language, isofficial, percentage) values ('zzz', 'MARCIANO', 'T', 100 );

-- RIGHT JOIN (TODOS LOS ELEMENTOS DE B Y DONDE NO EXISTA LOS ELEMENTOS DE A ENTONCES ES NULL)
select C.name, P.Name
from city as C
left join country as P on C.CountryCode = P.Code
where P.name = 'Colombia';
