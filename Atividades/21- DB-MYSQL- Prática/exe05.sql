-- criando Banco de Dados

CREATE DATABASE db_construindo_vidas;
USE db_construindo_vidas;

--  criando tabelas auxiliales

CREATE TABLE tb_categorias(
id_categoria BIGINT NOT NULL AUTO_INCREMENT,
categoria VARCHAR(255),
descricao VARCHAR(255),
PRIMARY KEY (id_categoria)
);

INSERT INTO tb_categorias (categoria, descricao) VALUES
('Materiais de Construção', 'Produtos e materiais para construção de casas e edifícios, como cimento, tijolos, areia, etc.'),
('Ferramentas', 'Equipamentos manuais e elétricos para construção, como martelos, furadeiras, serras, etc.'),
('Acabamento', 'Produtos para acabamento de obras, como tintas, pisos, revestimentos, portas e janelas.'),
('Hidráulico', 'Produtos relacionados a instalações hidráulicas, como canos, conexões, registros e válvulas.'),
('Elétrico', 'Materiais para instalações elétricas, como fios, tomadas, interruptores e lâmpadas.');

--  criando tabela principal

CREATE TABLE tb_produtos(
id BIGINT NOT NULL AUTO_INCREMENT,
nome VARCHAR(255),
valor DECIMAL(5,2),
categoria BIGINT NOT NULL,
fornecedor VARCHAR(255),
estoque INT,
PRIMARY KEY (id),
FOREIGN KEY (categoria) REFERENCES tb_categorias (id_categoria) ON DELETE CASCADE
);

INSERT INTO tb_produtos (nome, valor, categoria, fornecedor, estoque) VALUES
('Cimento Portland', 80.50, 1, 'Construtora ABC', 100),
('Areia Grossa', 95.30, 1, 'Construtora XYZ', 150),
('Martelo de Unha', 75.20, 2, 'Ferramentas LTDA', 200),
('Furadeira Elétrica', 120.75, 2, 'Ferramentas Power', 50),
('Piso Cerâmico', 110.00, 3, 'Acabamentos & Cia', 80),
('Revestimento Porcelanato', 130.60, 3, 'Acabamentos Plus', 60),
('Canos PVC', 60.90, 4, 'Hidráulica Nacional', 300),
('Tomada 10A', 50.20, 5, 'Elétrica Master', 400);

-- SELECT dos produtos com valor > R$100,00

SELECT * FROM tb_produtos WHERE valor > 100.00;

-- SELECT das produtos com valor >entr R$70,00 e R$150,00

SELECT * FROM tb_produtos WHERE valor BETWEEN 70 AND 150;

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
WHERE c.categoria = 'Hidráulico';