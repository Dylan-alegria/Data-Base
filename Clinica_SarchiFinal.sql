CREATE DATABASE Clinica;
use Clinica;
--Creacion de la TABLA Medico
CREATE TABLE Medico(
idmedico  int PRIMARY KEY,
nombreMd  varchar  (30),
apellidoMd varchar (30),
correoelectronicoMd varchar (45),
especialidadMd varchar (35),
telefonoMd int,
direccionMd varchar (60),
cargoMd varchar (30),
turnoMd varchar (30),
salarioMd int 
);

insert into medico (idmedico, nombremd,apellidomd,correoelectronicomd , especialidadMd ,telefonomd ,direccionMd,cargomd, turnomd,salarioMd)
values (189230200,'grettel  ','salazar rios','gsalazarr@clinicasarchi.cr','cardiologa',88728239,'Centro de sarchi ', 'gerente','Dia ','2000000'),
(129334000,'Mattias   ','figueres alvarado','mfigueresa@clinicasarchi.cr','emergencias',87228240,'Sur de sarchi 500 mts de la iglesia  ', 'medico ','noche ','800000') ,
(744666082,'Sebastian','martinez mora','smartinezm@clinicasarchi.cr','urologia ',79002292,'norte de sarchi a las par de la puperia dos pinos  ', 'medico ','Dia ','1200000')
select* from Medico
---------//////////////--------------///////////////////////------------//////////////--------------////////////////-------------------
--creacion de tabla de plantas 
create table plantas (
idplanta  int PRIMARY KEY not null,
descripcion_plantas varchar(50) ,---listo
observacionesplantas  varchar (100),
);

insert into plantas(idplanta,descripcion_plantas,observacionesplantas)
values (12,'planta de odontologia ','necesita mas equipamento'),(1,'planta de emergencia','necesita seguridad'),
(9,'planta de cardiologia ','no hay observaciones ')
select* from plantas
---------//////////////--------------///////////////////////------------//////////////--------------////////////////-------------------

--Creacion de TABLA Habitaciones 
CREATE TABLE Habitaciones( 
idhabitacion int PRIMARY KEY not null,
descripcionHB varchar (100),
idplanta int not null,
disponibilidad varchar (20)
FOREIGN KEY (idplanta) REFERENCES plantas(idplanta)

);
insert into Habitaciones (idhabitacion,descripcionHB,idplanta,disponibilidad  )
values (12,'habitacion de cardiologia ',9 , 'D'),(11,'habitacion de cardiologia ',9,'D'),(2,'habitacion de urologia ',1 ,'D' );
select * from Habitaciones
---------//////////////--------------///////////////////////------------//////////////--------------////////////////-------------------

--Creacion de Tabla Pacientes
CREATE TABLE Pacientes(
idpaciente int PRIMARY KEY not null,
idhabitacion int not null,
idmedico int not null,
idhistoria int not null,--se añade por constraint
nombrePc varchar (30),
apellidoPc varchar (30),
direccionPc varchar (50),
mailPc varchar (45),
provinciaPc varchar (30),
telefonoPc int,
observacionesPc varchar (45),
numero_seguroPc varchar(10),
FOREIGN KEY (idhabitacion) REFERENCES Habitaciones(idhabitacion),
FOREIGN KEY (idmedico) REFERENCES Medico(idmedico)
);

insert into Pacientes(idpaciente,idhabitacion, idmedico,idhistoria, nombrepc,apellidoPc,direccionPc,mailpc,provinciaPc,telefonoPc,observacionesPc,numero_seguroPc)
values (555594040,12,189230200,97,'javier' , 'fonseca', 'sarchi norte 600 mts sur de correos de costa rica ','javierf@gmail.com','alajuela ',64889309,'Cita de rutina ', 133363323 ),
(123423234,11,189230200,98,'andres','quiros','sarchi 200mts este  del pollolandia de sarchi','andresq@hotmail.com','alajuela ',88954323,'Cita de emergencia ',123232315),
(2113149121,2,129334000,120,'lauren','snyder',' 300 oeste del parque de limon ','laurens@hotmail.com','limon ',84955319,'se quebro una brazo ',111541599   )
select * from Pacientes

---------//////////////--------------///////////////////////------------//////////////--------------////////////////-------------------
--Creacion de TABLA Historias
CREATE TABLE Historia(
idhistoria int PRIMARY KEY not null,
FechaingresoH date  ,
Fecha_de_altaH date ,
numero_de_seguroH int,---listo
DescripcionH varchar (100),
codRV int,
idpaciente int not null,
FOREIGN KEY (idpaciente) REFERENCES Pacientes(idpaciente)
);


insert into Historia (idhistoria,FechaingresoH,Fecha_de_altaH,numero_de_seguroH,DescripcionH,codRV,idpaciente)
values(97,'3/3/2022','3/4/2021',133363323,'paciente llego por cita de rutina y se quedo por problemas del corazon',900,'555594040' ),
(98,'5/5/2021','5/7/2021',123232315,'paciente llego por cita de emergecia  y se quedo por problemas del corazon',100,'123423234' ),
(120,'9/9/2021','10/7/2021',111541599,'paciente llego de  emergecia por quebradura de brazo ',200,'2113149121' )
select * from Historia

