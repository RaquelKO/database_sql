/*Atividade 4: Views + SubConsultas
Utilizando os conceitos aprendidos durante a aula sobre Views e SubConsultas, realize as opera��es solicitadas.*/

--Por: Raquel Kuntz Oliveira R.A.: 121036

--1. Criar uma View para exibir o Nome e Data de Nascimento do Personagem, Nome e Origem da Ra�a, Nome da Classe e Nome da Habilidade.
CREATE VIEW vwDetalhesPersonagens
AS
	SELECT
		P.Nome,
		P.DataNascimento,
		R.Nome NomeRaca,
		R.Origem OrigemRaca,
		C.Nome NomeClasse,
		H.Nome NomeHabilidade
	FROM
		Personagem P INNER JOIN Ra�a R
		ON P.IDRa�a = R.IDRa�a
		INNER JOIN Classe C
		ON P.IDClasse = C.IDClasse
		INNER JOIN Habilidade H
		ON C.IDHabilidade = H.IDHabilidade

-- Consultando a view: 
SELECT * FROM vwDetalhesPersonagens ORDER BY Nome, DataNascimento, NomeRaca, OrigemRaca, NomeClasse, NomeHabilidade

--2. Criar uma View para exibir o Nome de TODAS as Classe e a quantidade de personagens associadas a cada uma delas. Quando a Classe n�o possuir nenhum Personagem associado deve ser exibido o valor 0 (zero).
CREATE VIEW vwQtdePersonagensPorClasse
AS
	SELECT
		C.Nome, COUNT(P.IDPersonagem) QtdePersonagens
	FROM
		Classe C LEFT JOIN Personagem P
		ON C.IDClasse = P.IDClasse
	GROUP BY
		C.Nome
	
-- Consultando a view:
SELECT * FROM vwQtdePersonagensPorClasse ORDER BY Nome

--3. Criar uma View para exibir o Nome da Ra�a, o Nome de Classe e a quantidade de personagens associados ao conjunto indicado.
CREATE VIEW vwQtdePersonagensPorRacaEClasse
AS
	SELECT
		R.Nome NomeRaca,
		C.Nome NomeClasse, 
		COUNT(P.IDPersonagem) QtdePersonagens
	FROM
		Personagem P RIGHT JOIN Ra�a R
		ON P.IDRa�a = R.IDRa�a
		LEFT JOIN Classe C
		ON P.IDClasse = C.IDClasse
	GROUP BY
		R.Nome, C.Nome
	
-- Consultando a view:
SELECT * FROM vwQtdePersonagensPorRacaEClasse ORDER BY NomeRaca

--4. Criar uma SubConsulta para exibir o Nome das Habilidades que est�o acima da m�dia de Poder.
SELECT Nome 
FROM Habilidade 
WHERE Poder > (SELECT AVG(Poder) FROM Habilidade)

--5. Criar uma SubConsulta para exibir o ID, Nome e Origem das Ra�as que N�O est�o sendo utilizadas pelos Personagens.
SELECT IDRa�a, Nome, Origem
FROM Ra�a
WHERE IDRa�a NOT IN (SELECT IDRa�a FROM Personagem)

--6. Criar uma SuConsulta para exibir o ID, Nome e Caracter�stica das Classes que est�o sendo utilizadas pelos Personagens.
SELECT IDClasse, Nome, Caracter�sticas
FROM Classe
WHERE IDClasse IN (SELECT IDClasse FROM Personagem)