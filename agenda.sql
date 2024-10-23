create database if not exists agenda;
use agenda;

create table contactos (
id int auto_increment primary key not null,
nombre varchar(50),
apellido varchar(50),
email varchar(30),
telefono varchar(30),
sexo varchar(20),
edad int(3),
fecha_nac date
);

