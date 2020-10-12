/*Exerc�cio 02 � Agrupamento e Sumariza��o
Utilizando os conceitos aprendidos durante a aula, realize as seguintes opera��es solicitadas*/

--1. Exibir a quantidade de Marcas cadastradas.
SELECT COUNT(*) QtdeMarcas FROM Marca

--2. Exibir a soma dos valores (valor) de todos os Ve�culos.
SELECT SUM(Valor) SomaValores FROM Veiculo

--3. Exibir a m�dia de Renda Mensal dos propriet�rios que nasceram entre 1980 e 2000.
SELECT AVG(RendaMensal) RendaMensal FROM Proprietario WHERE YEAR(DataNascimento) BETWEEN 1980 AND 2000

--4. Exibir a quantidade de Ve�culos agrupados por Ano de Fabrica��o.
SELECT AnoFabricacao, COUNT(*) Placa FROM Veiculo GROUP BY AnoFabricacao

--5. Exibir a renda mensal m�dia dos propriet�rios agrupadas por cidade.
SELECT Cidade, AVG(RendaMensal) RendaMensalPorCidade FROM Proprietario GROUP BY Cidade

--6. Exibir a soma dos valores dos ve�culos agrupados por ano de fabrica��o.
SELECT AnoFabricacao, SUM(Valor) SomaValores FROM Veiculo GROUP BY AnoFabricacao

--7. Exibir por ano e m�s de compra (DataCompra) o ve�culo mais barato e o ve�culo mais caro.
SELECT YEAR(DataCompra) Ano, MONTH(DataCompra) Mes, MIN(Valor), MAX(Valor) FROM Veiculo GROUP BY YEAR(DataCompra), MONTH(DataCompra)

--8. Exibir a quantidade de propriet�rios agrupados por cidade. Somente devem ser exibidas a cidades com 3 ou mais propriet�rios.
SELECT Cidade, COUNT(*) Nome FROM Proprietario GROUP BY Cidade HAVING COUNT(*) >= 3

--9. Exibir a quantidade de ve�culos comprados por m�s (DataCompra) quando o valor do ve�culo for superior a R$ 30.000,00. Al�m disso, somente devem ser exibidos os meses com menos de 5 ve�culos vendidos.
SELECT MONTH(DataCompra) M�s, COUNT(*) IDVeiculo FROM Veiculo WHERE Valor > 30000 GROUP BY MONTH(DataCompra) HAVING COUNT(*) <= 5

--10. Exibir a renda mensal m�dia dos propriet�rios agrupadas por cidade. Somente as cidades com renda entre R$ 5.000,00 e R$ 10.000,00 devem ser exibidas.
SELECT Cidade, AVG(RendaMensal) RendaMensalMedia FROM Proprietario GROUP BY Cidade HAVING AVG(RendaMensal) BETWEEN 5000 AND 10000

--11. Exibir a soma dos valores dos ve�culos agrupados por ano de fabrica��o. Somente os anos com soma inferior a R$ 25.000,00 devem ser exibidos.
SELECT AnoFabricacao, SUM(Valor) SomaValores FROM Veiculo GROUP BY AnoFabricacao HAVING SUM(Valor) < 25000