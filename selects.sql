-- 1 Exibir todas locações realizados no mês de maio do ano de 2020
SELECT
	FORMAT (l.data_locacao, 'dd/MM/yyyy', 'pt-br') AS [Data da Locação],
	FORMAT (l.data_devolucao, 'dd/MM/yyyy', 'pt-br') AS [Data da Devolução],
	l.quilometragem AS [Quilometragem Percorrida (KM)],
	FORMAT (l.valor, 'N', 'pt-br') AS [Valor Total (R$)],
	CONCAT (ma.descricao, ' - ', mo.descricao, ' - ', a.ano,  ' - ', a.tipo_combustivel, ' - ', 
	    a.numero_portas, ' portas - ', a.placa) AS [Automóvel]
FROM locacao AS l
	INNER JOIN cliente AS c ON c.id = l.id_cliente
	INNER JOIN automovel AS a ON a.id = l.id_automovel
	INNER JOIN modelo AS mo ON mo.id = a.id_modelo
	INNER JOIN marca AS ma ON ma.id = mo.id_marca
WHERE l.data_locacao BETWEEN '2020-05-01' AND '2020-05-31'
ORDER BY l.data_locacao ASC;

-- 2 Exibir a quantidade de diárias da última locação de um determinado cliente dado seu CPF ou CNPJ
SELECT
	TOP 1
	FORMAT (l.data_locacao, 'dd/MM/yyyy', 'pt-br') AS [Data da Locação],
	FORMAT (l.data_devolucao, 'dd/MM/yyyy', 'pt-br') AS [Data da Devolução],
	DATEDIFF (DAY, l.data_locacao, l.data_devolucao) AS [Número de Diárias]
FROM locacao AS l
	INNER JOIN cliente AS c ON c.id = l.id_cliente
WHERE c.cpf_cnpj = '77344660000114'
ORDER BY l.data_locacao DESC;

-- 3.1 Exibir o valor total das locações agrupado por cliente
SELECT
    FORMAT (SUM (l.valor), 'N', 'pt-br') AS [Total (R$)],
	c.nome AS [Cliente]
FROM locacao AS l
    INNER JOIN cliente AS c ON c.id = l.id_cliente
GROUP BY c.nome
ORDER BY c.nome ASC;

-- 3.2 Exibir o automóvel mais locado
SELECT
	TOP 1
	COUNT (*) AS [Quantidade],
	CONCAT (ma.descricao, ' - ', mo.descricao, ' - ', a.ano,  ' - ', a.tipo_combustivel, ' - ', 
	    a.numero_portas, ' portas - ', a.placa) AS [Automóvel]
FROM automovel AS a
	INNER JOIN locacao AS l ON l.id_automovel = a.id
	INNER JOIN modelo AS mo ON mo.id = a.id_modelo
	INNER JOIN marca AS ma ON ma.id = mo.id_marca
GROUP BY ma.descricao, mo.descricao, a.ano, a.tipo_combustivel, a.numero_portas,a.placa
ORDER BY Quantidade DESC;

-- 3.3 Exibir todos clientes que alocaram um determinado automóvel dado sua placa
SELECT
	c.nome AS [Cliente]
FROM automovel AS a
	INNER JOIN locacao AS l ON l.id_automovel = a.id
	INNER JOIN cliente AS c ON c.id = l.id_cliente
WHERE a.placa = 'OTD8563'
GROUP BY c.nome
ORDER BY c.nome ASC;