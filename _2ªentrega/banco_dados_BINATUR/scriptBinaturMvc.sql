CREATE DATABASE binaturmvc;

desc clientes;

select * from clientes;

create table clientes (
id_clientes int auto_increment,
nome varchar(100) not null,
fone varchar(15)not null,
email varchar(100) not null,
primary key (id_clientes)
) default charset = utf8mb4;

