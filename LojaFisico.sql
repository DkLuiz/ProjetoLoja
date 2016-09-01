-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.

CREATE DATABASE PLOJA;

CREATE TABLE ItensPedido (
IdProduto INT,
IdPedido INT,
Quantidade INT,
PRIMARY KEY(IdProduto, IdPedido)
);

CREATE TABLE Cliente (
IdCliente INT AUTO_INCREMENT,
Nome VARCHAR(65),
CPF VARCHAR(11),
DataNascimento DATE,
Sexo CHAR(1),
Email VARCHAR(80),
Senha VARCHAR(20),
PRIMARY KEY(IdCliente)
);

CREATE TABLE Endereco (
IdEndereco INT AUTO_INCREMENT,
IdCliente INT,
CEP VARCHAR(8),
Endereco VARCHAR(200),
Numero INT,
Complemento VARCHAR(200),
Bairro VARCHAR(50),
Cidade VARCHAR(50),
UF CHAR(2),
Ativo CHAR(1),
PRIMARY KEY(IdEndereco),
FOREIGN KEY(IdCliente) REFERENCES Cliente (IdCliente)
);

CREATE TABLE Preco (
IdPreco INT AUTO_INCREMENT,
IdProduto INT,
Data DATE,
TipoPreco VARCHAR(50),
Preco FLOAT,
Ativo CHAR(1),
PRIMARY KEY(IdPreco)
);

CREATE TABLE Produto (
IdProduto INT AUTO_INCREMENT,
NomeProduto VARCHAR(50),
PRIMARY KEY(IdProduto)
);

CREATE TABLE Pedido (
IdPedido INT AUTO_INCREMENT,
NumeroPedido INT NOT NULL,
IdCliente INT,
DataPedido DATE,
DataEnvio DATE,
Frete FLOAT,
PrecoPedido FLOAT,
PRIMARY KEY(IdPedido),
FOREIGN KEY(IdCliente) REFERENCES Cliente (IdCliente)
);

CREATE TABLE Telefone (
IdTelefone INT AUTO_INCREMENT,
IdCliente INT,
Telefone VARCHAR(14),
Tipo VARCHAR(20),
Ativo CHAR(1),
PRIMARY KEY(IdTelefone),
FOREIGN KEY(IdCliente) REFERENCES Cliente (IdCliente)
);

ALTER TABLE ItensPedido ADD CONSTRAINT FK_PRODUTO_IDPRODUTO FOREIGN KEY(IdProduto) REFERENCES Produto (IdProduto);
ALTER TABLE ItensPedido ADD CONSTRAINT FK_PEDIDO_IDPEDIDO FOREIGN KEY(IdPedido)    REFERENCES Pedido (IdPedido);
ALTER TABLE Preco ADD FOREIGN KEY(IdProduto) REFERENCES Produto (IdProduto);
