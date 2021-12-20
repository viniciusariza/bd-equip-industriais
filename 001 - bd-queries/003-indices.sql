USE db_manutencaoei

-- �ndice que garante a unicidade dos logins de cada unidade
CREATE UNIQUE INDEX u_login_unidade
ON tb_unidade(login_unidade)
GO

--�ndice que aumenta a velocidade de consultas pelo nome do modelo
CREATE INDEX i_modelo 
ON tb_modelo(nome_modelo);
GO

-- �ndice que garante a unicidade do documento de cada cliente e aumenta a velocidade de consultas pelo documento
CREATE UNIQUE INDEX i_doc_cliente
ON tb_cliente(doc_cliente)
GO

--�ndice que aumenta a velocidade de consultas pelo nome do cliente
CREATE INDEX i_nome_cliente
ON tb_cliente(nome_cliente)
GO

-- �ndice que garante a unicidade do documento de cada funcion�rio e aumenta a velocidade de consultas pelo documento
CREATE UNIQUE INDEX i_doc_funcionario
ON tb_funcionario(doc_funcionario)
GO

--�ndice que aumenta a velocidade de consultas pelo nome do funcion�rio
CREATE INDEX i_nome_funcionario
ON tb_funcionario(nome_funcionario)
GO

--�ndice que indica o servi�o realizado pelo funcion�rio, o qual n�o se pode repetir em um mesmo atendimento
CREATE INDEX u_servico_funcionario
ON tb_item_atendimento(id_servico,id_funcionario)
