/*Exercício 01 - DDL: Data Definition Language
Utilizando os conceitos aprendidos durante a aula, realize as seguintes operações solicitadas.*/

--1. Criar as tabelas do modelo indicado abaixo
--2. Criar as restrições solicitadas (not null, identity).
--3. Criar os relacionamentos necessários (chaves primárias e chaves estrangeiras)
CREATE TABLE GameServer
(
	IDGameServer	int not null identity,
	[IP]			varchar(30) not null,
	[Type]			varchar(100) not null,
	CreationDate	datetime not null,
	DNSServer		int,
	CONSTRAINT PKIDGameServer PRIMARY KEY(IDGameServer)
)

CREATE TABLE Player
(
	IDPlayer		int not null identity,
	[Name]			varchar(100) not null,
	UserName		varchar(20) not null,
	[Password]		varchar(20) not null,
	Points			int,
	IDGameServer	int not null,
	CONSTRAINT	PKIDPlayer PRIMARY KEY (IDPlayer),
	CONSTRAINT	FKPlayerGameServer FOREIGN KEY(IDGameServer) REFERENCES GameServer(IDGameServer)
)

--4. Adicionar na tabela Player o campo Age do tipo int
ALTER TABLE Player ADD Age int

--5. Alterar o campo Name da tabela Player para varchar(200)
ALTER TABLE Player ALTER COLUMN [Name] varchar(200) not null

--6. Excluir o campo DNSServer da tabela GameServer
ALTER TABLE GameServer DROP COLUMN DNSServer