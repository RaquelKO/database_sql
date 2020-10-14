/*Exercício 01 – SELECT
Utilizando os conceitos aprendidos durante a aula, realize as seguintes operações solicitadas.*/

--1. Selecionar todas as informações da tabela Player
SELECT * FROM Player

--2. Selecionar todas as informações da tabela GameServer
SELECT * FROM GameServer

--3. Selecionar o Nome, UserName e Password da tabela Player
SELECT [Name], UserName, [Password] FROM Player

--4. Selecionar o IP e o Type da tabela GameServer
SELECT [IP], [Type] FROM GameServer

--5. BETWEEN: Selecionar o IP, Type e CreationDate da tabela GameServer quando o ano de criação (CreationDate) estiver entre 2005 e 2018.
SELECT [IP], [Type], CreationDate FROM GameServer WHERE YEAR(CreationDate) BETWEEN 2005 AND 2018

--6. IN: Selecionar o UserName, Password e Age da tabela Player quando a idade (age) for 15, 20, 25 ou 30 anos.
SELECT UserName, [Password], Age FROM Player WHERE Age IN (15, 20, 25, 30)

--7. AND: Selecionar o Name e o Password da tabela Player quando a idade (age) for 38 anos e o número de pontos (points) for maior ou igual a 650.
SELECT [Name],[Password] FROM Player WHERE Age = 38 AND Points >=60

--8. =: Selecionar o Nome e o UserName da tabela Player quando a senha (password) for 123
SELECT [Name], UserName FROM Player WHERE [Password] = 123

--9. <=: Selecionar o nome, username e Password da tabela player o ID for menor ou igual (<=) a 4.
SELECT [Name], UserName, [Password] FROM Player WHERE IDPlayer <= 4

--10. AND: Selecionar todas as informações da tabela GameServer quando os pontos (points) possuírem valor (is not null) e o ano de cadastro (CreationDate) seja maior ou 2015.
SELECT * FROM GameServer WHERE IDGameServer IN (SELECT IDGameServer FROM Player WHERE Points is not null) AND YEAR(CreationDate) >= 2015

--11. LEN: Selecionar o Nome e o UserName da tabela Player a quantidade de caracteres do campo Password for menor que 8 (oito)
SELECT [Name], UserName FROM Player WHERE LEN([Password]) < 8