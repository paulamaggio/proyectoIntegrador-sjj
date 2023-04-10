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
