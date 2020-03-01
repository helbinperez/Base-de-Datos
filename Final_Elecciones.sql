create database Final_Eleccion
use Final_Eleccion

--Tabla Administrador
create table administrador
(
Id_administrador int IDENTITY,
Usuario varchar(50),
Passwor int,
CONSTRAINT PK_ADMINISTRADOR PRIMARY KEY(Id_administrador) 
)

--Tabla Elecciones
create table Elecciones
(
Id_eleccion int IDENTITY,
Nombre varchar(50),
Fecha_Realizada date,
Estado bit,
CONSTRAINT PK_ID_ELECCIONES PRIMARY KEY (Id_eleccion)
)


--Tabla Partido
create table Partidos
(
Id_partido int IDENTITY,
Nombre varchar(50),
Descripcion varchar(100),
Logo image,
Estado bit,
Elecciones_id int,
CONSTRAINT PK_ID_PATRTIDO PRIMARY KEY (Id_partido),
CONSTRAINT FK_PARTIDOS_ELECCIONES FOREIGN KEY (Elecciones_id) references Elecciones(Id_eleccion)
)

--Tabla Puesto_Electivo
create table Puesto_Electivo
(
Id_puesto int IDENTITY,
Nombre varchar(50),
Descripcion varchar(150),
Estado bit,
PartidoPues_id int
CONSTRAINT PK_ID_PUESTO PRIMARY KEY (Id_puesto),
CONSTRAINT FK_PUESTO_ELECTIVO_PARTIDO FOREIGN KEY (PartidoPues_id) references Partidos(Id_partido) 
)

--Tabla Candidatos
create table Candidatos
(
Id_candidato int IDENTITY,
Nombre varchar(50),
Apellido varchar(50),
PartidoCan_id int,
PuestoCan_id int,
Foto image, 
Estado bit,
CONSTRAINT PK_ID_CANDIDATOS PRIMARY KEY (Id_candidato),
CONSTRAINT FK_CANDIDATO_PARTIDO FOREIGN KEY(PartidoCan_id) references Partidos(Id_partido),
CONSTRAINT FK_CANDIDATOS_PUESTO FOREIGN KEY(PuestoCan_id) references Puesto_Electivo(Id_puesto)
)

--Tabla ciudadano
create table Ciudadanos
(
Id_ciudadano int IDENTITY,
Nombre varchar(50),
Apellido varchar(50),
Email varchar(50),
Estado bit,
PartidoCiu_id int
CONSTRAINT PK_ID_CIUDADANO PRIMARY KEY(Id_ciudadano),
CONSTRAINT FK_CIUDADANOS_PARTIDO FOREIGN KEY(PartidoCiu_id) references Partidos(Id_partido)
)

create table Votos
(
Id_ciudadano_voto int,
Id_candidato_voto int,
CONSTRAINT PK_CIUDADANO_VOTO PRIMARY KEY (Id_ciudadano_voto, Id_candidato_voto),
CONSTRAINT FK_VOTOS FOREIGN KEY (Id_ciudadano_voto) references Ciudadanos(Id_ciudadano),
CONSTRAINT FK_CANDIDATO_VOTOS FOREIGN KEY (Id_candidato_voto) references Candidatos(Id_candidato) 
)
