-- --------------------------------------
-- SECTION 8 - PROCEDIMIENTOS ALMACENADOS
-- --------------------------------------

				-- CREAR UN POCEDIMINENTO
				/* CREATE procedure nombre_procedimiento([])
				begin
					-- Declaraciones SQL y logica del procedimiento
				end; */

-- Tipos de entrada: IN, OUT, INOUT.
-- ejemplo de creacion
delimiter  // 
CREATE procedure calcularTotal(IN precio DECIMAL(10,2), IN cantidad INT, OUT total DECIMAL(10,2))
BEGIN
	SET total = precio * cantidad;
END //
delimiter ;
use tienda;
-- llamar a una funcion
		/*
		set @total = 0;
		call tienda.calcularTotal(1, 5, @total);
		select @total;
		*/
		set @total = 0;
		call tienda.calcularTotal(10, 5, @total);
		select @total;

-- NUEVA BASE DE DATOS PARA TRABAJAR SOBRE ELLA
CREATE DATABASE base_ejemplo;
use base_ejemplo;
 create TABLE productos(
	id INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(20) NOT NULL,
    estado VARCHAR(20) NOT NULL DEFAULT 'Disponible',
    precio FLOAT NOT NULL DEFAULT 0.0,
    PRIMARY KEY(id)
 );
 
	-- (IN) Obtener productos basados en el estados de los productos (Disponible, Agotado)
    delimiter $$
    create procedure obtenerProductosPorEstado(IN nombre_estado VARCHAR(255))
    BEGIN
		SELECT * FROM productos
        WHERE estado = nombre_estado;
	END $$
    
	-- (OUT) Contar el numero de productos segun su estado y devolver este numero.
		delimiter $$
		create procedure contarProductosPorEstado(IN nombre_estado VARCHAR(25), OUT numero INT)
		BEGIN
			SELECT count(id) INTO numero 
            FROM productos 
            WHERE estado = nombre_estado;
		END $$
		delimiter ;
        
	-- (INOUT) Actualizar el total de beneficios 
    delimiter $$
    CREATE PROCEDURE venderProducto(INOUT beneficio INT(255), IN id_producto INT)
    BEGIN
		DECLARE precio_producto FLOAT;
        SELECT precio INTO precio_producto
        FROM productos 
        WHERE id = id_producto;
        SET beneficio = beneficio + precio_producto;
	END $$
    delimiter ;
    
		-- llamar al procedimiento IN
		call base_ejemplo.obtenerProductosPorEstado('disponible');
		-- llamar procedimiento OUT
		set @cantidad_disponible = 0;
		call contarProductosPorEstado('disponible', @cantidad_disponible);
		select @cantidad_disponible AS productosDisponibles;
        -- llamar procedimiento INOUT
        set @beneficio_acumulado = 0;
        call venderProducto(@beneficio_acumulado, 1);
        select @beneficio_acumulado as beneficioTotal;
-- ELIMINAR PROCEDIMIENTO
-- DROP PROCEDURE ListarCiudadesPais;
INSERT INTO productos (nombre, estado, precio) VALUES
('Producto1', 'disponible', 10.99),
('Producto2', 'disponible', 20.49),
('Producto3', 'agotado', 5.99),
('Producto4', 'disponible', 15.29),
('Producto5', 'disponible', 12.99),
('Producto6', 'agotado', 8.99),
('Producto7', 'disponible', 18.79),
('Producto8', 'agotado', 6.49),
('Producto9', 'disponible', 22.99),
('Producto10', 'disponible', 14.99),
('Producto11', 'disponible', 11.99),
('Producto12', 'agotado', 9.99),
('Producto13', 'disponible', 17.99),
('Producto14', 'disponible', 19.99),
('Producto15', 'disponible', 16.99),
('Producto16', 'agotado', 7.99),
('Producto17', 'disponible', 21.99),
('Producto18', 'disponible', 24.99),
('Producto19', 'disponible', 13.99),
('Producto20', 'agotado', 8.49);

