CREATE TABLE Materias (
    id_materia INT PRIMARY KEY,
    nombre_materia VARCHAR(255) NOT NULL,
    descripcion TEXT,
    id_maestro INT,
    FOREIGN KEY (id_maestro) REFERENCES Maestros(id_maestro)
);
CREATE TABLE Edificios (
    id_edificio INT PRIMARY KEY,
    nombre_edificio VARCHAR(255) NOT NULL,
    ubicacion VARCHAR(255),
    numero_pisos INT,
);

CREATE TABLE Aulas (
    id_aula INT PRIMARY KEY,
    nombre_aula VARCHAR(50) NOT NULL,
    capacidad INT,
    id_edificio INT,
    FOREIGN KEY (id_edificio) REFERENCES Edificios(id_edificio)
);

CREATE TABLE Maestros (
    id_maestro INT PRIMARY KEY,
    nombre_maestro VARCHAR(255) NOT NULL,
    correo_electronico VARCHAR(255),
    telefono_contacto VARCHAR(15)
);

CREATE TABLE Asistencia (
    id_asistencia INT PRIMARY KEY,
    id_horario INT,
    fecha DATE NOT NULL,
    presente BIT,
    FOREIGN KEY (id_horario) REFERENCES HorarioMaestros(id_horario)
);

CREATE TABLE Prefectos (
    id_prefecto INT PRIMARY KEY,
    nombre_prefecto VARCHAR(255) NOT NULL,
    id_maestro INT,
    FOREIGN KEY (id_maestro) REFERENCES Maestros(id_maestro)
);

CREATE TABLE Coordinador (
    id_coordinador INT PRIMARY KEY,
    nombre_coordinador VARCHAR(255) NOT NULL,
    area_coordinacion VARCHAR(255),
    id_maestro INT,
    FOREIGN KEY (id_maestro) REFERENCES Maestros(id_maestro)
);


CREATE TABLE RegistrosGenerales (
    id_registro INT PRIMARY KEY,
    tipo_actividad VARCHAR(255) NOT NULL,
    descripcion TEXT,
    fecha DATE,
    lugar VARCHAR(255),
    id_responsable INT,
    FOREIGN KEY (id_responsable) REFERENCES Maestros(id_maestro)
);