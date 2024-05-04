
CREATE TABLE Mes (
    idMes INT PRIMARY KEY NOT NULL,
    mes VARCHAR(10) NOT NULL UNIQUE
);

CREATE TABLE Sexo (
    idSexo INT PRIMARY KEY NOT NULL,
    sexo VARCHAR(10) NOT NULL UNIQUE
);

CREATE TABLE PuebloPertenencia (
    idPueblo INT PRIMARY KEY NOT NULL,
    nombrePueblo VARCHAR(10) NOT NULL UNIQUE
);

-------Edad?
CREATE TABLE Edad (
    idEdad INT PRIMARY KEY NOT NULL,
    edad VARCHAR(10) NOT NULL
);

CREATE TABLE PeriodoEdad (
    idPeriodo INT PRIMARY KEY NOT NULL,
    periodo VARCHAR(20) NOT NULL UNIQUE
);

CREATE TABLE Departamento (
    idDepartamento VARCHAR(2) PRIMARY KEY NOT NULL,
    departamento VARCHAR(15) NOT NULL UNIQUE    
);

CREATE TABLE Municipio (
    idMunicipio VARCHAR(4) PRIMARY KEY NOT NULL,
    municipio VARCHAR(30) NOT NULL UNIQUE,
    departamento VARCHAR(2) NOT NULL FOREIGN KEY REFERENCES Departamento(idDepartamento)
);

CREATE TABLE TipoConsulta (
    idTipoConsulta INT PRIMARY KEY NOT NULL,
    tipoConsulta VARCHAR(30) NOT NULL UNIQUE    
);

CREATE TABLE CausaAtencion (
    codigoCIE INT PRIMARY KEY NOT NULL,
    descripcion TEXT NOT NULL UNIQUE    
);

------ Dias estancia?
CREATE TABLE DiasEstancia (
    idDiasEstancia INT PRIMARY KEY NOT NULL,
    diasEstancia VARCHAR(10) NOT NULL UNIQUE    
);

CREATE TABLE CondicionEgreso (
    idCondicionEgreso INT PRIMARY KEY NOT NULL,
    condicionEgreso VARCHAR(10) NOT NULL UNIQUE    
);

CREATE TABLE Tratamiento (
    idTratamiento INT PRIMARY KEY NOT NULL,
    Tratamiento VARCHAR(10) NOT NULL UNIQUE    
);

CREATE TABLE TipoIncendio (
    idTipoIncendio INT PRIMARY KEY NOT NULL,
    tipoIncendio VARCHAR(15) NOT NULL UNIQUE    
);

CREATE TABLE ReporteIncendio (
    idReporteIncendio INT PRIMARY KEY NOT NULL,
    fechaHoraReporte DATETIME NOT NULL,
    tipoIncendio INT NOT NULL FOREIGN KEY REFERENCES TipoIncendio (idTipoIncendio),
    municipio INT NOT NULL FOREIGN KEY REFERENCES Municipio (idMunicipio),
    lugar TEXT NOT NULL,
    latitud DECIMAL(6,8),
    longitud DECIMAL(6,8),
    hectarias DECIMAL(6,2),
);


