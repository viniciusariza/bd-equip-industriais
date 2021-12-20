'Povoamento da tabela tb_equipamentos, inserindo as cores aleatórias e sua respectiva marca e modelo

Private Sub povoarEquipamentos_Click()
    Application.ScreenUpdating = False
    Dim i As Integer, qtd As Integer, marca As String, cor As String, qtdmax As Integer
    qtdmax = Range("A1").CurrentRegion.Rows.Count - 1
    qtd = InputBox("Quantidade de equipamentos a cadastrar")
    For i = 2 To qtd Step 1
        cor = Range("A" & WorksheetFunction.RandBetween(2, 70))
        modelo = WorksheetFunction.RandBetween(1, 60)
        cliente = WorksheetFunction.RandBetween(1, 1000)
        comando = "INSERT INTO tb_equipamento (cor_equipamento,id_cliente,id_modelo) VALUES ('" & cor & "'," & cliente & "," & modelo & ")"
        Conexao.SQLServer (comando)
    Next
    Application.ScreenUpdating = True
End Sub