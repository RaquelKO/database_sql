/*Exerc�cio 07 � View
Utilizando os conceitos aprendidos durante a aula, realize as seguintes opera��es solicitadas.*/

--1. Criar uma view para exibir o Nome, UserName e Password dos Players com idade (Age) maior ou igual a 30.
CREATE VIEW vwDetalhesPlayers
AS
	SELECT
		P.Name Nome,
		P.UserName Usu�rio,
		P.Password Senha
	FROM
		Player P
	WHERE P.Age >= 30
-- Consultando a view:
SELECT * FROM vwDetalhesPlayers ORDER BY Nome, Usu�rio, Senha

--2. Criar uma view para exibir o IP, Type e CreationDate dos GameServer.
CREATE VIEW vwDetalhesGameServer
AS
	SELECT
		G.IP,
		G.Type,
		G.CreationDate
	FROM
		GameServer G
-- Consultando a view:
SELECT * FROM vwDetalhesGameServer ORDER BY IP, Type, CreationDate

--3. Criar uma view para exibir o Nome e UserName do Player e o IP e Type do GameServer.
CREATE VIEW vwPlayerAndServer
AS
	SELECT
		P.Name Nome,
		P.UserName Usu�rio,
		G.IP,
		G.Type Tipo
	FROM
		Player P INNER JOIN GameServer G
			ON P.IDGameServer = G.IDGameServer
-- Consultando a view:
SELECT * FROM vwPlayerAndServer ORDER BY Nome, Usu�rio, IP, Tipo

--4. Criar uma view para exibir a quantidade de Players por GameServer. Exibir o IP do GameServer e a quantidade de players.
CREATE VIEW vwQtdePlayersPorGameServer
AS
	SELECT
		G.IP,
		COUNT(P.IDPlayer) QtdePlayers
	FROM
		Player P INNER JOIN GameServer G
			ON P.IDGameServer = G.IDGameServer
	GROUP BY
		IP
-- Consultando a view:
SELECT * FROM vwQtdePlayersPorGameServer ORDER BY IP

--5. Criar uma view para exibir a quantidade de GameServer criados por ano (CreationDate).
CREATE VIEW vwQtdePlayersCriadosPorAno
AS
	SELECT
		YEAR(G.CreationDate) AnoCriacao,
		COUNT(*) QtdeGameServer
	FROM
		GameServer G
	GROUP BY
		YEAR(G.CreationDate)
-- Consultando a view:
SELECT * FROM vwQtdePlayersCriadosPorAno ORDER BY AnoCriacao

--6. Criar uma view para exibir o Type do GameServer, a m�dia e a soma de pontos dos players que est�o associados ao Game Server.
CREATE VIEW vwPlayersPointsPerGameServerTypes
AS
	SELECT
		G.Type Tipo,
		AVG(P.Points) M�dia,
		SUM(P.Points) Soma
	FROM
		Player P INNER JOIN GameServer G
			ON P.IDGameServer = G.IDGameServer
	GROUP BY
		G.Type
-- Consultando a view:
SELECT * FROM vwPlayersPointsPerGameServerTypes ORDER BY Tipo