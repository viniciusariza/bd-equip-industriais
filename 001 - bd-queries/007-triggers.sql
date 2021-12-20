--Trigger que impede a inser��o de itens em atendimentos cuja data de atendimento (entrega) n�o foi informada
CREATE TRIGGER t_inserir_item_atendimento
ON tb_item_atendimento
FOR INSERT
AS
BEGIN
	DECLARE 
	@idAtendimento INT,
	@dataAtendimento DATE

	SELECT @idAtendimento = id_atendimento FROM inserted
	SELECT @dataAtendimento = data_atendimento FROM tb_atendimento WHERE id_atendimento = @idAtendimento

	IF @dataAtendimento IS NULL
	BEGIN
		PRINT 'Informe a data do atendimento (entrega) antes de inserir um servi�o'
		ROLLBACK
	END
END
GO

--Teste em atendimento sem data de atendimento (entrega) informado
--INSERT INTO tb_item_atendimento (valor_item,id_servico,id_funcionario,id_atendimento) VALUES (150,59,181,3)
--GO


--Trigger que impede a inser��o  e altera��o de servi�os feitos por funcion�rios inativos
CREATE TRIGGER t_inserir_item_funcionario
ON tb_item_atendimento
FOR INSERT, UPDATE
AS
BEGIN
	DECLARE 
	@idFuncionario INT,
	@situacaoFuncionario BIT,
	@nomeFuncionario VARCHAR(80)

	SELECT @idFuncionario = id_funcionario FROM inserted
	SELECT @situacaoFuncionario = situacao_funcionario FROM tb_funcionario WHERE id_funcionario = @idFuncionario
	SELECT @nomeFuncionario = nome_funcionario FROM tb_funcionario WHERE id_funcionario = @idFuncionario

	IF @situacaoFuncionario = 0
	BEGIN
		PRINT 'O funcion�rio ' + @nomeFuncionario + ' n�o est� ativo'
		ROLLBACK
	END
END
GO

--Teste em altera��o de servi�o feito com funcion�rio inativo
--UPDATE tb_funcionario SET situacao_funcionario = 0  WHERE id_funcionario = 200 
--UPDATE tb_item_atendimento SET id_funcionario = 200
--GO
