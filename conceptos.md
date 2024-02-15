# Modelamiento de BD
![](/img/1.png)
## Normalizacion
![](/img/2.png)
## Dependencia
![](/img/3.png)
- **Dependencia funcional**
    ![](/img/4.png)
- **Dependencia completa**
    ![](/img/5.png)
- **Dependencia transitiva**
    ![](/img/6.png)
### Ejemplo de dependencias
![](/img/7.png)
    - **1FN**: Sacar las tabla.
    ![](/img/8.png) 
    - **2FN**: Identificar llaves primarias, verificar llaves con dependencias primarias y transitivas.
    ![](/img/9.png)
    ![](/img/9.1.png)
    - **3FN**: Sacar tablas con dependencias funcional/transitiva y sacar cardinalidad.
    ![](/img/10.png)
    ![](/img/10.1.png)
    - **4FN**: Creamos nuevas tablas para las relaciones M-> N
    ![](/img/11.png)
# ejercicio 1
![](/img/12.png)
- 1FN:
![](/img/13.png)
- 2FN:
![](/img/14.png)

# ejercicio 2
![](/img/15.png)

## Programas para arquitectura de DB
### Ejercicio de viajes
- StartUML:
![](/img/16.png)
- MySQL Workbench:
![](/img/17.png)
## Conceptos TABLAS DB
![](/img/18.png)
## Configuracion CLIENTE (MySQL)

### Comandos:
```
user@root:~$ mysql -h localhost -u root -p
```
Ver que base de datos tenemos
```
mysql> show databases;
```
Crear base de datos
```
mysql> create database viajes;
```
Trabajar sobre una base de datos
```
mysql> use viajes;
```
Ver tablas de mi base de datos
```
mysql> show tables;
```
Crear tabla
```
mysql> create table Vehiculo(
    -> placa_veh varchar(6) primary key,
    -> tipo_veh varchar(100) not null,
    -> conductor_veh varchar(100) not null);

mysql> create table if not exists Vehiculo(
    -> placa_veh varchar(6) primary key,
    -> tipo_veh varchar(100) not null,
    -> conductor_veh varchar(100) not null);

```
Ver tabla
```
mysql> describe Vehiculo;
```
Borrar tabla
```
mysql> drop table Vehiculo;
mysql> drop table if exists Vehiculo;
```
Conceptos
- DDL: CRREAR
- DSL: ACCEDER
- DML: MODIFICAR 

Crear un indice(llave tiplo multiple)
```
mysql> create index idx_vehiculo_conductor_veh
    -> on Vehiculo(conductor_veh);
```
