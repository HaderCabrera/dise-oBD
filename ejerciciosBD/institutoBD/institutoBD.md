# EJERCICIO DE DISEÑO DE BD DE UN INSTITUTO

“Se desea diseñar la base de datos de un Instituto. En la base de datos se desea guardar los datos de los profesores del Instituto (DNI, nombre, dirección y teléfono). Los profesores imparten módulos, y cada módulo tiene un código y
un nombre. Cada alumno está matriculado en uno o varios módulos. De cada alumno se desea guardar el nº de expediente, nombre, apellidos y fecha de nacimiento. Los profesores pueden impartir varios módulos, pero un módulo
sólo puede ser impartido por un profesor. Cada curso tiene un grupo de alumnos, uno de los cuales es el delegado del grupo“.
1. Aplique la reglas de normalización para crear el diseño y genere el modelo Relacional.
2. Construya el modelo E-R a partir de su modelo relacional.
3. Escriba y copie en el este documento el script SQL que crea el diseño físico del modelo relacional que generó.
4. Compare su modelo E-R con el modelo E-R de respuestas.
## NORMALIZACION Y MODELO RELACIONAL:
![](/ejerciciosBD/institutoBD/img/1.png)
![](/ejerciciosBD/institutoBD/img/2.png)
## MODELO E-R
![](/ejerciciosBD/institutoBD/img/4.png)
## SCRIP SQL (MODELADO FISICO)
```
-- Active: 1708071252028@@127.0.0.1@3306
CREATE DATABASE instituto
    DEFAULT CHARACTER SET = 'utf8mb4';

use instituto;
/* 2024-02-16 03:18:15 [26 ms] */ 
CREATE TABLE Profesores(
    dni_prof INT UNSIGNED PRIMARY KEY,
    nombre_prof varchar(100) NOT NULL,
    direccion_prof varchar(200) NOT NULL
);
/* 2024-02-16 03:26:53 [27 ms] */ 

CREATE TABLE Modulos(
    cod_mod INT PRIMARY KEY,
    nombre_mod varchar(100) NOT NULL,
    dni_prof INT UNSIGNED NOT NULL,
    Foreign Key (dni_prof) REFERENCES Profesores(dni_prof)
);
CREATE TABLE Alumno(
    expediente_alumn INT PRIMARY KEY,
    nombre_alumn varchar(100) NOT NULL,
    apellidos_alumn varchar(200) NOT NULL,
    fechanacimiento_alumn DATE NOT NULL,
    representante_alumn INTEGER NOT NULL,
    Foreign Key (representante_alumn) REFERENCES Alumno(expediente_alumn)
);
/* 2024-02-16 03:34:42 [25 ms] */ 


CREATE TABLE IF NOT EXISTS Modulo_alumno(
    cod_mod INT,
    expediente_alumn INT,
    PRIMARY KEY(cod_mod, expediente_alumn),
    FOREIGN KEY (cod_mod) REFERENCES Modulos(cod_mod),
    FOREIGN KEY (expediente_alumn) REFERENCES Alumno(expediente_alumn)
);

```