'Povoamento das tabelas tb_atendimento e tb_item_atendimento através da escolha de um equipamento aleatório e, após, os outros atributos aleatórios restritos a mesma unidade do equipamento para manter a consistência dos dados

Private Sub povoarAtendimento_Click()
    Application.ScreenUpdating = False
    Dim data As Date
    qtdAtendimentos = InputBox("Quantidade de atendimentos")
    For i = 1 To qtdAtendimentos Step 1
        linha = WorksheetFunction.RandBetween(1, 10000)
        data = Range("A" & linha)
        If (WorksheetFunction.RandBetween(1, 10) > 2) Then
            dataAtendimento = Range("B" & linha)
        Else
            dataAtendimento = Null
        End If
        idEquipamento = WorksheetFunction.RandBetween(1, 5000)
        comandoIDCliente = "SELECT id_cliente FROM tb_equipamento WHERE id_equipamento = " & idEquipamento
        Conexao.SelectSQLServer (comandoIDCliente)
        idCliente = Range("G1").Value
        idUnidade = WorksheetFunction.RandBetween(1, 10)
        comando = "INSERT INTO tb_atendimento (data_entrada, data_atendimento,id_cliente,id_equipamento,id_unidade) VALUES ('" & data & "','" & dataAtendimento & "'," & idCliente & "," & idEquipamento & "," & idUnidade & ")"
        Conexao.SQLServer (comando)
        qtditens = WorksheetFunction.RandBetween(1, 10)
        For j = 1 To qtditens Step 1
            comandoIDAtendimento = "SELECT TOP 1 id_atendimento FROM tb_atendimento ORDER BY id_atendimento DESC"
            Conexao.SelectSQLServer (comandoIDAtendimento)
            idAtendimento = Range("G1").Value
            idServico = WorksheetFunction.RandBetween(1, 60)
            comandoIDFuncionario = "SELECT id_funcionario FROM tb_funcionario WHERE id_unidade = " & idUnidade
            Conexao.SelectSQLServer (comandoIDFuncionario)
            ultimalinha = Range("G1").CurrentRegion.Rows.Count
            linhaEscolhida = WorksheetFunction.RandBetween(1, ultimalinha)
            idFuncionario = Range("G" & linhaEscolhida).Value
            Range("G1").CurrentRegion.ClearContents
            valoritem = WorksheetFunction.RandBetween(10, 7300) * Rnd
            comando = "INSERT INTO tb_item_atendimento (valor_item,id_servico,id_funcionario,id_atendimento) VALUES (" & valoritem & "," & idServico & "," & idFuncionario & "," & idAtendimento & ")"
            Conexao.SQLServer (comando)
        Next
    Next
    Application.ScreenUpdating = True
End Sub