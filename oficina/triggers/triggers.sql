
create trigger nome
before/after insert/delete/update on tabela
for each row (para cada linha)
begin -> inicio
    qualquer comando sql
end -> fim

create table usuario(
    idusuario int primary key auto_increment,
    nome varchar(30),
    login varchar(30),
    senha varchar(100)
);

create table bkp_usuario(
    idbackup int primary key auto_increment,
    idusuario int,
    nome varchar(30),
    login varchar(30)
);

-- criando a trigger

delimiter $

create trigger backup_user
before delete on usuario
for each row
begin
    insert into bkp_usuario values(null,old.idusuario, old.nome, old.login);
end
$

insert into usuario values(null, 'Maria', 'maria', '123456');
insert into usuario values(null, 'Helena', 'helena', '654321');

delete from usuario where idusuario = 1;

-- comunicação entre bancos

create database loja;

use loja;

create table produto(
    idproduto int primary key auto_increment,
    nome varchar(30),
    valor float(10,2)
);

create database backup;

use backup;

create table bkp_produto(
    idbkp int primary key auto_increment,
    idproduto int,
    nome varchar(30),
    valor float(10,2)
);

insert into backup.bkp_produto values(null, 1000, 'teste', 0.0);

delimiter $

create trigger backup_produto
before insert on produto
for each row
begin
    insert into backup.bkp_produto values(null, new.idproduto, new.nome, new.valor);
end
$

delimiter ;

insert into produto values(null, 'livro modelagem', 50.00);
insert into produto values(null, 'livro BI', 100.00);
insert into produto values(null, 'livro SQL', 150.00);
insert into produto values(null, 'livro POO', 200.00);

delimiter $

create trigger backup_produto_del
before delete on produto
for each row
begin
    insert into backup.bkp_produto values(null, old.idproduto, old.nome, old.valor);
end
$

delimiter ;

delete from produto where idproduto = 2;

drop trigger backup_produto;

delimiter $

create trigger backup_produto
after insert on produto
for each row
begin
    insert into backup.bkp_produto values(null, new.idproduto, new.nome, new.valor);
end
$

delimiter ;

insert into produtos values(null, 'livro PHP', 250.00);

alter table backup.bkp_produto
add evento char(1);

drop trigger backup_produto_del;

delimiter $

create trigger backup_produto_del
before delete on produto
for each row
begin
    insert into backup.bkp_produto values(null, old.idproduto, old.nome, old.valor,'d');
end
$

delimiter ;

delete from produto where idproduto = 4;

drop trigger backup_produto;

delimiter $

create trigger backup_produto
after insert on produto
for each row
begin
    insert into backup.bkp_produto values(null, new.idproduto, new.nome, new.valor,'i');
end
$

delimiter ;

insert into produto VALUES(null, 'livro java', 300.00);

delete from produto where idproduto = 6;

-- trigger de auditoria

create database loja;

use loja;

create table produto(
    idproduto int primary key auto_increment,
    nome varchar(30),
    valor float(10,2)
);

insert into produto values(null, 'livro modelagem', 50.00);
insert into produto values(null, 'livro BI', 100.00);
insert into produto values(null, 'livro SQL', 150.00);
insert into produto values(null, 'livro POO', 200.00);

create database backup;

use backup;

create table bkp_produto(
    idbackup int primary key auto_increment,
    idproduto int,
    nome varchar(30),
    valor_original float(10,2),
    valor_alterado float(10,2),
    data datetime,
    usuario varchar(30),
    evento char(1)
);

delimiter $

create trigger audit_prod
after update on produto
for each row
begin
    insert into backup.bkp_produto values(null, old.idproduto, old.nome, old.valor, new.valor, now(), current_user(), 'U');
end
$

delimiter ;

update produto set valor = 250.00 where idproduto = 4;