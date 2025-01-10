-- criando Banco de Dados

CREATE DATABASE db_farmacia_bem_estar;
USE db_farmacia_bem_estar;

--  criando tabelas auxiliales

CREATE TABLE tb_categorias(
id_categoria BIGINT NOT NULL AUTO_INCREMENT,
categoria VARCHAR(255),
descricao VARCHAR(255),
PRIMARY KEY (id_categoria)
);

INSERT INTO tb_categorias (categoria, descricao)
VALUES
('Medicamentos', 'Produtos utilizados para tratamento de doenças e sintomas'),
('Dermocosméticos', 'Produtos para cuidados com a pele e beleza'),
('Higiene Pessoal', 'Itens de higiene e cuidados diários'),
('Suplementos', 'Produtos para suplementação alimentar e esportiva'),
('Infantil', 'Produtos voltados para cuidados de bebês e crianças');

--  criando tabela principal

CREATE TABLE tb_produtos(
id BIGINT NOT NULL AUTO_INCREMENT,
nome VARCHAR(255),
valor DECIMAL(5,2),
categoria BIGINT NOT NULL,
validade DATE,
agente_ativo VARCHAR (255),
PRIMARY KEY (id),
FOREIGN KEY (categoria) REFERENCES tb_categorias (id_categoria) ON DELETE CASCADE
);

INSERT INTO tb_produtos (nome, valor, categoria, validade, agente_ativo)
VALUES
('Paracetamol 500mg', 15.99, 1, '2026-12-31', 'Paracetamol'),
('Bepantol Derma Creme', 29.90, 2, '2025-06-30', 'Dexpantenol'),
('Shampoo Anticaspa', 18.50, 3, '2025-04-15', 'Piritionato de Zinco'),
('Whey Protein Isolado', 99.90, 4, '2026-11-01', 'Proteína isolada de soro de leite'),
('Fralda Pampers', 45.99, 5, '2025-09-20', 'Polímero superabsorvente'),
('Aspirina 100mg', 10.99, 1, '2027-01-15', 'Ácido acetilsalicílico'),
('Creme Nivea', 22.50, 2, '2026-05-10', 'Óleo de amêndoas e vitamina E'),
('Gel para Dor Muscular', 25.00, 3, '2025-12-01', 'Mentol e cânfora');

-- SELECT dos produtos com valor > R$50,00

SELECT * FROM tb_produtos WHERE valor > 50.00;

-- SELECT dos produtos com valor >entr R$5,00 e R$60,00

SELECT * FROM tb_produtos WHERE valor BETWEEN 5 AND 60;

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
WHERE c.categoria = 'Medicamentos';
