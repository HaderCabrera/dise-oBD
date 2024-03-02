-- Ejercicio #1
 -- Crear un tabla temporal llamada empleados_departamentos_x la cual contendra la informacion de los empleados (nombre y salario) 
 -- de la tabla empleados. Estos empleados trabajan en el departamento X y ganan mas de $1.200.000.
 	CREATE TABLE empleados_departamentos_x
    AS
	SELECT nombre, salario, departamento
	FROM empleados
	WHERE departamento = "x" and salario > 1200000;
-- Ejercicio #2
 -- Crear una tabla llamada tempPais que contengan las columnas 'nombre' y 'poblacion', seleccionando los registros de la tabla 'country'
 -- donde la poblacion sea igual o inferior a 100,000,000. La tabla se encuentra en la base de datos world.
	use world;

  	CREATE TABLE tempPais
    AS
	SELECT C.Name, C.Population
	FROM world.country as C
	WHERE C.Population <= 100000000 ;
    describe tempPais;
    
    select * from tempPais;