---------//////////////--------------///////////////////////------------//////////////--------------////////////////-------------------



--Creacion de TABLA Citas
CREATE TABLE citas(
idcita int PRIMARY KEY not null,
FachaCt DATE NOT NULL,
observacionesct varchar (25),----listo
idpaciente int not null,
FOREIGN KEY (idpaciente) REFERENCES Pacientes(idpaciente)
);

insert into citas(idcita,fachact,observacionesct,idpaciente)
values (22, '2/2/2022', 'revision en urologia ','2113149121'),(12, '1/3/2022', 'revision en cardiologia  ','555594040'),
(45, '5/5/2022', 'revision en urologia ','123423234')
select * from citas
---------//////////////--------------///////////////////////------------//////////////--------------////////////////-------------------

--Creacion de TABLA Facturas
CREATE TABLE Facturas(
idfacturas int PRIMARY KEY not null,
idpaciente int not null,
Fechafac date ,--listo
precio float (12),
Detallefac varchar (100),

FOREIGN KEY (idpaciente) REFERENCES Pacientes(idpaciente)
);


insert into Facturas(idfacturas,idpaciente,Fechafac,precio,Detallefac)
values(1,'555594040','3/4/2021',900000,'factura de la estadia en la clinica sarchi'),
(2,'123423234','5/7/2021',100000,'factura de la estadia en la clinica sarchi'),(3,'2113149121','10/7/2021',200000,'factura de la estadia en la clinica sarchi')
select * from Facturas
---------//////////////--------------///////////////////////------------//////////////--------------////////////////-------------------
--Creacion de tabla empleados
create table empleados(
idempleado int PRIMARY KEY not null,
nombreem varchar (20),
apellidoem varchar (20),
mailem varchar (30), ----listo
cargoem varchar (30),
telefonoem int ,
direccionem varchar (100),
provinciaem varchar (30),
salarioemp varchar (20),
);
insert into empleados(idempleado,nombreem,apellidoem,mailem,cargoem,telefonoem,direccionem,provinciaem,salarioemp)
values(344244242,'jennifer ', 'estrada', 'jestrada@clinicasarchi.com','Enfermera ',87888545,'Apartamentos nueva esperanza en sarchi ','Limon', '700000' ),
(455455455,'alejandra  ', 'balvin', 'abalvin@clinicasarchi.com','conductora de ambulancia  ',88866533,' a la par de pollolandia sarchi ','Alajuela', '600000' ),
(134344209,'emmanuel ', 'simsomp', 'esimsomp@clinicasarchi.com','Dentista ',77668922,'500mts sur de la escuela de sarchi  ','San Jose', '450000' )

---------//////////////--------------///////////////////////------------//////////////--------------////////////////-------------------
--Creacion de tabla ambulancias  
create table ambulancias(
idambulancia int PRIMARY KEY,
idempleado int not null,
placaamb varchar (12),----listo
disponibilidad varchar (12),
FOREIGN KEY (idempleado) REFERENCES empleados(idempleado)
);
insert into ambulancias(idambulancia,idempleado,placaamb,disponibilidad)
values(992,344244242,'vas992','o'),(999,455455455,'emr999','d'),(656,134344209,'lkg656','d');

select * from ambulancias
---------//////////////--------------///////////////////////------------//////////////--------------////////////////-------------------



--creacion de tabla implementos y equipos
create table implementos_equipos (
idimplementos int PRIMARY KEY not null,
idplanta int not null,
nombreie varchar (30),--listo
habitacion varchar (30),
costoie varchar (30),
descripcionie varchar (100),
FOREIGN KEY (idplanta) REFERENCES plantas(idplanta)
);
insert into implementos_equipos(idimplementos,idplanta,nombreie,habitacion,costoie, descripcionie)
values(1,9,'electrocardiograma','9','1900000','producto comprado 1 de diciembre del 2021'),
(2,9,'monitores holter ','29','2000000','equipo viejo '),(3,9,'monitores holter ','9','4000000','producto comprado 1 de diciembre del 2021')

---------//////////////--------------///////////////////////------------//////////////--------------////////////////-------------------

--creacion de tabla de contabilidad
create table contabilidad (
idcontabilidad   int PRIMARY KEY not null,
idplanta  int not null,
numCuenta int ,
descripcionC varchar (100),
FOREIGN KEY (idplanta) REFERENCES Plantas(idplanta)
);
insert into contabilidad(idcontabilidad,idplanta,numCuenta,descripcionC)
values(1,9,123456789,'gasto de nuevo  equipo para cardiologos electrocardiograma'),(2,9,123456789,'gasto de nuevo  equipo para cardiologos monitores holter'),
(3,9,123456789,'gasto de reparacion de un equipo viejo en cardiologia ')

---------//////////////--------------///////////////////////------------//////////////--------------////////////////-------------------

