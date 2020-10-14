-- Atividade 2: Comando SELECT por Raquel Kuntz Oliveira

--1. Selecionar todas as informa��es da tabela Personagem.
SELECT * FROM Personagem

--2. Selecionar o Nome e Poder da tabela Habilidade quando o valor do poder estiver entre 0 e 100.
SELECT Nome, Poder FROM Habilidade WHERE Poder BETWEEN 0 AND 100

--3. selecionar o Nome e Caracter�stica da tabela Classe quando o IDHabilidade for 1, 2, 3, 5 e 7.
SELECT Nome, Caracter�sticas FROM Classe WHERE IDHabilidade IN (1, 2, 3, 5, 7)

--4. Selecionar o Nome Descri��o e Data de Nascimentos da tabela Personagem quando o nome possuir �Big� (em qualquer parte do texto) e o ano de nascimento estiver entre 1990 e 2000.
SELECT Nome, Descri��o, DataNascimento FROM Personagem WHERE Nome LIKE '%Big%' AND YEAR(DataNascimento) BETWEEN 1990 AND 2000

--5. Selecionar o Nome, Descri��o e Origem da tabela Ra�a quando a origem iniciar por �Terra�.
SELECT Nome, Descri��o, Origem FROM Ra�a WHERE Origem LIKE 'Terra%'

--6. Selecionar todas as informa��es da tabela Classe quando o seu nome terminar por �Orc�.
SELECT * FROM Classe WHERE Nome LIKE '%Orc'

--7. Selecionar o Nome e Data de Nascimentos da tabela Personagem quando os nomes se iniciarem entre �A� e �M�
SELECT Nome, DataNascimento FROM Personagem WHERE Nome LIKE 'A%' OR Nome LIKE 'M%'

--8. Selecionar todos os Nomes distintos da tabela Personagem.
SELECT DISTINCT Nome FROM Personagem