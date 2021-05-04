El laberinto de la soledad, Octavio Paz, 1952
Vuelta al laberinto de la soledad, Octavio Paz, 1960

INSERT INTO books(title, author_id) VALUES ('El laberinto de la soledad', 6);

INSERT INTO books(title, author_id, `year`)
VALUES ('Vuelta al laberinto de la soledad',
(SELECT author_id FROM authors WHERE name = 'Octavio Paz'
LIMIT 1), 1960);

