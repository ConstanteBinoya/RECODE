-- CRIANDO O BD - BINATUR:

create database binatur
default character set utf8mb4
default collate utf8mb4_general_ci;

-- FIM CRIANDO O BD - BINATUR.
-- ===================================================================================================================================================

-- ORDEM ESTRATÉGICA À CRIAÇÃO  DAS TABELAS DO BD BINATUR:

-- Tabela-Mãe
create table cliente (
cpf varchar(15) not null,
nome varchar(50) not null,
sobrenome varchar(100) not null,
telefone varchar(15) not null,
email varchar(100) not null,
data_nascimento date not null,
primary key (cpf)
) default charset = utf8mb4;

-- Tabela Filha-Direta
create table endereco_cliente (
cpf_cliente varchar(15) not null,
cep varchar(12) not null,
logradouro varchar(100) not null,
numero varchar(10) not null,
complemento varchar(200) null,
bairro varchar(30) not null,
cidade varchar(30) not null,
estado varchar(30) not null,
pais varchar(20) not null,
primary key (cpf_cliente, cep),
foreign key (cpf_cliente) references cliente(cpf)
) default charset = utf8mb4;

-- Tabela-Mãe
create table viagem (
id_viagem int not null auto_increment,
origem varchar(50) not null,
destino varchar(50) not null,
data_partida date not null,
data_chegada date not null,
preco decimal(10,2) not null,
primary key (id_viagem)
) default charset = utf8mb4;

-- Tabela Filha-Direta
create table viagem_cliente (
cpf_cliente varchar(15) not null,
id_viagem int not null,
primary key (cpf_cliente, id_viagem),
foreign key (cpf_cliente) references cliente(cpf),
foreign key (id_viagem) references viagem(id_viagem)
) default charset = utf8mb4;

-- Tabela-Mãe
create table tipo_transporte (
id_transporte int not null auto_increment,
aereo boolean not null,
maritmo boolean not null,
rodoviario boolean not null,
ferroviario boolean not null,
primary key (id_transporte)
) default charset = utf8mb4;

-- Tabela Filha-Indireta
create table viagem_tipo_transporte (
id_viagem int not null,
id_transporte int not null,
primary key (id_viagem, id_transporte),
foreign key (id_viagem) references tipo_transporte(id_transporte),
foreign key (id_transporte) references viagem(id_viagem)
) default charset = utf8mb4;

-- Tabela-Mãe
create table categoria_quarto (
id_quarto int not null auto_increment,
standard boolean not null,
luxo boolean not null,
premeum boolean not null,
conjugado boolean not null,
animal_estimacao boolean not null,
qtd_quarto int not null,
primary key (id_quarto)
) default charset = utf8mb4;

-- Tabela-Mãe
create table hospedagem (
id_hospedagem int not null auto_increment,
qtd_pessoas int not null,
nome_hotel varchar(30) not null,
chekin datetime not null,
chekout datetime not null,
preco decimal(10,2) not null,
primary key (id_hospedagem)
) default charset = utf8mb4;

-- Tabela Filha-Direta
create table cate_quarto_hosp (
id_quarto int not null,
id_hospedagem int not null,
primary key (id_quarto, id_hospedagem),
foreign key (id_hospedagem) references hospedagem(id_hospedagem),
foreign key (id_quarto) references categoria_quarto(id_quarto)
) default charset = utf8mb4;

-- Tabela Filha-Direta
create table hosp_cliente (
cpf_cliente varchar(15) not null,
id_hospedagem int not null,
primary key (cpf_cliente, id_hospedagem),
foreign key (id_hospedagem) references hospedagem(id_hospedagem),
foreign key (cpf_cliente) references cliente(cpf)
) default charset = utf8mb4;

-- Tabela-Mãe
create table pacote (
id_pacote int not null auto_increment,
id_viagem int not null,
id_transporte int not null,
id_hospedagem int not null,
preco_pacote decimal(10,2) not null,
primary key (id_pacote)
) default charset = utf8mb4;
-- Fim tabelas-Pais

