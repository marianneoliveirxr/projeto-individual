DROP DATABASE IF EXISTS fitMatch;
CREATE DATABASE fitMatch;
USE fitMatch;

CREATE TABLE perfil(
	id INT PRIMARY KEY AUTO_INCREMENT,
    objetivo VARCHAR(60),
    nivelFisico VARCHAR(45),
    sexo VARCHAR(45),
    CONSTRAINT chk_objetivo CHECK (objetivo IN ('Emagrecimento/Definição', 'Hipertrofia/Ganho de Massa Muscular')),
    CONSTRAINT chk_nivelFisico CHECK (nivelFisico IN ('iniciante', 'intermediario', 'avancado')),
    CONSTRAINT chk_sexo CHECK (sexo IN ('feminino', 'masculino'))
);

create table usuario(
	id_usuario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(80),
    email VARCHAR(50) UNIQUE,
    senha VARCHAR(50),
    fkPerfil INT,
    FOREIGN KEY (fkPerfil) REFERENCES perfil(id)
);

CREATE TABLE progresso(
	id INT PRIMARY KEY AUTO_INCREMENT,
    peso INT,
    altura INT,
    dtRegistro DATETIME DEFAULT CURRENT_TIMESTAMP,
    fkUsuario INT,
    FOREIGN KEY (fkUsuario) REFERENCES usuario(id_usuario)
);	

CREATE TABLE meta(
	id INT PRIMARY KEY AUTO_INCREMENT,
    pesoMeta INT,
    fkUsuario INT,
    FOREIGN KEY (fkUsuario) REFERENCES usuario(id_usuario)
);

CREATE TABLE treino(
	id INT PRIMARY KEY AUTO_INCREMENT,
    divisao CHAR(1),
    musculos VARCHAR(60),
    cardio VARCHAR(60),
    fkPerfil INT,
    CONSTRAINT chk_divisao CHECK (divisao IN('A', 'B', 'C')),
    FOREIGN KEY (fkPerfil) REFERENCES perfil(id)
);

CREATE TABLE exercicios(
	id INT PRIMARY KEY AUTO_INCREMENT,
    exercicio VARCHAR(45),
    series INT,
	repeticoes INT,
    fkTreino INT,
    FOREIGN KEY (fkTreino) REFERENCES treino(id)
);

INSERT INTO perfil (objetivo, nivelFisico, sexo) VALUES
('Emagrecimento/Definição', 'iniciante', 'masculino'),
('Emagrecimento/Definição', 'intermediário', 'masculino'),
('Emagrecimento/Definição', 'avançado', 'masculino'),
('Hipertrofia/Ganho de Massa Muscular', 'iniciante', 'masculino'),
('Hipertrofia/Ganho de Massa Muscular', 'intermediário', 'masculino'),
('Hipertrofia/Ganho de Massa Muscular', 'avançado', 'masculino'),
('Emagrecimento/Definição', 'iniciante', 'feminino'),
('Emagrecimento/Definição', 'intermediário', 'feminino'),
('Emagrecimento/Definição', 'avançado', 'feminino'),
('Hipertrofia/Ganho de Massa Muscular', 'iniciante', 'feminino'),
('Hipertrofia/Ganho de Massa Muscular', 'intermediário', 'feminino'),
('Hipertrofia/Ganho de Massa Muscular', 'avançado', 'feminino');

