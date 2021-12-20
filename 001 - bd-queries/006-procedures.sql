-- Procedimento que insere atendimento e serviços
-- Caso não seja informado o ID do atendimento o procedimento cria um novo atendimento e insere o serviço passado nos parâmetros
-- Caso seja informado o ID de um atendimento já existente o procedimento altera os dados do atendimento (se o usuário desejar) e adiciona um novo serviço ao atendimento
-- Caso em qualquer uma das hipóteses sejam informados dados inconsistentes, o procedimento retorna uma mensagem de erro e não realiza as inserções/alterações
CREATE PROCEDURE inserir_atendimento_servico(@idAtendimento INT = NULL, @DataEntrada DATE, @DataAtendimento DATE = NULL, @idCliente INT, @idEquipamento INT, @idFuncionario INT, @idServico INT, @ValorServico DECIMAL(10,2)) 
AS BEGIN
	BEGIN TRY  
		DECLARE @idUnidade INT
		DECLARE @idNovoAtendimento INT
		SET @IdUnidade = (SELECT id_unidade FROM tb_funcionario WHERE id_funcionario = @idFuncionario)

		BEGIN TRAN
			IF @idAtendimento IS NULL
			BEGIN
				IF (SELECT id_cliente FROM tb_equipamento WHERE id_equipamento = @idEquipamento) = @idCliente
				BEGIN
					INSERT INTO tb_atendimento (data_entrada, data_atendimento, id_cliente, id_equipamento, id_unidade) 
					VALUES (@DataEntrada, @DataAtendimento,@idCliente,@idEquipamento,@IdUnidade);
					SET @idNovoAtendimento = (SELECT SCOPE_IDENTITY())
					INSERT INTO tb_item_atendimento (id_atendimento, id_funcionario, id_servico, valor_item) 
					VALUES (@idNovoAtendimento,@idFuncionario,@idServico,@ValorServico)
				END
				ELSE
				BEGIN
					PRINT 'O equipamento deve pertencer ao cliente. Verifique os dados e tente novamente!'
				END
			END
			ELSE
				BEGIN
					IF (SELECT id_unidade FROM tb_atendimento WHERE id_atendimento = @idAtendimento) = @idUnidade AND
					   (SELECT id_cliente FROM tb_equipamento WHERE id_equipamento = @idEquipamento) = @idCliente
					BEGIN
						UPDATE tb_atendimento SET data_atendimento = @DataAtendimento, id_cliente = @idCliente, id_equipamento = @idEquipamento 
						WHERE id_atendimento = @idAtendimento
						INSERT INTO tb_item_atendimento (id_atendimento, id_funcionario, id_servico, valor_item) 
						VALUES (@idAtendimento,@idFuncionario,@idServico,@ValorServico)
					END
					ELSE
					BEGIN
						PRINT 'O funcionário deve pertencer a mesma unidade em que o atendimento foi realizado. Verifique os dados e tente novamente!'
					END
				END
		COMMIT TRAN
	END TRY  
	BEGIN CATCH  
		 ROLLBACK TRAN
	END CATCH
END
GO

--1º Caso: Cadastrar um novo atendimento e serviço com dados consistentes
--EXEC inserir_atendimento_servico @DataEntrada = '2020-11-20', @idCliente = 8, @idEquipamento = 1, @idFuncionario = 16, @idServico = 24, @ValorServico = 150
--GO

--2º Caso: Cadastrar um novo atendimento e serviço com dados inconsistentes
--EXEC inserir_atendimento_servico @DataEntrada = '2020-11-20', @DataAtendimento = '2020-11-28', @idCliente = 9, @idEquipamento = 1, @idFuncionario = 16, @idServico = 14, @ValorServico = 351
--GO

--3º Caso: Alterar um atendimento existente e adicionar um serviço com dados consistentes
--EXEC inserir_atendimento_servico @DataEntrada = '2020-11-20', @DataAtendimento = '2020-11-29', @idAtendimento = 10001, @idCliente = 8, @idEquipamento = 1, @idFuncionario = 20, @idServico = 24, @ValorServico = 125
--GO

--4º Caso: Alterar um atendimento existente e adicionar um serviço com dados inconsistentes
--EXEC inserir_atendimento_servico @DataEntrada = '2020-11-20', @DataAtendimento = '2020-11-29', @idAtendimento = 19000, @idCliente = 1258, @idEquipamento = 39, @idFuncionario = 26, @idServico = 12, @ValorServico = 1200
--GO

--Procedimento que consulta os atendimentos realizados entre as datas informadas e na unidade escolhida
CREATE PROCEDURE atendimentos_unidade(@idUnidade INT, @dataInicial DATETIME, @dataFinal DATETIME) 
AS BEGIN
	SELECT ra.data_atendimento,ra.nome_cliente,ra.Equipamento,ra.[Valor Total]
	FROM v_resumo_atendimento ra
	INNER JOIN tb_atendimento a
	ON ra.id_atendimento = a.id_atendimento
	INNER JOIN tb_unidade u
	ON a.id_unidade = u.id_unidade
	WHERE ra.data_atendimento IS NOT NULL AND u.id_unidade =  @idUnidade AND ra.data_atendimento BETWEEN @dataInicial AND @dataFinal
	ORDER BY ra.data_atendimento
END
GO

--Atendimentos da unidade 3 entre 03/01/2019 e 04/07/2020
--EXEC atendimentos_unidade 3,'2019-01-03','2020-07-04'
--GO
