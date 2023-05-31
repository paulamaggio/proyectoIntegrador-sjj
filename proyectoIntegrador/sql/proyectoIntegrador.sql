drop schema proyectoIntegrador;
create database proyectoIntegrador ;
use proyectoIntegrador ;

CREATE TABLE usuarios( 
id INT UNSIGNED PRIMARY KEY auto_increment, 
email VARCHAR(200) NOT NULL UNIQUE,
contrasena VARCHAR(250) NOT NULL,
fotoPerfil VARCHAR(300),
fecha DATE,
dni INT not null,
createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
deletedAt  TIMESTAMP null
);

create table productos(
id INT UNSIGNED PRIMARY KEY auto_increment,
idUsuario int unsigned not null,
foreign key (idUsuario) references usuarios(id),
nombreProducto varchar(250) not null,
fotoProducto varchar(1250) not null,
descripcion varchar(400) not null,
createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
deletedAt  TIMESTAMP null
);

create table comentarios(
id INT UNSIGNED PRIMARY KEY auto_increment,
idPost int unsigned,
foreign key (idPost) references productos(id),
idUsuario int unsigned,
foreign key (idUsuario) references usuarios(id),
comentario varchar(400) not null, 
createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
deletedAt  TIMESTAMP null
);

insert into usuarios(id,email,contrasena,fotoPerfil,fecha,dni)
values (default, "juanneira@gmail.com", "juan_neira", "/images/users/foto_jeremias.jpg", '2003-10-08', 45978253),
(default, "bocapasion@gmail.com", "bocapasion", "/images/users/bocapasion.jpg", '2003-10-08', 45212253),
(default, "sofimaggio@gmail.com", "sofimaggio", "/images/users/sofimaggio.jpg", '2003-10-08', 45212253),
(default, "lolo_123@gmail.com", "lolo_123", "/images/users/lolo_123.jpg", '2003-10-08', 46212563),
(default, "justivergara@gmail.com", "justivergara", "/images/users/justivergara.jpg", '2003-10-08', 4512253);

insert into productos(id, idUsuario, nombreProducto, fotoProducto, descripcion)
values (default, 1, "I will be right here", '/images/products/remeraCortaET.jpg', "Remera con frase de ET, color celeste"),
(default, 2, "ET Long Sleeve", '/images/products/remeraLargaET.jpg', "Remera con frase de ET, manga larga, color azul"),
(default, 3, "Peluche ET con camperita", '/images/products/pelucheETcamperita.jpg', "Peluche de ET para decorar o jugar con el"),
(default, 4, "Peluche ET con corazon", '/images/products/pelucheETcorazon.jpg', "Peluche del 40 aniversario de ET"),
(default, 5, "Peluche ET en bata", '/images/products/pelucheETbata.jpg', "Peluche de ET con bata, super suave y tierno"),
(default, 1, "Set de vasos de shot de ET", '/images/products/shotsET.jpg', "Vasos de shot del aniversario 40 de ET"),
(default, 2, "Pin The extra-terrestrial", '/images/products/pinET.jpg', "Pin coleccionable de la tienda del mejor extraterestre"),
(default, 3, "Magnet I love ET", '/images/products/imanILET.jpg', "Iman para decorar tu heladera de ET"),
(default, 4, "Magnet Be Good", '/images/products/imanBeGoodET.jpg', "Iman para decorar tu heladera de ET"),
(default, 5, "ET Wallet", '/images/products/billeteraET.jpg', "Billetera de ET"),
(default, 1, "ET Mug", '/images/products/tazaET.jpg', "Taza con doble diseño de ET"),
(default, 2, "ET Key Ring", '/images/products/llaveroETcamperita.jpg', "Llavero de ET con la figura de ET en 3D, para decorar tus llaves"),
(default, 3, "Peluche ET Bebe",'/images/products/pelucheETbebe.jpg', "Peluche super suave y tierno de ET");

insert into comentarios(id, idPost, idUsuario, comentario) 
values(default, 1, 2, 'Que linda remeraa!'),
(default, 1, 4, 'Me encanta el color'),
(default, 1, 3, 'ET es mi pelicula favorita'),
(default, 1, 5, 'Tienen buzos?'),
(default, 2, 3, 'Jajajaj es muy mi tio.'),
(default, 2, 1, 'Van a sacar mas modelos manga larga?'),
(default, 2, 4, 'Recomiendo este producto'),
(default, 2, 5, 'Excelente calidad'),
(default, 3, 4, 'Mi amiga tiene el mismo!'),
(default, 3, 2, 'Puedo ponerle la nueva camiseta de boca?'),
(default, 3, 1, 'Hay mas colores?'),
(default, 3, 3, 'Cupido tiro la flecha'),
(default, 4, 5, 'Quiero uno'),
(default, 4, 1, 'Imagine all the people!'),
(default, 4, 2, 'Mi amiga justice quiere uno!'),
(default, 4, 5, 'Hacen canje?'),
(default, 5, 1, 'Se le puede sacar la bata?'),
(default, 5, 4, 'Tienen fundas de ET?'),
(default, 5, 2, 'Es perfecto para mi abuelo'),
(default, 5, 5, 'Amo las cookies'),
(default, 6, 1, 'El precio incluye el envio?'),
(default, 6, 2, 'Se puede pagar en cuotas?'),
(default, 6, 4, 'Ame'),
(default, 6, 5, 'Odie'),
(default, 7, 1, 'Llore'),
(default, 7, 3, 'Excelente calidad, voy a pedir 15 mas'),
(default, 7, 4, 'Esta genial'),
(default, 7, 5, 'Indispensable para la vuelta a clases'),
(default, 8, 1, 'Hermoso'),
(default, 8, 2, 'Ahora mi mochila es la envidia de todos'),
(default, 8, 3, 'El favorito de mis hijos'),
(default, 8, 4, 'Mi pin favorito'),
(default, 9, 3, 'Me encanto'),
(default, 9, 2, 'Cotidiano'),
(default, 9, 1, 'De chiquita siempre quise uno'),
(default, 9, 5, 'Es muy lindo'),
(default, 10, 5, 'Que canchera!'),
(default, 10, 3, 'uwu'),
(default, 10, 1, 'Sofi kawai'),
(default, 10, 2, 'Aesthetic'),
(default, 11, 3, 'Que lindo'),
(default, 11, 2, 'Practico'),
(default, 11, 5, 'Lo recomiendo'),
(default, 11, 4, 'Van a sacar mas modelos?'),
(default, 12, 1, 'Love this product'),
(default, 12, 2, 'Hay descuento para jubilados?'),
(default, 12, 3, 'Mi personaje fav!'),
(default, 12, 5, 'Me recuerda a mi niñez'),
(default, 13, 1, 'Que copado!'),
(default, 13, 2, 'Si lo compro ahora, llega para navidad?'),
(default, 13, 4, 'No puedo esperar a que llegue'),
(default, 13,3, 'Mi amiga sofia lo ama');
