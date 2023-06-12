CREATE DATABASE  IF NOT EXISTS EcoHarvest;
USE EcoHarvest;


CREATE TABLE usuario (
    id      INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome 	VARCHAR(45)    NOT NULL,
    senha 	VARCHAR(45)    NOT NULL
);

CREATE TABLE funcionario (
    id         INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome       VARCHAR(45)    	NOT NULL,
    sobrenome  VARCHAR(45)    	NOT NULL,
    email      VARCHAR(45)    	NOT NULL,
    cargo      VARCHAR(45)    	NOT NULL,
    nascimento VARCHAR(45)    	NOT NULL,
    celular    VARCHAR(45)    	NOT NULL,
    genero     VARCHAR(45)  	NOT NULL,
    salario    DOUBLE   		NOT NULL
);

CREATE TABLE fornecedor (
	id				INT PRIMARY KEY AUTO_INCREMENT,
    nome			VARCHAR(45),
    endereco 		VARCHAR(45),
    email			VARCHAR(45),
    telefone		VARCHAR(45),
    tipo_produto	VARCHAR(45)
);


CREATE TABLE produto (
	id 					INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome				VARCHAR(45),
    peso				FLOAT,
    disponibilidade		VARCHAR(45),
    qntd_estoque		INTEGER,
    valor_compra		DOUBLE,
    valor_venda			DOUBLE,
    id_fornecedor		INT,
    
    FOREIGN KEY (id_fornecedor) REFERENCES fornecedor(id)
);

CREATE TABLE pedido (
	id 					INTEGER PRIMARY KEY AUTO_INCREMENT,
    id_funcionario		INT,
    id_produto			INT,
    qtd_pedido			INT,
    
    FOREIGN KEY (id_funcionario) REFERENCES funcionario(id),
    FOREIGN KEY (id_produto) REFERENCES produto(id)
);

INSERT INTO usuario (nome, senha)
VALUES	('admin', 'admin'),
		('1',		  '1');

INSERT INTO funcionario (nome, sobrenome, email, cargo, nascimento, celular, genero, salario)
VALUES ('João',		'Silva', 	'joao@email.com', 	 'Gerente', 	'1990-05-15', '987654321', 'Masculino', 5000.00),
       ('Maria', 	'Santos', 	'maria@email.com',   'Vendedor', 	'1995-08-20', '123456789', 'Feminino', 	3000.00),
       ('Pedro',	'Oliveira', 'pedro@email.com',	 'Atendente', 	'1992-02-10', '456789123', 'Masculino', 2500.00),
       ('Ana',		'Pereira', 	'ana@email.com', 	 'Estoquista', 	'1998-11-05', '789123456', 'Feminino', 	2000.00),
       ('Carlos', 	'Gomes', 	'carlos@email.com',  'Auxiliar', 	'1993-07-25', '321654987', 'Masculino', 1800.00);

INSERT INTO fornecedor (nome, endereco, email, telefone, tipo_produto)
VALUES ('Ciagro', 	'Rua Amenis, n 12',		'ciagro@contato.com', 	'15 84122354',	'Arroz'),
       ('Bunge', 	'Av. Unidas, 11', 		'contato@bunge.com', 	'11 987654321', 'Soja'),
       ('Cargill', 	'Rua Verbo Divino, 18', 'contato@cargill.com',	'11 123456789', 'Trigo'),
       ('Archer', 	'Av. das Nações, 101',  'contato@adm.com', 		'11 456789123', 'Milho'),
       ('Dreyfus',	'Av. Paulista, 17', 	'contato@ldcom.com', 	'11 789123456', 'Café');

INSERT INTO produto (nome, peso, disponibilidade, qntd_estoque, valor_compra, valor_venda, id_fornecedor)
VALUES  ('Arroz', 		1.0, 'Disponível', 100, 5.0, 10.0, 	1),
		('Milho', 		1.5, 'Disponível', 80, 	4.0, 8.0, 	4),
		('Trigo', 		2.0, 'Disponível', 60, 	6.0, 12.0, 	3),
		('Café', 		0.2, 'Disponível', 100, 8.0, 16.0, 	5),
		('Soja', 		1.2, 'Disponível', 50, 	7.0, 14.0, 	2);

SELECT * FROM funcionario;

SELECT * FROM usuario;

SELECT * FROM fornecedor;

SELECT * FROM produto;

SELECT * FROM pedido;



SELECT 

pe.id, 
pr.nome, 
f.nome,
pe.qtd_pedido

FROM pedido pe 
JOIN funcionario f 
JOIN produto pr

ON pe.id_funcionario = f.id AND pe.id_produto = pr.id

where pe.id = 1;
