SELECT se utiliza cuando quieres leer (o seleccionar) tus datos.
INSERT se utiliza cuando quieres añadir (o insertar) nuevos datos.
UPDATE se utiliza cuando quieres cambiar (o actualizar) datos existentes.
DELETE se utiliza cuando quieres eliminar (o borrar) datos existentes.
REPLACE se utiliza cuando quieres añadir o cambiar (o reemplazar) datos nuevos o ya existentes.
TRUNCATE se utiliza cuando quieres vaciar (o borrar) todos los datos de la plantilla.

CREATE DATABASE se utiliza para crear una nueva base de datos vacía.
DROP DATABASE se utiliza para eliminar completamente una base de datos existente.
CREATE TABLE se utiliza para crear una nueva tabla, donde la información se almacena realmente.
ALTER TABLE se utiliza para modificar una tabla ya existente.
DROP TABLE se utiliza para eliminar por completo una tabla existente.

describe tabla; --explicar columnas de nuestra tabla
show full columns from tabla;--Te explica todo con detalle y comentarios
show warnings;
show databases;
use tabla;
show tables;
SELECT DATABASE();
DROP TABLE tabla


SELECT * from Tabla;

Con **** \G *****Los valores se muestran mejor

source C://ruta se importa una base de datos



/*SELECT */
SELECT ***columna de talbla*** from ***tabla***
Ejemplo SELECT name FROM clients
SELECT name, email, gender FROM clients
SELECT name, email, gender FROM clients LIMIT 10
SELECT name, email, gender FROM clients WHERE gender='M' 
SELECT YEAR(NOW()) - YEAR (BIRTHDATE) FROM clients limit 10;--TE DA LA EDAD ESTA OPERACION
SELECT name, email, YEAR(NOW()) - YEAR(birthdate) AS edad, gender --AS LE DA EL NOMBRE A LA COLUMNA
FROM clients
WHERE gender='F'
    AND name LIKE '%Lop%'; --LIKE SIRVE COMO CERCANIA DE TEXTOS

--TODAS TERMINAN CON **  ;  **


SELECT COUNT(*) from books
SELECT * FROM authors WHERE author_id >0 and author_id<=5
select * from books where author_id between 1 and 5
SELECT name * FROM authors WHERE author_id = 4

SELECT book_id, author_id, title from books where author_id BETWEEN 1 and 5


SELECT b.book_id, a.name, a.author_id, b.title
FROM books as b 
JOIN authors as a 
ON a.author_id = b.author_id
WHERE a.author_id BETWEEN 1 and 5;


/*3TABLAS JUNTAS*/
SELECT c.name, b.title, a.name, t.type
FROM transactions as t 
JOIN books as b 
ON t.book_id = b.book_id
JOIN clients as c 
ON t.client_id = c.client_id
JOIN authors as a 
ON b.author_id = a.author_id
WHERE c.gender ='F'
and t.type = 'sell'

t.type IN ('sell', 'lend') --CON ESTE TE TRAE VARIOS RESULTADOS



/* JOIN IMPLICITO*/
SELECT b.title, a.name
FROM authors as a, books as b 
WHERE b.author_id = a.author_id
LIMIT 10;

/*JOIN EXPLICITO*/

SELECT b.title, a.name 
from books as b 
INNER JOIN authors as a 
ON a.author_id = b.author_id
limit 10;

SELECT a.author_id, a.name, a.nationality, b.title
FROM authors AS a 
JOIN books as b 
on b.author_id = a.author_id
WHERE a.author_id BETWEEN 1 and 5
ORDER BY a.author_id;

/*ORDER BY SI  NO ESPECIFICAS LO HACE DE FORMA ASCENDENTE 
DE FORMA DESCENDENTE SE AGREGA DESC 
EJEMPLO
ORDER BY a.author_id DESC;*/


SELECT a.author_id, a.name, a.nationality, COUNT(b.book_id)
FROM authors AS a 
INNER  JOIN books as b 
on b.author_id = a.author_id
WHERE a.author_id BETWEEN 1 and 5
GROUP BY a.author_id
ORDER BY a.author_id;


Como aporte.
ALTER es a las columnas lo que UPDATE es a las filas
DROP es a las columnas lo que DELETE es a las filas

Y la siguiente canción para nunca olvidar poner el WHERE en el DELETE FROM.

UPDATE authors
SET nationality = "GBR"
WHERE nationality = "ENG";

SELECT nationality, COUNT(book_id),
  SUM(IF(year < 1950, 1, 0)) AS"<1950",
  SUM(IF(year >= 1950 and year < 1990, 1, 0)) AS"<1990",
  SUM(IF(year >= 1990 and year < 2000, 1, 0)) AS"<2000",
  SUM(IF(year >= 2000, 1, 0)) AS"<hoy"
FROM books AS b
JOIN authors AS a
ON a.author_id = b.author_id
WHERE a.nationality IS NOT NULL
GROUP BY nationality;

SELECT nationality, COUNT(book_id),
  SUM(IF(year < 1950, 1, 0)) AS"<1950",
  SUM(IF(year >= 1950 and year < 1990, 1, 0)) AS"<1990",
  SUM(IF(year >= 1990 and year < 2000, 1, 0)) AS"<2000",
  SUM(IF(year >= 2000, 1, 0)) AS"<hoy"
FROM books AS b
JOIN authors AS a
ON a.author_id = b.author_id
WHERE a.nationality IS NOT NULL
GROUP BY nationality;

/*RESPALDAR*/
mysqldump -u user -p database_name esquema.sql -- guarda el esquema de una base de datos con todo y datos en un
archivo sql.
mysqldump -u user -p -d database_name --es parecido al comando anterior solo que aquí no se guardan los datos.