
drop database tienda;

CREATE DATABASE Tienda;
USE Tienda;

CREATE TABLE Clientes ( ClienteID INT PRIMARY KEY, Nombre
VARCHAR(100), Ciudad VARCHAR(100) );

CREATE TABLE Pedidos ( PedidoID INT PRIMARY KEY, ClienteID INT, Fecha
DATE, Monto DECIMAL(10, 2), FOREIGN KEY (ClienteID) REFERENCES
Clientes(ClienteID) );

INSERT INTO Clientes (ClienteID, Nombre, Ciudad) VALUES (1, 'Juan Pérez', 'Madrid'), 
(2, 'Ana Gómez', 'Barcelona'),
(3, 'Luis Martínez', 'Valencia'), 
(4, 'María Rodríguez', 'Sevilla'), 
(5, 'Carlos Sánchez', 'Bilbao'), 
(6, 'Laura Fernández', 'Zaragoza'), 
(7, 'José López', 'Granada'), 
(8, 'Elena García', 'Alicante'), 
(9, 'Marta Ruiz', 'Córdoba'), 
(10, 'Pedro Ramírez', 'Vigo'); 

INSERT INTO Pedidos (PedidoID, ClienteID, Fecha, Monto) VALUES 
(1, 1, '2024-05-01', 100.50),
(2, 2, '2024-05-03', 200.75), 
(3, 3, '2024-05-05', 150.20), 
(4, 4, '2024-05-07', 300.10), 
(5, 5, '2024-05-09', 50.30), 
(6, 1, '2024-05-11', 120.90), 
(7, 2, '2024-05-13', 220.40), 
(8, 3, '2024-05-15', 170.60), 
(9, 4, '2024-05-17', 310.80), 
(10, 5, '2024-05-19', 80.90); 

/* 1. Subconsulta 1: Obtener los clientes que han realizado pedidos superiores a 200*/

select c.clienteId, c.nombre, c.ciudad from clientes c
where c.clienteID in (select clienteId from pedidos where monto > 200);

/* b. Subconsulta 2: Obtener los pedidos realizados por clientes de 'Madrid' */

select pedidoID, monto from pedidos 
where clienteID in (select clienteID from clientes where ciudad = "Madrid" or ciudad = "madrid");

/* c. Subconsulta 3: Obtener la cantidad total de pedidos y el monto total por cliente */


SELECT ClienteID, (SELECT COUNT(*) 
FROM Pedidos 
WHERE Pedidos.ClienteID = Clientes.ClienteID) AS TotalPedidos, 
(SELECT SUM(Monto) FROM Pedidos WHERE Pedidos.ClienteID = Clientes.ClienteID) AS MontoTotal 
FROM Clientes; 



