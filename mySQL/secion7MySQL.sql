-- ---------------------------------
-- SECTION 6 - CONSULTAS AVANZADAS
-- ---------------------------------

-- funciones de agregacion
	-- diferencia de count(*) y count(column)
-- groupby
drop schema if exists miprimerabasededatos;
create schema if not exists miprimerabasededatos
DEFAULT character SET utf8mb3;
show warnings;
USE miprimerabasededatos;

DROP TABLE IF EXISTS coches;
CREATE TABLE IF NOT EXISTS coches(
	id INT(11) NOT NULL auto_increment,
    Marca VARCHAR(40) NOT NULL,
    Modelo VARCHAR(45) NOT NULL,
    Kilometros INT(11) NOT NULL,
    primary key(id)
);

insert into coches(marca,modelo,kilometros) values ("Renault","Clio",10),("Renault","Megane",23000),
("Seat","Ibiza",9000),("Seat","Leon",20),("Opel","Corsa",999),("Renault","Clio",34000),("Seat","Ibiza",2000),
("Seat","Cordoba",99999),("Renault","Clio",88888);

select Marca from miprimerabasededatos.coches group by Marca;

select Marca, Modelo
from miprimerabasededatos.coches;
-- falta, revisarlo!!!

select Marca, count(*) as contador 
from  miprimerabasededatos.coches
group by Marca 
order by contador desc;

-- kilometraje de los coches de una marca
select Marca, SUM(kilometros)
from miprimerabasededatos.coches
group by Marca;

-- maximos y minimos
select Marca, MAX(kilometros)
from miprimerabasededatos.coches
group by Marca;

select Marca, MIN(kilometros)
from miprimerabasededatos.coches
group by Marca;

-- HAVING: FILTROS SOBRE LOS GROUP BY


 