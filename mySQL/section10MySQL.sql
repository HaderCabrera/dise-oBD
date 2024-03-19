-- --------------------------------------
-- SECTION 10 - FUNCIONES
-- --------------------------------------
	-- CALCULAR EL AREA DE UN CIRCULO
	drop function calcularAreaCirculo;
	delimiter $$
	create function calcularAreaCirculo(radio double)
	returns double
	deterministic
	begin
		declare area double;
		set area = pi() * radio * radio;
		return area;
	end $$
	delimiter ;

	select calcularAreaCirculo(10);

	-- CALCULAR LA CALIFICACION DE UNA PELKCULA SEGUN SU EDAD
    delimiter $$
    create function clasificarPelicula(edad int)
    returns varchar(30)
    deterministic
    begin
		if edad < 13 then
			return "Para niños";
		elseif edad < 18 then
			return "Para adolecentes";
		else 
			return "Para adultos";
		end if;
    end $$
    delimiter ;
    
    -- CALCULAR EL FACTORIAL DE UN NUMERO
	delimiter $$
    create function calcularFactorial(numero int)
    returns int
    deterministic
    begin
		declare f int default 1;
        while numero > 1 DO
			set f = f * numero;
            set numero  = numero - 1;
        end while;
        return f;
    end $$
    delimiter ;
    
    select calcularFactorial(5);
    
    -- hallar el veihuclo mas andado
    use miprimerabasededatos;
    drop function hallarCocheMasViejo;
	delimiter $$
    create function hallarCocheMasViejo()
    returns int
    deterministic
    begin
		declare km int;
        select Kilometros into km 
        from coches 
        order by kilometros desc
        limit 1;
        return km;
    end $$
    delimiter ;
    select *
    from coches 
    where Kilometros = hallarCocheMasViejo();
-- Calcular el iva leyendo un campo como PRECIO
use subTienda;
-- Funcion que calcula un descuendo al precio del producto.
 delimiter $$
 create function calcularDescuento(valor decimal(10,2), porc decimal(10,2))
 returns decimal(10,2)
 deterministic
 begin 
	if porc > 0 and porc < 100 then 
		return valor * (porc / 100);
    elseif porc > 100 then
		return valor;
	else
		return 0;
	end if;
 end $$
 delimiter ;
 select nombre,precio, calcularDescuento(precio, 20 ) as descuento
 from Productos;
 -- ejercicio VENTAS
 CREATE TABLE Ventass(
	id INT auto_increment,
    vendedor_id INT,
    monto_venta DECIMAL(10,2),
    primary key(id)
 );
 
-- select PromedioVentas (123) as promedioVentasVendor; TERMINAR DE HACER !!!!!!!
  delimiter $$
 create function promedioVentasVendedor(valor decimal(10,2), id int)
 returns decimal(10,2)
 deterministic
 begin 
	return	avg(valor);
 end $$
 delimiter ;
 
 -- Funcion calcular el descuento tenniendo en cuenta la categoria del cliente, TERMINAL !!!!!!!!!!!!!!!!!1
 create table ordenes(
	id INT auto_increment,
    cliente_id INT,
    precio DECIMAL(10, 2),
    categoria_cliente varchar(10),
    primary key(id)
 );
 
 delimiter $$
 create function calcularDescuentoPorCategoria(valor decimal(10,2), categoria varchar(50))
 returns decimal(10,2)
 deterministic
 begin
	select categoria_cliente as Categoria
    from Productos
    where Productos.categoria_cliente = categoria;
	-- if ()
 end $$
 delimiter ;

-- --------------------------------------
-- SECTION 11 - EXECPIONES Y ERRORES 
-- --------------------------------------

-- CREAR UN ERROR Y LANZARLO
 SELECT 1 / 0 ;
 drop function calcularDivision;
 delimiter $$
    create function calcularDivision(dividendo double, divisor double)
    returns varchar(30)
    deterministic
    begin
	if divisor = 0 then
		signal sqlstate '45000' set message_text = 'Error. Division por cero loco, verifica esos calculos!';
	end if;
		return dividendo / divisor;
    end $$
 delimiter ;
 
 select calcularDivision(6, 0) as resultado;

-- --------------------------------------
-- SECTION 11 - usuarios y restricciones 
-- --------------------------------------

select user, host
from mysql.user;

-- CREAR UN USUARIO
CREATE user 'cacas'@localhost identified by 'cacas2024';
	-- permisos
    grant select, insert, update on prueba.* to 'cacas'@localhost;
    grant select on prueba.* to 'cacas'@localhost;
    -- que no pueda insertar 
    grant insert on prueba.empleados to 'cacas'@localhost;
    revoke insert on prueba.empleados from 'cacas'@localhost;
    
    show grants for 'cacas'@localhost;
-- BORRAR USUARIO
drop user 'cacas'@localhost;

grant usage on prueba.* to 'cacas'@localhost ;
alter user 'cacas'@localhost with max_queries_per_hour 100;



-- eliminar usuarios anonimos para garantizar seguriDAD
	-- MIRAR USUARIOS ANONIMOS
	select user, host
	from mysql.user
    where user = '';
    -- eliminar usuario anonimo
    drop user ''@localhost;
    
-- cambiar contraseña
alter user 'cacas'@localhost identified by 'cacas<2024>';

-- dejar solo siertos provilegios
revoke all privileges on *.* from 'cacas'@localhost;
grant select on prueba.* to 'cacas'@localhost;

-- CREAR USUARIO ADMIN PARA POSTERIORMENTE BORRAR EL USUARIO ROOT
CREATE USER 'admin'@'%' identified by 'campus2024';
grant all privileges on *.* to 'admin'@'%' with grant option;
    
-- crear usuario que solo pueda editar algunas cosas
create user 'camilo'@localhost identified by 'bucaroncampeon';
grant select (Funcion,Hospital_Cod) on Hospital.Plantilla to 'camilo'@localhost;

-- recargar privilegios
FLUSH privileges;

-- 
use world;

select * from city where countrycode = 'COL';
prepare stmt from 'select * from city where countrycode = ?';
set @pais = 'COL';
execute stmt using @pais; 

deallocate prepare stmt;









 
