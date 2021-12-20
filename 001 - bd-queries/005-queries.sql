USE db_manutencaoei

-- Resumo dos atendimentos realizados na Unidade Faro no ano de 2020 em ordem decrescente de valor utilizando a VIEW v_resumo_atendimento
SELECT ra.data_atendimento,ra.nome_cliente,ra.Equipamento,ra.[Valor Total]
FROM v_resumo_atendimento ra
INNER JOIN tb_atendimento a
ON ra.id_atendimento = a.id_atendimento
INNER JOIN tb_unidade u
ON a.id_unidade = u.id_unidade
WHERE u.nome_unidade = 'Unidade Bragança' 
	  AND YEAR(ra.data_atendimento) = 2020
ORDER BY [Valor Total] DESC
GO

--Lista dos 5 serviços mais realizados entre os anos de 2018 e 2020 na unidade 4
SELECT TOP 5 s.nome_servico, COUNT(*) AS 'qtd'
FROM tb_item_atendimento ia
INNER JOIN tb_atendimento a
ON ia.id_atendimento = a.id_atendimento
INNER JOIN tb_servico s
ON ia.id_servico = s.id_servico
WHERE YEAR(a.data_atendimento) BETWEEN 2018 AND 2020
	  AND a.id_unidade = 4
GROUP BY s.nome_servico
ORDER BY qtd DESC
GO

--Lista dos 5 funcionários que renderam as maiores receitas para a Unidade de Beja no ano de 2019
SELECT TOP 5 f.nome_funcionario, SUM(ia.valor_item) AS 'Valor'
FROM tb_item_atendimento ia
INNER JOIN tb_atendimento a
ON ia.id_atendimento = a.id_atendimento
INNER JOIN tb_funcionario f
ON ia.id_funcionario = f.id_funcionario
INNER JOIN tb_unidade u
ON a.id_unidade = u.id_unidade
WHERE u.nome_unidade = 'Unidade Beja' AND YEAR(a.data_atendimento) = 2020
GROUP BY f.nome_funcionario
ORDER BY SUM(ia.valor_item) DESC
GO

--Lista dos 5 melhores clientes das 3 unidades que tem o pior desempenho
SELECT TOP 5 u.nome_unidade, c.nome_cliente, SUM(ia.valor_item) AS 'Valor'
FROM tb_item_atendimento ia
INNER JOIN tb_atendimento a
ON ia.id_atendimento = a.id_atendimento
INNER JOIN tb_cliente c
ON a.id_cliente = c.id_cliente
INNER JOIN tb_unidade u
ON a.id_unidade = u.id_unidade
WHERE u.nome_unidade IN
	(SELECT TOP 3 u.nome_unidade
	FROM tb_item_atendimento ia
	INNER JOIN tb_atendimento a
	ON ia.id_atendimento = a.id_atendimento
	INNER JOIN tb_cliente c
	ON a.id_cliente = c.id_cliente
	INNER JOIN tb_unidade u
	ON a.id_unidade = u.id_unidade
	GROUP BY u.nome_unidade
	ORDER BY SUM(ia.valor_item))
GROUP BY u.nome_unidade, c.nome_cliente
ORDER BY Valor DESC

--Lista dos clientes que tem no nome ou sobrenome "Barbosa" e que o documento termina em "5"
SELECT c.nome_cliente, c.doc_cliente
FROM tb_cliente c
WHERE nome_cliente LIKE '%Barbosa%' AND doc_cliente LIKE '%5'

--Lista do valor total recebido por cada unidade em ordem decrescente
SELECT u.nome_unidade, SUM(ia.valor_item) AS 'Valor Total'
FROM tb_item_atendimento ia
INNER JOIN tb_atendimento a
ON ia.id_atendimento = a.id_atendimento
INNER JOIN tb_unidade u
ON a.id_unidade = u.id_unidade
GROUP BY u.nome_unidade
ORDER BY SUM(ia.valor_item) DESC

--Quantidade de atendimentos que não foram concretizados
SELECT COUNT(*) AS 'Quantidade'
FROM tb_atendimento
WHERE data_atendimento IS NULL
