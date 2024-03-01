--Entrar al sql local desde consola--
-- mysql -u root -p --

--VER LAS BASES DE DATOS QUE TENGO CREADAS-- 
SHOW DATABASES;

-- CREAR BASE DE DATOS--
CREATE DATABASE "NOMBRE DE LA BASE"

--USAR BASE DE DATOS--
USE "NOMBRE DE LA BASE"


--CREAR TABLA EN LA BASE DE DATOS --

CREATE TABLE coders(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(40) UNIQUE NOT NULL,
    email VARCHAR(50) UNIQUE NOT NULL
);

--COMANDO PARA VER LA LISTA DE TABLAS--
SHOW TABLES;

--DESCRIBIR TABLA O LO QUE TIENE DENTRO
DESC "NOMBRE DE LA TABLA"

--AGREGAR DATOS O REGISTROS

INSERT INTO "NombreTabla" (atributo1, atributo2, atributo3)VALUES (VALOR1, VALOR2)

INSERT INTO coders(nombre,email) 
VALUES ('Alejandro', 'Alejandromarulanda1645@gmail.com');

--LISTAR DATOS DE UNA TABLA O MOSTRARLOS--
SELECT * FROM "nombre de la tabla"
SELECT * FROM coders;

------------------------AGREGAR ----------------------------------------
--COMANDO PARA AGREGAR UNA TABLA UN NUEVO ATRIBUTO DESPUES DE QUE LA TABLA YA ESTA CREADA--
ALTER TABLE "nombreTabla" ADD COLUMN "nombre Atributo Nuevo"  + tipo de datos EJ: DATE;
ALTER TABLE coders ADD COLUMN fecha_nacimiento DATE;


--COMANDO PARA MODIFICAR EL TIPO DE DATO O RESTRICCIONES DE UN DATO YA CREADO--
ALTER TABLE coders MODIFY COLUMN "nombre del atributo" tipoDATO, NuevasReglas;
ALTER TABLE coders MODIFY COLUMN fecha_nacimiento DATE NOT NULL;

--ELiminar dato especifico--
DELETE FROM coders WHERE coders.id = 1;



-----------------------MODIFICAR--------------------------
--COMANDO PARA MODIFICAR EL NOMBRE DE UN ATRIBUTO O COLUMNA--
ALTER TABLE coders CHANGE COLUMN "nombre del atributo" nuevoNombre Tipo de dato Restricciones(opcional);
ALTER TABLE coders CHANGE COLUMN fecha_ingreso fecha_ingresar DATE NOT NULL; 


--…or create a new repository on the command line

echo "# ComandosSql" >> README.md
git init
git add README.md
git commit -m "first commit"
git branch -M main
git remote add origin https://github.com/Marulanda921/ComandosSql.git
git push -u origin main
--


or push an existing repository from the command line

git remote add origin https://github.com/Marulanda921/ComandosSql.git
git branch -M main
git push -u origin main






CREATE TABLE centros_educativos(
id INT PRIMARY KEY AUTO_INCREMENT,
nombre VARCHAR(40) NOT NULL,
direccion VARCHAR(40) NOT NULL UNIQUE
);


--CON LLAVE FORANEA QUE ES LA QUE LLEGA DE OTRA TABLA PADRE--
--CONSTRAIN ES EL NOMBRE DE LA RESTRICCION--

CREATE TABLE estudiantes(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(40) NOT NULL,
    apellido VARCHAR(40) NOT NULL,
    fecha_nacimiento DATE,
    id_centro_educativo INT,
--constrain siempre inicia con fk y forein key y el nombre del id dentro de la tabla, y reference de donde viene con su identificador--
    CONSTRAINT fk_centro_educativo FOREIGN KEY (id_centro_educativo) REFERENCES centros_educativos(id)
);



____________________________________________________--clase 2__________________________________________

CREATE TABLE conjunto (
nit_conjunto VARCHAR(11) PRIMARY KEY,
nombre VARCHAR(30) NOT NULL,
estrato INT NOT NULL
);

