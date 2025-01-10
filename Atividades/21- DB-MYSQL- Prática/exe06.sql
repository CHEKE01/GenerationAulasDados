-- criando Banco de Dados

CREATE DATABASE db_curso_da_minha_vida;
USE db_curso_da_minha_vida;

--  criando tabelas auxiliales

CREATE TABLE tb_categorias(
id_categoria BIGINT NOT NULL AUTO_INCREMENT,
categoria VARCHAR(255),
descricao VARCHAR(255),
PRIMARY KEY (id_categoria)
);

INSERT INTO tb_categorias (categoria, descricao) VALUES
('Exatas', 'Cursos focados em ciências exatas, como Matemática, Física, Engenharia e Tecnologia'),
('Humanas', 'Cursos relacionados ao estudo do comportamento humano, como Psicologia, Sociologia, Filosofia e História'),
('Biológicas', 'Cursos ligados à área da biologia, como Medicina, Biotecnologia, Ciências Ambientais e Veterinária'),
('Saúde', 'Cursos voltados para a área da saúde, como Enfermagem, Fisioterapia, Nutrição e Farmácia'),
('Artes', 'Cursos relacionados à expressão artística, como Música, Dança, Teatro e Artes Visuais');

--  criando tabela principal

CREATE TABLE tb_cursos(
id BIGINT NOT NULL AUTO_INCREMENT,
nome VARCHAR(255),
carga_horaria INT,
duração INT,
categoria BIGINT NOT NULL,
modalidade_ead TINYINT,
mensalidade_media DECIMAL(8,2),
PRIMARY KEY (id),
FOREIGN KEY (categoria) REFERENCES tb_categorias (id_categoria) ON DELETE CASCADE
);

INSERT INTO tb_cursos (nome, carga_horaria, duração, categoria, modalidade_ead, mensalidade_media)
VALUES
('Algoritmos e Estruturas de Dados', 120, 6, 1, 1, 450.00),
('Psicologia Comportamental', 100, 6, 2, 1, 400.00),
('Introdução à Biotecnologia', 150, 8, 3, 0, 800.00),
('Enfermagem Básica', 160, 9, 4, 0, 650.00),
('História da Arte', 80, 4, 5, 1, 300.00),
('Física Moderna', 140, 7, 1, 1, 550.00),
('Sociologia Contemporânea', 90, 5, 2, 0, 350.00),
('Medicina Veterinária', 200, 10, 3, 0, 1200.00),
('Java para Iniciantes', 120, 6, 1, 1, 500.00);

-- SELECT dos cursos com valor > R$500,00

SELECT * FROM tb_cursos WHERE mensalidade_media > 500.00;

-- SELECT das cursos com valor >entr R$600,00 e R$1000,00

SELECT * FROM tb_cursos WHERE mensalidade_media BETWEEN 600 AND 1000;

-- SELECT dos produtos com a letra J no nome

SELECT * 
FROM tb_cursos
WHERE nome LIKE '%J%';

-- SELECT unindo os dados das tabelas cursos e categorias

SELECT c.nome AS curso, c.carga_horaria, c.duração, c.modalidade_ead, c.mensalidade_media, cat.categoria
FROM tb_cursos c
INNER JOIN tb_categorias cat
ON c.categoria = cat.id_categoria;

-- SELECT dos cursos de uma unica categoria

SELECT c.nome AS curso, c.carga_horaria, c.duração, c.modalidade_ead, c.mensalidade_media
FROM tb_cursos c
INNER JOIN tb_categorias cat ON c.categoria = cat.id_categoria
WHERE cat.categoria = 'Biológicas';
