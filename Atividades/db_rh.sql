CREATE DATABASE db_rh;

USE db_rh;

CREATE TABLE tb_colaborador(
id BIGINT AUTO_INCREMENT,
nome VARCHAR(255),
data_inicio DATE,
cargo VARCHAR(255),
salario DECIMAL(8,2) NOT NULL,
PRIMARY KEY (id)
);

INSERT INTO tb_colaborador(nome, data_inicio, cargo, salario) 
VALUES 
("João", "2023-12-15", "Gerente", 12000.00),
("Ana", "2023-12-15", "Desenvolvedor senior", 10000.00),
("Pedro", "2023-12-15", "Desenvolvedor Pleno",  8000.00),
("Banana", "2023-12-15", "Desenvolvedor Junior", 6000.00),
("Cris", "2023-12-15", "Desenvolvedor Junior",  4000.00),
("Maria", "2023-12-15", "Estagiario", 2000.00);

UPDATE tb_colaborador SET nome = "Julha" WHERE Id = 4;

SELECT * FROM tb_colaborador WHERE salario > 2000.00;

SELECT * FROM tb_colaborador WHERE salario <= 2000.00;

SELECT * FROM tb_colaborador;


