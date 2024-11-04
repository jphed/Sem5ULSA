-- MODELO FISICO BASE DE DATOS RESTAURANTE

DROP DATABASE IF EXISTS restaurante;

CREATE DATABASE restaurante CHARSET=utf8 COLLATE=utf8_spanish_ci;
USE restaurante;

-- Tabla de categorias (debe ser creada primero)

CREATE TABLE categorias (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  tipo VARCHAR(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

INSERT INTO categorias (id, tipo) VALUES
(1, 'SOPA'),
(2, 'BEBIDA'),
(3, 'POSTRE'),
(4, 'RES'),
(5, 'POLLO'),
(6, 'ENSALADA'),
(7, 'GUARNICION');

-- Tabla de menus

CREATE TABLE menus (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  menu VARCHAR(30) NOT NULL,
  precio DECIMAL(4,2) UNSIGNED NOT NULL,
  calorias INT UNSIGNED NOT NULL,
  idcategoria INT UNSIGNED NOT NULL,
  UNIQUE(menu),
  INDEX (idcategoria),

  FOREIGN KEY (idcategoria) 
    REFERENCES categorias (id) 
    ON UPDATE RESTRICT 
    ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

INSERT INTO menus (id, menu, precio, calorias, idcategoria) VALUES
(1, 'MILANESA DE POLLO', 70, 300, 5),
(2, 'AGUA DE COCO', 30, 50, 2),
(3, 'SOPA AZTECA', 70, 100, 1),
(4, 'CONO DE NIEVE', 50, 150, 3),
(5, 'FILETE', 90, 300, 4),
(6, 'ENSALADA', 30, 60, 6),
(7, 'PAPAS FRITAS', 30, 120, 7);

-- Tabla de ingredientes

CREATE TABLE ingredientes (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  ingrediente VARCHAR(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

INSERT INTO ingredientes (id, ingrediente) VALUES
(1, 'TORTILLA'),
(2, 'TOMATE'),
(3, 'AGUA'),
(4, 'COCO'),
(5, 'HELADO'),
(6, 'POLLO'),
(7, 'RES'),
(8, 'LECHUGA'),
(9, 'CEBOLLA'),
(10, 'PAPA');

-- Tabla Menus_Ingredientes

CREATE TABLE menus_ingredientes (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  idmenu INT UNSIGNED NOT NULL,
  idingredientes INT UNSIGNED NOT NULL,
  
  INDEX(idmenu),
  INDEX(idingredientes),
  UNIQUE(idmenu, idingredientes),

  FOREIGN KEY (idmenu) 
    REFERENCES menus (id) 
    ON UPDATE RESTRICT 
    ON DELETE RESTRICT,

  FOREIGN KEY (idingredientes) 
    REFERENCES ingredientes (id) 
    ON UPDATE RESTRICT 
    ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

INSERT INTO menus_ingredientes (id, idmenu, idingredientes) VALUES
(1, 1, 6),
(2, 2, 4),
(3, 3, 1),
(4, 4, 5),
(5, 5, 4),
(6, 6, 8),
(7, 7, 10);


