--Atividade 1: Comandos DDL e DML por Raquel Kuntz Oliveira

--DDL – Data Definition Language

--1. Criar as tabelas do modelo ER indicado abaixo.
CREATE TABLE Habilidade
(
	IDHabilidade	int not null identity,
	Nome			varchar(200) not null,
	CONSTRAINT PKIDHabilidade PRIMARY KEY(IDHabilidade)
)

CREATE TABLE Classe
(
	IDClasse		int not null identity,
	Nome			varchar(100) not null,
	Características	varchar(1000),
	IDHabilidade	int not null,
	CONSTRAINT PKIDClasse PRIMARY KEY(IDClasse),
	CONSTRAINT FKClasseHabilidade FOREIGN KEY(IDHabilidade) REFERENCES Habilidade(IDHabilidade)
)

CREATE TABLE Raça
(
	IDRaça		int not null identity,
	Nome		varchar(100) not null,
	Descrição	varchar(500),
	Origem		varchar(150) not null,
	Perdido		datetime not null,
	CONSTRAINT PKIDRaça PRIMARY KEY(IDRaça)
)

CREATE TABLE Personagem
(
	IDPersonagem	int not null identity,
	Nome			varchar(100) not null,
	Descrição		varchar(500) not null,
	DataNascimento	datetime not null,
	IDRaça			int not null,
	IDClasse		int not null,
	CONSTRAINT PKIDPersonagem PRIMARY KEY(IDPersonagem),
	CONSTRAINT FKPersonagemClasse FOREIGN KEY(IDClasse) REFERENCES Classe(IDClasse),
	CONSTRAINT FKPersonagemRaça FOREIGN KEY(IDRaça) REFERENCES Raça(IDRaça)
)

--2. Adicionar na tabela Habilidade o campo Poder do tipo int.
ALTER TABLE Habilidade ADD Poder int

--3. Alterar o campo Características da tabela Classe para varchar(500).
ALTER TABLE Classe ALTER COLUMN Características varchar(500)

--4. Excluir o campo Perdido da tabela Raça
ALTER TABLE Raça DROP COLUMN Perdido

--DML – Data Manipulation Language

--5. Inserir pelo menos 3 (três) linhas de dados para cada uma das tabelas (atenção para a ordem de inserção nas tabelas).
INSERT INTO Habilidade(Nome, Poder)
VALUES
	('Magia', 800),
	('Arco e Flecha', 500),
	('Machado', 450)

INSERT INTO Classe(Nome, Características, IDHabilidade)
VALUES
	(
		'Mago',
		'Magos possuem o dom da magia para ataque ou cura.',
		(SELECT IDHabilidade FROM Habilidade WHERE Nome = 'Magia')
	),
	(
		'Arqueiro',
		NULL,
		(SELECT IDHabilidade FROM Habilidade WHERE Nome = 'Arco e Flecha')
	),
	(
		'Guerreiro',
		'Um guerreiro é capaz de batalhar corpo a corpo e com o uso de armas.',
		(SELECT IDHabilidade FROM Habilidade WHERE Nome = 'Machado')
	)

INSERT INTO Raça(Nome, Origem)
VALUES
	('Orc', 'Cavernas de Moria'),
	('Elfo', 'Montanhas de Gondolin'),
	('Humano', 'Planícies e campos')

INSERT INTO Personagem(Nome, Descrição, DataNascimento, IDRaça, IDClasse)
VALUES
	(
		'Azog',
		'Azog é o Rei dos Orcs de Moria, com imensa força e sede de vingança.',
		(CONVERT(datetime, '1971-05-07')),
		(SELECT IDRaça FROM Raça WHERE Nome = 'Orc'),
		(SELECT IDClasse FROM Classe WHERE Nome = 'Guerreiro')
	),
	(
		'Legolas',
		'É um elfo mensageiro, de família real.',
		(CONVERT(datetime, '1986-10-26')),
		(SELECT IDRaça FROM Raça WHERE Nome = 'Elfo'),
		(SELECT IDClasse FROM Classe WHERE Nome = 'Arqueiro')
	),
	(
		'Gandalf',
		'YOU SHALL PASS IN DB!',
		(CONVERT(datetime, '1874-08-07')),
		(SELECT IDRaça FROM Raça WHERE Nome = 'Humano'),
		(SELECT IDClasse FROM Classe WHERE Nome = 'Mago')
	)

--6. Atualizar as Caracteristicas da tabela Classe para “Características Gerais” quando o seu valor estiver null.
UPDATE Classe SET Características = 'Características Gerais' WHERE Características IS NULL

--7. Atualizar a informação do Poder da tabela Habilidade para o triplo do seu valor.
UPDATE Habilidade SET Poder *= 3

--8. Excluir todos os Personagens com ano de nascimento (DataNascimento) entre 1970 e 1990.
DELETE FROM Personagem WHERE YEAR(DataNascimento) BETWEEN 1970 AND 1990

--9. Excluir todas as Classes que o IDHabilidade seja igual 1, 2 ou 3.
DELETE FROM Personagem WHERE IDClasse IN (SELECT IDClasse FROM Classe WHERE IDHabilidade <= 3)
DELETE FROM Classe WHERE IDHabilidade <= 3