/*Exercício 02 - DML: Data Manipulation Language
Utilizando os conceitos aprendidos durante a aula, realize as seguintes operações solicitadas.*/

--1. Inserir 5 (linhas) de dados para cada uma das tabelas (atenção para a ordem de execução).
INSERT INTO GameServer([IP], [Type], CreationDate)
VALUES
	('Phoebe001', 'Dedicated server', GETDATE()),
	('Rachel002', 'Dedicated server', GETDATE()),
	('Monica003', 'Dedicated server', GETDATE()),
	('Joseph004', 'Dedicated server', GETDATE()),
	('Chandler005', 'Dedicated server', GETDATE())

INSERT INTO Player([Name], UserName, [Password], IDGameServer)
VALUES
	('Phoebe Buffay', 'Phoebe', 'cookies', 1),
	('Rachel Green', 'Rach', 'coffee', 2),
	('Monica Geller', 'Monica', 'chef', 3),
	('Joseph Tribiani', 'Joey', 'actor', 4),
	('Chandler Muriel Bing', 'Chandler', 'something', 5)
	
--2. Atualizar todos os GameServer com Type igual a ‘Peer-to-Peer’ para ‘P2P’.
UPDATE GameServer SET [Type] = 'P2P' WHERE [Type] = 'Peer-to-Peer'

--3. Dobrar o número de Points de todos os Players (atualizar).
UPDATE Player SET Points *= 2

--4. Atualizar o UserName do Player para conter as 5 (cinco) primeiras letras do Name.
UPDATE Player SET UserName = LEFT([Name],5)

--5. Atualizar o Password de todos os Player para 123.
UPDATE Player SET [Password] = '123'

--6. Excluir todos os Player com Name igual a Cosme.
DELETE FROM Player WHERE [Name] = 'Cosme'

--7. Excluir todos os GameServer com CreationDate dos anos de 2010 à 2013.
DELETE FROM Player WHERE IDGameServer IN (
	SELECT IDGameServer FROM GameServer WHERE YEAR(CreationDate) BETWEEN 2010 AND 2013
)
DELETE FROM GameServer WHERE YEAR(CreationDate) BETWEEN 2010 AND 2013

--8. Excluir todos os Player com points menor do que 750.
DELETE FROM Player WHERE Points < 750

--9. Excluir todos os Player com Age maior que 50.
DELETE FROM Player WHERE Age > 50