CREATE TABLE vigilantes(
ced_vigilante VARCHAR(10) PRIMARY KEY,
nombre VARCHAR(30) NOT NULL,
fecha_nac DATE,
#validar que este campo contenga un valores especifico
genero VARCHAR(4) CHECK(genero IN("M", "F", "Otro"))
);


CREATE TABLE edificios(
id_edificio INT PRIMARY KEY AUTO_INCREMENT,
#beetwen es un entre o un rango numero de pisos esta entre 5 a 8
nro_de_pisos INT CHECK(nro_de_pisos BETWEEN 5 AND 8),
ubicacion VARCHAR(40)
#al traer un id de otra tabla tiene que tener el mismo tamaño y tipo de dato
#id_conjuntos varchar(11),
#constraint fk_id_conjunto foreign key(id_conjunto)
#references conjunto(nit_conjunto)

);

#crear la columna
alter table edificios add column id_conjunto varchar(11);

#añadir restriccion
alter table edificios add constraint fk_id_conjunto foreign key(id_conjunto) references conjunto(nit_conjunto);

#alterar el nombre dentro de la tabla conjunto y verificar que el usuario no ingrese estos datos concretos
ALTER TABLE conjunto
MODIFY COLUMN nombre VARCHAR(40) NOT NULL CHECK(nombre IN("Santana", "Altos", "Montes"));

#eliminar tabla completa
drop table novedades;


#_______________________________________________________________________________________________________________________________#

CREATE TABLE novedades (
id int auto_increment primary key,
id_edificio int,
id_vigilante varchar(10),

constraint fk_id_edificio foreign key(id_edificio)
references edificios(id_edificio),

constraint fk_id_vigilante foreign key(id_vigilante)
references vigilantes(ced_vigilante)

);

create table apartamentos (
num_apartamento int primary key auto_increment,
piso int not null,
valor double check(valor between 10000 and 100000),
id_edificio int,
constraint fk_id_edificio2 foreign key(id_edificio)
references edificios(id_edificio)
);

alter table edificios add column sector varchar(30) check(sector in ("Piscina", "Alameda", "Cancha"));
#______DML____________________________________________________________________________________________________

#INSERTAR DATOS EN TABLAS
DESC conjunto;
INSERT INTO conjunto VALUES("1123456", "Alejandro", 3);
ALTER TABLE conjunto drop constraint conjunto_chk_1;
select * from conjuntos;

insert into edificios(nro_de_pisos,sector) values("6","Piscina");
select * from edificios;

insert into vigilantes values("1232123", "darcy", "22-03-1843","M");
select * from vigilantes;

use residencia


___DDL_________________________________________________

CREATE TABLE banco (
codigo INT UNIQUE PRIMARY KEY,
nombre VARCHAR(30) UNIQUE,
fecha_Fund DATE
);


CREATE TABLE sucursal(
codigo int primary key,
ubicacion varchar(35) not null,
ciudad varchar(35) not null,
telefono varchar(25)
);


CREATE TABLE vigilante (
	nombre varchar(35),
    nro_cedula varchar(10) primary key,
    telefono varchar(25),
    genero varchar(10),
    salario int
);

____________________--FULL DML SUBLENGUAJE PARA AFECTAR LA ESTRUCTURA DE LA BASE DE DATOS--________________________

#INNER JOIN unir tabla a y b y solo trae los registros que concidan en las 2 tablas
#Consultas de seleccion SQL
#JOIN PARA UNIR TABLAS DE UNA BASE

#INNER JOIN unir tabla a y b y solo trae los registros que concidan en las 2 tablas
#LEFT JOIN trae toda la tabla a y no importa si coincide con la tabla b 
#RIGHT JOIN no importa la tabla de la derecha solo la de la izquierda y no importa si coinciden los id
#FULL JOIN coge todas las tablas solo existe en posgres y sqlServer



#Seleccionar todos los datos de los clientes
SELECT * FROM cliente

