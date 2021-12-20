'Povoamento da tabela tb_marcas através das marcas contidas na Planilha 2
Private Sub povoarMarcas_Click()
    Dim i As Integer, qtd As Integer, marca As String, qtdmax As Integer
    qtdmax = Range("A1").CurrentRegion.Rows.Count - 1
    Do
        qtd = InputBox("Quantidade de marcas")
    Loop While qtd < 1 Or qtd > qtdmax
    For i = 2 To qtd Step 1
        marca = Range("A" & i)
        comando = "INSERT INTO tb_marca (nome_marca) values ('" & marca & "')"
        Conexao.SQLServer (comando)
    Next
    MsgBox ("Cadastro finalizado")
End Sub