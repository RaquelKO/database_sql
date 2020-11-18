/*Exercício 01 – SubConsultas
Utilizando os conceitos aprendidos durante a aula, realize as seguintes operações solicitadas.*/

--1. Criar uma SubConsulta para exibir o Nome e UserName dos players que estão acima da média de idade.
SELECT Name, UserName
FROM Player
WHERE Age > (SELECT AVG(Age) FROM Player)

--2. Criar uma SubConsulta para exibir o Nome e Password dos players que estão abaixo da média de idade.
SELECT Name, Password
FROM Player
WHERE Age < (SELECT AVG(Age) FROM Player)

--3. Criar uma SubConsulta para exibir o IP, Type e CreationDate que são utilizados pelos players.
SELECT
IP, Type, CreationDate
FROM
GameServer
WHERE
IDGameServer IN (SELECT IDGameServer FROM Player)

--4. Criar uma SubConsulta para exibir o IP, Type e CreationDate que NÃO são utilizados pelos players.
SELECT
IP, Type, CreationDate
FROM
GameServer
WHERE
IDGameServer NOT IN (SELECT IDGameServer FROM Player)

--5. Criar uma SubConsulta para exibir todas as informações dos players que estão acima da pontuação (points) média.
SELECT *
FROM Player
WHERE Points > (SELECT AVG(Points) FROM Player)

--6. Criar uma SubConsulta para exibir o Nome, UserName e Password dos players que possuem a idade maior que o “Hulk Jedi”.
SELECT Name, UserName, Password
FROM Player
WHERE Age > (SELECT Age FROM Player WHERE Name = 'Hulk Jedi')

--7. Criar uma SubConsulta para exibir o Nome, UserName e Password e Points dos players que utilizam os mesmos GameServers que o “Ace Monster” e o “Procurando Nemo”.
SELECT Name, UserName, Password, Points, IDGameServer
FROM Player
WHERE IDGameServer IN (SELECT IDGameServer FROM Player WHERE Name IN ('Ace Monster', 'Procurando Nemo'))