-- Tabela Filha-Indireta
create table pacote_cliente (
cpf_cliente varchar(15) not null,
id_pacote int not null,
primary key (cpf_cliente, id_pacote),
foreign key (id_pacote) references pacote(id_pacote),
foreign key (cpf_cliente) references cliente(cpf)
) default charset = utf8mb4;

-- Tabela Filha-Indireta
create table pacote_viagem (
id_viagem int not null,
id_pacote int not null,
primary key (id_viagem, id_pacote),
foreign key (id_pacote) references pacote(id_pacote),
foreign key (id_viagem) references viagem(id_viagem)
) default charset = utf8mb4;

-- Tabela Filha-Indireta
create table pacote_hospedagem (
id_hospedagem int not null,
id_pacote int not null,
primary key (id_hospedagem, id_pacote),
foreign key (id_pacote) references pacote(id_pacote),
foreign key (id_hospedagem) references hospedagem(id_hospedagem)
) default charset = utf8mb4;

-- Tabela Filha-Direta
create table aereo_reserva (
id_reserva_voo int not null auto_increment,
cpf_cliente varchar(15) not null,
id_transporte int not null,
num_voo int not null,
num_assento varchar(5) not null unique,
data_embarque date not null,
hora_embarque datetime not null,
primary key (id_reserva_voo),
foreign key (cpf_cliente) references cliente(cpf),
foreign key (id_transporte) references tipo_transporte(id_trasnporte)
) default charset = utf8mb4;

-- Tabela Filha-Direta
create table maritmo_reserva (
id_reserva_cruzeiro int not null auto_increment,
cpf_cliente varchar(15) not null,
id_transporte int not null,
nome_cruzeiro int not null,
num_cabine varchar(5) not null unique,
data_embarque date not null,
hora_embarque datetime not null,
primary key (id_reserva_cruzeiro),
foreign key (cpf_cliente) references cliente(cpf),
foreign key (id_transporte) references tipo_transporte(id_trasnporte)
) default charset = utf8mb4;

-- Tabela Filha-Direta
create table rodoviario_reserva (
id_reserva_onibus int not null auto_increment,
cpf_cliente varchar(15) not null,
id_transporte int not null,
num_onibus int not null,
num_assento varchar(5) not null unique,
data_embarque date not null,
hora_embarque datetime not null,
primary key (id_reserva_onibus),
foreign key (cpf_cliente) references cliente(cpf),
foreign key (id_transporte) references tipo_transporte(id_trasnporte)
) default charset = utf8mb4;

-- Tabela Filha-Direta
create table ferroviario_reserva (
id_reserva_trem int not null auto_increment,
cpf_cliente varchar(15) not null,
id_transporte int not null,
num_trem int not null,
num_assento varchar(5) not null unique,
data_embarque date not null,
hora_embarque datetime not null,
primary key (id_reserva_trem),
foreign key (cpf_cliente) references cliente(cpf),
foreign key (id_transporte) references tipo_transporte(id_trasnporte)
) default charset = utf8mb4;

-- FIM  ORDEM ESTRATÉGICA À CRIAÇÃO  DAS TABELAS DO BD BINATUR.
-- ===================================================================================================================================================

-- ALIMENTANDO TABELAS PARA TESTE:

-- Para fins de teste serão cadastrados 6 clientes fictícios:
insert into cliente   
(cpf, nome, sobrenome, telefone, email, data_nascimento)
values
('014.279.577-21', 'Constante', 'Binoya', '(81)9.9670-1523', 'constantebinoyaz1@gmail.com', '1989-04-26'),
('314.970.587-01', 'Joaquim', 'José da Silva Chavier', '(83)3471-2156', 'tiradentesemcabeca@outlook.com', '1990-05-15'),
('911.289.397-44', 'João', 'Cabral de Melo Neto', '(61)3487-5501', 'morte_vida_severina@bol.com.br', '1970-03-12'),
('546.279.546-36', 'Pedro', 'Holmes', '(11)3491-4417', 'elementar_watson@gmail.com', '1959-12-12'),
('015.287.633-98', 'Monkey', 'D. Luffy', '(21)3497-2215', 'onepeace_ismy@hotmail.com', '2003-09-11'),
('917.386.288-54', 'Ahab', 'Capitão', '(76)9.8924-8550', 'mob_dick_papaperna@gmail.com.br', '1982-06-25');

