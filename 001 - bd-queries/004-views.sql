--VIEW que lista o resumo dos atendimentos, com o valor total, consultando 5 tabelas
CREATE VIEW v_resumo_atendimento
AS SELECT a.id_atendimento, a.data_entrada, a.data_atendimento, 
		  c.nome_cliente, c.telefone_cliente, c.doc_cliente,
	      ma.nome_marca + ' ' + mo.nome_modelo + ' ' + e.cor_equipamento as 'Equipamento',
		  SUM(ia.valor_item) AS 'Valor Total'
FROM tb_atendimento a
INNER JOIN tb_cliente c
ON a.id_cliente = c.id_cliente
INNER JOIN tb_equipamento e
ON a.id_equipamento = e.id_equipamento
INNER JOIN tb_modelo mo
ON e.id_modelo = mo.id_modelo
INNER JOIN tb_marca ma
ON mo.id_marca = ma.id_marca
INNER JOIN tb_item_atendimento ia
ON a.id_atendimento = ia.id_atendimento
GROUP BY a.id_atendimento, a.data_entrada, a.data_atendimento, 
		 c.nome_cliente, c.telefone_cliente, c.doc_cliente,
	     ma.nome_marca + ' ' + mo.nome_modelo + ' ' + e.cor_equipamento
GO

--VIEW que lista o resumo dos itens, com valor unitário, adicionados nos atendimentos consultando 4 tabelas
CREATE VIEW v_resumo_itens
AS SELECT id_atendimento,f.nome_funcionario,s.nome_servico,ia.valor_item
FROM tb_item_atendimento ia
INNER JOIN tb_servico s
ON s.id_servico = ia.id_servico
INNER JOIN tb_funcionario f
ON f.id_funcionario = ia.id_funcionario
GO

--VIEW que lista todas as marcas e seus respectivos modelos, consultando 2 tabelas
CREATE VIEW v_marca_modelo
AS SELECT ma.nome_marca, mo.nome_modelo
FROM tb_marca ma
INNER JOIN tb_modelo mo
ON ma.id_marca = mo.id_marca;
GO

