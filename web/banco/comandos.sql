-- abrir linha de comando
mysql -u root -p agenda

-- mostra os bancos
SHOW DATABASES;

-- criar um banco
CREATE DATABASE agenda;

-- obs.: 1 row affected: sucesso!
-- usar um banco
USE agenda;

-- criar uma tabela simples
CREATE TABLE contatos (
    nome     VARCHAR(50),
    telefone VARCHAR(50)
);
    
-- mostrando a estrutura da tabela
DESCRIBE contatos; 

-- excluir uma tabela
DROP TABLE contatos;

-- mostrar as tabelas existentes
SHOW TABLES;

-- "reset"
DROP TABLES IF EXISTS contatos;
CREATE TABLE contatos (
    nome     VARCHAR(50),
    telefone VARCHAR(50)
);

-- tabela mais "sofisticada"
CREATE TABLE contatos (
    codigo   INTEGER     PRIMARY KEY AUTO_INCREMENT,
    nome     VARCHAR(50) NOT NULL,
    telefone VARCHAR(50)
);

-- inserindo dados
INSERT INTO contatos VALUES (
    DEFAULT,
    'IFRS',
    '32338603'
);

INSERT INTO contatos (telefone, nome) VALUES (
    '32338603',
    'IFRS'
);

INSERT INTO contatos (telefone, nome) VALUES (
    '88223344',
    'Teste 1'
), (
    '44555553',
    'Teste 2'
);

-- consultando (query) 
SELECT * FROM contatos;

SELECT nome FROM contatos;

SELECT * FROM contatos 
         WHERE codigo = 1;

SELECT * FROM contatos 
         WHERE nome = 'IFRS';

SELECT * FROM contatos 
         WHERE nome LIKE 'I%';

SELECT * FROM contatos 
         ORDER BY nome;

SELECT * FROM contatos 
         ORDER BY nome DESC;

SELECT * FROM contatos 
         ORDER BY codigo DESC 
         LIMIT 1 OFFSET 1;

-- excluir registro
DELETE FROM contatos;

DELETE FROM contatos
       WHERE codigo = 1;

DELETE FROM contatos 
       WHERE codigo IN (2,4,6);

-- atualizar um registro
UPDATE contatos SET 
    telefone = '99992222'
    WHERE codigo = 1;