INSERT INTO treino (divisao, musculos, cardio, fkPerfil) VALUES
('A', 'Peito, Ombro e Triceps', 'Esteira', 1),
('B', 'Costas e Biceps', 'Esteira', 1),
('C', 'Pernas Completo', 'Esteira', 1),
('A', 'Peito, Ombro e Triceps', 'Bicicleta', 2),
('B', 'Costas e Biceps', 'Bicicleta', 2),
('C', 'Pernas Completo', 'Bicicleta', 2),
('A', 'Peito, Ombro e Triceps', 'Escada', 3),
('B', 'Costas e Biceps', 'Escada', 3),
('C', 'Pernas Completo', 'Escada', 3),
('A', 'Peito, Ombro e Triceps', 'Esteira', 4),
('B', 'Costas e Biceps', 'Esteira', 4),
('C', 'Pernas Completo', 'Esteira', 4),
('A', 'Peito, Ombro e Triceps', 'Bicicleta', 5),
('B', 'Costas e Biceps', 'Bicicleta', 5),
('C', 'Pernas Completo', 'Bicicleta', 5),
('A', 'Peito, Ombro e Triceps', 'Escada', 6),
('B', 'Costas e Biceps', 'Escada', 6),
('C', 'Pernas Completo', 'Escada', 6),
('A', 'Quadriceps', 'Esteira', 7),
('B', 'Superiores Completo', 'Esteira', 7),
('C', 'Gluteo e Posterior', 'Esteira', 7),
('A', 'Quadriceps', 'Esteira inclinada', 8),
('B', 'Superiores Completo', 'Esteira inclinada', 8),
('C', 'Gluteo e Posterior', 'Esteira inclinada', 8),
('A', 'Quadriceps', 'Bicicleta', 9),
('B', 'Superiores Completo', 'Bicicleta', 9),
('C', 'Gluteo e Posterior', 'Bicicleta', 9),
('A', 'Quadriceps', 'Esteira', 10),
('B', 'Superiores Completo', 'Esteira', 10),
('C', 'Gluteo e Posterior', 'Esteira', 10),
('A', 'Quadriceps', 'Escada', 11),
('B', 'Superiores Completo', 'Escada', 11),
('C', 'Gluteo e Posterior', 'Escada', 11),
('A', 'Quadriceps', 'Esteira', 12),
('B', 'Superiores Completo', 'Esteira', 12),
('C', 'Gluteo e Posterior', 'Esteira', 12);

INSERT INTO exercicios (exercicio, series, repeticoes, fkTreino) VALUES
('Supino reto com barra', 4, 10, 1),
('Supino inclinado com halteres', 3, 10, 1),
('Desenvolvimento com halteres', 3, 12, 1),
('Crucifixo reto com halteres', 3, 15, 1),
('Triceps testa com barra', 3, 12, 1),
('Triceps pushdown na polia alta', 3, 10, 1);

INSERT INTO exercicios (exercicio, series, repeticoes, fkTreino) VALUES
('Puxada na frente com barra na polia alta', 3, 15, 2),
('Remada curvada com barra', 4, 8, 2),
('Remada unilateral com halteres', 3, 10, 2),
('Remada baixa na maquina', 3, 8, 2),
('Rosca direta com barra', 3, 12, 2),
('Rosca alternada com halteres', 3, 15, 2);

INSERT INTO exercicios (exercicio, series, repeticoes, fkTreino) VALUES
('Agachamento com barra', 3, 15, 3),
('Leg press 45', 3, 8, 3),
('Avanco com halteres', 3, 10, 3),
('Leg extension', 4, 10, 3),
('Cadeira flexora', 3, 10, 3),
('Cadeira abdutora', 3, 10, 3);

INSERT INTO exercicios (exercicio, series, repeticoes, fkTreino) VALUES
('Supino reto com barra', 4, 12, 4),
('Supino inclinado com halteres', 4, 10, 4),
('Desenvolvimento com halteres', 4, 12, 4),
('Crucifixo inclinado com halteres', 3, 10, 4),
('Triceps testa com barra', 4, 8, 4),
('Triceps pushdown na polia alta', 4, 12, 4);

INSERT INTO exercicios (exercicio, series, repeticoes, fkTreino) VALUES
('Puxada alta na polia', 4, 12, 5),
('Remada curvada com barra', 4, 10, 5),
('Remada unilateral com halteres', 4, 8, 5),
('Remada baixa na maquina', 3, 12, 5),
('Rosca direta com barra', 4, 10, 5),
('Rosca alternada com halteres', 4, 8, 5);

