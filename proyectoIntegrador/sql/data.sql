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
values (default, "jeregomez@gmail.com", "Jeremias123", "/images/users/foto_jeremias.jpg", 13/4/2003, 45978253)

