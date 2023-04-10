create database proyectoIntegrador ;
use proyectoIntegrador ;

CREATE TABLE users ( 
id INT UNSIGNED PRIMARY KEY UNIQUE, 
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
values (default, "juanneira@gmail.com", "juan_neira", "/images/users/foto_jeremias.jpg", 16/10/2003, 45978253),
(default, "bocapasion@gmail.com", "bocapasion", "/images/users/bocapasion.jpg", 6/6/2003, 45212253),
(default, "sofimaggio@gmail.com", "sofimaggio", "/images/users/sofimaggio.jpg", 6/6/2003, 45212253),
(default, "lolo_123@gmail.com", "lolo_123", "/images/users/lolo_123.jpg", 16/10/2003, 46212563),
(default, "justivergara@gmail.com", "justivergara", "/images/users/justivergara.jpg", 1/4/2004, 4512253);


create table products(
id INT UNSIGNED PRIMARY KEY UNIQUE,
nombreProducto varchar(250) not null,
descripcion varchar(400) not null,

createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
deletedAt  TIMESTAMP null
)