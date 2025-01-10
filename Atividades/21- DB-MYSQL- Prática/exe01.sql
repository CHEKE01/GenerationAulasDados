-- criando Banco de Dados

CREATE DATABASE db_generation_game_online;
USE db_generation_game_online;

--  criando tabelas auxiliales 

CREATE TABLE tb_tipos_dano(
id_tipo_dano BIGINT NOT NULL AUTO_INCREMENT,
tipo_dano VARCHAR (255),
PRIMARY KEY (id_tipo_dano)
);

INSERT INTO tb_tipos_dano (tipo_dano)
VALUES
('Magico'),
('Fisico'),
('Híbrido');

CREATE TABLE tb_classes(
id_classe BIGINT NOT NULL AUTO_INCREMENT,
classe VARCHAR (255),
PRIMARY KEY (id_classe)
);

INSERT INTO tb_classes (classe)
VALUES
('Bárbaro'),
('Bardo'),
('Clérigo'),
('Druida'),
('Guerreiro'),
('Monge'),
('Paladino'),
('Patrulheiro'),
('Ladino'),
('Feiticeiro'),
('Bruxo'),
('Mago');

CREATE TABLE tb_racas(
id_raca BIGINT NOT NULL AUTO_INCREMENT,
raca VARCHAR (255),
PRIMARY KEY (id_raca)
);

INSERT INTO tb_racas (raca)
VALUES
('Anões'),
('Elfos'),
('Halflings'),
('Humanos'),
('Draconatos'),
('Gnomos'),
('Tieflings'),
('Mestiço');


--  criando tabela principal

CREATE TABLE tb_personagens(
id BIGINT NOT NULL AUTO_INCREMENT,
nome VARCHAR (255),
raca BIGINT,
idade INT,
pontos_vida BIGINT,
pontos_mana BIGINT,
poder BIGINT,
defesa BIGINT,
economia DECIMAL (8,2) ,
classe BIGINT,
tipo_dano BIGINT,
PRIMARY KEY (id),
FOREIGN KEY (raca) REFERENCES tb_racas (id_raca) ON DELETE CASCADE,
FOREIGN KEY (classe) REFERENCES tb_classes (id_classe) ON DELETE CASCADE,
FOREIGN KEY (tipo_dano) REFERENCES tb_tipos_dano (id_tipo_dano) ON DELETE CASCADE
);

INSERT INTO tb_personagens (nome, raca, idade, pontos_vida, pontos_mana, poder, defesa, economia, classe, tipo_dano)
VALUES
('Gorath, o Invencível', 1, 35, 5000, 3000, 2500, 800, 1200.50, 2, 3),
('Krynn, Mestre das Chamas', 3, 40, 4500, 3500, 2800, 500, 900.75, 1, 2),
('Aranel, o Guardião', 2, 120, 3000, 2000, 1800, 1500, 750.00, 3, 1),
('Thalios, o Sentinela', 4, 50, 3500, 1500, 1900, 1700, 850.25, 4, 3),
('Caranthir, Mago das Sombras', 5, 25, 2000, 2500, 1800, 900, 500.00, 2, 2),
('Celeste, a Feiticeira', 2, 22, 2200, 1800, 1600, 800, 620.50, 3, 2),
('Eldrin, o Explorador', 6, 45, 2800, 1200, 1500, 950, 400.00, 1, 1),
('Zarion, o Destruidor', 1, 33, 3500, 2500, 2000, 1100, 300.75, 4, 3);

-- SELECT dos personagens com poder > 2000

SELECT * 
FROM tb_personagens
WHERE poder > 2000;

-- SELECT dos personagens com defeza entre 1000 e 2000

SELECT * 
FROM tb_personagens
WHERE defesa BETWEEN 1000 AND 2000;

-- SELECT dos personagens com a letra C no nome

SELECT * 
FROM tb_personagens
WHERE nome LIKE '%C%';

-- SELECT unindo os dados das tabelas personagens e classes

SELECT p.*, c.classe
FROM tb_personagens p
INNER JOIN tb_classes c ON p.classe = c.id_classe;

-- SELECT dos personagens de uma unica classe

SELECT p.*, c.classe
FROM tb_personagens p
INNER JOIN tb_classes c ON p.classe = c.id_classe
WHERE c.classe = 'Clérigo';
