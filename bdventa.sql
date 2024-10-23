/* drop database venta */

CREATE DATABASE venta;

USE venta;

CREATE TABLE productos (
    idproducto INT AUTO_INCREMENT PRIMARY KEY,
    nombreproducto VARCHAR(255) NOT NULL,
    marca VARCHAR(255) NOT NULL,
    preciounitario DECIMAL(10, 2) NOT NULL,
    stock INT NOT NULL
);
