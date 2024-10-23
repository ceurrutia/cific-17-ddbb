/* drop database transportista;*/ 

CREATE DATABASE IF NOT EXISTS transportista;
use transportista;

create table if not exists camioneros (
id_camionero INT(10) PRIMARY KEY auto_increment,
nombre varchar(50),
direccion varchar (100),
telefono varchar(12),
sueldo int(10)
);

insert into camioneros (nombre, direccion, telefono, sueldo) values 
('Dominguez', 'Arboleda Chania 2034', '098345', 980000),
('Martinez', 'Libertador 8907', '3498765', 1300000),
('Robledo', 'Bartolome Mitre 3054', '302248765', 1200000)
;


create table if not exists ciudades(
id_ciudad int(10) primary key  auto_increment,
nombre varchar(50)
);

insert into ciudades (nombre) values
('Mendoza'),
('Misiones'),
('Salta');


create table if not exists camiones (
matricula int(20) primary key not null,
marca varchar(50),
modelo varchar(50),
potencia varchar(20),
tipo varchar(30)
);

insert into camiones (matricula, marca, modelo, potencia, tipo) values 
(45989, 'SCANIA', 'power', '300', 'acoplado' ),
(34098, 'FIAT', 'challenge', '250', 'mediano' ),
(25987, 'IVECO', 'charge', '400', 'acoplado grande' );


create table detalle_paquetes(
id_detalle_paquete int(10) primary key auto_increment,
id_camionero int(10),
foreign key (id_camionero) references camioneros (id_camionero),
matricula int(20),
foreign key (matricula) references camiones (matricula)
);

insert into detalle_paquetes (id_camionero, matricula) values 
(1, 34098);



create table if not exists paquetes (
id_paquete int(10) primary key auto_increment,
descripcion varchar(50),
destinatario varchar(50),
direccion varchar(50),
id_camionero int(10),
id_ciudad int(10),
foreign key (id_camionero) references camioneros (id_camionero),
foreign key (id_ciudad) references ciudades (id_ciudad)
);

insert into paquetes (descripcion, destinatario, direccion, id_camionero, id_ciudad ) values
('Paquete 1', 'Juan Diaz', 'Posadas 345', 1, 2 ),
('Paquete 2', 'Mariano Rodriguez', 'Abrevalla 1250', 2, 2 );

insert into paquetes (descripcion, destinatario, direccion, id_camionero, id_ciudad ) values
('Paquete 1Men', 'Pedro Julio', 'Cascada 1234', 2, 1 ),
('Paquete Men', 'Juan Alvez', 'Tamago 345', 1, 1 );



/* EJERCICIOS */
/* 5. Registrar el envío de 2 paquetes a la ciudad de MISIONES con el camión de Marca Fiat. */

select count(p.id_paquete) as cantidad_paquetes, c.id_ciudad, ca.marca 
from paquetes p, camiones ca, ciudades c 
where ca.marca like "FIAT";

/* combino id de camionero con marca del camion */

select ca.matricula, id_camionero, ca.marca 
from camiones ca, camioneros c 
where id_camionero = 1 and ca.marca = "Fiat" or "FIAT";

select * from paquetes;

/* 6. Registrar el envío de 2 paquetes a la ciudad de MENDOZA con el camión de
Marca IVECO. */

select count(p.id_paquete) as cantidad_paquetes, c.id_ciudad, c.nombre , ca.marca 
from paquetes p, camiones ca, ciudades c 
where ca.marca like "IVECO";

SELECT * from paquetes;

/* 7. Modificar la Matrícula del camión SCANIA por 8795.*/

SET SQL_SAFE_UPDATES = 0;

update camiones
set matricula = '8795'
where marca = 'SCANIA';

select * from camiones;

 /* 8. Calcular el monto de dinero que se paga en sueldos a todos los camioneros. */
 
 select sum(sueldo) as sueldo_total from camioneros;
 
 /* 9. Listar por orden alfabético en forma ascendente, la cantidad de paquetes que
transporta cada Camionero a la ciudad de SALTA. */

select ca.nombre, count(p.id_paquete) as cantidad_paquetes, c.nombre as Ciudad
from paquetes p, ciudades c, camioneros ca 
where c.nombre like 'SALTA' or 'Salta' group by ca.nombre asc;

/* 10- Eliminar el registro del segundo paquete enviado a MENDOZA en el punto 6. */

select * from paquetes;
delete from paquetes where id_paquete = 16;







