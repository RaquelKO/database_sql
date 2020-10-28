/*Atividade 3: Comandos Agrupamento + Totalização + Junções
Utilizando os conceitos aprendidos durante a aula sobre Agrupamento, Totalização e Junções, realize as operações solicitadas.*/

--1. Criar uma consulta para exibir a quantidade de Habilidades cadastradas.
SELECT COUNT(*) QtdeHabilidades FROM Habilidade

--2. Criar uma consulta para exibir a Data de Nascimento do Personagem mais velho e mais novo.
SELECT MAX(DataNascimento) MaisNovo, MIN(DataNascimento) MaisVelho FROM Personagem

--3. Criar uma consulta para exibir o Nome da Classe e a quantidade de personagens associados a cada uma delas.
SELECT Nome, COUNT(*) QtdePersonagens FROM Classe GROUP BY Nome

--4. Criar uma consulta para exibir o Nome de TODAS as Raças e a quantidade de personagens associadas a cada uma delas. Quando a raça não estiver associada a nenhum personagem deve ser exibido o valor 0 (zero).
SELECT R.Nome, COUNT(IDPersonagem) QtdePersonagens
FROM
	Raça R LEFT JOIN Personagem P
		ON R.IDRaça = P.IDRaça
GROUP BY
	R.Nome

--5. Criar uma consulta para exibir o Nome da classe e o valor médio dos seus poderes. Somente devem ser exibidas as classes que o valor médio do poder for maior ou igual a 100.
SELECT C.Nome, AVG(H.Poder) ValorMedioPoder
FROM
	Classe C INNER JOIN Habilidade H
		ON C.IDHabilidade = H.IDHabilidade
GROUP BY
	C.Nome
HAVING 
	AVG(H.Poder) >= 100

--6. Criar uma consulta para exibir o Nome da classe e a soma do valor dos seus poderes. Somente devem ser exibidas as classes cuja soma dos poderes esteja entre 150 e 250.
SELECT C.Nome, SUM(H.Poder) SomaPoderes
FROM
	Classe C INNER JOIN Habilidade H
		ON C.IDHabilidade = H.IDHabilidade
GROUP BY
	C.Nome
HAVING 
	SUM(H.Poder) BETWEEN 150 AND 250
	
--7. Criar uma consulta para exibir o Nome e Data de Nascimento do Personagem, o Nome da sua Raça, o Nome da sua Classe e o Nome da sua Habilidade.
SELECT P.Nome, P.DataNascimento, R.Nome Raça, C.Nome Classe, H.Nome Habilidade
FROM
	Personagem P INNER JOIN Raça R
		ON P.IDRaça = R.IDRaça
	INNER JOIN Classe C
		ON P.IDClasse = C.IDClasse
	INNER JOIN Habilidade H
		ON C.IDHabilidade = H.IDHabilidade