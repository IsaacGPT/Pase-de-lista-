-- Crear la base de datos
CREATE DATABASE PaseDeListaDB;
GO

-- Crear la base de datos
CREATE DATABASE PaseDeListaDB;
GO

-- Usar la base de datos
USE PaseDeListaDB;
GO

-- Crear tabla Maestros
CREATE TABLE Maestros (
    MaestroID INT PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL,
    Materia VARCHAR(50) NOT NULL
);
GO

-- Crear tabla Cursos
CREATE TABLE Clases (
    CursoID INT PRIMARY KEY,
    NombreCurso VARCHAR(50) NOT NULL
);
GO

-- Crear tabla Edificios
CREATE TABLE Edificios (
    EdificioID INT PRIMARY KEY,
    NombreEdificio VARCHAR(50) NOT NULL
);
GO

-- Crear tabla Asistencias
CREATE TABLE Asistencias (
    AsistenciaID INT PRIMARY KEY,
    MaestroID INT,
    ClaseID INT,
    Fecha DATE,
    Presente BIT,
    Justificacion BIT,
    Falta BIT,
    Retraso BIT,
    HoraEntrada TIME,
    HoraSalida TIME,
    MotivoInasistencia VARCHAR(100),
    PeriodoClases VARCHAR(20),
    FOREIGN KEY (MaestroID) REFERENCES Maestros(MaestroID),
    FOREIGN KEY (ClaseID) REFERENCES Clases(CursoID) -- Corregido aquí
);
GO


-- Crear tabla AsistenciasDetalles
CREATE TABLE AsistenciasDetalles (
    AsistenciaDetalleID INT PRIMARY KEY,
    AsistenciaID INT,
    HoraEntrada TIME,
    HoraSalida TIME,
    FOREIGN KEY (AsistenciaID) REFERENCES Asistencias(AsistenciaID)
);
GO

-- Crear procedimiento almacenado para insertar asistencia
CREATE PROCEDURE InsertarAsistencia
    @MaestroID INT,
    @ClaseID INT,
    @Fecha DATE,
    @HoraEntrada TIME,
    @HoraSalida TIME,
    @MotivoInasistencia VARCHAR(100),
    @PeriodoClases VARCHAR(20)
AS
BEGIN
    IF @HoraEntrada >= '07:00:00' AND @HoraEntrada <= '14:00:00'
    BEGIN
        INSERT INTO Asistencias (MaestroID, ClaseID, Fecha, HoraEntrada, HoraSalida, MotivoInasistencia, PeriodoClases)
        VALUES (@MaestroID, @ClaseID, @Fecha, @HoraEntrada, @HoraSalida, @MotivoInasistencia, @PeriodoClases);
        
        -- Puedes realizar otras acciones aquí, como actualizar estadísticas, etc.
    END
    ELSE
    BEGIN
        PRINT 'La hora de entrada está fuera del período de clases.';
        -- Puedes manejar esta situación de acuerdo a tus requerimientos.
    END
END;
GO

-- Crear tabla MotivosInasistencia
CREATE TABLE MotivosInasistencia (
    MotivoID INT PRIMARY KEY,
    Descripcion VARCHAR(100) NOT NULL
);
GO

-- Crear tabla MensajesAsistencia
CREATE TABLE MensajesAsistencia (
    MensajeAsistenciaID INT PRIMARY KEY,
    AsistenciaID INT,
    Mensaje VARCHAR(255) NOT NULL,
    FOREIGN KEY (AsistenciaID) REFERENCES Asistencias(AsistenciaID)
);
GO

-- Crear tabla Evaluaciones
CREATE TABLE Evaluaciones (
    EvaluacionID INT PRIMARY KEY,
    ClaseID INT,
    MaestroID INT,
    Fecha DATE,
    TipoEvaluacion VARCHAR(50) NOT NULL,
    Puntaje FLOAT,
    FOREIGN KEY (ClaseID) REFERENCES Clases(CursoID),
    FOREIGN KEY (MaestroID) REFERENCES Maestros(MaestroID)
);
GO

-- Crear tabla ComentariosMaestros
CREATE TABLE ComentariosMaestros (
    ComentarioMaestroID INT PRIMARY KEY,
    MaestroID INT,
    Comentario VARCHAR(255) NOT NULL,
    FechaComentario DATE,
    FOREIGN KEY (MaestroID) REFERENCES Maestros(MaestroID)
);
GO

-- Crear tabla AsignaturasMaestros
CREATE TABLE AsignaturasMaestros (
    AsignaturaMaestroID INT PRIMARY KEY,
    MaestroID INT,
    Asignatura VARCHAR(50) NOT NULL,
    FOREIGN KEY (MaestroID) REFERENCES Maestros(MaestroID)
);
GO

-- Crear tabla HorasTrabajoMaestros
CREATE TABLE HorasTrabajoMaestros (
    HorasTrabajoMaestroID INT PRIMARY KEY,
    MaestroID INT,
    DiaSemana VARCHAR(15) NOT NULL,
    HoraInicio TIME,
    HoraFin TIME,
    FOREIGN KEY (MaestroID) REFERENCES Maestros(MaestroID)
);
GO

-- Crear tabla ActividadesExtra
CREATE TABLE ActividadesExtra (
    ActividadID INT PRIMARY KEY,
    MaestroID INT,
    NombreActividad VARCHAR(50) NOT NULL,
    Fecha DATE,
    Descripcion VARCHAR(255),
    FOREIGN KEY (MaestroID) REFERENCES Maestros(MaestroID)
);
GO

-- Crear tabla ReunionesMaestros
CREATE TABLE ReunionesMaestros (
    ReunionID INT PRIMARY KEY,
    MaestroID INT,
    Fecha DATE,
    HoraInicio TIME,
    HoraFin TIME,
    Lugar VARCHAR(100),
    FOREIGN KEY (MaestroID) REFERENCES Maestros(MaestroID)
);
GO

-- Crear tabla ProyectosMaestros
CREATE TABLE ProyectosMaestros (
    ProyectoID INT PRIMARY KEY,
    MaestroID INT,
    NombreProyecto VARCHAR(50) NOT NULL,
    Descripcion VARCHAR(255),
    FechaInicio DATE,
    FechaFin DATE,
    FOREIGN KEY (MaestroID) REFERENCES Maestros(MaestroID)
);
GO

-- Crear tabla TutoresMaestros
CREATE TABLE TutoresMaestros (
    TutorMaestroID INT PRIMARY KEY,
    MaestroID INT,
    EstudianteID INT,
    FOREIGN KEY (MaestroID) REFERENCES Maestros(MaestroID),
    FOREIGN KEY (EstudianteID) REFERENCES Estudiantes(EstudianteID)
);
GO

-- Crear tabla CalendarioMaestros
CREATE TABLE CalendarioMaestros (
    CalendarioID INT PRIMARY KEY,
    MaestroID INT,
    Fecha DATE,
    Evento VARCHAR(100) NOT NULL,
    Descripcion VARCHAR(255),
    FOREIGN KEY (MaestroID) REFERENCES Maestros(MaestroID)
);
GO
