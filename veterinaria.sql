drop database veterinaria;

-- Crear la base de datos veterinaria
CREATE DATABASE IF NOT EXISTS veterinaria;

-- Usar la base de datos veterinaria
USE veterinaria;

-- Crear la tabla mascotas
CREATE TABLE IF NOT EXISTS mascotas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    edad INT,
    especie VARCHAR(100) NOT NULL,
    cantidad_visitas INT DEFAULT 0,
    color VARCHAR(50),
    tamaño VARCHAR(50)
);

-- Insertar ejemplos de datos de mascotas
INSERT INTO mascotas (nombre, edad, especie, cantidad_visitas, color, tamaño) VALUES
('Max', 5, 'Perro', 3, 'Marrón', 'Mediano'),
('Luna', 3, 'Gato', 2, 'Negro', 'Pequeño'),
('Buddy', 2, 'Perro', 1, 'Blanco', 'Grande'),
('Tiger', 8, 'Gato', 4, 'Rayado', 'Mediano'),
('Bella', 4, 'Perro', 2, 'Dorado', 'Pequeño'),
('Rocky', 6, 'Perro', 2, 'Gris', 'Grande'),
('Oliver', 1, 'Gato', 1, 'Naranja', 'Pequeño'),
('Milo', 7, 'Perro', 3, 'Negro', 'Mediano'),
('Simba', 2, 'Gato', 1, 'Marrón', 'Mediano'),
('Lucky', 3, 'Perro', 2, 'Blanco', 'Pequeño'),
('Whiskers', 5, 'Gato', 3, 'Blanco', 'Pequeño'),
('Coco', 4, 'Perro', 2, 'Negro', 'Mediano'),
('Charlie', 2, 'Perro', 1, 'Café', 'Grande'),
('Smokey', 6, 'Gato', 2, 'Gris', 'Mediano'),
('Lucy', 3, 'Perro', 2, 'Blanco', 'Pequeño'),
('Toby', 4, 'Gato', 2, 'Blanco', 'Pequeño'),
('Daisy', 5, 'Perro', 3, 'Marrón', 'Mediano'),
('Oreo', 2, 'Gato', 1, 'Negro', 'Pequeño'),
('Maximus', 4, 'Perro', 2, 'Negro', 'Grande'),
('Buster', 3, 'Perro', 2, 'Café', 'Mediano');


select nombre, tamaño from mascotas where tamaño = "grande";

select count(*) as cantidad_visitas  from mascotas where cantidad_visitas like +2;

select edad, count(*) as cantidad_total from mascotas group by edad;

select sum(edad) as suma_edades from mascotas where nombre IN ("Toby", "Luna");


select especie, count(*) as cantidad_total from mascotas group by especie order by especie asc;

select max(edad) from mascotas;

select especie,  max(cantidad_visitas) as cantidad_visitas from mascotas group by especie;

select nombre from mascotas  where nombre like "%a%" order by nombre;