#Seleccionar todos los médicos con la profesión Veterinario
SELECT * FROM medico WHERE med_profesion = "Veterinario"

#Obtener los medicamentos que tienen una m en su nombre el %m% significa que lo contenga en cuaquier parte
#%m si inicia con m
#si termina con m%
#si la contiene en cualquier parte %m%

SELECT * FROM medicamentos WHERE medicamentos.med_nombre LIKE '%m%';

#Obtener los medicamentos que tienen su valor entre 40 y 1000
SELECT * FROM medicamentos WHERE medicamentos.med_Valor BETWEEN 10 AND 15;

#Obtener solamente el nombre de los medicamentos cuya longitud este entre 1 y 10
#CHAR_LENGTH recibe la palabra que queremos contarle la longitud
#colocal alias para que escriba lo que quieres AS
SELECT medicamentos.med_nombre AS Medicamento FROM medicamentos WHERE CHAR_LENGTH(medicamentos.med_nombre) BETWEEN 1 AND 10;

#Contar el número total de mascotas registradas
#para contar COUNT(*)
SELECT COUNT(*) AS Mascotas FROM mascotas;

#Seleccionar los nombres únicos de las especializaciones
SELECT DISTINCT especializacion.esp_nombre AS Especialidad FROM especializacion;

#Listar los medicamentos ordenados por valor de forma descendente
SELECT * FROM medicamentos ORDER BY medicamentos.med_valor DESC;

#Seleccionar las citas programadas entre dos fechas 
#BETWEEN tambien recibe fechas para poder filtrar
SELECT * FROM citas WHERE citas.cit_fecha BETWEEN "2024-04-01" AND "2024-04-30";

#Obtener el nombre de la mascota y el nombre del cliente
SELECT mascotas.mas_nombre, cliente.cli_nombre FROM mascotas INNER JOIN cliente ON mascotas.cliente_cli_id = cliente.cli_id;
SELECT mascotas.mas_nombre, cliente.cli_nombre FROM mascotas, cliente WHERE mascotas.cliente_cli_id = cliente.cli_id;

#Listar todas las mascotas y sus historias clínicas, incluyendo las mascotas sin historias clínicas
#saber cual es la debil y la fuerte para hacer la conexion
SELECT mascotas.mas_nombre, historias_clinicas.his_descripcion FROM mascotas LEFT JOIN historias_clinicas ON historias_clinicas.his_id = mascotas.historias_clinicas_his_id;
SELECT mascotas.mas_nombre, historias_clinicas.his_descripcion FROM mascotas LEFT JOIN historias_clinicas ON mascotas.historias_clinicas_his_id = historias_clinicas.his_id;

#Calcular el costo total por cada tipo de servicio
#Usar SUM
SELECT  especializacion.esp_nombre AS Nombre_Servicio, CONCAT( "$" , SUM(servicio.ser_costo)) AS Precio_Total FROM servicio INNER JOIN especializacion ON especializacion.esp_id = servicio.especializacion_esp_id GROUP BY servicio.especializacion_esp_id;

#Obtener una lista de citas con un estado 'Pendiente' o 'Realizado' basado en el valor de cit_estado
#Casos en SQL CASE() como si fuera un Switch en javascript
SELECT citas.cit_fecha, CASE when citas.cit_estado = 0 then "Pendiente" when citas.cit_estado = 1 then "Realizado" END AS EstadoCita FROM citas;

#Obtener los nombres de las mascotas, el procedimiento del servicio que recibieron, y el nombre de su médico
SELECT citas.cit_fecha AS Fecha,  mascotas.mas_nombre AS NombreMascota, ser_procedimiento AS Procedimiento, medico.med_nombre AS Medico FROM citas INNER JOIN mascotas ON mascotas.mas_id = citas.mascotas_mas_id
INNER JOIN servicio ON servicio.ser_id = citas.servicio_ser_id INNER JOIN medico ON medico.med_id = citas.medico_med_id;