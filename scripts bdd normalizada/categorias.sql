
-- CREACIÓN BASE DE DATOS FIREBIRD --
CREATE DATABASE 'hospitales.fdb' USER '' PASSWORD '';

CONNECT 'hospitales.fdb' USER '' PASSWORD '';


CREATE TABLE Mes (
    idMes INT PRIMARY KEY NOT NULL,
    mes VARCHAR(10) NOT NULL UNIQUE
);

CREATE TABLE Sexo (
    idSexo INT PRIMARY KEY NOT NULL,
    sexo VARCHAR(10) NOT NULL UNIQUE
);


CREATE TABLE Departamento (
    idDepartamento VARCHAR(2) PRIMARY KEY NOT NULL,
    departamento VARCHAR(15) NOT NULL UNIQUE    
);

CREATE TABLE Municipio (
    idMunicipio VARCHAR(4) PRIMARY KEY NOT NULL,
    municipio VARCHAR(30) NOT NULL UNIQUE,
    idDepartamento VARCHAR(2) NOT NULL,
    FOREIGN KEY (idDepartamento) REFERENCES Departamento(idDepartamento)
);

CREATE TABLE TipoConsulta (
    idTipoConsulta INT PRIMARY KEY NOT NULL,
    tipoConsulta VARCHAR(30) NOT NULL UNIQUE    
);

CREATE TABLE CausaAtencion (
    codigoCIE VARCHAR(5) PRIMARY KEY NOT NULL,
    descripcion VARCHAR(250) NOT NULL UNIQUE    
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
    fechaReporte DATE NOT NULL,
    horaReporte TIME,
    idTipoIncendio INT NOT NULL,
    idMunicipio VARCHAR(4) NOT NULL,
    lugar VARCHAR(150),
    latitud DECIMAL(14,8),
    longitud DECIMAL(14,8),
    hectarias DECIMAL(8,2),
    FOREIGN KEY (idTipoIncendio) REFERENCES TipoIncendio (idTipoIncendio),
    FOREIGN KEY (idMunicipio) REFERENCES Municipio (idMunicipio)
);

CREATE TABLE TipoServicios (
    idTipoServicios INT PRIMARY KEY NOT NULL,
    TipoServicios VARCHAR(20) NOT NULL UNIQUE
);

CREATE TABLE AtencionPorRangoEdad (
    idAtencionPorRangoEdad INT PRIMARY KEY NOT NULL,
    limInfRango INT NOT NULL,
    limSupRango INT NOT NULL,
    codigoCIE VARCHAR(5) NOT NULL REFERENCES CausaAtencion (codigoCIE),
    idSexo INT NOT NULL REFERENCES Sexo (idSexo),
    idTipoServicios INT NOT NULL REFERENCES TipoServicios (idTipoServicios),
    total INT
);

CREATE TABLE AtencionPorDepartamento (
    idAtencionPorDepartamento INT PRIMARY KEY NOT NULL,
    departamento VARCHAR(2) NOT NULL REFERENCES Departamento (idDepartamento),
    codigoCIE VARCHAR(5) NOT NULL REFERENCES CausaAtencion (codigoCIE),
    idSexo INT NOT NULL REFERENCES Sexo (idSexo),
    idTipoServicios INT NOT NULL REFERENCES TipoServicios (idTipoServicios),
    total INT
);

CREATE TABLE AtencionPorTipoConsulta (
    idAtencionPorTipoConsulta INT PRIMARY KEY NOT NULL,
    limInfRango INT NOT NULL,
    limSupRango INT NOT NULL,
    idSexo INT NOT NULL REFERENCES Sexo (idSexo),
    tipoConsulta INT NOT NULL REFERENCES TipoServicios (idTipoServicios),
    total INT
);
 

CREATE TABLE CondicionEgresoSegunSexo (
    idCondicionEgresoSegunSexo INT PRIMARY KEY NOT NULL,
    idSexo INT NOT NULL REFERENCES Sexo (idSexo),
    idCondicionEgreso INT NOT NULL REFERENCES CondicionEgreso (idCondicionEgreso),
    total INT
);


CREATE TABLE TratamientoServiciosInternos (
    idTratamientoServiciosInternos INT PRIMARY KEY NOT NULL,
    idSexo INT NOT NULL REFERENCES Sexo (idSexo),
    idTratamiento INT NOT NULL REFERENCES Tratamiento (idTratamiento),
    total INT
);

CREATE TABLE PromedioEstanciaEgresados (
    idPromedioEstanciaEgresados INT PRIMARY KEY NOT NULL,
    idDepartamento VARCHAR(2) NOT NULL REFERENCES Departamento (idDepartamento),
    totalEgresados INT NOT NULL,
    promedioEstancia DECIMAL(4,2) NOT NULL
);



/* CREATE TABLE PuebloPertenencia (
    idPueblo INT PRIMARY KEY NOT NULL,
    nombrePueblo VARCHAR(10) NOT NULL UNIQUE
); */

-------Edad?
/* CREATE TABLE Edad (
    idEdad INT PRIMARY KEY NOT NULL,
    edad VARCHAR(10) NOT NULL
); */

/* CREATE TABLE PeriodoEdad (
    idPeriodo INT PRIMARY KEY NOT NULL,
    periodo VARCHAR(20) NOT NULL UNIQUE
); */

------ Dias estancia?
/* CREATE TABLE DiasEstancia (
    idDiasEstancia INT PRIMARY KEY NOT NULL,
    diasEstancia VARCHAR(10) NOT NULL UNIQUE    
); */



