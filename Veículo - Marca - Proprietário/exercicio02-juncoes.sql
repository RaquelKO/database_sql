/*Exerc�cio 02 � Jun��es
Utilizando os conceitos aprendidos durante a aula, realize as seguintes opera��es solicitadas.*/

--1. Criar uma consulta para exibir Placa e Ano de Fabrica��o do Ve�culo, o Nome da Marca e o o Nome, Cidade e Renda Mensal do Propriet�rio.
SELECT V.Placa, V.AnoFabricacao, M.Nome, P.Nome, P.Cidade, P.RendaMensal
FROM
	Veiculo V INNER JOIN Marca M
		ON V.IDMarca = M.IDMarca
	INNER JOIN Proprietario P
		ON V.IDProprietario = P.IDProprietario

--2. Criar uma consulta para exibir o Nome do Propriet�rio e a quantidade de ve�culos que possui.
SELECT P.Nome, COUNT(IDVeiculo) QtdeVeiculos
FROM
	Proprietario P INNER JOIN Veiculo V
		ON P.IDProprietario = V.IDProprietario
GROUP BY 
	P.Nome

--3. Criar uma consulta para exibir o Nome de TODAS as marcas e a quantidade de ve�culo de cada uma delas.
SELECT M.Nome, COUNT(*) QtdeVeiculos
FROM
	Marca M LEFT JOIN Veiculo V
		ON M.IDMarca = V.IDMarca
GROUP BY
	M.Nome

--4. Criar uma consulta para exibir o Nome do Propriet�rio, o Nome da Marca e a quantidade a respectiva quantidade de ve�culos que possui.
SELECT P.Nome, M.Nome, COUNT(IDVeiculo) QtdeVeiculos
FROM
	Veiculo V INNER JOIN Marca M
		ON V.IDMarca = M.IDMarca
	INNER JOIN Proprietario P
		ON V.IDProprietario = P.IDProprietario
GROUP BY
	P.Nome, M.Nome

--5. Criar uma consulta para exibir o Nome do Propriet�rio e o valor total gasto (soma) com os ve�culos que possui.
SELECT P.Nome, SUM(V.Valor) ValorTotal
FROM
	Proprietario P INNER JOIN Veiculo V
		ON P.IDProprietario = V.IDProprietario
GROUP BY
	P.Nome
