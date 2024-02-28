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