INSERT INTO exercicios (exercicio, series, repeticoes, fkTreino) VALUES
('Agachamento com barra', 4, 12, 6),
('Leg press 45', 4, 10, 6),
('Avanco com halteres', 3, 10, 6),
('Leg extension', 4, 12, 6),
('Cadeira flexora', 3, 10, 6),
('Levantamento Terra', 3, 12, 6);

INSERT INTO exercicios (exercicio, series, repeticoes, fkTreino) VALUES
('Supino reto com barra', 4, 12, 7),
('Supino inclinado com halteres', 4, 8, 7),
('Desenvolvimento com halteres', 3, 10, 7),
('Crucifixo com halteres', 3, 10, 7),
('Triceps testa com barra', 4, 12, 7),
('Triceps pushdown na polia alta', 4, 10, 7);

INSERT INTO exercicios (exercicio, series, repeticoes, fkTreino) VALUES
('Puxada na frente com barra', 4, 12, 8),
('Remada curvada com barra', 3, 12, 8),
('Remada unilateral com halteres', 4, 10, 8),
('Remada baixa com polia', 3, 10, 8),
('Rosca direta com barra', 4, 12, 8),
('Rosca alternada com halteres', 4, 10, 8);

INSERT INTO exercicios (exercicio, series, repeticoes, fkTreino) VALUES
('Agachamento com barra', 4, 12, 9),
('Leg press 45', 4, 8, 9),
('Avanco com halteres', 3, 10, 9),
('Hack squat', 3, 12, 9),
('Leg extension', 4, 12, 9),
('Cadeira flexora', 3, 10, 9);

INSERT INTO exercicios (exercicio, series, repeticoes, fkTreino) VALUES
('Supino reto com barra', 4, 12, 10),
('Supino inclinado com halteres', 3, 10, 10),
('Desenvolvimento com halteres', 4, 12, 10),
('Crucifixo reto com halteres', 3, 8, 10),
('Triceps testa com barra', 3, 10, 10),
('Triceps pushdown na polia alta', 4, 12, 10);

INSERT INTO exercicios (exercicio, series, repeticoes, fkTreino) VALUES
('Puxada na polia alta', 4, 12, 11),
('Remada curvada com barra', 4, 12, 11),
('Remada unilateral com halteres', 3, 10, 11),
('Remada baixa na maquina', 4, 8, 11),
('Rosca direta com barra', 3, 10, 11),
('Rosca alternada com halteres', 4, 8, 11);

INSERT INTO exercicios (exercicio, series, repeticoes, fkTreino) VALUES
('Agachamento com barra', 4, 12, 12),
('Leg press 45', 3, 10, 12),
('Avanco com halteres', 3, 10, 12),
('Leg extension', 4, 10, 12),
('Cadeira flexora', 3, 10, 12),
('Cadeira Abdutora', 3, 12, 12);

INSERT INTO exercicios (exercicio, series, repeticoes, fkTreino) VALUES
('Supino reto com barra', 4, 10, 13),
('Supino inclinado com halteres', 3, 10, 13),
('Desenvolvimento com halteres', 4, 10, 13),
('Crucifixo com halteres', 4, 10, 13),
('Triceps testa com barra', 4, 12, 13),
('Triceps pushdown na polia alta', 3, 10, 13);

INSERT INTO exercicios (exercicio, series, repeticoes, fkTreino) VALUES
('Puxada alta na polia', 4, 10, 14),
('Remada curvada com barra', 3, 10, 14),
('Remada unilateral com halteres', 4, 12, 14),
('Remada baixa com polia', 3, 10, 14),
('Rosca direta com barra', 4, 8, 14),
('Rosca alternada com halteres', 4, 10, 14);

INSERT INTO exercicios (exercicio, series, repeticoes, fkTreino) VALUES
('Agachamento com barra', 4, 12, 15),
('Leg press 45', 3, 10, 15),
('Avanco com halteres', 4, 10, 15),
('Hack squat', 3, 10, 15),
('Leg extension', 3, 12, 15),
('Cadeira flexora', 4, 12, 15);