-- TRABAJO SOBRE BASE DE DATOS WORLD
use world;
DROP PROCEDURE ListarCiudadesPais;
delimiter $$
create procedure ListarCiudadesPais(IN nombrePais VARCHAR(100))
BEGIN
	select city.name
    from country
    inner join city on city.countrycode = country.code
    where upper(country.name) = upper(nombrePais);
END $$
delimiter ;
call world.ListarCiudadesPais('colombia');

-- EJERCICIO: Crear un procedimiento almacenado para contar el numero de ciudades en un pais en especifico
	DROP PROCEDURE contarCantidadCiudadesEnPais;
	delimiter $$
	create procedure contarCantidadCiudadesEnPais(IN nombre_pais VARCHAR(25), OUT numero INT)
	BEGIN
		SELECT count(C.CountryCode) into numero 
		FROM world.country as P
		inner join world.city as C on P.Code = C.CountryCode
		where nombre_pais = P.Name;
	END $$
	delimiter ;
    -- llamado a el procedimiento
		set @cantidad_ciudades = 0;
		call contarCantidadCiudadesEnPais('Colombia', @cantidad_ciudades);
		select @cantidad_ciudades AS ciudades;
        
-- EJERCICIO: Hacer un procedimiento almacenado que calcule la poblacion total de ciertos paises que
		   -- hablan español como idioma oficial. Cada uno de estos paises se pasan por parametros
	DROP PROCEDURE hallarPoblacionConHablaHispana;
	delimiter $$
	create procedure hallarPoblacionConHablaHispana(IN nombre_pais VARCHAR(25), OUT poblacion INT)
	BEGIN
		SELECT P.Population  into poblacion 
		FROM world.country as P
		inner join world.countrylanguage as L on P.Code = L.CountryCode
		where nombre_pais = P.Name and L.Language = 'Spanish' and L.IsOfficial = 'T';
	END $$
	delimiter ;
	-- llamado a el procedimiento
		set @cantidad_poblacion = 0;
		call hallarPoblacionConHablaHispana('France', @cantidad_poblacion);
		select @cantidad_poblacion AS poblacionHispana;
		-- TERMINAR EJERCICIO
        
	-- Estructura IF-THEN-ELSE
			
			/*
			IF condicion 
			*/
    
    -- Estructura LOOP (Estructura ciclica)alter
			/*
			LOOP 
				-- Acciones a repetir
				IF condicion_salida THEN 
					LEAVE  loop_label;
				END IF;
			END LOOP loop_label
			*/
    
-- Estructura REPEAT (Estructura ciclica)alter
			/*
			REPEAT
				-- Acciones a repetir
			UNTIL condicion
			END REPEAT;
			*/

-- Estructura WHILE (Estructura ciclica)alter
			/*
			WHILE condicion DO
				-- Acciones a repetir
			END WHILE;
            */
-- Estructura CASE (Estructura ciclica)
			/*
			CASE expresion
				WHEN valor1 THEN
					-- Acciones a repetir para 1
				WHEN valor2 THEN
					-- Acciones a repetir para 2
                ELSE
					-- Acciones si no cumple ningun case
			END CASE;
			*/

-- ERRORES 
	-- Intentar ingresar un fabricante que ya existe
	use tienda;
	drop procedure insertarFabritcante;
	delimiter $$
	create procedure insertarFabritcante(IN idfab INT, IN nomfab VARCHAR(100))
		BEGIN
			DECLARE EXIT HANDLER FOR 1062 SELECT concat('Error. El fabricante con id ', idfab, " ya existe.") as 'mnsError';
			insert into fabricante values(idfab, nomfab);
		END $$
	delimiter ;

	call insertarFabritcante(10, 'Motorola');

	-- actualizar datos (transacciones)
    
    
