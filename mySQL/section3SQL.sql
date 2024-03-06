-- ---------------------------------
-- SECTION 3 - GESTION DE DATOS SQL
-- ---------------------------------
									-- instalar jupyter, y luego ejecutar los siguientes comando en jupyter: 
											-- %reload_ext sql
											-- ----------------
											-- %load_ext sql
											-- %sql mysql://<usuario>:
											-- <contraseña>@localhost/<base de datos>
											-- ----------------
											-- Para ejecutar SQL en Jupyter se hace así:
											-- %%sql
											-- SELECT * FROM country limit 5;

-- CREAR TABLAS TEMPORALES
	/*
	CREATE TABLE nueva_tabla
    AS
	SELECT columna1, columna 2...
	FROM tabla_origen
	WHERE condition;
	*/
    
-- mostrar los 5 paises de EUropa con menor expectativa de vida, luego ordenar e resultado por expectativa de vida y nombre
	CREATE TABLE expVida AS
		SELECT  Continent, LifeExpectancy, Name
		FROM country
		where Continent = "Europe" and LifeExpectancy  is not null
		order by LifeExpectancy
		limit 5;
	SELECT * FROM expVida order by LifeExpectancy desc, name;
    
-- RELACIONES ENTRE TABLAS
 -- Relacion 1:M
 CREATE schema librery;
	use librery;
	create table Libro (
		ID INT primary KEY,
		Titulo VARCHAR(100),
		Autor VARCHAR(100)
	);
	create table Prestamo (
		id INT primary KEY,
		id_libro int,
		fechaprestamo date,
		fechadevolucion date,
		foreign key(id_libro) references Libro(ID)
	);
 -- RELACION MUCHOS A MUCHOS
	 -- Estudiantes a incripcion a cursos (N:M)
		 create table estudiante(
			id int primary key,
			nombre varchar(100)
		 );
		 create table curso(
			id int primary key,
			nombre varchar(100),
			descripcion text
		 );
		 create table incripcion(
			idEstudiante int,
			idCurso int,
			primary key(idEstudiante,idCurso),
			foreign key(idEstudiante) references estudiante(id),
			foreign key(idCurso) references curso(id)
		 );
		 
	-- Ejercicio #1
		 create table pais(
			id int primary key,
			nombre varchar(100),
			continente varchar(100),
			poblacion int
		 );
		 create table ciudad(
			id int primary key,
			nombre varchar(100),
			id_pais int,
			foreign key(id_pais) references pais(id)
		 );
	-- Ejercicio #2
		 create table idioma(
			id int primary key,
			idioma varchar(50)
		 );
		 create table pais(
			id int primary key,
			nombre varchar(20),
			continente varchar(50),
			poblacion int
		 );
		 create table idioma_pais(
			idPais int,
			idIdioma int,
			esOficial tinyint(1),
			primary key(idPais,idIdioma),
			foreign key(idPais) references pais(id),
			foreign key(idIdioma) references idioma(id)
		 );
-- REVISION DE ESTRUCTURA DE UNA TABLA
	-- Comando describe o desc
    -- Comando SHOW COLUMNS FROM 
    -- Comando SHOW CREATE TABLE ->> nos muestra como se creo la tabla
    -- Comando SHOW TABLE STATUS LIKE->> nos da informacion general de la tabla
    -- Comando INFORMATION_SQUEMA:COLUMNS WHERE TABLE_NAME = "nombre_de_la_tabla"
    
    use librery;
    show create table Libro;
    show columns from country;
    show table status like "Libro";
    
        show table status like "country";
    
    select *
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_NAME = "Libro";
    
	select *
    FROM INFORMATION_SCHEMA.tables
    WHERE TABLE_SCHEMA = "world";
    use world;
    
-- Funciones y comandos en Campos de mySQL
	-- 1.CONCAT: Concatena dos o mas cadenas de texto.
    select concat(name," ",region) as Ubicacion 
	from country
    limit 5;
	-- 2. UPPER: Convierte una cadena a mayuscula.
	select upper(concat(name," ",region)) as Ubicacion 
	from country
    limit 5;
    -- 3. LOWER: Convierte una cadena a minuscula.
	select lower(concat(name," ",region)) as Ubicacion 
	from country
    limit 5;
    -- 4. LENGTH: Devuelte la longitud de una cadena.
	select (concat(name," ",region)) as Ubicacion, length(concat(name," ",region)) as Largo
	from country
    limit 5;
		-- muestre un listado con los 3 paises con el nombre mas largo . Ordenados del mas largo al menos
			SELECT  C.Name
			FROM world.country as C
			order by length(C.Name) desc
			limit 3;
	-- 5. SUBSTRING(): Extrae una parte de una cadena
	select substring(concat(name," ",region), 1, 3) as "Iniciales de la ubicacion"
	from country
    limit 5;
    -- 6. LOCATE: Encuentra la posicion de una cadena
	select substring(concat(name," ",region), 1, 3) as "Sigla de la ubicacion",
    locate('g',substring(concat(name," ",region), 1, 3)) as POS_G
	from country
    limit 5;
		-- EJERCICIO: construya un listado con el primer nombre de los paises con nombres compuestos.Ordene el listado
        -- por nombre de pais
			select substr(name, 1, locate(' ', name)) as Primer_Nombre, name as pais, locate(' ', name) as compuesto
            from country
            where locate(' ', name) > 0
            order by pais;
            
	-- 7. TRIM: Quito los espacios al principoio y al final (existe el PRIMT() a la derecha, LTRIM() a la izquierda)
		select  TRIM(substr(name, 1, locate(' ', name))) as Primer_Nombre,
			name as pais,
			locate(' ', name) as compuesto
		from country
		where locate(' ', name) > 0
		order by pais;
	-- 8. REPLACE: reemplaza una subcadena por otra sucadena.
		select name, replace(name, 'Gu', 'HAAAAAAAAAAAA') as REEMPLAZO
        from country
        where region = 'South America';
		
        -- EJERCICIO: Mostrar el listado de los paises en los cuales es posible el reemplazo.
		select name, replace(name, 'Gu', 'HAAAAAAAAAAAA') as REEMPLAZO
        from country
		where region = 'South America' and name <> replace(name, 'Gu', 'HAAAAAAAAAAAA')  ;
		
        select * from country;