--creacion de tabla centro de llamadas 
create table Centro_llamadas (
idcubicolo int PRIMARY KEY not null,
numeros_empleados int ,
numeros_telefonos int ,
numero_computadores int ,
);
insert into Centro_llamadas(idcubicolo,numero_computadores,numeros_empleados,numeros_telefonos)
values(1,2,2,3),(2,3,3,3),(3,2,2,3)

---------------- se creo disponibilidad en la tbla habitaciones 
------------------------------------------------vistas-------------------------------
Create view ambulanciasD as select * from ambulancias where disponibilidad = 'D'; 

Create view HabitacionesD as select * from Habitaciones  where  disponibilidad = 'D';

Create view Vwfacturas as select * from facturas;

select * from  ambulanciasD
select * from Vwfacturas
alter table Pacientes add CONSTRAINT FK_idfact FOREIGN KEY (idhistoria) REFERENCES Historia;--se añade la FK de id historia a esta tabla ya que no pudo ser aregada anteriormente por el orden de creacion de las mismas.

--CHECKS--
--Solo se permite la letra "o" de ocupado o la letra d de disponible en el campo disponibilidad de la tabla ambulancias
ALTER TABLE ambulancias
 ADD CONSTRAINT ck_Ambulancias_disponibles
 CHECK (disponibilidad ='d' OR disponibilidad='o');

 --En la tabla medico en el campo turnoMd solo se permite la palabra dia o noche
 ALTER TABLE medico 
 ADD CONSTRAINT ck_turnoMd
 CHECK (turnoMd IN ('dia', 'noche')) ;

 --En la tabla empleados solo se permiten salarios menores a cero, asi se evita que por cualquier situacion se ponga algun salario en negativo por alguna razon 
 ALTER TABLE empleados ADD CONSTRAINT ck_salarioemp
 CHECK (salarioemp > 0) ;

 --En la tabla habitaciones solo se permite la letra "o" y la letra "d".
 ALTER TABLE Habitaciones
 ADD CONSTRAINT ck_Habitaciones_Disponibles
 CHECK (disponibilidad ='D' OR disponibilidad='O');

---Consultas---
--Estos *select* son para tener a mano las tablas de la base de datos para realizar las consultas--
select * from ambulancias
select * from centro_llamadas
select * from citas
select * from contabilidad
select * from empleados
select * from facturas
select * from habitaciones
select * from historia
select * from implementos_equipos
select * from medico
select * from pacientes
select * from plantas

--¿	Cuantas personas han venido a la Clínica mas de tres meses?
select b.idpaciente,nombrePC,DATEDIFF(day,FechaingresoH,Fecha_de_altaH) AS 'Dias' from Historia b, Pacientes a where  DATEDIFF(day, FechaingresoH,Fecha_de_altaH) > 90 and a.idpaciente = b.idpaciente

--¿Cuantos doctores ganan mas de 900000?--
select count(Distinct nombreMd) as 'Salarios de mas de 900000' from medico where salarioMd > 900000

--¿Cuantos empleados trabajan en el centro de llamadas?--
select  sum(numeros_empleados) as 'Empleados en Centro de Llamadas' from Centro_llamadas


--¿Cuantos Pacientes son de Sanjose?--
select count(Distinct nombrePc) as 'Pacientes de San Jose' from Pacientes where provinciaPc = 'San Jose'


--¿Cuantos empleados son dentistas?--
select count(Distinct nombreem) as 'Dentistas' from empleados where cargoem = 'Dentistas'


--¿Cuantas ambulacias disponibles hay?--
select count(Distinct idambulancia) as 'Disponibles' from ambulancias where disponibilidad = 'd'

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-------------------------------Procedimientos almacenados----------------------
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
create procedure SP_pacientes
  @Medico varchar(30),
  @paciente varchar(20) 
 as
  select Pacientes.nombrePc,Pacientes.observacionesPc , Medico.nombreMd
   from Pacientes INNER JOIN Medico
   on Medico.nombreMd= @Medico and Pacientes.nombrePc=@paciente;
  
  exec SP_pacientes;--se ejecuta este procedimiento almacenado para saber sobre el paciente el medico que lo atendió y sus observaciones.

--______________________________________________________________________________________

create procedure SP_facturas
	@idfacturas int	
	as 
  select Facturas.idpaciente,Facturas.Fechafac, Facturas.precio
   from Facturas where Facturas.idfacturas= @idfacturas;
go 
exec SP_facturas '555594040';---se consulta el idfactura deseado
go

--_______________________________________________________________________________________
-----------------------------------------------------------------------------------------
-----------------------------------TRIGGERS----------------------------------------------
-----------------------------------------------------------------------------------------
--_______________________________________________________________________________________

create trigger dis_pacientes_borrar
  on Pacientes
  for delete
 as
  if (select count(*) from deleted)>1
  begin
    raiserror('No puede eliminar más de un 1 Paciente', 16, 1)
    rollback transaction
  end;
  --Este trigger no permite que se eliminen 2 pacientes a la vez
