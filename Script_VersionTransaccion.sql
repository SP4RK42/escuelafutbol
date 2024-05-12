-- Crear la base de datos
CREATE DATABASE IF NOT EXISTS EscuelaFutbolDB;
USE EscuelaFutbolDB;

-- Tabla de Alumnos
CREATE TABLE Alumnos (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    DNI VARCHAR(10),
    Nombre VARCHAR(50),
    Apellido VARCHAR(50),
    Fecha_Nacimiento DATE,
    Direccion VARCHAR(100),
    Telefono VARCHAR(20)
);

-- Tabla de Profesores
CREATE TABLE Profesores (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    DNI VARCHAR(10),
    Nombre VARCHAR(50),
    Apellido VARCHAR(50),
    Telefono VARCHAR(20),
    Correo_Electronico VARCHAR(100),
    Especializacion VARCHAR(100)
);

-- Tabla de Equipos
CREATE TABLE Equipos (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre_Equipo VARCHAR(50),
    ID_Entrenador INT,
    nromaximo INT,
    FOREIGN KEY (ID_Entrenador) REFERENCES Profesores(ID)
);

-- Tabla de Relación Alumno-Equipo
CREATE TABLE Alumno_Equipo (
	ID_Alumno_Equipo INT PRIMARY KEY auto_increment,
    ID_Alumno INT,
    ID_Equipo INT,
    Fecha_Registro DATE,
    Activo BOOLEAN default 0,
    FOREIGN KEY (ID_Alumno) REFERENCES Alumnos(ID),
    FOREIGN KEY (ID_Equipo) REFERENCES Equipos(ID)
);

-- Tabla de Pruebas Físicas
CREATE TABLE Pruebas_Fisicas (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Tipo_Prueba VARCHAR(50),
    Descripcion VARCHAR(100)
);

-- Tabla de Resultados de Pruebas Físicas
CREATE TABLE Resultados_Pruebas (
    ID_Alumno INT,
    ID_Prueba INT,
    Resultado VARCHAR(100),
    Fecha_Prueba DATE,
    FOREIGN KEY (ID_Alumno) REFERENCES Alumnos(ID),
    FOREIGN KEY (ID_Prueba) REFERENCES Pruebas_Fisicas(ID)
);

create table Usuario(
	idusuario INT AUTO_INCREMENT PRIMARY KEY,
	nomusuario VARCHAR(50),
	email VARCHAR(100),
	password VARCHAR(50),
	nombres VARCHAR(50),
	apellidos VARCHAR(50)
);

create table Rol(
	idrol INT AUTO_INCREMENT PRIMARY KEY,
	nomrol VARCHAR(50)
);

create table Usuario_rol(
	idusuario INT,
	idrol INT,
	FOREIGN KEY (idusuario) REFERENCES Usuario(idusuario),
    FOREIGN KEY (idrol) REFERENCES Rol(idrol)
);

INSERT INTO Alumnos (DNI, Nombre, Apellido, Fecha_Nacimiento, Direccion, Telefono)
VALUES ('12345678A', 'Juan', 'González', '2005-08-10', 'Calle Principal 123', '987654321');

INSERT INTO Alumnos (DNI, Nombre, Apellido, Fecha_Nacimiento, Direccion, Telefono)
VALUES ('87654321B', 'María', 'López', '2006-04-25', 'Avenida Central 456', '654321987');

INSERT INTO Alumnos (DNI, Nombre, Apellido, Fecha_Nacimiento, Direccion, Telefono)
VALUES ('13579246C', 'Pedro', 'Martínez', '2007-11-15', 'Plaza Mayor 789', '123456789');

INSERT INTO Alumnos (DNI, Nombre, Apellido, Fecha_Nacimiento, Direccion, Telefono)
VALUES ('98765432D', 'Laura', 'Rodríguez', '2005-12-30', 'Calle Secundaria 567', '678912345');

INSERT INTO Alumnos (DNI, Nombre, Apellido, Fecha_Nacimiento, Direccion, Telefono)
VALUES ('24681359E', 'Ana', 'Sánchez', '2006-09-08', 'Avenida Norte 1011', '321654987');

-- select * from alumnos a ;

INSERT INTO Profesores (DNI, Nombre, Apellido, Telefono, Correo_Electronico, Especializacion)
VALUES ('98765432X', 'Carlos', 'Fernández', '912345678', 'carlos@example.com', 'Entrenamiento físico');

INSERT INTO Profesores (DNI, Nombre, Apellido, Telefono, Correo_Electronico, Especializacion)
VALUES ('12345678Y', 'Ana', 'García', '935678912', 'ana@example.com', 'Técnica y táctica');

