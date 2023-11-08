CREATE DATABASE binaturmvc;

desc cadastro;

drop table clientes;

select * from cadastro;

create table cadastro (
id_cliente int auto_increment,
nome varchar(100) not null,
fone varchar(15)not null,
email varchar(100) not null,
primary key (id_cliente)
) default charset = utf8mb4;

