CREATE DATABASE IF NOT EXISTS PetCare;
USE PetCare;

CREATE TABLE Cliente (
    ID_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome_cliente varchar(70) NOT NULL,
    CPF char(11) NOT NULL,
    CONSTRAINT CPF UNIQUE(CPF),
    telefone varchar(15) NOT NULL,
    email varchar(100)
);


CREATE TABLE Animais (
    ID_animais INT AUTO_INCREMENT PRIMARY KEY,
    ID_cliente INT NOT NULL,
    FOREIGN KEY (ID_cliente) REFERENCES Cliente(ID_cliente),
    nome_animal varchar(70) NOT NULL,
    data_nascimento DATE NOT NULL,
    especie varchar(25) NOT NULL,
    raca varchar(25) NOT NULL
);

CREATE TABLE Atendimento (
    ID_atendimento INT AUTO_INCREMENT PRIMARY KEY,
    ID_animais INT NOT NULL,
    FOREIGN KEY (ID_animais) REFERENCES Animais(ID_animais),
    data_atendimento DATE NOT NULL,
    tipo varchar(30) NOT NULL,
    valor DOUBLE NOT NULL
);


-- INSERTS
INSERT INTO Cliente (nome_cliente, CPF, telefone, email)
VALUES
('Maria Eduarda', '12345678901', '(19)99999-1111', 'maria@gmail.com'),
('Miguel Cardoso', '98765432100', '(19)98888-2222', 'mimi@gmail.com'),
('João Lima', '11122233344', '(19)97777-3333', 'joao@gmaill.com');

INSERT INTO Animais (ID_cliente, nome_animal, data_nascimento, especie, raca)
VALUES
(1, 'Mel', '2025-07-27', 'Cachorro', 'SRD'),
(2, 'Nairobi', '2023-01-20', 'Cachorro', 'Labardor Chocolate'),
(3, 'Thor', '2020-11-15', 'Coelho', 'Coelho Hotot'),
(3, 'Luna', '2022-08-03', 'Gato', 'Siamês'),
(2, 'Max', '2020-04-23', 'Cachorro', 'SRD');

INSERT INTO Atendimento (ID_animais, data_atendimento, tipo, valor)
VALUES
(1, '2026-06-10', 'Consulta', 150.20),
(1, '2026-06-12', 'Vacinação', 120.50),
(2, '2026-06-13', 'Banho', 72.00),
(3, '2026-06-14', 'Cirurgia', 250.60),
(4, '2026-06-14', 'Consulta', 110.00);


-- SELECTS
SELECT * FROM Cliente;

SELECT * FROM Animais;

SELECT * FROM Atendimento;

SELECT * FROM Atendimento
WHERE tipo = 'Consulta'; -- mostra só as consultas

-- Busca textual utilizando LIKE
SELECT * FROM Animais
WHERE nome_animal LIKE '%a%'; -- vai retornar todos os animais que tem "a" no nome.

-- Listagem ordenada de forma decrescente
SELECT * FROM Atendimento
ORDER BY valor DESC; -- mostra os atendimentos do maior para o menor

-- UPDATES
UPDATE Cliente
SET telefone = '(19)00000-9999'
WHERE ID_cliente = 1;

UPDATE Cliente
SET email = 'novoemail@gmail.com'
WHERE ID_cliente = 2;

UPDATE Animais
SET raca = 'Golden Retriever'
WHERE ID_animais = 4;

UPDATE Atendimento
SET valor = 180.00
WHERE ID_atendimento = 1;


-- DELETE
DELETE FROM Atendimento
WHERE ID_atendimento = 5;

DELETE FROM Atendimento
WHERE ID_animais = 2; -- exclui um animal (depois de excluir seus atendimentos)

DELETE FROM Animais
WHERE ID_animais = 2;

DELETE FROM Atendimento
WHERE ID_animais = 3;

DELETE FROM Animais
WHERE ID_cliente = 2; -- exclui um cliente (depois de excluir seus animais e atendimentos)

DELETE FROM Cliente
WHERE ID_cliente = 2;