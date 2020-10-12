--Atividade 1: Comandos DDL e DML por Raquel Kuntz Oliveira

--DDL � Data Definition Language

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
	Caracter�sticas	varchar(1000),
	IDHabilidade	int not null,
	CONSTRAINT PKIDClasse PRIMARY KEY(IDClasse),
	CONSTRAINT FKClasseHabilidade FOREIGN KEY(IDHabilidade) REFERENCES Habilidade(IDHabilidade)
)

CREATE TABLE Ra�a
(
	IDRa�a		int not null identity,
	Nome		varchar(100) not null,
	Descri��o	varchar(500),
	Origem		varchar(150) not null,
	Perdido		datetime not null,
	CONSTRAINT PKIDRa�a PRIMARY KEY(IDRa�a)
)

CREATE TABLE Personagem
(
	IDPersonagem	int not null identity,
	Nome			varchar(100) not null,
	Descri��o		varchar(500) not null,
	DataNascimento	datetime not null,
	IDRa�a			int not null,
	IDClasse		int not null,
	CONSTRAINT PKIDPersonagem PRIMARY KEY(IDPersonagem),
	CONSTRAINT FKPersonagemClasse FOREIGN KEY(IDClasse) REFERENCES Classe(IDClasse),
	CONSTRAINT FKPersonagemRa�a FOREIGN KEY(IDRa�a) REFERENCES Ra�a(IDRa�a)
)

--2. Adicionar na tabela Habilidade o campo Poder do tipo int.
ALTER TABLE Habilidade ADD Poder int

--3. Alterar o campo Caracter�sticas da tabela Classe para varchar(500).
ALTER TABLE Classe ALTER COLUMN Caracter�sticas varchar(500)

--4. Excluir o campo Perdido da tabela Ra�a
ALTER TABLE Ra�a DROP COLUMN Perdido

--DML � Data Manipulation Language

--5. Inserir pelo menos 3 (tr�s) linhas de dados para cada uma das tabelas (aten��o para a ordem de inser��o nas tabelas).
INSERT INTO Habilidade(Nome, Poder)
VALUES
	('Magia', 800),
	('Arco e Flecha', 500),
	('Machado', 450)

INSERT INTO Classe(Nome, Caracter�sticas, IDHabilidade)
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
		'Um guerreiro � capaz de batalhar corpo a corpo e com o uso de armas.',
		(SELECT IDHabilidade FROM Habilidade WHERE Nome = 'Machado')
	)

INSERT INTO Ra�a(Nome, Origem)
VALUES
	('Orc', 'Cavernas de Moria'),
	('Elfo', 'Montanhas de Gondolin'),
	('Humano', 'Plan�cies e campos')

INSERT INTO Personagem(Nome, Descri��o, DataNascimento, IDRa�a, IDClasse)
VALUES
	(
		'Azog',
		'Azog � o Rei dos Orcs de Moria, com imensa for�a e sede de vingan�a.',
		(CONVERT(datetime, '1971-05-07')),
		(SELECT IDRa�a FROM Ra�a WHERE Nome = 'Orc'),
		(SELECT IDClasse FROM Classe WHERE Nome = 'Guerreiro')
	),
	(
		'Legolas',
		'� um elfo mensageiro, de fam�lia real.',
		(CONVERT(datetime, '1986-10-26')),
		(SELECT IDRa�a FROM Ra�a WHERE Nome = 'Elfo'),
		(SELECT IDClasse FROM Classe WHERE Nome = 'Arqueiro')
	),
	(
		'Gandalf',
		'YOU SHALL PASS IN DB!',
		(CONVERT(datetime, '1874-08-07')),
		(SELECT IDRa�a FROM Ra�a WHERE Nome = 'Humano'),
		(SELECT IDClasse FROM Classe WHERE Nome = 'Mago')
	)

--6. Atualizar as Caracteristicas da tabela Classe para �Caracter�sticas Gerais� quando o seu valor estiver null.
UPDATE Classe SET Caracter�sticas = 'Caracter�sticas Gerais' WHERE Caracter�sticas IS NULL

--7. Atualizar a informa��o do Poder da tabela Habilidade para o triplo do seu valor.
UPDATE Habilidade SET Poder *= 3

--8. Excluir todos os Personagens com ano de nascimento (DataNascimento) entre 1970 e 1990.
DELETE FROM Personagem WHERE YEAR(DataNascimento) BETWEEN 1970 AND 1990

--9. Excluir todas as Classes que o IDHabilidade seja igual 1, 2 ou 3.
DELETE FROM Personagem WHERE IDClasse IN (SELECT IDClasse FROM Classe WHERE IDHabilidade <= 3)
DELETE FROM Classe WHERE IDHabilidade <= 3