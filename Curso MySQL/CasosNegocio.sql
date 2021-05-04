/*1.Que nacionalidades hay
    2.Cuantos escritores de cada nacionalidad
    3.Cuantos libros hay de cada nacionalidad
    4.Cual es el promedio7desviacion standar del precio de libros
    5.idem, pero por nacionalidad
    6.Cual es el precio maximo/minimo de un libro
    7.Como quedaria el reporte de prestamos */


   --CASO 1

   SELECT nationality FROM authors
   GROUP BY nationality;

   --CASO 2 y 3
      SELECT nationality, COUNT(author_id) AS c_authors
      from authors
      WHERE nationality IS NOT NULL 
      AND nationality NOT IN ('RUS', 'AUT')
      GROUP BY nationality
      ORDER BY c_authors DESC, nationality ASC;
      --ASC SIGNIFICA ASCENDENTE
      --Ejemplo de como no mostrar un dato Y SI QUITA EL NOT SOLO SALEN LOS DATOS DEL PARENTESIS

    --CASO 4 y 5
    SELECT title, price from books ORDER BY price asc LIMIT 10;
    SELECT nationality, count(book_id) AS libros,
    AVG(price) AS prom, 
    STDDEV(price) AS std
    FROM books AS b 
    JOIN authors as a 
    ON a.author_id = b.author_id
    GROUP BY nationality
    ORDER BY libros DESC;

    --CASO 6
    SELECT nationality,
    MAX(price), MIN(price) 
    FROM books as b 
    JOIN authors AS a 
    ON a.author_id = b.author_id
    GROUP BY nationality;

    --CASO 7
    SELECT c.name, t.type, b.title,
    CONCAT (a.name, " (", a.nationality, ")") AS autor,
    TO_DAYS(NOW()) - TO_DAYS(t.created_at) AS ago
    FROM transactions AS t
    LEFT JOIN clients AS c
    ON c.client_id = t.client_id
    LEFT JOIN books AS b
    ON b.book_id = t.book_id
    LEFT JOIN authors AS a
    ON b.author_id = a.author_id;