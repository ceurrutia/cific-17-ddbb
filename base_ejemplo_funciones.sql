CREATE DATABASE base_ejemplo;

USE base_ejemplo;

/* drop table productos */

CREATE TABLE productos (
    id INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(20) NOT NULL,
    coste FLOAT NOT NULL DEFAULT 0.0,
    precio FLOAT NOT NULL DEFAULT 0.0,
    PRIMARY KEY(id)
) engine = InnoDB;

INSERT INTO productos (nombre, coste, precio) VALUES 
('Producto A', 4, 8), 
('Producto B', 1, 1.5),
('Producto C', 50, 80);

select * from productos;

/* crea una funcion beneficio que calcule el beneficio por producto */

/* drop function calcularBeneficio;*/

delimiter $$
create function calcularBeneficio(coste float, precio float)
returns decimal(10,2)
begin
	declare beneficio decimal(10,2);
    set beneficio = precio - coste;
    return beneficio;
end $$
delimiter ;

select calcularBeneficio(coste, precio) as beneficio from productos;

select *, calcularBeneficio(coste, precio) as beneficio
from productos;

/* crea una funcion que aumente el costo 10% */

delimiter $$
create function aumentoCosto10(coste float)
returns decimal(9,2)
begin 
	declare aumento decimal(9,1);
    set aumento = coste + (coste * 10 / 100);
    return aumento;
end $$
delimiter ;

select coste, aumentoCosto10(coste) as costo_aumento from productos;

select nombre, calcularBeneficio(coste, precio) as beneficio, aumentoCosto10(coste) as costo_aumentado 
from productos
where nombre = upper('Producto B');


