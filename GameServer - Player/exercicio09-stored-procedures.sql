/*Exerc�cio 09 � Stored Procedures
Utilizando os conceitos aprendidos durante a aula, realize as seguintes opera��es solicitadas.*/

SELECT * FROM GameServer
SELECT * FROM Player

--1. Criar uma Stored Procedure para exibir a quantidade de Players cadastrados.
CREATE OR ALTER PROC spQtdePlayers
as
BEGIN
	SELECT COUNT(*) QtdePlayers FROM Player
END

exec spQtdePlayers 

--2. Criar uma Stored Procedure para exibir o CreationDate mais antigo do GameServer.
CREATE OR ALTER PROC spOldestCreationDate
AS
BEGIN
	SELECT MIN(CreationDate) MaisVelho FROM GameServer
END

exec spOldestCreationDate

--3. Criar uma Stored Procedure para atualizar o Points de um determinado Player informado (utilizar o IDPlayer)
CREATE PROCEDURE spAtualizaPontos @Player INT
AS
BEGIN
	UPDATE Player SET Points = 100 WHERE IDPlayer = @Player
END

exec spAtualizaPontos 1 --Por posi��o
exec spAtualizaPontos @Player = 1 --Por refer�ncia

--4. Criar uma Stored Procedure para realizar a inser��o de uma novo GameServer 
--(todos os campos obrigat�rios devem fazer parte dos par�metros informados)
CREATE or ALTER PROCEDURE spAdicionaGameServer
	@IP	varchar(30),
	@Type varchar(100)
AS
BEGIN
	INSERT INTO GameServer VALUES (@IP, @Type, GETDATE())
END

EXEC spAdicionaGameServer '192.168.10.63', 'Listen server' --Por Posi��o
EXEC spAdicionaGameServer @Type = 'Listen server', @IP = '192.168.10.63' --Por refer�ncia
SELECT * FROM GameServer ORDER BY IDGameServer DESC

--5. Criar uma Stored Procedure para realizar a inser��o de um novo Player 
--(todos os campos obrigat�rios devem fazer parte dos par�metros informados).
CREATE or ALTER PROCEDURE spAdicionaPlayer
	@Name	varchar(100),
	@Username varchar(20),
	@Password varchar(20),
	@Points int,
	@IDGameServer int,
	@Age int
AS
BEGIN
	INSERT INTO Player VALUES (@Name, @Username, @Password, @Points, @IDGameServer, @Age)
END

EXEC spAdicionaPlayer 'Cosmo', 'Co5m0', '987', '550', 1, 25 --Por Posi��o
EXEC spAdicionaPlayer @Name = 'Cosmo', @Username = 'Co5m0', @Password = '987', @Points = '550', @IDGameServer = 1, @Age = 25 --Por refer�ncia
SELECT * FROM Player ORDER BY IDPlayer DESC