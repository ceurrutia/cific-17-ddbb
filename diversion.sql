SET FOREIGN_KEY_CHECKS=0; 
-- ---------------------------- -- Estructura de la tabla juegos -- ----------------------------
 create database diversion;
 use diversion; 
 DROP TABLE IF EXISTS juegos; 
 CREATE TABLE juegos ( 
 ID int(11) NOT NULL AUTO_INCREMENT,
 juegoname varchar(255) DEFAULT NULL, 
 PRIMARY KEY (`ID`) ) 
  ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8; 
 -- ---------------------------- -- Registros de la tabla juegos -- ---------------------------- 
 INSERT INTO juegos VALUES ('1', 'Final Fantasy VII'); 
 INSERT INTO juegos  VALUES ('2', 'Zelda: A link to the past'); 
 INSERT INTO juegos  VALUES ('3', 'Crazy Taxy'); 
 INSERT INTO juegos  VALUES ('4', 'Donkey Kong Country'); 
 INSERT INTO juegos VALUES ('5', 'Fallout 4'); 
 INSERT INTO juegos  VALUES ('6', 'Saints Row III'); 
 INSERT INTO juegos  VALUES ('7', 'La taba'); 
 /*-- ---------------------------- -- Estructura de la tabla juegousuario -- ---------------------------- */
 DROP TABLE IF EXISTS juegousuario;
 CREATE TABLE juegousuario (
 ID_usuario int(11) NOT NULL,
 ID_juego int(11) NOT NULL,
 UNIQUE KEY id_user_juego (ID_usuario,ID_juego) ) 
 ENGINE=InnoDB DEFAULT CHARSET=utf8;
 /*-- ---------------------------- -- Registros de la tabla juegousuario -- ----------------------------*/ 
 INSERT INTO juegousuario VALUES ('1', '1'); 
 INSERT INTO juegousuario  VALUES ('1', '2'); 
 INSERT INTO juegousuario  VALUES ('1', '3'); 
 INSERT INTO juegousuario  VALUES ('1', '4'); 
 #INSERT INTO `juegousuario` VALUES ('1', '5'); 
 INSERT INTO juegousuario  VALUES ('1', '6'); 
 INSERT INTO juegousuario  VALUES ('1', '7'); 
 INSERT INTO juegousuario  VALUES ('2', '3'); 
 INSERT INTO juegousuario  VALUES ('2', '7'); 
 INSERT INTO juegousuario  VALUES ('4', '1'); 
 INSERT INTO juegousuario  VALUES ('4', '2'); 
 INSERT INTO juegousuario  VALUES ('4', '4'); 
 INSERT INTO juegousuario  VALUES ('4', '7');
/* -- ---------------------------- -- Estructura de tabla usuarios-- ---------------------------- */
 DROP TABLE IF EXISTS usuarios;
 CREATE TABLE usuarios (
 ID int(11) NOT NULL AUTO_INCREMENT,
 username  varchar(255) DEFAULT NULL,
 PRIMARY KEY (`ID`) ) 
 ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/* -- ---------------------------- -- Records of usuarios -- ---------------------------- */
 INSERT INTO usuarios VALUES ('1', 'vichaunter');
 INSERT INTO usuarios VALUES ('2', 'pepito');
 INSERT INTO usuarios VALUES ('3', 'jaimito');
 INSERT INTO usuarios VALUES ('4', 'ataulfo');
 SET FOREIGN_KEY_CHECKS=1;
 
 show tables;
 select * from juegos;
 select * from usuarios;
 select * from juegousuario;
 
 /* Mostrar los juegos que tiene cada usuario, solo mostrar los datos siempre que un juego pertenezca a
un usuario.*/

select usuarios.username, juegos.juegoname
from usuarios inner join juegos ON usuarios.id = juegos.id
inner join juegousuario on juegousuario.id_usuario = juegos.id; 

/* Hacer un listado de todos los juegos de los usuarios*/

select juegos.juegoname, usuarios.username
from juegos inner join usuarios on juegos.id = usuarios.id
inner join juegousuario on juegousuario.id_usuario = juegos.id;

/* Mostrar todos los juegos que existen, y a qué usuarios pertenecen (o simplemente si le pertenece a
algún usuario). */

select usuarios.username, juegos.juegoname
from usuarios right join juegousuario on juegousuario.id_usuario = usuarios.id
right join juegos on juegos.id =  juegousuario.id_juego;

select usuarios.username, juegousuario.id_juego
from juegousuario 
inner join usuarios on juegousuario.id_usuario = usuarios.id;