insert into endereco_cliente
(cpf_cliente, cep, logradouro, numero, complemento, bairro, cidade, estado, pais)
values
('014.279.577-21', '34518-200', 'Rua do Jacarandá', '23-A', 'Ali perto de lá', 'Brasilovics', 'Binoyopolis','Pernambuco', 'Brazöwya'),
('314.970.587-01', '23517-200', 'Avenida do Jabuticabal', '45', 'Virando a esquina', 'Piedade', 'Itaquaquecetuba','São Paulo', 'Brazöwya'),
('911.289.397-44', '83513-400', 'Beco do sai Quieto', '235', 'Logo ali', 'piedade', 'Rio doce','Paraiba', 'Brazöwya'),
('546.279.546-36', '43510-900', 'Travessa da Agonia', '200-C', 'Vai indo e vira', 'Dois carneiros', 'Apipucos','Rio Grande do Norte', 'Brazöwya'),
('015.287.633-98', '23511-500', 'Alameda dos Anos', '212-B', 'seguindo a primeira estrela da manhã', 'Going Marry', 'Red Line','Rio Grande do Sul', 'Brazöwya'),
('917.386.288-54', '53090-330', 'Rua walfrido de Zazaserto', '388', 'Bloco D, apto 208', 'Janga', 'Paulista','Pernambuco', 'Brazöwya');

-- Dos 6 clientes cadastrados apenas 4 realizarão viagens, sendo 2 viagens (apenas deslocamento) e 2 viagens + hospedagem que geram um pacote:
insert into viagem
(origem, destino, data_partida, data_chegada, preco)
values
('Recife', 'São Paulo', '2020-12-01', '2020-12-02', 950.00),
('Salvador', 'Paulo Afonso', '2021-02-15', '2021-02-16', 1500.00),
('Rio de janeiro', 'Jalapão', '2023-04-26', '2023-04-26', 450.00),
('Acre', 'Canoa Quebrada', '2023-11-23', '2023-11-25', 2700.00);
-- ('Aracaju', 'Olinda', '2023-07-30', '2023-07-30', 600.00);

-- Estes são os clientes que apenas viajarão (deslocamento puro):
insert into viagem_cliente
(cpf_cliente, id_viagem)
values
('014.279.577-21', 1),
('314.970.587-01', 2),
('015.287.633-98',3),
('917.386.288-54', 4);

-- Tipo do trtansporte disponível assinalado por VERDADEIRO (true) = '1' ou FALSO 9false) '0':
insert into tipo_transporte
(aereo, maritmo, rodoviario, ferroviario)
values
(0, 0, 1, 0),
(0, 1, 0, 0),
(1, 0, 0, 0),
(0, 0, 0, 1);

-- Elo entre viagem e tipo de transporte:
insert into viagem_tipo_transporte
(id_viagem, id_transporte)
values
(1, 1),
(2, 2),
(3, 3),
(4, 4);

-- Dados sobre os detalhes do quarto (para melhor compreensão analise o DICIONÁRIO):
insert into categoria_quarto
(standard, luxo, premeum, conjugado, animal_estimacao, qtd_quarto)
values
(0, 0, 1, 1, 1, 2),
(1, 0, 0, 0, 0, 1),
(0, 1, 1, 1, 1, 2),
(1, 1, 1, 0, 1, 3);

