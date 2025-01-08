CREATE DATABASE bd_ecomerce;

USE bd_ecomerce;

CREATE TABLE tb_produto(
id BIGINT NOT NULL AUTO_INCREMENT,
nome VARCHAR (255),
quantidade INT,
preco DECIMAL (8.2),
descricao VARCHAR(255),
PRIMARY KEY (id)
);

INSERT INTO tb_produto (nome, quantidade, preco, descricao)
VALUES
('Notebook Dell', 10, 4500.50, 'Notebook Core i7 com 16GB RAM'),
('Smartphone Samsung', 25, 1500.00, 'Galaxy com tela AMOLED'),
('Teclado Mecânico', 50, 350.99, 'Teclado RGB com switches mecânicos'),
('Monitor LG', 15, 1200.49, 'Monitor Full HD 24 polegadas'),
('Cadeira Gamer', 5, 899.90, 'Cadeira com ajuste de altura e reclinação'),
('Mouse Logitech', 30, 199.99, 'Mouse sem fio ergonômico'),
('HD Externo', 20, 350.00, 'HD de 1TB para armazenamento'),
('Fone de Ouvido JBL', 40, 299.90, 'Fone Bluetooth com som estéreo');

SELECT * FROM tb_produto WHERE preco > 500;

SELECT * FROM tb_produto WHERE preco < 500;

UPDATE tb_produtos SET quantidade = 15 WHERE Id = 6;

SELECT * FROM tb_produto;