create database if not exists base_peliculas;

use base_peliculas;

drop table peliculas;

create table if not exists peliculas(
id_pelicula int primary key auto_increment not null,
titulo varchar(100),
anio int(4),
nacionalidad varchar(100),
idioma varchar(100),
descripcion varchar(500),
observaciones varchar(500)
);

show tables;

insert into peliculas ( titulo, anio, nacionalidad, idioma, descripcion, observaciones)
 values("El padrino", 1968 , "americana", "ingles", "pelñicula", "Netflix"),
 ("Harry Potter 1", 2011, "americana", "ingles", "pelicula", "HBO Max"),
 ("El secreto de sus ojos", 2007, "argentina", "español", "pelicula", "Cuevana"),
 ("Kimi no na wa", 2019, "japonesa", "japones", "pelicula", "Crunchyroll"),
 ("Tenki no Ko", 2021, "japonesa", "japones", "pelicula", "Crunchyroll"),
 ("Titanic", 1999, "americana", "inglés", "pelicula", "HBO"),
 ("Kimestu no Yaiba: Mugen train", 2020, "japonesa", "japones", "pelicula", "Crunchyroll"),
 ("El señor de los anillos: La comunidad de anillo", 2000, "americana", "ingles", "pelicula", "Netflix"),
 ("El señor de los anillos: El retorno del rey", 2005, "americana", "ingles", "Frodo, Sam y Gollum se acercan al monte del Destino, donde destruirán el anillo o perecerán en el intento. Mientras, Aragorn y sus compañeros se enfrentan a las monstruosas tropas de Sauron.", "Esta Vigo Mortensen"),
 ("Relatos salvajes", 2014, "argentina", "español", "pelicula", "Netflix"),
 ("Oppenheimer", 2023, "americana", "ingles", "pelicula", "Amazon"),
 ("El rey león", 1994, "americana", "ingles", "pelicula", "Amazon"),
 ("The Matrix", 1991, "americana", "ingles", "pelicula", "Amazon"),
 ("Matrix Revoluciones ", 1991, "americana", "ingles", "pelicula", "Amazon"),
 ("Full Metal Alchemist ", 1990, "japonesa", "japones", "serie", "Crunchyroll"),
 ("Kimetsu No yaiba ", 2019, "japonesa", "japones", "serie", "Crunchyroll");

select * from peliculas;

update peliculas
set descripcion = "Película"
where id_pelicula = 1;

select count(*) as cantidad, idioma from peliculas group by idioma;

insert into peliculas ( titulo, anio, nacionalidad, idioma, descripcion, observaciones) 
values("Tokyo Revengers ", 2022, "japonesa", "japones", "serie", "Star Plus");

alter table peliculas add resumen varchar (500);

update peliculas
set resumen = "La novela detalla la historia ficticia de una familia de la mafia siciliana asentada en Nueva York y que está encabezada por Don Vito Corleone, El gran jefe, la cual se convirtió en sinónima de la mafia italiana."
where id_pelicula = 1;

update peliculas
set resumen = "Takemichi, un chico que a sus 26 años cree que ya ha arruinado su vida. Viviendo a través de trabajos esporádicos lo suficientemente buenos como para pagar el alquiler, su vida se ve aún peor cuando se entera de la muerte de Hinata, la única novia que ha tenido."
where id_pelicula = 17;


update peliculas
set resumen = "La obra cuenta la historia de Harry Potter, un mago de 11 años que descubre, justo el día de su cumpleaños, no sólo que posee poderes mágicos sino que es mago"
where id_pelicula = 2;

update peliculas
set resumen = "Tanjirō Kamado, un adolescente cuya familia fue cruelmente asesinada por un Demonio el cual convirtió a su hermana Nezuko en una de estas criaturas"
where id_pelicula = 16;

/* EJERCICIOS */

/* Listar las películas ordenadas alfabéticamente en forma descendente */

select count(titulo) as cantidad from peliculas where descripcion = "pelicula" order by titulo desc;

/* Cuántas películas se estrenaron entre 1990 y 2010 */

select count(*) as cantidad_peliculas from peliculas where anio between 1990 and 2010;

/* Cuántas películas existen de cada género */

alter table peliculas add genero varchar(50);

update peliculas
set genero = "Aventuras"
where id_pelicula = 17;

update peliculas
set genero = "Drama"
where id_pelicula = 11;

/* Cuántas películas existen de cada nacionalidad */

select nacionalidad, count(*) as cantidad_peliculas from peliculas group by nacionalidad;


/* Listar películas solamente y no las series, ordenadas por idioma. */

select titulo, descripcion, idioma from peliculas where descripcion = "pelicula" order by idioma; 

/* Agregar un campo actor/actriz y completar ese campo */ 

alter table peliculas
add actoractriz varchar (100);

update peliculas
set actoractriz = "Marlon Brando"
where id_pelicula = 1;

update peliculas
set actoractriz = "Ryunosuke Kamiki"
where id_pelicula = 4;

update peliculas
set actoractriz = "Keanu Reeves"
where id_pelicula = 14;

/* Cambiar el idioma de la película que aparece en tercer, quinto y decimo lugar por italiano. */

update peliculas
set idioma = "italiano"
where id_pelicula in (3,5, 10);


update peliculas
set actoractriz = "Viggo Mortensen"
where id_pelicula in (8, 9);

/* Cambiar el género drama por hechos reales de todas las películas de idioma diferente a inglés */

update peliculas
set genero = "Hechos reales"
where genero ="drama" and idioma = "ingles" and id_pelicula in (1,2);

select * from peliculas;

select titulo , idioma from peliculas where idioma  not in ("ingles");

/* Mostar las películas, año, actor ordenado por año en forma descendente. */

select titulo, anio, actoractriz from peliculas order by  anio desc;

/* Cambiar el año 1990 por 1995 en todas las películas. */

update peliculas
set anio = 1995
where anio = 1990;

update peliculas
set actoractriz = "Rose y Leonardo"
where id_pelicula = 6;

select * from peliculas where anio = 1990;

update peliculas
set genero = "Ciencia Ficcion"
where id_pelicula in (13 );

select genero, count(id_pelicula) as cantidad from peliculas group by genero;

select * from peliculas;

DELIMITER $$
begin







