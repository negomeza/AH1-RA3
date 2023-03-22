-- Crear base de datos
CREATE DATABASE editorial;

-- Seleccionar la base de datos
USE editorial;

-- Crear tabla sucursales
CREATE TABLE sucursales (
  IdSucursal INT NOT NULL AUTO_INCREMENT,
  Domicilio VARCHAR(100),
  Telefono VARCHAR(20),
  CodigoSucursal VARCHAR(10),
  PRIMARY KEY (IdSucursal)
);

-- Crear tabla empleados
CREATE TABLE empleados (
  IdEmpleado INT NOT NULL AUTO_INCREMENT,
  Nombre VARCHAR(50),
  Apellidos VARCHAR(100),
  NIT VARCHAR(20),
  Telefono VARCHAR(20),
  IdSucursal INT NOT NULL,
  PRIMARY KEY (IdEmpleado),
  FOREIGN KEY (IdSucursal) REFERENCES sucursales(IdSucursal)
);

-- Crear tabla revistas
CREATE TABLE revistas (
  IdRevista INT NOT NULL AUTO_INCREMENT,
  Titulo VARCHAR(100),
  NumeroRegistro VARCHAR(20),
  Periodicidad VARCHAR(20),
  Tipo VARCHAR(50),
  PRIMARY KEY (IdRevista)
);

-- Crear tabla sucursal_revista
CREATE TABLE sucursal_revista (
  IdSucursal INT NOT NULL,
  IdRevista INT NOT NULL,
  PRIMARY KEY (IdSucursal, IdRevista),
  FOREIGN KEY (IdSucursal) REFERENCES sucursales(IdSucursal),
  FOREIGN KEY (IdRevista) REFERENCES revistas(IdRevista)
);

-- Crear tabla periodistas
CREATE TABLE periodistas (
  IdPeriodista INT NOT NULL AUTO_INCREMENT,
  Nombre VARCHAR(50),
  Apellidos VARCHAR(100),
  NIT VARCHAR(20),
  Telefono VARCHAR(20),
  Especialidad VARCHAR(50),
  PRIMARY KEY (IdPeriodista)
);


-- Crear tabla ejemplares
CREATE TABLE ejemplares (
  IdEjemplar INT NOT NULL AUTO_INCREMENT,
  Fecha DATE,
  NumeroPaginas INT,
  NumeroejemplaresVendidos INT,
  IdRevista INT NOT NULL,
  PRIMARY KEY (IdEjemplar),
  FOREIGN KEY (IdRevista) REFERENCES revistas(IdRevista)
);

CREATE TABLE secciones (
  IdSeccion INT NOT NULL AUTO_INCREMENT,
  Titulo VARCHAR(100),
  Extension INT,
  PRIMARY KEY (IdSeccion)
);

CREATE TABLE articulos (
  IdArticulo INT NOT NULL AUTO_INCREMENT,
  Titulo VARCHAR(100),
  Contenido TEXT,
  IdPeriodista INT NOT NULL,
  IdSeccion INT NOT NULL,
  IdRevista INT NOT NULL,
  PRIMARY KEY (IdArticulo),
  FOREIGN KEY (IdPeriodista) REFERENCES periodistas(IdPeriodista),
  FOREIGN KEY (IdSeccion) REFERENCES secciones(IdSeccion),
  FOREIGN KEY (IdRevista) REFERENCES revistas(IdRevista)
);



-- Ingresar registros en la tabla Sucursales
INSERT INTO Sucursales (Domicilio, Telefono, CodigoSucursal) VALUES
('4a. Avenida 12-62, Zona 10', '+502 2234-5678', 'GUA-001'),
('5a. Avenida 5-27, Zona 14', '+502 2333-4455', 'GUA-002'),
('6a. Calle 7-45, Zona 9', '+502 2444-1122', 'GUA-003'),
('15a. Calle 12-32, Zona 1', '+502 2533-8899', 'GUA-004'),
('10a. Avenida 18-56, Zona 16', '+502 2633-7766', 'GUA-005');


-- Ingresar registros en la tabla Empleados
INSERT INTO Empleados (Nombre, Apellidos, NIT, Telefono, IdSucursal) VALUES
('Juan', 'Perez Garcia', '1234-567890-123-4', '+502 5555-6666', 1),
('Maria', 'Gonzalez Rodriguez', '4321-098765-321-0', '+502 7777-8888', 2),
('Pedro', 'Lopez Ramirez', '8765-432109-876-5', '+502 9999-0000', 3),
('Ana', 'Mendez Perez', '4567-890123-456-7', '+502 2222-3333', 4),
('Carlos', 'Gomez Hernandez', '7890-123456-789-0', '+502 4444-5555', 5);

-- Ingresar registros en la tabla Revistas
INSERT INTO Revistas (Titulo, NumeroRegistro, Periodicidad, Tipo) VALUES
('Guatemala Hoy', '1234567', 'Diaria', 'Noticias'),
('Revista Cultural', '7654321', 'Mensual', 'Cultural'),
('Salud y Bienestar', '246810', 'Semanal', 'Salud'),
('Cocina Facil', '1357924', 'Bimensual', 'Culinario'),
('Deportes Total', '9876543', 'Semanal', 'Deportes');


-- Ingresar registros en la tabla SucursalRevista
INSERT INTO Sucursal_Revista (IdSucursal, IdRevista) VALUES
(1, 1),
(1, 3),
(2, 2),
(3, 1),
(3, 5);


INSERT INTO Periodistas (Nombre, Apellidos, NIT, Telefono, Especialidad) VALUES 
('María', 'García', '1234567890123', '555-1234', 'Cultura'),
('Juan', 'Pérez', '9876543210987', '555-5678', 'Deportes'),
('Ana', 'López', '4567890123456', '555-9012', 'Política'),
('Luis', 'Rodríguez', '2345678901234', '555-3456', 'Ciencia'),
('Sofía', 'Hernández', '8765432109876', '555-7890', 'Entretenimiento');


INSERT INTO Secciones (Titulo, Extension) VALUES 
('Política', 6),
('Cultura', 4),
('Deportes', 8),
('Ciencia', 7),
('Entretenimiento', 5);


INSERT INTO Articulos (Titulo, Contenido, IdPeriodista, IdSeccion, IdRevista) VALUES 
('Elecciones presidenciales en Guatemala', 'El próximo mes se realizarán elecciones presidenciales en Guatemala...', 1, 1, 1),
('La música en Guatemala', 'La música en Guatemala es muy variada y rica...', 2, 2, 2),
('El partido de la final del torneo de fútbol', 'El partido de la final del torneo de fútbol...', 3, 3, 3),
('Descubren nueva especie de animal en Guatemala', 'Un equipo de científicos descubrió una nueva especie de animal en Guatemala...', 4, 4, 4),
('Nuevas películas en cartelera', 'En las salas de cine de Guatemala ya se pueden ver varias películas nuevas...', 5, 5, 5);


INSERT INTO Ejemplares (Fecha, NumeroPaginas, NumeroEjemplaresVendidos, IdRevista) VALUES 
('2022-01-01', 20, 1000, 1),
('2022-01-02', 24, 800, 2),
('2022-01-03', 16, 1200, 3),
('2022-01-04', 22, 900, 4),
('2022-01-05', 18, 1100, 5);




