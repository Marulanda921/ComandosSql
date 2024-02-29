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
#__________________________________________________________________________________________________________

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


____________________________________________________

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