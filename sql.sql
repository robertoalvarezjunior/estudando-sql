insert into cliente(idcliente, nome, sexo, email, cpf) values(null,'João','M','joao@joao','12345678901'
);
insert into cliente(idcliente, nome, sexo, email, cpf) values(null,'Carlos','M','carlos@carlos','1325678901'
);
insert into cliente(idcliente, nome, sexo, email, cpf) values(null,'Ana','M',null,'89545678901'
);
insert into cliente(idcliente, nome, sexo, email, cpf) values(null,'Clara','M','clara@clara','785678901');
insert into cliente(idcliente, nome, sexo, email, cpf) values(null,'Jorge','M','jorge@jorge','23678901');

insert into cliente(idcliente, nome, sexo, email, cpf) values(null,'Julia','F',null,'88845678901'
);
insert into cliente(idcliente, nome, sexo, email, cpf) values(null,'Tiago','M','julia@julia','465678901');
insert into cliente(idcliente, nome, sexo, email, cpf) values(null,'Sara','F','sara@sara','125478901');

insert into endereco(idendereco, idcliente, rua, bairro, cidade, estado) values(null, 4, 'rua1', 'bairoo1', 'cidade1', 'MG');
insert into endereco(idendereco, idcliente, rua, bairro, cidade, estado) values(null, 1, 'rua2', 'bairro2', 'cidade2', 'RJ');
insert into endereco(idendereco, idcliente, rua, bairro, cidade, estado) values(null, 3, 'rua3', 'bairro3', 'cidade3', 'DF');
insert into endereco(idendereco, idcliente, rua, bairro, cidade, estado) values(null, 6, 'rua4', 'bairro4', 'cidade4', 'SP');
insert into endereco(idendereco, idcliente, rua, bairro, cidade, estado) values(null, 5, 'rua5', 'bairro5', 'cidade5', 'RS');
insert into endereco(idendereco, idcliente, rua, bairro, cidade, estado) values(null, 2, 'rua6', 'bairro6', 'cidade6', 'SC');

insert into endereco(idendereco, idcliente, rua, bairro, cidade, estado) values(null, 7, 'rua7', 'bairro7', 'cidade7', 'SP');
insert into endereco(idendereco, idcliente, rua, bairro, cidade, estado) values(null, 8, 'rua8', 'bairro8', 'cidade8', 'RS');
insert into endereco(idendereco, idcliente, rua, bairro, cidade, estado) values(null, 9, 'rua9', 'bairro9', 'cidade9', 'SC');

insert into telefone(idtelefone, tipo, numero, idcliente) values(null, 'cel', '123456789', 1);
insert into telefone(idtelefone, tipo, numero, idcliente) values(null, 'res', '987654321', 2);
insert into telefone(idtelefone, tipo, numero, idcliente) values(null, 'com', '456789012', 3);
insert into telefone(idtelefone, tipo, numero, idcliente) values(null, 'cel', '85678901', 4);
insert into telefone(idtelefone, tipo, numero, idcliente) values(null, 'res', '75678901', 5);
insert into telefone(idtelefone, tipo, numero, idcliente) values(null, 'com', '35678901', 6);

insert into telefone(idtelefone, tipo, numero, idcliente) values(null, 'cel', '33456789', 4);
insert into telefone(idtelefone, tipo, numero, idcliente) values(null, 'res', '46789012', 5);
insert into telefone(idtelefone, tipo, numero, idcliente) values(null, 'com', '22345678', 6);



select nome, sexo, cidade
from cliente, endereco
where idcliente = id_cliente;

select nome, sexo, idcliente, id_cliente, bairro, cidade
from cliente
inner join endereco
on idcliente = id_cliente;

select nome, sexo, idcliente, id_cliente, bairro, cidade
from cliente
inner join endereco
on idcliente = id_cliente
where sexo = 'M';

select nome, sexo, email, tipo, numero
from cliente
inner join telefone
on idcliente = id_cliente;

select cliente.nome, cliente.sexo, endereco.bairro, endereco.cidade, telefone.tipo, telefone.numero
from cliente
inner join endereco
on cliente.idcliente = endereco.id_cliente
inner join telefone
on cliente.idcliente = telefone.id_cliente;

select c.nome, c.sexo, e.bairro, e.cidade, t.tipo, t.numero
from cliente c
inner join endereco e
on c.idcliente = e.id_cliente
inner join telefone t
on c.idcliente = t.id_cliente;

create table produto(
idproduto int primary key auto_increment,
nome varchar(50) not null,
preco int
);

/* alterado a coluna */
alter table produto
change preco preco float(10,2) not null;