-- detalhes sobre a hospedagem:
insert into hospedagem
(qtd_pessoas, nome_hotel, chekin, chekout, preco)
values
(2, 'Dolphin Hotel', '2020-12-02 14:00:00', '2020-12-20 12:00:00', 2936.50),
(1, 'Pinewood Motel', '2021-02-16 15:30:00', '2021-02-19 11:00:00', 400.00),
(4, 'Waldorf Astoria', '2023-04-26 16:45:00', '2023-05-15 10:15:00', 5750.00),
(6, 'Overlook Hotel', '2023-11-25 13:00:00', '2023-11-28 09:30:00', 3000.00);
-- (1, 'Beates Motel', '2023-07-30 18:00:00', '2023-07-31 14:00:00', 250.00);

-- Elo entre a categoria do quarto e a hospedagem:
insert into cate_quarto_hosp
(id_quarto, id_hospedagem)
values
(1, 1),
(2, 2),
(3, 3),
(4, 4);

-- Elo entre a hospedagem e o cliente que a adiquiriu:
insert into hosp_cliente
(cpf_cliente, id_hospedagem)
values
('911.289.397-44', 1),
('546.279.546-36', 2),
('015.287.633-98', 3),
('917.386.288-54', 3);

-- Na compre de uma viagem (deslocamento) e uma hospedagem em conjunto existe a possibilidade de até 30% de desconto e isto caracteriza um pacote:
insert into pacote
(id_viagem, id_transporte, id_hospedagem, preco_pacote)
values
(3, 3, 3, 4340.00),
(4, 4, 4, 3990.00);

-- Elo entre pacote e cliente:
insert into pacote_cliente
(cpf_cliente, id_pacote)
values
('015.287.633-98', 1),
('917.386.288-54', 2);

-- Elo entre pacote e a viagem que o compõe: 
insert into pacote_viagem
(id_viagem, id_pacote)
values
(3, 1),
(4, 2);

-- Elo entre pacote e a hospedagem que o compõe:
insert into pacote_hospedagem
(id_hospedagem, id_pacote)
values
(3, 1),
(4, 2);

-- Detalhes sobre a reserva do voo:
insert into aereo_reserva
(cpf_cliente, id_transporte, num_voo, num_assento, data_embarque, hora_embarque)
values
('015.287.633-98', 3, 747, '26-A', '2023-04-26', '03:00:00');

-- Detalhes sobre a reserva do cruzeiro:
insert into maritmo_reserva
(cpf_cliente, id_transporte, nome_cruzeiro, num_cabine, data_embarque, hora_embarque)
values
('314.970.587-01', 2, 'Charlotte', '10-sup', '2021-02-15', '10:30:00');

-- Detalhes sobre a reserva do onibus:
insert into rodoviario_reserva
(cpf_cliente, id_transporte, num_onibus, num_assento, data_embarque, hora_embarque)
values
('014.279.577-21', 1, 1001, '12-D', '2020-12-01', '12:45:00');

-- Detalhes sobre a reserva do trem:
insert into ferroviario_reserva
(cpf_cliente, id_transporte, num_trem, num_assento, data_embarque, hora_embarque)
values
('917.386.288-54', 4, '001', '44-3-E', '2023-11-23', '20:30:00');

-- FIM ALIMENTANDO TABELAS PARA TESTE.
-- ===================================================================================================================================================

-- ÁREA DE TESTES (dentro do que consegui aprender até agora e o que eu achei mais lógico a uma agência de viagens):

-- Consultar todos os itens de uma tabela:
select * from endereco_cliente;
select * from cliente;
select * from viagem;
select * from viagem_cliente;
select * from tipo_transporte;
select * from viagem_tipo_transporte;
select * from categoria_quarto;
select * from hospedagem;
select * from cate_quarto_hosp;
select * from hosp_cliente;
select * from pacote;
select * from pacote_cliente;
select * from pacote_viagem;
select * from pacote_hospedagem;
select * from aereo_reserva;
select * from maritmo_reserva;
select * from rodoviario_reserva;
select * from ferroviario_reserva;
-- ---------------------------------------------------------------------------------------------------------------------------------------------------

