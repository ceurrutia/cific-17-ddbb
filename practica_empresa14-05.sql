create database if not exists empresa;

use empresa;

create table empleados (
id_empleado int (20) primary key auto_increment,
apellido varchar(60),
nombre varchar(60),
telefono int(11),
direccion varchar(60),
fecha_nacimiento date,
observaciones varchar(45),
sueldo int(11)
);

insert into empleados (apellido, nombre, telefono, direccion, fecha_nacimiento, observaciones, sueldo)
values 
("Perez", "Roman", 234567, "Almagro 56", "2004-06-22", "Programador", 800000),
("Martinez", "Jazmin", 8978766, "Palermo 70", "1998-06-12", "DBA", 950000);

/* sumar todos los sueldos */

drop function SumaSueldos;

delimiter $$
create function SumaSueldos() returns decimal(10,2)
begin
	declare suma decimal(10,2);
    select sum(sueldo) into suma from empleados;
    return suma;
end $$
delimiter $$

select SumaSueldos();

/* calcular un aumnento del 10% a todos los sueldos */

/*drop function aumento10;*/

delimiter $$
create function aumento10(sueldo float, porcentaje float) returns decimal(10,2)
begin
	declare aumento decimal (10,2);
    set aumento = (sueldo * porcentaje /100);
    return aumento;
end $$
delimiter $$

select id_empleado, nombre, sueldo, aumento10(sueldo, 10) as aumento from empleados; 

update empleados
set sueldo = sueldo + aumento10(sueldo, 10);

select nombre, sueldo, sueldo + aumento10(sueldo, 10) as sueldo_aumentado from empleados;




