/*Exercício 01 – Junções
Utilizando os conceitos aprendidos durante a aula, realize as seguintes operações solicitadas.*/

--1. Criar uma consulta para exibir o Name e o UserName do Player e os seus respectivos Type do GameServer utilizado por eles.
SELECT
	P.[Name] NomePlayer, 
	P.UserName NomeUsuario
FROM
	Player P INNER JOIN GameServer G
		ON G.IDGameServer = P.IDGameServer

--2. Criar uma consulta para exibir o UserName e o Password do Player e o respectivo IP e CreationDate do GameServer utilizado por eles.
SELECT 
	P.UserName NomeUsuario,
	P.[Password] Senha
FROM
	Player P INNER JOIN GameServer G
		ON G.IDGameServer = P.IDGameServer

--3. Criar uma consulta para exibir o IP de todos os GameSever e os Name dos respectivos Players quando existir associação.
SELECT 
	G.[IP] EndereçoIP,
	P.[Name] Nome
FROM
	GameServer G LEFT JOIN Player P
		ON G.IDGameServer = P.IDGameServer

--4. Criar uma consulta para exibir o IP e CreationDate do GameServer e o Name do Player quando o seu Name possuir “Ana” em qualquer parte do texto.
SELECT 
	G.[IP] EndereçoIP,
	G.CreationDate DataCriação,
	P.[Name] Nome
FROM
	GameServer G INNER JOIN Player P
		ON G.IDGameServer = P.IDGameServer
WHERE 
	P.[Name] LIKE ('%Ana%')

--5. Criar uma consulta para exibir o UserName e o Age do Player e o Creation Date do GameServer quando o Password do Player possuir 4 (inclusive) ou menos letras.
SELECT 
	P.UserName Usuario,
	P.Age Idade,
	G.CreationDate DataCriação
FROM
	GameServer G INNER JOIN Player P
		ON G.IDGameServer = P.IDGameServer
WHERE 
	LEN(Password) <= 4

--6. Criar uma consulta para exibir o IP do GameServer e a quantidade de Players associados a cada GameServer
SELECT 
	G.[IP] EndereçoIP,
	COUNT (*) QtdePlayers
FROM
	GameServer G INNER JOIN Player P
		ON G.IDGameServer = P.IDGameServer
GROUP BY
	G.[IP]

--7. Criar uma consulta para exibir o Type do GameServer e a média de idade (Age) dos Players associados a eles.
SELECT 
	G.[Type] TipoServidor,
	AVG (P.Age) MediaIdade
FROM
	GameServer G INNER JOIN Player P
		ON G.IDGameServer = P.IDGameServer
GROUP BY
	G.[Type]