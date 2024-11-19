
CREATE DATABASE IF NOT EXISTS Superfly;

USE Superfly;

CREATE TABLE Unidades (
    id INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion VARCHAR(255)
);

CREATE TABLE Clientes (
    id INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100),
    fecha_ingreso DATE,
    dni INT UNIQUE,
    id_reprocan INT UNIQUE
);

CREATE TABLE THC_CBD (
    id INT PRIMARY KEY,
    thc FLOAT,
    cbd FLOAT
);

CREATE TABLE Geneticas (
    id INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion VARCHAR(255),
    banco VARCHAR(100),
    id_thc_cbd INT,
    FOREIGN KEY (id_thc_cbd) REFERENCES THC_CBD(id)
);

CREATE TABLE Parametros (
    id INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion VARCHAR(255),
    id_unidad INT,
    FOREIGN KEY (id_unidad) REFERENCES Unidades(id)
);

CREATE TABLE Marca (
    id INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    tipo VARCHAR(50)
);

CREATE TABLE Fertilizante (
    id INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion VARCHAR(255),
    id_marca INT,
    FOREIGN KEY (id_marca) REFERENCES Marca(id)
);

CREATE TABLE Tipo_producto (
    id INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion VARCHAR(255),
    id_genetica INT,
    FOREIGN KEY (id_genetica) REFERENCES Geneticas(id)
);

CREATE TABLE Productos (
    id INT PRIMARY KEY,
    producto VARCHAR(100) NOT NULL,
    descripcion VARCHAR(255),
    valor FLOAT,
    id_unidades INT,
    id_tipo_producto INT,
    FOREIGN KEY (id_unidades) REFERENCES Unidades(id),
    FOREIGN KEY (id_tipo_producto) REFERENCES Tipo_producto(id)
);

CREATE TABLE Produccion (
    id INT PRIMARY KEY,
    fecha DATE,
    id_genetica INT,
    id_parametros INT,
    id_fertilizantes INT,
    cantidad INT,
    FOREIGN KEY (id_genetica) REFERENCES Geneticas(id),
    FOREIGN KEY (id_parametros) REFERENCES Parametros(id),
    FOREIGN KEY (id_fertilizantes) REFERENCES Fertilizante(id)
);

CREATE TABLE Compras (
    id INT PRIMARY KEY,
    fecha DATE,
    id_producto INT,
    valor FLOAT,
    cantidad INT,
    id_cliente INT,
    FOREIGN KEY (id_producto) REFERENCES Productos(id),
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id)
);
