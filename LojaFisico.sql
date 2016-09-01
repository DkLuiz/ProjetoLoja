-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.

CREATE DATABASE PLOJA;

CREATE TABLE ItensPedido (
IdProduto INT,
NumeroPedido INT,
Quantidade INT,
PRIMARY KEY(IdProduto,NumeroPedido)
);

CREATE TABLE Cliente (
IdCliente INT PRIMARY KEY,
Nome VARCHAR(65),
CPF VARCHAR(11),
DataNascimento DATE,
Sexo CHAR(1),
Email VARCHAR(80),
Senha VARCHAR(20)
);

CREATE TABLE Endereco (
IdEndereco INT PRIMARY KEY,
IdCliente INT,
CEP VARCHAR(8),
Endereco VARCHAR(200),
Numero INT,
Complemento VARCHAR(200),
Bairro VARCHAR(50),
Cidade VARCHAR(50),
UF CHAR(2),
Ativo CHAR(1),
FOREIGN KEY(IdCliente) REFERENCES Cliente (IdCliente)
);

CREATE TABLE Preco (
IdPreco INT PRIMARY KEY,
IdProduto INT,
Data DATE,
TipoPreco VARCHAR(50),
Preco FLOAT,
Ativo CHAR(1)
);

CREATE TABLE Produto (
IdProduto INT PRIMARY KEY,
NomeProduto VARCHAR(50)
);

CREATE TABLE Pedido (
IdPedido INT PRIMARY KEY,
NumeroPedido INT NOT NULL,
IdCliente INT,
DataPedido DATE,
DataEnvio DATE,
Frete FLOAT,
PrecoPedido FLOAT,
FOREIGN KEY(IdCliente) REFERENCES Cliente (IdCliente)
);

CREATE TABLE Telefone (
IdTelefone INT PRIMARY KEY,
IdCliente INT,
Telefone VARCHAR(14),
Tipo VARCHAR(20),
Ativo CHAR(1),
FOREIGN KEY(IdCliente) REFERENCES Cliente (IdCliente)
);

ALTER TABLE ItensPedido ADD FOREIGN KEY(IdProduto) REFERENCES Produto (IdProduto);
ALTER TABLE ItensPedido ADD FOREIGN KEY(NumeroPedido) REFERENCES Pedido (NumeroPedido);
ALTER TABLE Preco ADD FOREIGN KEY(IdProduto) REFERENCES Produto (IdProduto);
