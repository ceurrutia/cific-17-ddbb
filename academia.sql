/* drop database if exists academia */

create database  if not exists academia;
use academia;

create table cursos (
id_curso int not null auto_increment,
titulo varchar(30),
primary key (id_curso)
);

/* agregar un campo nuevo en tabla cursos */
alter table cursos add id_profe int;

/* crear el campo clave foranea */

alter table cursos add foreign key (id_profe) 
references profesores(id_profe);


create table profesores (
id_profe int not null auto_increment,
nombre varchar(20),
apellido varchar(20),
fec_nacimiento date,
primary key (id_profe)
);

insert into profesores (nombre, apellido, fec_nacimiento) values 
("Mirta", "Soraide", "1989-05-06"),
("Monica", "Isnardi", "1973-12-23"),
("Federico", "Gasco", "1986-0914"),
("Flavia", "Rosa", "1982-08-13")
;

insert into cursos (titulo, id_profe) values 
("POO", 1),
("Tecnicas de programacion", 2),
("Java", 1),
("Relaciones laborales", 2);

select * from profesores;

select c.id_curso, c.titulo, c.id_profe, p.nombre, p.apellido 
from cursos c, profesores p
where c.id_curso = p.id_profe;



