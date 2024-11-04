-- Configurar el juego de caracteres
SET NAMES 'utf8mb4';
SET CHARACTER SET 'utf8mb4';
SET character_set_connection = 'utf8mb4';

-- Crear base de datos
CREATE DATABASE IF NOT EXISTS superheroes_db CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci;

-- Usar la base de datos
USE superheroes_db;

-- Tabla: Compañías
CREATE TABLE IF NOT EXISTS Compañías (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    compañia VARCHAR(100) UNIQUE NOT NULL,
    año_creacion YEAR NOT NULL
) ENGINE=InnoDB;

-- Tabla: Niveles de Poder
CREATE TABLE IF NOT EXISTS Niveles_de_Poder (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    tipo VARCHAR(50) UNIQUE NOT NULL
) ENGINE=InnoDB;

-- Tabla: Superpoderes
CREATE TABLE IF NOT EXISTS Superpoderes (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    descripcion VARCHAR(255) NOT NULL
) ENGINE=InnoDB;

-- Tabla: Superhéroes
CREATE TABLE IF NOT EXISTS Superhéroes (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    ciudad VARCHAR(100) NOT NULL,
    id_niveles INT UNSIGNED NOT NULL,
    id_compañias INT UNSIGNED NOT NULL,
    FOREIGN KEY (id_niveles) REFERENCES Niveles_de_Poder(id),
    FOREIGN KEY (id_compañias) REFERENCES Compañías(id)
) ENGINE=InnoDB;

-- Tabla: Superhéroes-Superpoderes-Nivel
CREATE TABLE IF NOT EXISTS Superhéroes_Superpoderes_Nivel (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    id_superheroe INT UNSIGNED NOT NULL,
    id_superpoderes INT UNSIGNED NOT NULL,
    id_nivel INT UNSIGNED NOT NULL,
    FOREIGN KEY (id_superheroe) REFERENCES Superhéroes(id),
    FOREIGN KEY (id_superpoderes) REFERENCES Superpoderes(id),
    FOREIGN KEY (id_nivel) REFERENCES Niveles_de_Poder(id)
) ENGINE=InnoDB;

-- Insertar datos de ejemplo en Compañías
INSERT INTO Compañías (compañia, año_creacion) VALUES
('Marvel', 1939),
('DC', 1934);

-- Insertar datos de ejemplo en Niveles de Poder
INSERT INTO Niveles_de_Poder (tipo) VALUES
('BAJO'),
('MEDIO'),
('ALTO');

-- Insertar datos de ejemplo en Superpoderes
INSERT INTO Superpoderes (descripcion) VALUES
('Vuelo'),
('Super Fuerza'),
('Invisibilidad'),
('Telepatía'),
('Control de Elementos'),
('Regeneración'),
('Super Velocidad'),
('Telequinesis'),
('Fuerza sobrehumana'),
('Manipulación del Tiempo');

-- Insertar datos de ejemplo en Superhéroes
INSERT INTO Superhéroes (nombre, ciudad, id_niveles, id_compañias) VALUES
('Spider-Man', 'Nueva York', 2, 1),
('Thor', 'Asgard', 3, 1),
('Iron Man', 'Malibu', 3, 1),
('Batman', 'Gotham City', 2, 2),
('Wonder Woman', 'Themyscira', 3, 2),
('Superman', 'Metrópolis', 3, 2),
('Black Panther', 'Wakanda', 2, 1),
('Flash', 'Central City', 1, 2),
('Green Lantern', 'Coast City', 2, 2),
('Aquaman', 'Atlantis', 2, 2);

-- Insertar datos de ejemplo en Superhéroes-Superpoderes-Nivel
INSERT INTO Superhéroes_Superpoderes_Nivel (id_superheroe, id_superpoderes, id_nivel) VALUES
(1, 1, 2),  -- Spider-Man - Vuelo
(1, 2, 3),  -- Spider-Man - Super Fuerza
(2, 1, 3),  -- Thor - Vuelo
(2, 2, 3),  -- Thor - Super Fuerza
(3, 1, 3),  -- Iron Man - Vuelo
(3, 2, 3),  -- Iron Man - Super Fuerza
(4, 2, 2),  -- Batman - Super Fuerza
(5, 2, 3),  -- Wonder Woman - Super Fuerza
(6, 1, 3),  -- Superman - Vuelo
(6, 2, 3),  -- Superman - Super Fuerza
(7, 1, 2),  -- Black Panther - Vuelo
(8, 1, 1),  -- Flash - Super Velocidad
(9, 1, 2),  -- Green Lantern - Vuelo
(10, 1, 2); -- Aquaman - Super Fuerza

-- Confirmar que las tablas y datos se han creado correctamente
SELECT * FROM Compañías;
SELECT * FROM Niveles_de_Poder;
SELECT * FROM Superpoderes;
SELECT * FROM Superhéroes;
SELECT * FROM Superhéroes_Superpoderes_Nivel;
