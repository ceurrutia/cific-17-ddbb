drop database fauna;

-- Crear la base de datos "fauna"
CREATE DATABASE IF NOT EXISTS fauna;

-- Usar la base de datos "fauna"
USE fauna;

-- Crear la tabla "aniamles"
CREATE TABLE IF NOT EXISTS animales (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    especie VARCHAR(100) NOT NULL,
    pais_origen VARCHAR(100) NOT NULL,
    habitat VARCHAR(100) NOT NULL,
    extension BOOLEAN
);

-- Insertar 25 animales de ejemplo
INSERT INTO animales (nombre, especie, pais_origen, habitat, extension) VALUES
    ('León', 'Panthera leo', 'África', 'Savanna', TRUE),
    ('Tigre', 'Panthera tigris', 'Asia', 'Bosque', FALSE),
    ('Elefante', 'Loxodonta africana', 'África', 'Sabana', TRUE),
    ('Jirafa', 'Giraffa camelopardalis', 'África', 'Sabana', TRUE),
    ('Cebra', 'Equus quagga', 'África', 'Pradera', TRUE),
    ('Hipopótamo', 'Hippopotamus amphibius', 'África', 'Río', FALSE),
    ('Oso polar', 'Ursus maritimus', 'Ártico', 'Tundra', TRUE),
    ('Pingüino emperador', 'Aptenodytes forsteri', 'Antártida', 'Hielo', FALSE),
    ('Panda gigante', 'Ailuropoda melanoleuca', 'China', 'Bosque', TRUE),
    ('Canguro rojo', 'Macropus rufus', 'Australia', 'Desierto', FALSE),
    ('Leopardo', 'Panthera pardus', 'África', 'Selva', TRUE),
    ('Delfín', 'Delphinus delphis', 'Océano', 'Mar', FALSE),
    ('Gorila', 'Gorilla beringei', 'África', 'Bosque', TRUE),
    ('Cocodrilo', 'Crocodylus niloticus', 'África', 'Río', FALSE),
    ('Águila calva', 'Haliaeetus leucocephalus', 'Norteamérica', 'Montaña', TRUE),
    ('Tiburón blanco', 'Carcharodon carcharias', 'Océano', 'Mar', FALSE),
    ('Lobo gris', 'Canis lupus', 'América del Norte', 'Bosque', TRUE),
    ('Rinoceronte negro', 'Diceros bicornis', 'África', 'Savanna', TRUE),
    ('Puma', 'Puma concolor', 'América', 'Montaña', TRUE),
    ('Oso pardo', 'Ursus arctos', 'América del Norte', 'Bosque', TRUE),
    ('Suricata', 'Suricata suricatta', 'África', 'Desierto', FALSE),
    ('Cóndor andino', 'Vultur gryphus', 'América del Sur', 'Montaña', TRUE),
    ('Orangután', 'Pongo abelii', 'Borneo', 'Selva', TRUE),
    ('Tortuga marina', 'Chelonia mydas', 'Océano', 'Mar', FALSE),
    ('Lémur de cola anillada', 'Lemur catta', 'Madagascar', 'Bosque', FALSE);
    
  /* . ¿Cuáles son los animales que tienen una extensión de
hábitat?*/

select nombre from animales where extension = true;  

/*  ¿Cuál es el país de origen de la especie "Orangután"?*/

select pais_origen from animales where nombre = "Orangutan";

/* ¿Cuántos animales tienen la palabra "oso" en su
nombre? */

select nombre from animales where nombre like "%oso%";

/*  ¿Cuáles son las especies de animales que comienzan con la
letra "P"? */

select especie from animales where especie like "P%";

/* ¿Cuántos animales tienen "Montaña" en su hábitat?*/

select count(*) as cantidad from animales where habitat = "Montaña" ;

/* ¿Cuántos animales hay por país de origen? */

select pais_origen, count(*)  as cantidad_total from animales group by pais_origen order by pais_origen asc;

/* ¿Cuántos animales hay por especie?*/

select especie, count(*) as cantidad from animales group by especie;

/* ¿Cuál es el número máximo de animales por hábitat? */

select count(*) as maxima_cantidad, habitat from animales group by habitat;

/* ¿Cuáles son los animales ordenados alfabéticamente por nombre? */ 

select nombre from animales ORDER BY nombre ASC;

/* ¿Cuáles son los animales ordenados por país de origen de manera descendente?*/

select nombre, pais_origen from animales order by pais_origen desc;

/* ¿Cuáles son las especies de animales ordenadas por cantidad en hábitat extendido de manera ascendente?  */

select count(*) as cantidad, especie, extension  from animales where extension = true group by especie order by especie asc ;

/*¿Cuáles son los animales de las especies "León", "Tigre" y "Elefante"? */

select nombre from animales where especie in ("Panthera leo", "Panthera tigris", "Loxodonta africana");

/*¿Cuáles son las especies de los animales "León", "Tigre" y "Elefante"? */

select nombre, especie from animales where nombre in ("Leon", "Tigre", "Elefante");

/* ¿Cuántos animales tienen una especie (nombre) que no sea ni "León", ni "Tigre", ni "Elefante"?*/

select count(*) as cantidad  from animales where nombre NOT  IN ("León", "Tigre", "Elefante");


/*¿Cuáles son los animales que tienen un hábitat de "Pradera" o "Desierto"?*/

select nombre, habitat from animales where habitat IN ("Pradera", "Desierto") order by habitat;

/* ¿Cuántos animales tienen un hábitat extendido?*/

select count(*) as cantidad from animales where extension = true;

/* ¿Cuántos animales hay en total cuya especie (NOMBRE?) es "León" y tienen un hábitat extendido?*/

select count(*) as cantidad from animales where nombre = "Leon" and extension = true;

/* Cuál es la suma total de las extensiones de hábitat para los animales cuya especie es "Oso pardo"?*/
SELECT SUM(nombre) AS suma_extension FROM animales WHERE especie = 'Ursus arctos';

/* ¿Cuál es el número total de animales cuyo país de origen es "África" y tienen una extensión de hábitat?*/

select count(*) as cantidad_total from animales where pais_origen = "Africa" and extension = true;

/* FUNCIONES */

DELIMITER ||
create function suma(num1 integer, num2 integer)
returns double precision
	begin 
		return num1 + num2;
end; ||

DELIMITER ;
SET global log_bin_trust_function_creators=1;

select suma(4, 8);

drop function mi_funcion;

DELIMITER ||
create function restar(n1 integer, n2 integer)
returns double precision
	begin
		return n1 - n2;
	end; ||
    
select restar(12,4);

delimiter //
create function numero_letras (letra char) returns int
begin 
	declare numero int;
	select count(*) into numero from animales 
	where nombre like concat('%', letra, '%');
	return numero;
end//
delimiter ;
select numero_letras('p');

delimiter //
create function nombres (nom char) returns char
begin 
declare cantidad int;
select count(*) into cantidad from animales
where nombre = "%L%";
return cantidad;
end //
delimiter 

drop function nombres;

select nombres('Leon')

    
	



    