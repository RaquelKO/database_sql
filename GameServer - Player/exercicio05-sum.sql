/*Exercício 01 – Agrupamento e Sumarização
Utilizando os conceitos aprendidos durante a aula, realize as seguintes operações solicitadas.*/

--1. COUNT: Exibir a quantidade de GameServer cadastrados
SELECT COUNT(*) QtdGameServer FROM GameServer

--2. SUM: Exibir a soma de todos os Points dos Players
SELECT SUM(Points) SomaPontos FROM Player

--3. AVG: Exibir a média dos Points dos Players
SELECT AVG(Points) MediaPontos FROM Player

--4. MAX e MIN: Exibir o GameServer mais novo e mais velho
SELECT MAX(CreationDate) MaisNovo, MIN(CreationDate) MaisVelho FROM GameServer

--5. SUM + WHERE: Exibir a soma da idade (Age) dos Players com mais de 100 pontos (points)
SELECT SUM(Age) SomaIdade FROM Player WHERE Points >= 100

--6. COUNT + GROUP BY: Exibir a quantidade de GameServer agrupados por Tipo (Type)
SELECT [Type], COUNT(*) QtdeGameServer FROM GameServer GROUP BY [Type]

--7. AVG + GROUP BY: Exibir a média de pontos (points) agrupados por idade (age)
SELECT Age, AVG(Points) MediaPontos FROM Player GROUP BY Age

--8. COUNT + GROUP BY+ HAVING: Exibir a quantidade de GameServer agrupados por Tipo (Type). Somente os GameServer com quantidade entre 1 e 3 devem ser exibidos.
SELECT [Type], COUNT(*) QtdeGameServer FROM GameServer GROUP BY [Type] HAVING COUNT(*) BETWEEN 1 AND 3

--9. AVG + GROUP BY + HAVING: Exibir a média de pontos (points) agrupados por idade (age). Somente os players com média superior a 100 devem ser exibidos.
SELECT Age, AVG(Points) MediaPontos FROM Player GROUP BY Age HAVING AVG(Points) >= 100

--10. AVG + GROUP BY + HAVING: Exibir a quantidade de Players agrupados por idade (age). Somente as idades com mais de 1 player devem ser exibidas.
SELECT Age, COUNT(*) QtdePlayers FROM Player GROUP BY Age HAVING COUNT(*) >= 1