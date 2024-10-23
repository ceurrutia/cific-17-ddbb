/* drop database if exists ciencia */

create database if not exists ciencia;
use ciencia;

create table investigadores (
dni int(12) primary key not null,
nombre_completo varchar(50)
);

insert into investigadores (dni, nombre_completo) values
("45678900", "Manuel Lopez"),
("386542", "Pedro Gonzalez"),
("783422", "Ana Molina"),
("987234", "Juana Perez"),
("348765", "Ignacio Lopez Cazo");

/* drop table proyectos */

create table proyectos (
id_proyecto int(10) primary key auto_increment not null,
nombre_proyecto varchar(255),
horas_dedicadas int(10)
);

insert into proyectos (nombre_proyecto, horas_dedicadas) values 
("Proyecto Reciclado de plasticos", 150),
("Proyecto Aguas claras", 25),
("Compostaje de algas", 25),
("Oceanos limpios", 50),
("Tapitas gaseosas", 40),
("Bolsas plasticas", 110),
("Reciclaje elementos electronicos", 120),
("Fibras textiles a partir de reciclado", 150),
("Recoleccion botellas plasticas", 40),
("Cuidado medio ambiente", 105),
("Reciclaje en reservas naturales", 130);

select * from proyectos;

/* drop table info_proyectos */

create table info_proyectos (
id_info int(10) auto_increment primary key,
dni int(10),
foreign key(dni) references investigadores(dni),
id_proyecto int(10),
foreign key (id_proyecto) references proyectos(id_proyecto)
);

insert into info_proyectos (dni, id_proyecto) values
("45678900", 1 ),
("45678900", 2),
("783422", 4),
("783422", 5),
("987234", 11),
("987234", 10),
("348765", 11),
("348765", 9)
;

select * from info_proyectos;
select * from proyectos;
show tables;

/* 1. Mostrar los investigadores asignados a cada proyecto, se debe visualizar dni, nombre
del investigador, nombre del proyecto.*/


select i.dni, i.nombre_completo, p.nombre_proyecto
from investigadores i, proyectos p, info_proyectos inf
where i.dni = inf.dni and p.id_proyecto = inf.id_proyecto;

/* 3. Mostrar las horas dedicadas de cada investigador y los datos del mismo. */

select i.dni, i.nombre_completo,
(select sum((select p.horas_dedicadas from proyectos p 
where p.id_proyecto = inf.id_proyecto  ))
from info_proyectos inf
where  inf.dni = i.dni ) as suma
from investigadores i;


/* 2. Obtener la cantidad de proyectos que tiene a cargo cada investigador, mostrando dni
y nombre del mismo. La lista debe mostrar a todos los investigadores */

select i.dni, i.nombre_completo,
(select count(*) 
from info_proyectos inf
where i.dni = inf.dni) as cant_proyectos
from investigadores i;

/* 4. Listar los investigadores que tienen más de un proyecto y cuya dedicación media a
cada proyecto sea igual o superior a 60 horas. */

select p.id_proyecto, (select count(p.id_proyecto) 
from proyectos p, investigadores i 
where p.id_proyecto = i.dni) as cantidad_proyectos, 
avg(p.horas_dedicadas) as prom_horas_dedicadas
from investigadores i, proyectos p 
group by p.nombre_proyecto;


