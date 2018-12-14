use EDUCATIVO
CREATE TABLE Estudiante
(
Matricula CHAR(10) NOT NULL,
Nombre	VARCHAR(40) NOT NULL,
Apellido VARCHAR(40) NOT NULL,
Estado CHAR(10) NOT NULL,
Foto VARBINARY(100),
FecNac DATE NOT NULL,
FecIng SMALLDATETIME NOT NULL,
TipoIdentifacion CHAR(3) NOT NULL,
Identificacion VARCHAR(16) NOT NULL,
Genero CHAR(1)
)
GO


create table periodo(
codigo char(6) not null,
nombre varchar(40) not null,
fechaini date not null,
fechafin date not null,
constraint pk_periodo primary key (codigo)
)

create table seccion(
seccionid char(6) not null,
CodAsignatura char(6) not null,
profesor varchar(11) not null,
limite int not null,
constraint pk_seccionid primary key (seccionid)
)

alter table seccion 

create table Horario(
seccionid int not null,
dia tinyint not null,
horaini smallint not null,
horafin smallint not null,
canthora as horafin - horaini 
CONSTRAINT pk_horarioid primary key (seccionid, dia)
)


create table IncripcionEst
(
matricula smallint not null,
fecha date not null,
CodPeriodo smallint not null,
constraint pk_InscripcionEst primary key (matricula, Codperiodo)
)

ALTER TABLE IncripcionEst
ADD CONSTRAINT DFT_fecha
DEFAULT  getdate () fOR fecha 

create table seccionEst(
matricula smallint not null,
CodPeriodo smallint not null,
seccionid smallint not null,
calificacion smallint,
constraint pk_seecionid primary key (seccionid)
)
alter table horario 
add constraint pk_seccion primary key (seccionid, dia)

ALTER TABLE horario
ADD CONSTRAINT DFT_horario_FecIni
DEFAULT  datepart(mi,n) FOR horaini 

create table asignatura(
codigo char(6) not null,
nombre varchar(40) not null,
programa varchar(40)
)

alter table asignatura 
add constraint pk_asiganatura primary key (codigo)
ALTER TABLE Estudiante
ADD CONSTRAINT PK_Estudiante PRIMARY KEY (Matricula)

CREATE TABLE ContactoEst
(
Matricula CHAR(10) NOT NULL,
Tipo VARCHAR(10) NOT NULL,
DatosContacto VARCHAR(40) NOT NULL
)

ALTER TABLE ContactoEst
ADD CONSTRAINT PK_ContactoEst PRIMARY KEY (Matricula, DatosContacto)


ALTER TABLE Estudiante
ADD CONSTRAINT UC_Estudiante UNIQUE (Identificacion)

ALTER TABLE ContactoEst
ADD CONSTRAINT FK_Contacto_Estudiante 
FOREIGN KEY (Matricula) REFERENCES Estudiante (Matricula)


ALTER TABLE Estudiante WITH NOCHECK
ADD CONSTRAINT CK_Estudiante_Estado 
CHECK (Estado IN ('INSCRITO', 'SUSPENDIDO', 'RETIRADO' ) )

ALTER TABLE Estudiante WITH NOCHECK
ADD CONSTRAINT CK_Estudiante_TipoIdenti
CHECK (TipoIdentifacion IN ('CED', 'PAS') )

ALTER TABLE Estudiante WITH NOCHECK
ADD CONSTRAINT CK_Estudiante_Genero
CHECK (Genero IN ('M', 'F') )

ALTER TABLE Estudiante 
ADD CONSTRAINT DF_Estudiante_Estado
DEFAULT 'INSCRITO' FOR Estado

ALTER TABLE Estudiante 
ADD CONSTRAINT DF_Estudiante_FecIng
DEFAULT  GETDATE() FOR FecIng






