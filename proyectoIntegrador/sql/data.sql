/*drop schema proyectoIntegrador;*/
create database proyectoIntegrador ;

use proyectoIntegrador ;

CREATE TABLE users ( 
id INT UNSIGNED PRIMARY KEY auto_increment, 
email VARCHAR(200) NOT NULL UNIQUE,
password VARCHAR(250) NOT NULL,
fotoPerfil VARCHAR(300),
fecha DATE,
dni INT not null,
createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
deletedAt  TIMESTAMP null
);

insert into users(id,email,password,fotoPerfil,fecha,dni)
values (default, "juanneira@gmail.com", "juan_neira", "/images/users/foto_jeremias.jpg", '2003-10-08', 45978253);
insert into users(id,email,password,fotoPerfil,fecha,dni) values
(default, "bocapasion@gmail.com", "bocapasion", "/images/users/bocapasion.jpg", '2003-10-08', 45212253),
(default, "sofimaggio@gmail.com", "sofimaggio", "/images/users/sofimaggio.jpg", '2003-10-08', 45212253),
(default, "lolo_123@gmail.com", "lolo_123", "/images/users/lolo_123.jpg", '2003-10-08', 46212563),
(default, "justivergara@gmail.com", "justivergara", "/images/users/justivergara.jpg", '2003-10-08', 4512253);



create table products(
id INT UNSIGNED PRIMARY KEY auto_increment,
idUsers int unsigned not null,
nombreProducto varchar(250) not null,
descripcion varchar(400) not null,
foreign key (idUsers) references users(id),
createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
deletedAt  TIMESTAMP null
);

insert into products(id, idUsers, nombreProducto, descripcion)
values (default, 1, "I will be right here","Remera con frase de ET, color celeste"),
(default, 2, "ET Long Sleeve","Remera con frase de ET, manga larga, color azul"),
(default, 3, "Peluche ET con camperita","Peluche de ET para decorar o jugar con el"),
(default, 4, "Peluche ET con corazon","Peluche del 40 aniversario de ET"),
(default, 5, "Peluche ET en bata","Peluche de ET con bata, super suave y tierno"),
(default, 1, "Set de vasos de shot de ET","Vasos de shot del aniversario 40 de ET"),
(default, 2, "Pin The extra-terrestrial","Pin coleccionable de la tienda del mejor extraterestre"),
(default, 3, "Magnet I love ET","Iman para decorar tu heladera de ET"),
(default, 4, "Magnet Be Good","Iman para decorar tu heladera de ET"),
(default, 5, "ET Wallet","Billetera de ET"),
(default, 1, "ET Mug","Taza con doble diseño de ET"),
(default, 2, "ET Key Ring","Llavero de ET con la figura de ET en 3D, para decorar tus llaves"),
(default, 3, "Peluche ET Bebe","Peluche super suave y tierno de ET");

create table comments(
id INT UNSIGNED PRIMARY KEY auto_increment,
idPost int unsigned,
foreign key (idPost) references products(id),
idUsers int unsigned,
foreign key (idUsers) references users(id),
comments varchar(400) not null, 
createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
deletedAt  TIMESTAMP null
);

insert into comments(id, idPost, idUsers, comments) 
values(default, 14, 2, 'Que linda remeraa!'),
(default, 14, 4, 'Me encanta el color'),
(default, 14, 3, 'ET es mi pelicula favorita'),
(default, 14, 5, 'Tienen buzos?'),
(default, 15, 3, 'Jajajaj es muy mi tio.'),
(default, 15, 1, 'Van a sacar mas modelos manga larga?'),
(default, 15, 4, 'Recomiendo este producto'),
(default, 15, 5, 'Excelente calidad'),
(default, 16, 4, 'Mi amiga tiene el mismo!'),
(default, 16, 2, 'Puedo ponerle la nueva camiseta de boca?'),
(default, 16, 1, 'Hay mas colores?'),
(default, 16, 3, 'Cupido tiro la flecha'),
(default, 17, 5, 'Quiero uno'),
(default, 17, 1, 'Imagine all the people!'),
(default, 17, 2, 'Mi amiga justice quiere uno!'),
(default, 17, 5, 'Hacen canje?'),
(default, 18, 1, 'Se le puede sacar la bata?'),
(default, 18, 4, 'Tienen fundas de ET?'),
(default, 18, 2, 'Es perfecto para mi abuelo'),
(default, 18, 5, 'Amo las cookies'),
(default, 19, 1, 'El precio incluye el envio?'),
(default, 19, 2, 'Se puede pagar en cuotas?'),
(default, 19, 4, 'Ame'),
(default, 19, 5, 'Odie'),
(default, 20, 1, 'Llore'),
(default, 20, 3, 'Excelente calidad, voy a pedir 15 mas'),
(default, 20, 4, 'Esta genial'),
(default, 20, 5, 'Indispensable para la vuelta a clases'),
(default, 21, 1, 'Hermoso'),
(default, 21, 2, 'Ahora mi mochila es la envidia de todos'),
(default, 21, 3, 'El favorito de mis hijos'),
(default, 21, 4, 'Mi pin favorito'),
(default, 22, 3, 'Me encanto'),
(default, 22, 2, 'Cotidiano'),
(default, 22, 1, 'De chiquita siempre quise uno'),
(default, 22, 5, 'Es muy lindo'),
(default, 23, 5, 'Que canchera!'),
(default, 23, 3, 'uwu'),
(default, 23, 1, 'Sofi kawai'),
(default, 23, 2, 'Aesthetic'),
(default, 24, 3, 'Que lindo'),
(default, 24, 2, 'Practico'),
(default, 24, 5, 'Lo recomiendo'),
(default, 24, 4, 'Van a sacar mas modelos?'),
(default, 25, 1, 'Love this product'),
(default, 25, 2, 'Hay descuento para jubilados?'),
(default, 25, 3, 'Mi personaje fav!'),
(default, 25, 5, 'Me recuerda a mi niñez'),
(default, 26, 1, 'Que copado!'),
(default, 26, 2, 'Si lo compro ahora, llega para navidad?'),
(default, 26, 4, 'No puedo esperar a que llegue'),
(default, 26,3, 'Mi amiga sofia lo ama');