INSERT INTO exercicios (exercicio, series, repeticoes, fkTreino) VALUES
('Supino reto com barra', 4, 10, 16),
('Supino inclinado com halteres', 4, 12, 6),
('Desenvolvimento com halteres', 4, 8, 16),
('Crucifixo com halteres', 3, 10, 16),
('Triceps testa com barra', 4, 10, 16),
('Triceps pushdown na polia alta', 4, 8, 16);

INSERT INTO exercicios (exercicio, series, repeticoes, fkTreino) VALUES
('Puxada alta na polia', 4, 10, 17),
('Remada curvada com barra', 4, 8, 17),
('Remada unilateral com halteres', 3, 10, 17),
('Remada baixa com polia', 4, 10, 17),
('Rosca direta com barra', 3, 12, 17),
('Rosca alternada com halteres', 3, 10, 17);

INSERT INTO exercicios (exercicio, series, repeticoes, fkTreino) VALUES
('Agachamento com barra', 4, 10, 18),
('Leg press 45', 4, 8, 18),
('Avanco com halteres', 3, 12, 18),
('Hack squat', 3, 12, 18),
('Leg extension', 4, 10, 18),
('Cadeira flexora', 4, 8, 18);

INSERT INTO exercicios (exercicio, series, repeticoes, fkTreino) VALUES
('Agachamento com barra', 3, 15, 19),
('Leg press 45', 4, 10, 19),
('Agachamento com halteres', 3, 12, 19),
('Avanco com halteres', 3, 15, 19),
('Hack squat', 3, 10, 19),
('Leg extension', 3, 12, 19);

INSERT INTO exercicios (exercicio, series, repeticoes, fkTreino) VALUES
('Supino reto com barra', 3, 10, 20),
('Puxada na polia alta', 3, 15, 20),
('Remada unilateral com halteres', 3, 12, 20),
('Desenvolvimento com halteres', 3, 12, 20),
('Rosca direta com barra', 3, 10, 20),
('Triceps na polia alta', 3, 15, 20);

INSERT INTO exercicios (exercicio, series, repeticoes, fkTreino) VALUES
('Elevação Pélvica', 3, 15, 21),
('Levantamento terra', 3, 10, 21),
('Avanco com halteres', 3, 15, 21),
('Coice na Polia', 3, 10, 21),
('Cadeira abdutora', 3, 12, 21),
('Cadeira flexora', 3, 15, 21);

INSERT INTO exercicios (exercicio, series, repeticoes, fkTreino) VALUES
('Agachamento com barra', 4, 10, 22),
('Leg press 45', 4, 12, 22),
('Agachamento com halteres', 4, 8, 22),
('Avanco com halteres', 3, 12, 22),
('Hack squat', 3, 12, 22),
('Leg extension', 4, 12, 22);

INSERT INTO exercicios (exercicio, series, repeticoes, fkTreino) VALUES
('Supino reto com barra', 4, 10, 23),
('Puxada na polia alta', 4, 10, 23),
('Remada unilateral com halteres', 4, 8, 23),
('Desenvolvimento com halteres', 3, 12, 23),
('Rosca direta com barra', 3, 10, 23),
('Triceps na polia alta', 4, 8, 23);

INSERT INTO exercicios (exercicio, series, repeticoes, fkTreino) VALUES
('Elevação Pélvica', 4, 12, 24),
('Levantamento Terra Sumô', 4, 10, 24),
('Búlgaro com halteres', 4, 8, 24),
('Coice na polia', 3, 10, 24),
('Abducao de quadril na maquina', 4, 8, 24),
('Cadeira flexora', 4, 12, 24);

INSERT INTO exercicios (exercicio, series, repeticoes, fkTreino) VALUES
('Agachamento com barra', 4, 12, 25),
('Leg press 45', 4, 10, 25),
('Hack squat', 3, 10, 25),
('Agachamento sumo com barra', 3, 10, 25),
('Leg extension', 4, 10, 25),
('Avanco com halteres', 4, 10, 25);