-- Consultar a estrutura de uma tabela:
desc cliente;
desc endereco_cliente;
desc viagem;
desc viagem_cliente;
desc tipo_transporte;
desc viagem_tipo_transporte;
desc categoria_quarto;
desc hospedagem;
desc cate_quarto_hosp;
desc hosp_cliente;
desc pacote;
desc pacote_cliente;
desc pacote_viagem;
desc pacote_hospedagem;
desc aereo_reserva;
desc maritmo_reserva;
desc rodoviario_reserva;
desc ferroviario_reserva;
-- ---------------------------------------------------------------------------------------------------------------------------------------------------

-- Comandos retificadores genéricos:
use binatur;

alter table pacote
modify preco_pacote decimal(10, 2);

UPDATE cliente
SET data_nascimento = '1982-06-25'
WHERE cpf = '917.386.288-54';

alter table cliente
add data_nascimento date not null;

update hosp_cliente 
set id = '2020-12-13'
where origem = 'Recife' and destino = 'São Paulo' and data_chegada = '2020-12-01';

-- drop table hospedagem; -- CUIDADO!!!

-- drop database binatur; -- CUIDADO!!!

-- alter table hospedagem drop column quarto; -- CUIDADO!!!

-- truncate table endereco_cliente; -- CUIDADO!!!

-- ---------------------------------------------------------------------------------------------------------------------------------------------------

-- Consultar o cliente através do ID da viagem (neste caso saõ apenas 2 possibilidades [de 1 a 2]):
select c.* 
from cliente c
inner join viagem_cliente vc on c.cpf = vc.cpf_cliente
where vc.id_viagem = 2;
-- ---------------------------------------------------------------------------------------------------------------------------------------------------

-- Consultar o endereço pelo CPF do cliente ('014.279.577-21','314.970.587-01','911.289.397-44','546.279.546-36','015.287.633-98', '917.386.288-54'):
select * from endereco_cliente
where cpf_cliente = '314.970.587-01';

-- ---------------------------------------------------------------------------------------------------------------------------------------------------

-- Consultar a viagem pelo CPF do cliente ('014.279.577-21', '314.970.587-01','015.287.633-98', '917.386.288-54'):
select v.*
from viagem v
inner join viagem_cliente vc on v.id_viagem = vc.id_viagem
where vc.cpf_cliente = '917.386.288-54';
-- ---------------------------------------------------------------------------------------------------------------------------------------------------
-- Consulta viagens realizadas dentro de um intervalo específico de datas (intervalo possível: 2020-01-01 à 2023-12-31):
select * from viagem
where data_partida between '2020-01-01' and '2021-02-01';

-- TRADUZINDO: Selecione tudo ena tabela "viagem" onde "data_partida" (campo desejado) esteja entre data "x" e data "y".
-- ---------------------------------------------------------------------------------------------------------------------------------------------------

-- Consultar quais tipos de transportes disponiveis no preocesso da empresa:
select * from tipo_transporte;

-- ---------------------------------------------------------------------------------------------------------------------------------------------------

-- Consultar todas as reservas de voos para um cliente específico ('014.279.577-21','314.970.587-01',['015.287.633-98'], '917.386.288-54'):
select * from aereo_reserva where cpf_cliente = '015.287.633-98';

-- ---------------------------------------------------------------------------------------------------------------------------------------------------

-- Consultar todas as reservas de cruzeiros para um cliente específico ('014.279.577-21',['314.970.587-01'],'015.287.633-98', '917.386.288-54'):
select * from maritmo_reserva where cpf_cliente = '314.970.587-01';

-- ---------------------------------------------------------------------------------------------------------------------------------------------------

-- Consultar todas as reservas de ônibus para um cliente específico ('014.279.577-21','314.970.587-01',['015.287.633-98'], '917.386.288-54'):
select * from rodoviario_reserva where cpf_cliente = '015.287.633-98';

-- ---------------------------------------------------------------------------------------------------------------------------------------------------

