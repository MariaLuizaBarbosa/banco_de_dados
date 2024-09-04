create database rede_social;
use rede_social;

create table usuarios (
   id int not null auto_increment primary key,
   nome varchar(100) not null,
   email varchar(45) not null unique,
   data_criacao date
);

create table postagens (
   id int not null auto_increment primary key,
   texto varchar(255),
   data_publicacao date,
   imagem varchar(255),
   usuarios_id int not null,
   foreign key (usuarios_id) references usuarios (id)
);

create table comentarios (
   id int not null auto_increment primary key,
   texto varchar(255) not null,
   data_criacao date,
   postagens_id int not null,
   usuarios_id int not null,
   foreign key (postagens_id) references postagens (id),
   foreign key (usuarios_id) references usuarios (id)
);

create table curtidas (
   postagens_id int not null,
   usuarios_id int not null,
   primary key (postagens_id, usuarios_id),
   foreign key (postagens_id) references postagens (id),
   foreign key (usuarios_id) references usuarios (id)
);

insert into usuarios (nome, email, data_criacao) values ("Malu", "malu@senai", "2024-08-27");
insert into usuarios (nome, email, data_criacao) values ("Guigui", "guigui@senai", "2024-08-28");
insert into usuarios (nome, email, data_criacao) values ("Rahiany", "rahi@senai", "2024-08-29");
insert into usuarios (nome, email, data_criacao) values ("Gabi", "gabi@senai", "2024-08-30");
insert into usuarios (nome, email, data_criacao) values ("Victor", "vitin@senai", "2024-08-31");

select * from usuarios;

insert into postagens (texto, data_publicacao, imagem, usuario_id) values ("Victor", "vitin@senai", "2024-08-31");




