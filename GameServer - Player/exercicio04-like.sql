/*Exerc�cio 04 � SELECT + LIKE
Utilizando os conceitos aprendidos durante a aula, realize as seguintes opera��es solicitadas.*/

--1. LIKE: Selecionar o Nome e o UserName da tabela Player quando a senha (password) possuir 123 (em qualquer parte do texto).
SELECT [Name], UserName FROM Player WHERE [Password] LIKE '%123%'

--2. LIKE: Selecionar o Nome, Username e Password da tabela Player quando o Nome iniciar com �Anna�.
SELECT [Name], UserName, [Password] FROM Player WHERE [Name] LIKE 'Ana%'

--3. LIKE + OR: Selecionar o Nome, Password da tabela Player quando o Nome terminar com �Silva� ou �Oliveira�.
SELECT [Name], [Password] FROM Player WHERE [Name] LIKE '%Silva' OR [Name] LIKE '%Oliveira'

--4. LIKE + AND: Selecionar todas as informa��es da tabela GameServer quando o tipo (type) possuir a palavra �server� e o ano de cadastro seja maior ou igual 2019.
SELECT * FROM GameServer WHERE [Type] LIKE '%server%' AND CreationDate >= YEAR(2019)

--5. LIKE: Selecionar o Nome e o UserName da tabela Player quando a senha (password) terminar com �mudar�
SELECT [Name], UserName FROM Player WHERE [Password] LIKE '%mudar'

--6. DISTINCT: Selecionar todos os Types distintos da tabela GameServer.
SELECT DISTINCT [Type] FROM GameServer