INSERT INTO Profesores (DNI, Nombre, Apellido, Telefono, Correo_Electronico, Especializacion)
VALUES ('87654321Z', 'David', 'Pérez', '965432189', 'david@example.com', 'Psicología deportiva');

INSERT INTO Profesores (DNI, Nombre, Apellido, Telefono, Correo_Electronico, Especializacion)
VALUES ('13579246W', 'Sara', 'Ruiz', '945678321', 'sara@example.com', 'Preparación física y mental');

INSERT INTO Profesores (DNI, Nombre, Apellido, Telefono, Correo_Electronico, Especializacion)
VALUES ('24681359V', 'Javier', 'López', '978654321', 'javier@example.com', 'Entrenamiento de porteros');

-- select * from profesores p ;

INSERT INTO Equipos (Nombre_Equipo, ID_Entrenador, nromaximo)
VALUES ('Juvenil A', 1, 2);

INSERT INTO Equipos (Nombre_Equipo, ID_Entrenador, nromaximo)
VALUES ('Infantil B', 3, 2);

INSERT INTO Equipos (Nombre_Equipo, ID_Entrenador, nromaximo)
VALUES ('Cadete A', 2, 2);

INSERT INTO Equipos (Nombre_Equipo, ID_Entrenador, nromaximo)
VALUES ('Benjamín A', 4, 2);

INSERT INTO Equipos (Nombre_Equipo, ID_Entrenador, nromaximo)
VALUES ('Femenino Sub-17', 5, 2);


-- select * from equipos e ;

INSERT INTO Pruebas_Fisicas (Tipo_Prueba, Descripcion) VALUES 
('Carrera de 100 metros', 'Medición del tiempo para completar una carrera de 100 metros'),
('Salto vertical', 'Medición de la altura alcanzada en un salto vertical'),
('Flexiones de brazos', 'Cantidad de flexiones de brazos realizadas en un minuto'),
('Agilidad y velocidad', 'Recorrido de obstáculos para medir la agilidad y velocidad'),
('Lanzamiento de balón', 'Distancia alcanzada en el lanzamiento de un balón');

INSERT INTO resultados_pruebas  (ID_Alumno , ID_Prueba , Resultado, Fecha_Prueba)
VALUES (1, 1, 'Aprobado', '2024-05-10');
INSERT INTO resultados_pruebas  (ID_Alumno , ID_Prueba , Resultado, Fecha_Prueba)
VALUES (1, 2, 'Aprobado', '2024-04-12');

-- select * from resultados_pruebas rp

INSERT INTO alumno_equipo  (ID_Alumno , ID_Equipo, Fecha_Registro,Activo)
VALUES (1, 1, '2024-05-10',0);
INSERT INTO alumno_equipo  (ID_Alumno , ID_Equipo, Fecha_Registro,Activo)
VALUES (2, 2, '2024-05-10',1);
-- select * from alumno_equipo ae
-- select * from alumnos a 

-- select *
-- from alumnos a 
-- inner join alumno_equipo ae on a.ID  = ae.ID_Alumno 
-- where ID  = 6 and activo = 1

-- update alumno_equipo ae
-- set activo = 0
-- where ID_Alumno  = 6


CREATE PROCEDURE obtener_equipo_alumno(id_alumno INT)
BEGIN
  select a.id, a.nombre ,e.id, e.nombre_equipo
  FROM alumnos a
  inner join alumno_equipo ae on a.ID = ae.id_alumno
  inner join equipos e on ae.id_equipo = e.ID
  WHERE a.ID = id_alumno and ae.activo = 1;
end;

CREATE PROCEDURE obtener_alumnosxequipo(id_equipo INT)
BEGIN
  select ae.ID_Alumno_Equipo, ae.ID_Alumno, ae.ID_Equipo, ae.Fecha_Registro, ae.Activo
  FROM alumnos a
  inner join alumno_equipo ae on a.ID = ae.ID_Alumno
  WHERE ae.ID_Equipo = id_equipo and ae.activo = 1;
end;

call obtener_equipo_alumno(5)
call obtener_alumnosxequipo(2)

-- update alumno_equipo ae
-- set Activo = 0
-- where ID_Alumno = 1

CREATE PROCEDURE actualizar_equipo_estado(id_alumno INT)
BEGIN
  update alumno_equipo ae
  set ae.Activo = 0
  where ae.ID_Alumno = id_alumno;
end;

call actualizar_equipo_estado(2)