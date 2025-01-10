-- criando Banco de Dados

CREATE DATABASE db_pizzaria_legal;
USE db_pizzaria_legal;

--  criando tabelas auxiliales

CREATE TABLE tb_categorias(
id_categoria BIGINT NOT NULL AUTO_INCREMENT,
categoria VARCHAR(255),
PRIMARY KEY (id_categoria)
);

INSERT INTO tb_categorias (categoria)
VALUES
('salgado'),
('doce'),
('vegetariano'),
('especial'),
('gourmet');

CREATE TABLE tb_tamanhos(
id_tamanho BIGINT NOT NULL AUTO_INCREMENT,
tamanho VARCHAR(255),
serve_quantas_pessoas INT,
PRIMARY KEY (id_tamanho)
);

INSERT INTO tb_tamanhos (tamanho, serve_quantas_pessoas)
VALUES
('brotinho', 2),
('pequena', 6),
('tradicional', 8),
('grande', 10 );

--  criando tabela principal

CREATE TABLE tb_pizzas(
id BIGINT NOT NULL AUTO_INCREMENT,
nome VARCHAR(255),
valor DECIMAL(5,2),
tamanho BIGINT NOT NULL,
categoria BIGINT NOT NULL,
lista_ingredientes VARCHAR(255),
PRIMARY KEY (id),
FOREIGN KEY (tamanho) REFERENCES tb_tamanhos (id_tamanho) ON DELETE CASCADE,
FOREIGN KEY (categoria) REFERENCES tb_categorias (id_categoria) ON DELETE CASCADE
);

INSERT INTO tb_pizzas (nome, valor, tamanho, categoria, lista_ingredientes)
VALUES
('Margherita', 45.00, 1, 1, 'Tomate, Mussarela, Manjericão'),
('Calabresa', 55.00, 2, 1, 'Calabresa, Cebola, Mussarela'),
('Nutella com Banana', 50.00, 1, 2, 'Nutella, Banana, Leite Condensado'),
('Romeu e Julieta', 30.00, 2, 2, 'Queijo, Goiabada'),
('Vegetariana Clássica', 35.00, 2, 3, 'Abobrinha, Berinjela, Cogumelos'),
('Vegana Gourmet', 60.00, 3, 3, 'Espinafre, Tomate Seco, Queijo Vegano'), 
('Quatro Queijos', 70.00, 1, 4, 'Mussarela, Gorgonzola, Parmesão, Catupiry'), 
('Frango com Catupiry', 40.00, 2, 4, 'Frango, Catupiry, Milho'),
('Parma com Rúcula', 80.00, 3, 5, 'Presunto Parma, Rúcula, Parmesão'),
('Burrata com Pesto', 90.00, 2, 5, 'Burrata, Molho Pesto, Tomates Cereja');

-- SELECT das pizzas com valor > R$45,00

SELECT * FROM tb_pizzas WHERE valor > 45.00;

-- SELECT das pizzas com valor >entr R$50,00 e R$100,00

SELECT * FROM tb_pizzas WHERE valor BETWEEN 50 AND 100;

-- SELECT das pizzas com a letra M no nome

SELECT * 
FROM tb_pizzas
WHERE nome LIKE '%M%';

-- SELECT unindo os dados das tabelas pizzas e categorias

SELECT p.nome AS pizza, p.valor, c.categoria
FROM tb_pizzas p
INNER JOIN tb_categorias c
ON p.categoria = c.id_categoria;

-- SELECT das pizzas de uma unica categoria

SELECT p.nome AS pizza,p.valor
FROM tb_pizzas p
INNER JOIN tb_categorias c ON p.categoria = c.id_categoria
WHERE c.categoria = 'doce';
