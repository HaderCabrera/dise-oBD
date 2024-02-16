# EJERCICIO DE DISEÑO DE BD DE UN BANCO
Se nos da el modelo E-R: 
- Apartir deL E-R ahi debemos crear el modelo relacional desde startUML y MySQL Workbrench. 
- Luego crear diseño fisico (script SQL)
## MODELO E-R:
![](/ejerciciosBD/bancoBD/img/1.png)
## MODELO RELACIONAL:
![](/ejerciciosBD/bancoBD/img/2.png)
## SCRIP SQL (MODELADO FISICO)
```
-- Active: 1708071252028@@127.0.0.1@3306
CREATE DATABASE banco
    DEFAULT CHARACTER SET = 'utf8mb4';

USE banco;

CREATE TABLE banco(
    codigo_banco INT PRIMARY KEY,
    nombre_banco VARCHAR(100) NOT NULL,
    direccion_banco VARCHAR(200) NOT NULL  
);

CREATE TABLE sucursal_banco(
    codigo_sucursal INT,
    direccion_sucursal VARCHAR(200) NOT NULL,
    codigo_banco INT,
    PRIMARY KEY(codigo_sucursal, codigo_banco),
    Foreign Key (codigo_banco) REFERENCES banco(codigo_banco)
);

CREATE TABLE cuenta(
    numero_cuenta INT PRIMARY KEY,
    saldo_cuenta DECIMAL NOT NULL,
    tipo_cuenta VARCHAR(45) NOT NULL,
    codigo_banco INT,
    codigo_sucursal INT,
    Foreign Key (codigo_banco,codigo_sucursal) REFERENCES sucursal_banco(codigo_banco, codigo_sucursal)
);

CREATE TABLE prestamo(
    numero_prestamo INT PRIMARY KEY,
    cantidad_prestamo DECIMAL NOT NULL,
    tipo_prestamo VARCHAR(45) NOT NULL,
    codigo_banco INT,
    codigo_sucursal INT,
    Foreign Key (codigo_banco,codigo_sucursal) REFERENCES sucursal_banco(codigo_banco, codigo_sucursal)
);

CREATE TABLE cliente(
    dni_cliente INT PRIMARY KEY,
    telefono_cliente INT NOT NULL,
    nombre_cliente VARCHAR(100) NOT NULL,
    direccion_cliente VARCHAR(200) NOT NULL
);

CREATE TABLE c_c(
    numero_cuenta INT,
    dni_cliente INT,
    PRIMARY KEY(numero_cuenta, dni_cliente),
    Foreign Key (numero_cuenta) REFERENCES cuenta(numero_cuenta),
    Foreign Key (dni_cliente) REFERENCES cliente(dni_cliente)
);

CREATE TABLE p_c(
    dni_cliente INT,
    numero_prestamo INT,
    PRIMARY KEY(dni_cliente, numero_prestamo),
    Foreign Key (dni_cliente) REFERENCES cliente(dni_cliente),
    Foreign Key (numero_prestamo) REFERENCES prestamo(numero_prestamo)
);

```
## REALIZAR INGENIERIA INVERSA