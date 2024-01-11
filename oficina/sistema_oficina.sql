/* sistema oficina*/

create table cliente(
    id_cliente int primary key auto_increment,
    nome varchar(30) not null,
    sexo enum('M', 'F'),
    id_carro int unique
);

create table telefone(
    id_telefone int primary key auto_increment,
    tipo enum('cel', 'res', 'com'),
    numero varchar(30) not null,
    id_cliente int
);

create table marca(
    id_marca int primary key auto_increment,
    marca varchar(30) unique
);

create table carro(
    id_carro int primary key auto_increment,
    modelo varchar(30) not null,
    placa varchar(8) not null unique,
    id_marca int
);

create table cor(
    id_cor int primary key auto_increment,
    cor varchar(30) unique
);

create table carro_cor(
    id_carro int,
    id_cor int,
    primary key(id_carro, id_cor)
);

alter table telefone add constraint fk_telefone_cliente foreign key(id_cliente) references cliente(id_cliente);

alter table carro add constraint fk_carro_marca foreign key(id_marca) references marca(id_marca);

alter table carro_cor add constraint fk_cor foreign key(id_cor) references cor(id_cor);

alter table carro_cor add constraint fk_carro foreign key(id_carro) references carro(id_carro);

alter table cliente add constraint fk_cliente_carro foreign key(id_carro) references carro(id_carro);


INSERT INTO cliente (nome, sexo, id_carro)
VALUES
    ('John Doe', 'M', 1),
    ('Jane Smith', 'F', 2),
    ('Michael Johnson', 'M', 3),
    ('Emily Davis', 'F', 4),
    ('Robert Wilson', 'M', 5),
    ('Sophia Brown', 'F', 6),
    ('William Miller', 'M', 7),
    ('Olivia Taylor', 'F', 8),
    ('David Anderson', 'M', 9),
    ('Emma Martinez', 'F', 10);


INSERT INTO telefone (tipo, numero, id_cliente)
VALUES
    ('cel', '123456789', 1),
    ('res', '987654321', 2),
    ('com', '555555555', 3),
    ('cel', '999999999', 4),
    ('res', '111111111', 5),
    ('com', '777777777', 6),
    ('cel', '444444444', 7),
    ('com', '123456789', 3),
    ('cel', null, 4),
    ('res', '987654321', 5),
    ('com', '159753456', 6),
    ('cel', '354621786', 7),
    ('res', '888888888', 8),
    ('com', '222222222', 9),
    ('cel', '666666666', 10);


INSERT INTO marca (marca)
VALUES
    ('Brand A'),
    ('Brand B'),
    ('Brand C'),
    ('Brand D'),
    ('Brand E'),
    ('Brand F'),
    ('Brand G'),
    ('Brand H'),
    ('Brand I'),
    ('Brand J');


INSERT INTO carro (modelo, placa, id_marca)
VALUES
    ('Model X', 'ABC123', 1),
    ('Model Y', 'DEF456', 2),
    ('Model Z', 'GHI789', 3),
    ('Model A', 'JKL012', 4),
    ('Model B', 'MNO345', 5),
    ('Model C', 'PQR678', 6),
    ('Model D', 'STU901', 7),
    ('Model E', 'VWX234', 8),
    ('Model F', 'YZA567', 9),
    ('Model G', 'BCD890', 10);


INSERT INTO cor (cor)
VALUES
    ('Red'),
    ('Blue'),
    ('Green'),
    ('Yellow'),
    ('Orange'),
    ('Purple'),
    ('Pink'),
    ('Gray'),
    ('Brown'),
    ('Black');


INSERT INTO carro_cor (id_carro, id_cor)
VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5),
    (6, 6),
    (7, 7),
    (8, 8),
    (9, 9),
    (10, 10);


