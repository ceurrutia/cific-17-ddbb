/* drop database if exists tienda */

create database if not exists tienda;
use tienda;

create table clientes (
ID_cliente int(20) primary key auto_increment not null,
nombre_cliente varchar(60),
ciudad varchar(60)
);

insert into clientes (ID_cliente, nombre_cliente, ciudad) values 
(1, 'Juan Pérez', 'Madrid'), 
(2, 'Ana Gómez', 'Barcelona'), 
(3, 'Luis Martínez', 'Valencia'), 
(4, 'María Rodríguez', 'Sevilla'), 
(5, 'Carlos Sánchez', 'Bilbao'), 
(6, 'Laura Fernández', 'Zaragoza'), 
(7, 'José López', 'Granada'), 
(8, 'Elena García', 'Alicante'), 
(9, 'Marta Ruiz', 'Córdoba'), 
(10, 'Pedro Ramírez', 'Vigo');


create table pedidos (
ID_pedido int(20) primary key auto_increment not null,
ID_cliente int(10),
fecha date,
monto decimal(10,2),
foreign key(ID_cliente) references clientes(ID_cliente)
);

INSERT INTO Pedidos (ID_pedido, ID_cliente, fecha, monto) VALUES 
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


SELECT * FROM PEDIDOS;
SELECT * FROM CLIENTES;

SHOW TABLES;

/* JOIN*/

select * from clientes c join pedidos p on p.ID_cliente=c.ID_cliente;

/* INGENIERIA INVERSA */
/* SE HACE ANTES DE CREAR LOS DATOS VERIFICAR EL DER Y LAS RELACIONES ANTES DE CARGAR DATOS */


/* EJERCICIOS */

/* 1. obtener los clientes que han realizado pedidos superiores a 200 */
/* igualdad de los ids, siempre que tenga una relacion por id*/

select c.nombre_cliente, p.monto
from pedidos p, clientes c 
where p.ID_pedido = c.ID_cliente and monto >= 200;

/* subconsultas tema super importante */
/* EJERCICIO: obtener los clientes que han realizado pedidos superiores a 200 */
/* el select de abajo me alimenta el select de arriba*/

select nombre_cliente, ciudad 
from clientes
where ID_cliente in (select ID_cliente from pedidos where monto > 200);

/* subconsulta 2: obtener los pedidos realizados por cliente en madrid */ 

select count(ID_pedido) as cantidad_pedidos 
from pedidos
where ID_pedido in (select ID_cliente from clientes where ciudad = 'Madrid');

/* subcosnulta 3: Obtener cantidad total de pedidos y monto total por cliente*/

select count(ID_pedido) as cantidad_pedidos 
from pedidos;

select c.ID_cliente, c.nombre_cliente, c.ciudad, sum(p.monto) from clientes c, pedidos p 
where c.ID_cliente = p.ID_pedido 
group by c.ID_cliente;

/* caso 2*/

select sum(monto), (select count(ID_pedido)) as cantidad_pedidos, c.nombre_cliente
from pedidos p, clientes c 
where c.ID_cliente = p.ID_pedido 
group by c.ID_cliente;

/*caso 3*/

select sum(monto), (select count(ID_pedido) ), c.nombre_cliente 
from pedidos p, clientes c 
where c.ID_cliente=p.ID_pedido group by c.ID_cliente ;

select count(*) as cantidad , sum(monto) as monto_total from pedidos;

select c.nombre_cliente, c.ID_cliente, p.ID_pedido, sum(p.monto)
from clientes c, pedidos p
group by c.ID_cliente;

/* trigger */











