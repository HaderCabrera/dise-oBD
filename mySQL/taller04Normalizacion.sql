-- -------------------------------
-- NORMALIZACION DE BASE DE DATOS
-- -------------------------------

-- 1.1 Una conlumna contiene varios valores. Por ejemplo, un campo Telefonos que almacena varios numero
-- en una sola fila.

-- Tabla original
CREATE TABLE Estudiante (
	ID int primary key,
	Nombre varchar(100),
	Telefonos varchar(500)
);

CREATE TABLE Telefonos (
	telefono int,
    id_est int ,
    foreign key(id_est) references Estudiante(id),
    primary key(id_est, telefono)
);

-- 1.2 Normalizar la siguiente estructurea
CREATE TABLE Curso (
	CursoID int primary key,
    NombreCurso varchar(100)
    -- NombreEstudiante varchar(100),
);

CREATE TABLE Estudiante (
    EstudianteID int primary key,
    NombreEstudiante varchar(100)
);

CREATE TABLE CursoEstudiante (
		CursoID int,
        EstudianteID int,
		primary key(CursoID, EstudianteID),
		foreign key(CursoID) references Curso(CursoID),
		foreign key(EstudianteID) references Estudiante(EstudianteID)        
);

-- 1.3 Normalizar la siguiente estructura
	CREATE TABLE Profesor(
		ProfesorID int,
        Nombre varchar(100),
        DepartamentoID int,
		foreign key (DepartamentoID) references Departamento(DepartamentoID)
    );
    create table Departamento(
		DepartamentoID int primary key,
        NombreDepartamento varchar(100)
    );
    
-- 1.4 Normalizar la siguiente estructura si HORARIO depende solo de CURSOID

CREATE TABLE  Profesor (
	ProfesorID int primary key,
    Nombre varchar(100)
);
CREATE TABLE  curso (
	CursoID int primary key,
    Nombre varchar(100)
);
 CREATE TABLE Asignacion (
	ProfesorID int,
	CursoID int,
    foreign key(ProfesorID) references Profesor(ProfesorID),
    foreign key(CursoID) references curso(CursoID),
    primary key (ProfesorID, CursoID)
 );
 
CREATE TABLE horario (
	CursoID int,
    Horario TIME,	
    ProfesorID int,
    foreign key (ProfesorID) references Asignacion(ProfesorID),
    primary key(CursoID, ProfesorID)
);

-- 1.5 Normalizar la siguiente estructura: En este escenario hay una tabla que intenta manejar multiples
-- aspectos de la informacion del paciente, las visitas al medico, los tratamientos y las recetas.

create table Paciente(
	PacienteID int primary key,
    NombrePaciente varchar(100),
    FechaNacimiento date
);

create table Medico(
    MedicoID int primary key,
    NombreMedico varchar(100),
    Especialidad varchar(100)
);

CREATE TABLE RegistroHopital (
	registroID int primary key,
    FechaVisita datetime,
    MedicoID int,
	PacienteID int,
    foreign key (MedicoID) references Medico(MedicoID),
	foreign key (PacienteID) references Paciente(PacienteID),
    TratamiendoID int,
    foreign key (TratamiendoID) references Tratamiento(TratamiendoID)
);

create table Tratamiento (
	TratamiendoID int primary key,
	DescripcionTratamiento varchar(255),
	PacienteID int,
    foreign key (PacienteID) references Paciente(PacienteID)
);

create table formulario (
	MedicamentoID int,
    TratamiendoID int,
	Dosis varchar(50),
	foreign key (MedicamentoID) references Medicamento(MedicamentoID),
	foreign key (TratamiendoID) references Tratamiento(TratamiendoID)
);

create table Medicamento (
	MedicamentoID int primary key,
	Medicamento varchar(100),
    TratamiendoID int,
    foreign key (TratamiendoID) references Tratamiento(TratamiendoID)
);

-- 1.6 


    
    
    
    
    
