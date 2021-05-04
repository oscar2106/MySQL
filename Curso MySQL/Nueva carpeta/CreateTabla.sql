CREATE TABLE IF NOT EXISTS books(
	book_id INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    author_id INTEGER UNSIGNED, 
    title VARCHAR(100) NOT NULL , 
    year INTEGER UNSIGNED NOT NULL DEFAULT 1900, 
    lenguage VARCHAR (2)NOT NULL DEFAULT 'es' COMMENT 'ISO 639-1 Lenguage', 
    cover_url VARCHAR (500), 
    price DOUBLE (6,2) NOT NULL DEFAULT 10.0 , 
    sellable TINYINT (1) DEFAULT 1, 
    copies INTEGER NOT NULL DEFAULT 1, 
    description TEXT 
); 

/*En la linea 8 el 6 son numeros enteros y el 2 el numero de decimales*/

CREATE TABLE IF NOT EXISTS authors (
    author_id INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR (100) NOT NULL ,
    nationality VARCHAR (3)
);

CREATE TABLE clients (
    client_id INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR (50) NOT NULL, 
    email VARCHAR (100) NOT NULL UNIQUE,
    birthdate DATETIME,
    gender ENUM('M', 'F', 'ND') NOT NULL, 
    active TINYINT (1) NOT NULL DEFAULT 1,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP 
);

CREATE TABLE IF NOT EXISTS operations(
    operation_id INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    book_id INTEGER UNSIGNED ,
    client_id INTEGER UNSIGNED ,
    `type` ENUM('B', 'R', 'S')NOT NULL COMMENT 'Borrowed, Returned, Sold',
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP  ON UPDATE CURRENT_TIMESTAMP,
    finished TINYINT (1) NOT NULL 
);