CREATE DATABASE mundo;
 use mundo;
 
 create table if not exists pais (
	 id int,
	 nombre varchar(20),
	 continente varchar(50),
	 poblacion int
 );

create table Temp (
	id integer,
    dato varchar(20)
);

drop table Temp;
-- modificar tabla ya creada
alter table pais add primary key (id);
-- mostrar estructura de tabla
describe pais;
-- crear copia de una tabla
create table Temp as select * from pais;
-- DML
	-- INSERTAR datos en la tabla
		insert into pais(id, nombre, continente, poblacion)
		values (101, "Colombia", "Sur America", 500000);
		
		-- mostrar como va quedando la abse de datos
		select * from pais;
		-- SIN un atributo
		insert into pais(id, nombre, continente)
		values (102, "Venezuela", "Sur America");
		-- SIN conocer atribustos
		insert into pais(id, nombre, continente, poblacion)
		values (103, "Guyana", NULL, NULL);
		
		insert into pais(id, nombre, continente, poblacion)
		values (102, "Ecuador", "Sur America", 1700000);
		
		insert into pais(id, nombre, continente, poblacion)
		values (103, "Guatemala", "Centro America", 5800000);
		
		-- INSERTAR varios registros a la vez en una tabla.
		insert into pais(id, nombre, continente, poblacion)
		values (104, "Mexico", "Centro America", 12500000),
		(105, "Estados Unidos", "Norte America", 331500000),
		(106, "Canada", "Centro America", 38700000);
        
    -- ACTUALIZAR datos (En where puede ir cualquier condicion)
		update pais
        SET poblacion = 50887423
        where id = 101;
        
	-- BORRAR datos
		/*
			DELE FROM nombre_de_la_tabla
            WHERE condicion
            LIMIT cantidad_de_registros;
        */
        -- BORRAR todos los datos de una tabla sin condicion (DDL)
			-- truncate table tpais;
	
		-- Borrando por id
		delete from pais where id=102 or id=103;
        
        delete from pais where id=106;
-- DQL : SELECT
    /*
    SELEC nombre_de_los_campos
    FROM nombre_de_las_tabla
    WHERE condicion;
    */
    -- mostrar todos los paises
    select nombre
    from pais;
    
    -- mostrar todos los paises ordenados (desc) o por defecto(ascendente)
    select nombre
    from pais
    order by nombre desc;
    
    -- mostrar pais con mayor poblacion
    select nombre, poblacion
    from pais
    order by poblacion desc
    limit 1;
    
    -- ALIAS DE CAMPOS (Mostrar informacion con diferentes nombres al de la BD)
	select nombre as PAIS, poblacion AS POBLACION
	from pais
	order by poblacion desc
	limit 1;
    
    -- ALIAS DE TABLAS (SI llegado al caso existe un mismo campo en dos tablas)
	select P.nombre as PAIS, P.poblacion AS POBLACION
	from pais as P
	order by poblacion desc
	limit 1;
    
    -- OPERADORES DE COMPARACION EN WHERE
    -- OPERADORES LOGICOS EN WHERE (AND , OR, NOT )
    
    -- Mostrar el listado de los paises ordenados alfabeticamente con poblacion menor a 100000
	SELECT nombre, poblacion
    FROM pais
    WHERE poblacion < 10000000
    order by nombre;
	-- Mostrar el listado de 2 paises con menor poblacion ordenado por la poblacion y nombre del pais.
	SELECT nombre, poblacion
    FROM pais
    order by poblacion , nombre
    limit 2;
    
    create database world;

    