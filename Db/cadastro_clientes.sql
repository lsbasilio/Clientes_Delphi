CREATE DATABASE cadastro_clientes;
USE cadastro_clientes;

CREATE TABLE clientes (
	Id int NOT NULL AUTO_INCREMENT,
    Nome varchar(60) NOT NULL,
    Tipo char NOT NULL,
    Cpf_Cnpj varchar(30) NOT NULL,
    Rg_Ie varchar(20),
    Data date,
    Ativo char,
    PRIMARY KEY (Id)
);

CREATE TABLE telefones (
	Id int NOT NULL AUTO_INCREMENT,
    Ddd int NOT NULL,
    Numero varchar(15) NOT NULL,
    ClienteId int,
    PRIMARY KEY (Id),
    FOREIGN KEY (ClienteId) REFERENCES clientes(Id)
);

CREATE TABLE enderecos (
	Id int NOT NULL AUTO_INCREMENT,
    logradouro varchar(60),
    numero int,
    cep varchar(15),
    bairro varchar(30),
    cidade varchar(30),
    estado varchar(30),
    pais varchar(30),
    PRIMARY KEY (Id),
    ClienteId int,
    FOREIGN KEY (ClienteId) REFERENCES clientes(Id)
);