INSERT INTO exercicios (exercicio, series, repeticoes, fkTreino) VALUES
('Supino reto com barra', 4, 10, 26),
('Remada curvada com barra', 4, 10, 26),
('Puxada na polia alta', 4, 10, 26),
('Desenvolvimento com halteres', 4, 10, 26),
('Rosca direta com barra', 4, 10, 26),
('Triceps pushdown na polia alta', 4, 10, 26);

INSERT INTO exercicios (exercicio, series, repeticoes, fkTreino) VALUES
('Elevação Pélvica', 4, 10, 27),
('Levantamento Terra Sumô', 4, 10, 27),
('Avanco com halteres', 4, 10, 27),
('Coice na Polia', 4, 10, 27),
('Cadeira abdutora', 4, 10, 27),
('Abdução na polia', 4, 10, 27);

INSERT INTO exercicios (exercicio, series, repeticoes, fkTreino) VALUES
('Agachamento com barra', 3, 12, 28),
('Leg press 45', 3, 12, 28),
('Agachamento com halteres', 3, 12, 28),
('Avanco com halteres', 3, 12, 28),
('Hack squat', 3, 12, 28),
('Leg extension', 3, 12, 28);

INSERT INTO exercicios (exercicio, series, repeticoes, fkTreino) VALUES
('Supino reto com barra', 3, 12, 29),
('Remada unilateral com halteres', 3, 12, 29),
('Puxada na polia alta', 3, 12, 29),
('Desenvolvimento com halteres', 3, 12, 29),
('Rosca direta com barra', 3, 12, 29),
('Triceps na polia alta', 3, 12, 29);

INSERT INTO exercicios (exercicio, series, repeticoes, fkTreino) VALUES
('Elevação Pélvica', 3, 12, 30),
('Levantamento Terra Sumô', 3, 12, 30),
('Avanco com halteres', 3, 12, 30),
('Coice na Polia', 3, 12, 30),
('Cadeira abdutora', 3, 12, 30),
('Cadeira flexora', 3, 12, 30);

INSERT INTO exercicios (exercicio, series, repeticoes, fkTreino) VALUES
('Agachamento com barra', 4, 10, 31),
('Leg press 45', 4, 10, 31),
('Hack squat', 4, 10, 31),
('Agachamento com halteres', 4, 10, 31),
('Leg extension', 4, 10, 31),
('Avanco com halteres', 4, 10, 31);

INSERT INTO exercicios (exercicio, series, repeticoes, fkTreino) VALUES
('Supino reto com barra', 4, 10, 32),
('Puxada na polia alta', 4, 10, 32),
('Remada unilateral com halteres', 4, 10, 32),
('Desenvolvimento com halteres', 4, 10, 32),
('Rosca direta com barra', 4, 10, 32),
('Triceps na polia alta', 4, 10, 32);

INSERT INTO exercicios (exercicio, series, repeticoes, fkTreino) VALUES
('Elevação Pélvica', 4, 10, 33),
('Levantamento Terra Sumô', 4, 10, 33),
('Búlgaro com halteres', 4, 10, 33),
('Coice na Polia', 4, 10, 33),
('Cadeira abdutora', 4, 10, 33),
('Abdução na polia', 4, 10, 33);

INSERT INTO exercicios (exercicio, series, repeticoes, fkTreino) VALUES
('Agachamento com barra', 5, 10, 34),
('Leg press 45', 5, 10, 34),
('Hack squat', 5, 10, 34),
('Agachamento sumo com barra', 5, 10, 34),
('Leg extension', 5, 10, 34),
('Avanco com halteres', 5, 10, 34);

