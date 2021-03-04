/*Exerc�cio 08 � SubConsultas
Utilizando os conceitos aprendidos durante a aula, realize as seguintes opera��es solicitadas.*/

--1. Criar uma SubConsulta para exibir o Nome e UserName dos players que est�o acima da m�dia de idade.
SELECT Name, UserName
FROM Player
WHERE Age > (SELECT AVG(Age) FROM Player)

--2. Criar uma SubConsulta para exibir o Nome e Password dos players que est�o abaixo da m�dia de idade.
SELECT Name, Password
FROM Player
WHERE Age < (SELECT AVG(Age) FROM Player)

--3. Criar uma SubConsulta para exibir o IP, Type e CreationDate que s�o utilizados pelos players.
SELECT
IP, Type, CreationDate
FROM
GameServer
WHERE
IDGameServer IN (SELECT IDGameServer FROM Player)

--4. Criar uma SubConsulta para exibir o IP, Type e CreationDate que N�O s�o utilizados pelos players.
SELECT
IP, Type, CreationDate
FROM
GameServer
WHERE
IDGameServer NOT IN (SELECT IDGameServer FROM Player)

--5. Criar uma SubConsulta para exibir todas as informa��es dos players que est�o acima da pontua��o (points) m�dia.
SELECT *
FROM Player
WHERE Points > (SELECT AVG(Points) FROM Player)

--6. Criar uma SubConsulta para exibir o Nome, UserName e Password dos players que possuem a idade maior que o �Hulk Jedi�.
SELECT Name, UserName, Password
FROM Player
WHERE Age > (SELECT Age FROM Player WHERE Name = 'Hulk Jedi')

--7. Criar uma SubConsulta para exibir o Nome, UserName e Password e Points dos players que utilizam os mesmos GameServers que o �Ace Monster� e o �Procurando Nemo�.
SELECT Name, UserName, Password, Points, IDGameServer
FROM Player
WHERE IDGameServer IN (SELECT IDGameServer FROM Player WHERE Name IN ('Ace Monster', 'Procurando Nemo'))
