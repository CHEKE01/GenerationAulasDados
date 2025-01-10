-- criando Banco de Dados

CREATE DATABASE db_cidade_dos_alimentos;
USE db_cidade_dos_alimentos;

--  criando tabelas auxiliales

CREATE TABLE tb_categorias(
id_categoria BIGINT NOT NULL AUTO_INCREMENT,
categoria VARCHAR(255),
vegano TINYINT,
PRIMARY KEY (id_categoria)
);

INSERT INTO tb_categorias (categoria, vegano)
VALUES
('Frutas', 1),
('Verduras', 1), 
('Grãos', 1), 
('Legumes', 1), 
('Produtos à Base Soja', 1),
('Carnes Bovina', 0),  
('Laticínios', 0),
('Carne Suina', 0), 
('Carne de Frango', 0),
('Futos do Mar', 0); 

--  criando tabela principal

CREATE TABLE tb_produtos(
id BIGINT NOT NULL AUTO_INCREMENT,
nome VARCHAR(255),
valor DECIMAL(5,2),
categoria BIGINT NOT NULL,
validade DATE,
vegano TINYINT,
PRIMARY KEY (id),
FOREIGN KEY (categoria) REFERENCES tb_categorias (id_categoria) ON DELETE CASCADE
);

INSERT INTO tb_produtos (nome, valor, categoria, validade, vegano) 
VALUES
('Maçã', 45.00, 1, '2025-06-30', 1),
('Banana', 50.00, 1, '2025-07-15', 1),
('Alface', 40.50, 2, '2025-03-20', 1),
('Espinafre', 55.00, 2, '2025-03-22', 1),
('Arroz Integral', 60.00, 3, '2025-08-10', 1),
('Feijão Preto', 70.00, 3, '2025-08-12', 1),
('Cenoura', 45.50, 4, '2025-04-05', 1),
('Batata', 60.00, 4, '2025-04-07', 1),
('Tofu', 50.00, 5, '2025-05-30', 1),
('Leite de Soja', 55.00, 5, '2025-06-10', 1),
('Bife de Alcatra', 120.00, 6, '2025-02-15', 0),
('Filé Mignon', 140.00, 6, '2025-02-17', 0),
('Queijo Mussarela', 80.00, 7, '2025-03-05', 0),
('Leite Integral', 60.00, 7, '2025-03-07', 0),
('Costela Suína', 100.00, 8, '2025-01-25', 0),
('Lombo Suíno', 120.00, 8, '2025-01-28', 0),
('Peito de Frango', 90.00, 9, '2025-02-01', 0),
('Coxinha de Frango', 70.00, 9, '2025-02-03', 0),
('Salmão', 130.00, 10, '2025-04-15', 0),
('Camarão', 150.00, 10, '2025-04-18', 0);

-- SELECT dos produtos com valor > R$50,00

SELECT * FROM tb_produtos WHERE valor > 50.00;

-- SELECT dos produtos com valor >entr R$50,00 e R$150,00

SELECT * FROM tb_produtos WHERE valor BETWEEN 50 AND 150;

-- SELECT dos produtos com a letra C no nome

SELECT * 
FROM tb_produtos
WHERE nome LIKE '%C%';

-- SELECT unindo os dados das tabelas produtos e categorias

SELECT p.nome AS produto, p.valor, c.categoria
FROM tb_produtos p
INNER JOIN tb_categorias c
ON p.categoria = c.id_categoria;

-- SELECT dos produtos de uma unica categoria

SELECT p.nome AS produto,p.valor
FROM tb_produtos p
INNER JOIN tb_categorias c ON p.categoria = c.id_categoria
WHERE c.categoria = 'Produtos à Base Soja';