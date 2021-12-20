USE db_manutencaoei

-- Índice que garante a unicidade dos logins de cada unidade
CREATE UNIQUE INDEX u_login_unidade
ON tb_unidade(login_unidade)
GO

--Índice que aumenta a velocidade de consultas pelo nome do modelo
CREATE INDEX i_modelo 
ON tb_modelo(nome_modelo);
GO

-- Índice que garante a unicidade do documento de cada cliente e aumenta a velocidade de consultas pelo documento
CREATE UNIQUE INDEX i_doc_cliente
ON tb_cliente(doc_cliente)
GO

--Índice que aumenta a velocidade de consultas pelo nome do cliente
CREATE INDEX i_nome_cliente
ON tb_cliente(nome_cliente)
GO

-- Índice que garante a unicidade do documento de cada funcionário e aumenta a velocidade de consultas pelo documento
CREATE UNIQUE INDEX i_doc_funcionario
ON tb_funcionario(doc_funcionario)
GO

--Índice que aumenta a velocidade de consultas pelo nome do funcionário
CREATE INDEX i_nome_funcionario
ON tb_funcionario(nome_funcionario)
GO

--Índice que indica o serviço realizado pelo funcionário, o qual não se pode repetir em um mesmo atendimento
CREATE INDEX u_servico_funcionario
ON tb_item_atendimento(id_servico,id_funcionario)