/* alterado o tipo da coluna */
alter table produto
modify preco float(10,2) not null;

/* adicionado uma coluna */
alter table produto
add desconto float(10,2);

/* removendo uma coluna */
alter table produto
drop column desconto;

/* removendo uma coluna na ordem especifica */
alter table produto
add column peso float(10,2) not null after nome;

select c.nome, ifnull(c.email, 'nao tem email'), e.estado, t.numero from cliente c inner join endereco e on c.idcliente = e.id_cliente inner join telefone t on c.idcliente = t.id_cliente

-- view --

create view v_relatorio as select c.nome, c.sexo, c.email, t.tipo, t.numero, e.bairro, e.cidade, e.estado from cliente c inner join telefone t on c.idcliente = t.id_cliente inner join endereco e on c.idcliente = e.id_cliente; 

select * from relatorio;

select nome, numero, estado from v_relatorio;

delimiter $
select nome, numero, estado from v_relatorio;
delimiter ;
 
-- stored procedures --

create procedure nome() begin
select * from v_relatorio;
end$

-- chamando procedure --

delimiter ;
call nome();

delimiter $
 
create procedure cad_curso(nome varchar(30), horas int(3), valor float(10,2)) begin insert into cursos values(null, nome, horas, valor); end$

delimiter ;

create procedure consulta_cursos() begin select nome as cursos from cursos; end$ 

create table vendedores(
idvendedor int primary key auto_increment,
nome varchar(30),
sexo char(2),
janeiro float(10,2),
fevereiro float(10,2),
marco float(10,2)
);

insert into vendedores values(null, 'Joao', 'M', 10000.89, 20000.55, 30000.30);
insert into vendedores values(null, 'Claudio', 'M', 3000.23, 4000.12, 5000.08);
insert into vendedores values(null, 'Carla', 'F', 5000.99, 6000.74, 7000.98);
insert into vendedores values(null, 'Carlos', 'M', 8000.00, 9000.00, 10000.00);

select max(fevereiro) as maior_fevereiro from vendedores;
select min(fevereiro) as maior_fevereiro from vendedores;

select avg(fevereiro) as media_fevereiro from vendedores;

select max(janeiro) as maior_janeiro, min(janeiro) as menor_janeiro, truncate(avg(janeiro),2) as media_janeiro from vendedores;

select sum(janeiro) as total_janeiro from vendedores;

select sexo, sum(marco) as total_marco from vendedores group by sexo;

select nome, marco from vendedores where marco = (select min(marco) from vendedores);

select nome, marco from vendedores where marco > (select avg(marco) from vendedores);
select nome, marco from vendedores where marco < (select avg(marco) from vendedores);

select nome, janeiro, fevereiro, marco, (janeiro+fevereiro+marco) as "total", truncate((janeiro+fevereiro+marco)/3,2) as "media" from vendedores;

select nome, janeiro, fevereiro, marco, (janeiro+fevereiro+marco) as "total", (janeiro+fevereiro+marco) * 0.25 as "desconto", truncate((janeiro+fevereiro+marco)/3,2) as "media" from vendedores;

create table tabela(coluna1 varchar(30), coluna2 varchar(30), coluna3 varchar(30));

alter table tabela add primary key (coluna1);

alter table tabela add coluna5 varchar(30) not null;

alter table tabela add column coluna4 varchar(30) not null unique after coluna3;

create table pessoa(id_pessoa int primary key auto_increment, nome varchar(30));

create table time(id_time int primary key auto_increment, time varchar(30), id_pessoa varchar(30));

alter table pessoa add idade int;

alter table time add foreign key (id_pessoa) references tabela(coluna1);

create table jogador(
    idjogador int primary key auto_increment,
    nome varchar(30)
);

create table times(
    idtime int primary key auto_increment,
    nometime varchar(30),
    idjogadorfk int,
    foreign key(idjogadorfk) references jogador(idjogador)
);

insert into jogador values(null, 'Jogador 1');
insert into times values(null, 'Time 1', 1);

show create table jogador;
show create table times;

create table cliente(
    id_cliente int,
    nome varchar(30) not null
);

create table telefone(
    id_telefone int,
    tipo char(3) not null,
    numero varchar(10) not null,
    id_cliente int
);

alter table cliente add constraint pk_cliente primary key(id_cliente);

alter table telefone add constraint fk_cliente_telefone foreign key(id_cliente) references cliente(id_cliente);

select constraint_schema as "banco", table_name as "tabela", constraint_name as "nome", constraint_type as "tipo" from table_constraints where constraint_schema = "comercio";

alter table telefone drop foreign key fk_cliente_telefone;

