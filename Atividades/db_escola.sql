-- criando o banco de dados

CREATE DATABASE db_escola;
USE db_escola;

-- criando as tabelas auxiliares

CREATE TABLE tb_academica (
    id_academica INT NOT NULL AUTO_INCREMENT,
    situacao_academica VARCHAR(255) NOT NULL UNIQUE,
    PRIMARY KEY (id_academica)
);
INSERT INTO tb_academica (situacao_academica)
VALUES 
    ('Ativo'),
    ('Inativo'),
    ('Formado');

CREATE TABLE tb_notas (
    id_nota BIGINT NOT NULL AUTO_INCREMENT,    
    nota_p1 DECIMAL(3,1),       
    nota_p2 DECIMAL(3,1),        
    nota_p3 DECIMAL(3,1),
    PRIMARY KEY (id_nota)                    
);

-- criando a tabela principal

CREATE TABLE tb_estudantes (
    ra BIGINT NOT NULL AUTO_INCREMENT,        
    nome VARCHAR(255) NOT NULL,               
    curso VARCHAR(100),                  
    data_nascimento DATE,                    
    media DECIMAL(3,1),                     
    id_academica INT,                       
    id_nota BIGINT,                          
    PRIMARY KEY (ra),                         
    FOREIGN KEY (id_academica) REFERENCES tb_academica(id_academica) ON DELETE SET NULL,
    FOREIGN KEY (id_nota) REFERENCES tb_notas(id_nota) ON DELETE CASCADE
);
-- inserindo informações na tabela principal

INSERT INTO tb_notas (nota_p1, nota_p2, nota_p3)
VALUES
  (8.5, 7.8, 9.0),
  (7.2, 6.9, 8.1),
  (9.1, 8.5, 9.3), 
  (6.8, 7.0, 6.9), 
  (8.7, 8.0, 8.9), 
  (7.9, 8.3, 8.5), 
  (9.0, 9.2, 8.8), 
  (7.5, 7.6, 7.7);

INSERT INTO tb_estudantes (nome, curso, data_nascimento, id_academica, id_nota)
VALUES
  ('Ana Silva', 'Engenharia de Software', '2000-05-15', 1, 1),
  ('Carlos Oliveira', 'Sistemas de Informação', '1999-11-22', 2, 2),
  ('Mariana Souza', 'Ciência da Computação', '2001-03-10', 3, 3),
  ('Felipe Almeida', 'Matemática', '1998-07-30', 1, 4),
  ('Fernanda Costa', 'Design Gráfico', '2000-02-05', 2, 5),
  ('Gabriel Lima', 'Engenharia Elétrica', '2001-01-18', 3, 6),
  ('Juliana Martins', 'Administração', '1999-08-25', 1, 7),
  ('Ricardo Pereira', 'Física', '2000-06-12', 2, 8);


UPDATE tb_estudantes e
JOIN tb_notas n ON e.id_nota = n.id_nota
SET e.media = (n.nota_p1 + n.nota_p2 + n.nota_p3) / 3
WHERE e.id_nota IS NOT NULL;

-- selecionando informações desejadas

SELECT ra, nome FROM tb_estudantes WHERE media > 7.0;

SELECT ra, nome FROM tb_estudantes WHERE media < 7.0;

SELECT * FROM tb_estudantes;
SELECT * FROM tb_notas;

-- UPDATE de nota

UPDATE tb_estudantes SET id_academica = 3 WHERE ra = 12;