-- EJERCICIOS:
	-- 1. Construya el procedimiento almacenado que saque todos los empleados que se dieron de
	-- 		alta entre una determinada fecha inicial y fecha final y que pertenecen a un determinado
	-- 		departamento.
    use Hospital;
	drop procedure coquettePeopleCountry;
    delimiter $$
    CREATE PROCEDURE coquettePeopleCountry(IN dateIni DATE, IN dateFin DATE, IN oficioEmpleado VARCHAR(50))
	BEGIN
		select *
        from Hospital.Emp as E
        where E.Oficio = oficioEmpleado AND 
			  Fecha_Alt > dateIni AND 
              Fecha_Alt < dateFin;
    END $$
    delimiter ;
    
    -- 2. Construya el procedimiento que inserte un empleado.
	drop procedure insertarEmpleado;
    delimiter $$
    CREATE PROCEDURE insertarEmpleado(IN Emp_No INT, IN Apellido VARCHAR(50), IN Oficio VARCHAR(50), IN Dir INT, IN Fecha_Alt DATE, IN Salario NUMERIC(9,2), IN Comision NUMERIC(9,2), IN Dept_No INT)
    BEGIN
		INSERT INTO Emp( Emp_No, Apellido, Oficio, Dir, Fecha_Alt, Salario, Comision, Dept_No)
		VALUES (Emp_No, Apellido, Oficio, Dir, Fecha_Alt, Salario, Comision, Dept_No);
    END $$
    delimiter ;
	
    -- 3. Construya el procedimiento que recupere el nombre, número y número de personas a
	-- partir del número de departamento.
	drop procedure mostrarCantidadDepartamento;
    delimiter $$
    CREATE PROCEDURE mostrarCantidadDepartamento( IN Dept_No INT)
    BEGIN
		select H.DNombre as nomDept, H.Dept_No as codDept, count(*) as Cantidad
        FROM Hospital.Dept as H
		inner join Hospital.Emp as E on H.Dept_No = E.Dept_No
        group by H.Dept_No
        having Dept_No = codDept;
    END $$
    delimiter ;
    
	-- 4. Diseñe y construya un procedimiento igual que el anterior, pero que recupere también las
	-- personas que trabajan en dicho departamento, pasándole como parámetro el nombre.
  	drop procedure mostrarEmpleadosDepartamento;
    delimiter $$
    CREATE PROCEDURE mostrarEmpleadosDepartamento( IN DNombre VARCHAR(50))
    BEGIN
		select *
        FROM Hospital.Dept as D
		inner join Hospital.Emp as E on D.Dept_No = E.Dept_No
        group by DNombre;
        -- having DNombre = H.DNombre;
    END $$
    delimiter ;
    
	-- PARTE DOS DEL TALLER
    -- 1. Crear un procedimiento que recupere el número departamento, el nombre y número de
	-- empleados, dándole como valor el nombre del departamento, si el nombre introducido no
	-- es válido, mostraremos un mensaje informativo comunicándolo.
    use Hospital;
	drop procedure mostrarInformacionDepartamento;
	delimiter $$
	CREATE PROCEDURE mostrarInformacionDepartamento( IN Dept_Name VARCHAR(50))
	BEGIN
		DECLARE bandera BOOL;
		select if (true, true, false) into bandera;
        select (bandera);
		select H.Dept_No as codDept, H.DNombre as nomDept, count(*) as Cantidad
		FROM Hospital.Dept as H
		inner join Hospital.Emp as E on H.Dept_No = E.Dept_No
		group by H.Dept_No
		having Dept_Name = nomDept;
	END $$
	delimiter ;
    
			/*CREATE TABLE error_logs(
			id INT AUTO_INCREMENT,
			nombre VARCHAR(255),
			PRIMARY KEY (id));
            INSERT INTO error_logs(nombre) VALUES ('NO EXITE ');*/
    
    
    
    
    
    
    
    
    
    
    
    
    
    -- USAR BASE DE DATPS SUBTIENDA

    
    
    
    
    
    
    
    
    