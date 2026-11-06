CREATE DATABASE IF NOT EXISTS gestao_torneios; 
USE gestao_torneios; -- Tabela Equipas 
CREATE TABLE Equipas ( 
ID_Equipa INT AUTO_INCREMENT PRIMARY KEY, 
Nome_Equipa VARCHAR(100) NOT NULL, 
Data_Criacao DATE NOT NULL 
); 

-- Tabela Jogadores 

CREATE TABLE Jogadores ( 
ID_Jogador INT AUTO_INCREMENT PRIMARY KEY, 
Nome VARCHAR(100) NOT NULL, 
Nickname VARCHAR(50) NOT NULL, 
Data_Nascimento DATE NOT NULL, 
ID_Equipa INT NOT NULL, 
FOREIGN KEY (ID_Equipa) 
REFERENCES Equipas(ID_Equipa) 
); 

-- Tabela Torneios 

CREATE TABLE Torneios ( 
ID_Torneio INT AUTO_INCREMENT PRIMARY KEY, 
Nome VARCHAR(100) NOT NULL, 
Data_Inicio DATE NOT NULL, 
Premio_Monetario DECIMAL(10,2) NOT NULL, 
CHECK (Premio_Monetario >= 0) 
);

-- Tabela Participacoes 

CREATE TABLE Participacoes ( 
ID_Equipa INT NOT NULL, 
ID_Torneio INT NOT NULL, 
PRIMARY KEY (ID_Equipa, ID_Torneio), 
FOREIGN KEY (ID_Equipa) 
REFERENCES Equipas(ID_Equipa), 
FOREIGN KEY (ID_Torneio) 
REFERENCES Torneios(ID_Torneio) 
); 

INSERT INTO Equipas ( Nome_Equipa, Data_Criacao) VALUES
( "Os Tots", "20091221"), 
( "Os D", "20091221");

INSERT INTO Jogadores (Nome, Nickname, Data_Nascimento, ID_Equipa) VALUES
("António Sereno", "Serenadas", "20041115" , 1),
("Vitor Santos", "Bombas", "20041116" , 1);

INSERT INTO Torneios (Nome, Data_Inicio, Premio_Monetario) VALUES
("O Big torneio", "20041116", 67),
("RedBull Torneio", "20041016", 6767),
("Torneio da G2", "20041216", 100);

INSERT INTO Participacoes (ID_Equipa, ID_Torneio) VALUES
(1, 1),
(2, 1);

SELECT * FROM Jogadores 
ORDER BY Nome ASC;

SELECT Nome, ID_Equipa FROM Jogadores;

SELECT * FROM Participacoes WHERE ID_Torneio = 1;

SELECT COUNT(*) AS total_Jogadores
FROM Jogadores
HAVING COUNT(*) >= 2;

-- Tentativa da E não funcmina
SELECT COUNT(*) AS total_Jogadores
FROM Jogadores
INNER JOIN Equipas
ON Equipas.Nome_Equipa;

-- Tentativa da E não funcmina
SELECT Equipas.Nome_Equipa, SUM(Jogadores.ID_Equipa) as total_Jogadores
FROM Equipas
INNER JOIN Jogadores
GROUP BY total_Jogadores;

-- Tentativa da F não funcmina

SELECT Torneios.Nome, Torneios.Premio_Monetario 
FROM Torneios
INNER JOIN Participacoes
ON COUNT(Participacoes.ID_Equipa);


  
  
