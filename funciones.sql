/* drop database mercado; */

create database mercado;

use mercado;

CREATE TABLE productos (
    id INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(20) NOT NULL,
    coste FLOAT NOT NULL DEFAULT 0.0,
    precio FLOAT NOT NULL DEFAULT 0.0,
    PRIMARY KEY(id)
);
INSERT INTO productos (nombre, coste, precio) VALUES 
('Iphone', 4, 8), ('Samsung galaxy', 1, 1.5),('Motorola', 50, 80);

INSERT INTO productos (nombre, coste, precio) VALUES 
('Xiaomi', 40, 60), ('Huawei', 45, 70);

UPDATE productos
SET precio = precio + 5
WHERE nombre = 'Iphone';

update productos
set coste = coste + (coste * 25) /100;

select precio from productos where nombre like 'Iphone';

select * from productos;

/* crea una funcion que calcule el beneficio de cada producto */

delimiter $$
create function calcularBeneficio(coste float, precio float) returns decimal(9,2)
begin 
    declare beneficio decimal(9,2);
    set beneficio = precio - coste;
    return beneficio;
end $$
delimiter $$


select *, calcularBeneficio(coste, precio) as beneficio from productos;

/* crea una funcion que sume al valor de cada producto un 15% */

/* drop function AumentarValor */

delimiter $$
create function AumentarValor(precio float) returns decimal(10,2)
begin
	declare aumento decimal(10,2);
    set aumento = (precio * 15) / 100 + precio;
    return aumento;
end $$

delimiter $$

select *, AumentarValor(precio) as precio_aumento from productos;

/* crea una funcion que descuente 10% al precio de  todos los productos */

delimiter $$
create function DescuentoProd(precio float) returns decimal(10,2)
begin
	declare descuento decimal(10,2);
    set descuento = precio - (precio * 10) /100;
    return descuento;
end $$

delimiter $$

select * , DescuentoProd(precio) as precio_con_descuento from productos;

/* crea una funcion que calcule la suma de precios de todos los productos */

/* drop function sumaPrecios */

delimiter $$
create function sumaPrecios(precio float) returns decimal(10,2)
begin
	declare suma decimal(10,2);
    select sum(precio) into suma from productos;
    return suma;
end $$
delimiter $$

select sumaPrecios(precio) as suma_precios from productos;

/* crear una funcion que le sume u 10% a todos los productos */

delimiter $$
create function aumentoPrecios(precio float) returns decimal(10,2)
begin
	declare aumento decimal(10,2);
	set aumento = precio + (precio * 10) /100;
    return aumento;
end $$
delimiter $$

select nombre, coste, precio, aumentoPrecios(precio) as aumento from productos;


select sum(precio) from productos;

/* crea una funcion que le sume un 25% al coste de productos */

delimiter $$
create function Aumento25(coste float) returns decimal(10,2)
begin
	declare aumento decimal(10,2);
    set aumento = coste + (coste *25) /100;
    return aumento;
end $$
delimiter $$

select coste, Aumento25(coste) as nuevo_costo from productos;

/* funcion que le reste 5% al costo */

delimiter $$
create function restaAlCoste(coste float) returns decimal(10,2)
begin
	declare resta decimal(10,2);
    set resta = coste - (coste * 5) /100;
    return resta;
end $$
delimiter $$
select *, restaAlCoste(coste) as reduccion5 from productos;
    

