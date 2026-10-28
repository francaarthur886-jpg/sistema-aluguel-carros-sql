CREATE DATABASE db_formula_de_um;

USE db_formula_de_um;

CREATE TABLE classesCarro (
    id_classeCarro INT NOT NULL AUTO_INCREMENT,
    nome_classeCarro VARCHAR(20) NOT NULL,
    valorDiaria DECIMAL(8,2) NOT NULL,
    PRIMARY KEY (id_classeCarro)
);

CREATE TABLE sedes (
    id_sede INT NOT NULL AUTO_INCREMENT,
    nome_sede VARCHAR(50) NOT NULL,
    endereco VARCHAR(80) NOT NULL,
    telefone VARCHAR(20) NOT NULL,
    nomeGerente VARCHAR(50) NOT NULL,
    multa_sedes DECIMAL(8,2) NOT NULL,
    PRIMARY KEY (id_sede)
);

CREATE TABLE clientes (
    id_cliente INT NOT NULL AUTO_INCREMENT,
    nome_cliente VARCHAR(50) NOT NULL,
    cpf VARCHAR(14) NOT NULL,
    cnh VARCHAR(20) NOT NULL,
    validadeCnh DATE NOT NULL,
    categoriaCnh VARCHAR(3) NOT NULL,
    PRIMARY KEY (id_cliente)
);

CREATE TABLE carros (
    id_carro INT NOT NULL AUTO_INCREMENT,
    placa VARCHAR(10) NOT NULL,
    modelo VARCHAR(40) NOT NULL,
    ano VARCHAR(9) NOT NULL,
    cor VARCHAR(20) NOT NULL,
    quilometragem DECIMAL(10,2) NOT NULL,
    descricao VARCHAR(100) NOT NULL,
    situacao_carros VARCHAR(30) NOT NULL,
    origemCarro INT NOT NULL,
    localizacaoCarro INT NOT NULL,
    classeCarro INT NOT NULL,
    PRIMARY KEY (id_carro)
);

CREATE TABLE reservas (
    numero INT NOT NULL AUTO_INCREMENT,
    diarias INT NOT NULL,
    dataLocacao DATE NOT NULL,
    dataRetorno DATE NULL,
    quilometrosRodados DECIMAL(10,2) NULL,
    multa_reservas DECIMAL(8,2) NULL,
    situacao_reserva VARCHAR(15) NOT NULL,
    total DECIMAL(10,2) NULL,
    carro_reserva INT NOT NULL,
    cliente_reserva INT NOT NULL,
    sedeLocacao INT NOT NULL,
    sedeDevolucao INT NULL,
    PRIMARY KEY (numero)
);

ALTER TABLE carros
ADD CONSTRAINT fk_sedesOrigem
FOREIGN KEY (origemCarro)
REFERENCES sedes(id_sede);

ALTER TABLE carros
ADD CONSTRAINT fk_sedesLocAtual
FOREIGN KEY (localizacaoCarro)
REFERENCES sedes(id_sede);

ALTER TABLE carros
ADD CONSTRAINT fk_classes
FOREIGN KEY (classeCarro)
REFERENCES classesCarro(id_classeCarro);

ALTER TABLE reservas
ADD CONSTRAINT fk_carros
FOREIGN KEY (carro_reserva)
REFERENCES carros(id_carro);

ALTER TABLE reservas
ADD CONSTRAINT fk_clientes
FOREIGN KEY (cliente_reserva)
REFERENCES clientes(id_cliente);

ALTER TABLE reservas
ADD CONSTRAINT fk_sedesLocacao
FOREIGN KEY (sedeLocacao)
REFERENCES sedes(id_sede);

ALTER TABLE reservas
ADD CONSTRAINT fk_sedesDevolucao
FOREIGN KEY (sedeDevolucao)
REFERENCES sedes(id_sede);
