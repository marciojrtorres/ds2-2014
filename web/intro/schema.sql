CREATE TABLE agenda;

USE agenda;

DROP TABLE IF EXISTS contatos;

CREATE TABLE contatos (
    codigo   INTEGER     PRIMARY KEY AUTO_INCREMENT,
    nome     VARCHAR(50) NOT NULL,
    telefone VARCHAR(50),
    email    VARCHAR(100)
);