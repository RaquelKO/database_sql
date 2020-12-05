/*Atividade 4: Views + SubConsultas
Utilizando os conceitos aprendidos durante a aula sobre Views e SubConsultas, realize as operações solicitadas.*/

--Por: Raquel Kuntz Oliveira R.A.: 121036

--1. Criar uma View para exibir o Nome e Data de Nascimento do Personagem, Nome e Origem da Raça, Nome da Classe e Nome da Habilidade.
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
		Personagem P INNER JOIN Raça R
		ON P.IDRaça = R.IDRaça
		INNER JOIN Classe C
		ON P.IDClasse = C.IDClasse
		INNER JOIN Habilidade H
		ON C.IDHabilidade = H.IDHabilidade

-- Consultando a view: 
SELECT * FROM vwDetalhesPersonagens ORDER BY Nome, DataNascimento, NomeRaca, OrigemRaca, NomeClasse, NomeHabilidade

--2. Criar uma View para exibir o Nome de TODAS as Classe e a quantidade de personagens associadas a cada uma delas. Quando a Classe não possuir nenhum Personagem associado deve ser exibido o valor 0 (zero).
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

--3. Criar uma View para exibir o Nome da Raça, o Nome de Classe e a quantidade de personagens associados ao conjunto indicado.
CREATE VIEW vwQtdePersonagensPorRacaEClasse
AS
	SELECT
		R.Nome NomeRaca,
		C.Nome NomeClasse, 
		COUNT(P.IDPersonagem) QtdePersonagens
	FROM
		Personagem P RIGHT JOIN Raça R
		ON P.IDRaça = R.IDRaça
		LEFT JOIN Classe C
		ON P.IDClasse = C.IDClasse
	GROUP BY
		R.Nome, C.Nome
	
-- Consultando a view:
SELECT * FROM vwQtdePersonagensPorRacaEClasse ORDER BY NomeRaca

--4. Criar uma SubConsulta para exibir o Nome das Habilidades que estão acima da média de Poder.
SELECT Nome 
FROM Habilidade 
WHERE Poder > (SELECT AVG(Poder) FROM Habilidade)

--5. Criar uma SubConsulta para exibir o ID, Nome e Origem das Raças que NÃO estão sendo utilizadas pelos Personagens.
SELECT IDRaça, Nome, Origem
FROM Raça
WHERE IDRaça NOT IN (SELECT IDRaça FROM Personagem)

--6. Criar uma SuConsulta para exibir o ID, Nome e Característica das Classes que estão sendo utilizadas pelos Personagens.
SELECT IDClasse, Nome, Características
FROM Classe
WHERE IDClasse IN (SELECT IDClasse FROM Personagem)