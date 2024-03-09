-- ---------------------------------
-- SECTION 6 - CLAVES O RESTRICCIONES
-- ---------------------------------

-- claves: 	- Integrdiad de datos.
		--  - Rendimiento.
        -- 	- Relacion entre tablas.
        -- - Prevencion de datos duplicados.

-- Claves Primarias (primary key): - Registro unico en toda la tabla.
								-- - NO puede contener valores nulos.
                                -- - SOl puede haber una clave primera por tabla.
CREATE table estudiantes  (
	id INT primary KEY,
    nombre VARCHAR(50)
);

CREATE table estudiantes  (
	id INT,
    nombre VARCHAR(50),
    Primary key (id)
);

-- Claves FOraneas (foreing key): - Registro unico en toda la tabla.
CREATE table cursos  (
	id INT primary KEY,
    nombre VARCHAR(50)
);

CREATE table inscripciones  (
	estudiante_id INT primary KEY,
    curso_id VARCHAR(50),
    foreign key(estudiante_id) references estudiantes(id),
    foreign key(curso_id) references cursos(id)
);

-- restricciones
	-- Restriccion de UNICIDAD (UNIQUE): gARANTRIZA que en una columna o un conjunto de datos sea unico.
	CREATE table cursos  (
		id INT primary KEY,
        codigo_empleado INT unique,
		nombre VARCHAR(50)
	);
    use tienda;
    
    -- Restriccion de valor predeterminado (DEFAULT):
    CREATE table pedidos  (
	id INT primary KEY,
    fecha_pedido DATE DEFAULT (CURRENT_DATE),
    total DECIMAL(10,2) DEFAULT 0.00
	);
    
    insert into pedidos (id, total) values (1,100), (2, 30), (3, 150);
    
    SELECT * FROM productoss;
    
    -- Restriccion de verificacion (CHECK): Un condicion para wque el valor se pueda almancenar.
    -- Ejemplo: Crear una tbala producto con id,nombre y cantidad donde cantidad > 0
    CREATE table if not exists productoss  (
	id INT primary KEY,
	nombre VARCHAR(50),
    cantidad INT CHECK(cantidad > 0)
    );
    
    insert into productoss values(1, "Bandeja Paisa", 0);
    
    -- Restruccion de NO NULOS (NOT NULL)
		
	CREATE TABLE clientes(
		id INT primary KEY,
        nombre varchar(50) not null
    );
    
    -- Restriccion de valor unico en clave primaria (AUTO_INCREMENT):
	create table empleado(
		id int primary key auto_increment,
        nombre varchar(50)
    );
    
    insert into empleado(nombre) values ('Carlos Mario'),('Hader Cabrera');
    select * from empleado;
    
    -- Entidad-Relacion y modelo relacional
    -- Componentes principales del modelo E-R
		-- - Entidades: Objetos de la vida real de interes para el sistema
        -- - Atributos: Caracteristicas o propiedades de las entidades.
        -- - Relaciones: Asociaciones o conexiones entre las entidades.
        -- - Cardinalidad: Cantidad de instancias de una entidad en la otra. (1, N), (M, N), (1, 1).
        
	-- Modelos relacional: Es una representacion logica y completa de la base de datos.
    -- Los datos se organizan en tablas y relaciones
    -- las tablas filas(registro) y columnas(campos)
    -- Las relaciones se hacen atraves  de las llaves (primarias y foraneas(Externas))
    
    
        
        
		