-- Consultar todas as reservas de trens para um cliente específico ('014.279.577-21','314.970.587-01','015.287.633-98', ['917.386.288-54']):
select * from ferroviario_reserva where cpf_cliente = '917.386.288-54';

-- ---------------------------------------------------------------------------------------------------------------------------------------------------

-- Consulta que tipo de transporte realizará determinada viagem (três tabelas envolvidas: viagem, viagem_tipo_transporte e tipo_transporte)

select
             -- Na primeira parte da consulta, estamos selecionando as colunas que desejamos incluir no resultado;
    v.id_viagem,   
    v.origem,      -- É uma boa prática abreviar o nome das tabelas quendo for referenciá-las em conjunto aos seus itens:
    v.destino,     -- EX:
    t.aereo,       --   Na área SELECT estamos dizendo ao computador: SELECIONE o ITEM "X" da TABELA "y".;
    t.maritmo,     --   Neste caso teriamos: SELECT VIAGEM.IDVIAGEM (assim já estaria correto, entretanto, podemos abreviar a tabela);
    t.rodoviario,  --   O resultado da abreviação seria o seguinte: SELECT V.ID_VIAGEM;
    t.ferroviario
from              -- FROM: É uma cláusula SQL que indica a tabela ou tabelas das quais você deseja recuperar dados (FORM = DE ou DA).
    viagem v       -- O nome da tabela que deseja recuperar dados - consultar - e o "apelido", "aliás" ou "abreviação" que usará para ela.
                   -- neste caso treiamos a seguinte tradução: FROM VIAGEM V = DE VIAGEM que eu chamarei de "V".
                   
inner join         -- Combina dados de DUAS ou MAIS tabelas com uma CONDIÇÃO ESPECÍFICA descrita logo a baixo;
    viagem_tipo_transporte vt on v.id_viagem = vt.id_viagem   -- "viagem_tipo_transporte" é o nome da tabela com a qual você está tentando combinar a tabela viagem;
															  -- "vt" é um apelido dado à tabela "viagem_tipo_transporte";
                                                              -- "ON" é usado para especificar a condição pela qual as duas tabelas estão sendo combinadas;
                                                              -- "v.id_viagem" é uma coluna da tabela viagem que está sendo usada como referência para a combinação;
                                                              -- "vt.id_viagem" é uma coluna da tabela viagem_tipo_transporte que está sendo usada como referência para a combinação.
				   -- TRADUZINDO: Combine os dados da tabela viagem (apelidada como v) com os dados da tabela viagem_tipo_transporte 
                   -- (apelidada como vt) onde as colunas id_viagem em ambas as tabelas são iguais."                                         
inner join
    tipo_transporte t on vt.id_transporte = t.id_transporte;
-- ---------------------------------------------------------------------------------------------------------------------------------------------------

-- Consultar a viagem e o tipo de transporte pelo CPF do cliente ('014.279.577-21','314.970.587-01','015.287.633-98', '917.386.288-54'): 
select
    v.id_viagem,
    v.origem,
    v.destino,
    t.aereo,
    t.maritmo,
    t.rodoviario,
    t.ferroviario
from viagem v
inner join viagem_tipo_transporte vt on v.id_viagem = vt.id_viagem
inner join tipo_transporte t on vt.id_transporte = t.id_transporte
inner join viagem_cliente vc on v.id_viagem = vc.id_viagem
where vc.cpf_cliente = '015.287.633-98'; -- Substitua pelo CPF do cliente.

-- ---------------------------------------------------------------------------------------------------------------------------------------------------

-- Consultar dados do quarto pelo CPF do cliente ('911.289.397-44','546.279.546-36','015.287.633-98', '917.386.288-54'):
select c.cpf, c.nome, c.sobrenome, cq.*
from categoria_quarto cq
inner join cate_quarto_hosp cqh on cq.id_quarto = cqh.id_quarto
inner join hosp_cliente hc on cqh.id_hospedagem = hc.id_hospedagem
inner join cliente c on hc.cpf_cliente = c.cpf
where c.cpf = '911.289.397-44'; -- Substitua pelo CPF do cliente.
-- ---------------------------------------------------------------------------------------------------------------------------------------------------