INSERT INTO exercicios (exercicio, series, repeticoes, fkTreino) VALUES
('Supino reto com barra', 5, 10, 35),
('Remada curvada com barra', 5, 10, 35),
('Puxada na polia alta', 5, 10, 35),
('Desenvolvimento com halteres', 5, 10, 35),
('Rosca direta com barra', 5, 10, 35),
('Triceps pushdown na polia alta', 5, 10, 35);

INSERT INTO exercicios (exercicio, series, repeticoes, fkTreino) VALUES
('Elevação Pélvica', 5, 10, 36),
('Levantamento Terra Sumô', 5, 10, 36),
('Avanco com halteres', 5, 10, 36),
('Coice na Polia', 5, 10, 36),
('Cadeira abdutora', 5, 10, 36),
('Abdução na Polia', 5, 10, 36);

-- VIEW DASHBOARD
CREATE VIEW VW_dashboard AS
SELECT 
pg.peso,
pg.altura,
m.pesoMeta,
pg.fkUsuario,
pg.dtRegistro
FROM usuario u
JOIN perfil p ON u.fkPerfil = p.id
JOIN progresso pg ON pg.fkUsuario = u.id_usuario
LEFT JOIN meta m ON m.fkUsuario = u.id_usuario;

-- GRÁFICO DASHBOARD
SELECT 
    peso,
    ROUND(peso / POWER(altura / 100, 2), 1) AS imc,
    DATE_FORMAT(dtRegistro, '%d/%m') AS dtRegistro
FROM VW_dashboard
WHERE fkUsuario = 3
ORDER BY dtRegistro ASC;

-- KPI peso atual
SELECT peso 
FROM VW_dashboard 
WHERE fkUsuario = 1
ORDER BY dtRegistro DESC 
LIMIT 1;

-- KPI QUANTO FALTA PARA A META
SELECT 
ABS(peso - pesoMeta) AS diferencaPeso
FROM VW_dashboard
WHERE fkUsuario = 3
ORDER BY dtRegistro DESC
LIMIT 1;

-- TREINO DO DIA
SELECT t.musculos
FROM usuario u
JOIN perfil p ON p.id = u.fkPerfil
JOIN treino t ON t.fkPerfil = p.id
WHERE u.id_usuario = 1
AND divisao =
CASE (DAYOFMONTH(CURDATE()) % 3)
WHEN 1 THEN 'A'
WHEN 2 THEN 'B'
ELSE 'C'
END;

-- VIEW MEUS TREINOS
CREATE VIEW vw_treinos_usuario AS
SELECT
u.id_usuario,
t.divisao,
t.musculos,
t.cardio,
e.exercicio,
e.series,
e.repeticoes
FROM usuario u
JOIN perfil p
ON p.id = u.fkPerfil
JOIN treino t
ON t.fkPerfil = p.id
JOIN exercicios e
ON e.fkTreino = t.id;

-- VER CADA TREINO
SELECT *
FROM vw_treinos_usuario
WHERE id_usuario = 3
ORDER BY divisao;

-- VIEW TELA PERFIL
CREATE VIEW VW_perfil AS
SELECT 
u.nome,
pG.peso,
pg.altura,
m.pesoMeta,
p.objetivo,
pg.dtRegistro,
u.id_usuario
FROM usuario u
JOIN progresso pg ON pg.fkUsuario = u.id_usuario
JOIN meta m ON m.fkUsuario = u.id_usuario
JOIN perfil p ON p.id = u.fkPerfil;

-- CARD PERFIL
SELECT 
peso,
altura
objetivo
FROM VW_perfil
WHERE id_usuario = 3
ORDER BY dtRegistro DESC 
LIMIT 1;

-- CARD META 
SELECT 
pesoMeta,
peso
FROM VW_perfil
WHERE id_usuario = 3
ORDER BY dtRegistro ASC
LIMIT 1;

SELECT
    pg.peso AS pesoAtual,
    m.pesoMeta
    FROM progresso pg
    JOIN meta m
    ON m.fkUsuario = pg.fkUsuario
    WHERE pg.fkUsuario = 1
    ORDER BY pg.dtRegistro DESC
    LIMIT 1;