-- Consultar dados da hospedagem pelo CPF do cliente ('911.289.397-44','546.279.546-36','015.287.633-98', '917.386.288-54'):
select c.cpf, c.nome, c.sobrenome, h.*
from hospedagem h
inner join hosp_cliente hc on h.id_hospedagem = hc.id_hospedagem
inner join cliente c on hc.cpf_cliente = c.cpf
where c.cpf = '015.287.633-98'; -- Substitua pelo CPF do cliente.

-- ---------------------------------------------------------------------------------------------------------------------------------------------------

-- Consultar a qual cliente pertence determinada hospedagem (neste caso são apenas 4 possibilidades [de 1 a 4]):
select h.id_hospedagem, h.nome_hotel, c.*
from cliente c
inner join hosp_cliente hc on c.cpf = hc.cpf_cliente
inner join hospedagem h on hc.id_hospedagem = h.id_hospedagem
where h.id_hospedagem = 4; -- Substitua pelo ID da hospedagem desejada.

-- ---------------------------------------------------------------------------------------------------------------------------------------------------

-- Consultar a qual cliente pertence determinado quarto (neste caso são apenas 4 possibilidades [de 1 a 4]):
select cq.id_quarto, h.id_hospedagem, h.nome_hotel, c.*
from cliente c
inner join hosp_cliente hc on c.cpf = hc.cpf_cliente
inner join cate_quarto_hosp cqh on hc.id_hospedagem = cqh.id_hospedagem
inner join categoria_quarto cq on cqh.id_quarto = cq.id_quarto
inner join hospedagem h on hc.id_hospedagem = h.id_hospedagem
where cq.id_quarto = 2; -- Substitua pelo ID do quarto desejado.

-- ---------------------------------------------------------------------------------------------------------------------------------------------------

-- Consultar detalhes de uma viagem e uma hospedagem que compõem um pacote (neste caso são apenas 2 possibilidades [de 1 e 2]):
select p.id_pacote, p.preco_pacote, v.*, h.*
from pacote p
inner join viagem v on p.id_viagem = v.id_viagem
inner join hospedagem h on p.id_hospedagem = h.id_hospedagem
where p.id_pacote = 2;

-- ---------------------------------------------------------------------------------------------------------------------------------------------------

-- Consultar detalhes da categoria do quarto em uma hospedagem e e o meio de transporte da viagem que compõem um pacote
-- (neste caso são apenas 2 possibilidades [de 1 e 2]):
select p.id_pacote, cq.*, tt.*
from pacote p
inner join categoria_quarto cq on p.id_hospedagem = cq.id_quarto
inner join viagem_tipo_transporte vtt on p.id_viagem = vtt.id_viagem
inner join tipo_transporte tt on vtt.id_transporte = tt.id_transporte
where p.id_pacote = 2;

-- ---------------------------------------------------------------------------------------------------------------------------------------------------

-- Consultar detalhes de uma viagem e uma hospedagem que compõem um pacote através do cpf do cliente, que neste caso são 2:
-- ('015.287.633-98', '917.386.288-54'):
select pc.cpf_cliente, c.nome, p.*, v.*, h.*
from pacote_cliente pc
inner join pacote p on pc.id_pacote = p.id_pacote
inner join viagem v on p.id_viagem = v.id_viagem
inner join pacote_hospedagem ph on p.id_pacote = ph.id_pacote
inner join hospedagem h on ph.id_hospedagem = h.id_hospedagem
inner join cliente c on pc.cpf_cliente = c.cpf
where pc.cpf_cliente = '917.386.288-54';

-- ---------------------------------------------------------------------------------------------------------------------------------------------------

-- Selecionar todos os pacotes de viagem:
SELECT * FROM pacote;

-- FIM ÁREA DE TESTES.
-- ===================================================================================================================================================