'Povoamento da tabela tb_modelos através da geração de modelos aleatórios utilizando como base as siglas contidas na Planilha 2

Private Sub povoarModelos_Click()
    Dim i As Integer, j As Integer
    Dim qtdIteracoes As Integer, qtdModelos As Integer, idMarca As Integer, qtdmax As Integer
    Dim comandoIDMarca As String, modelo As String, comando As String
    qtdmax = Range("A2").CurrentRegion.Rows.Count - 1
    Do
        qtdIteracoes = InputBox("Quantidade de iterações")
        qtdModelos = InputBox("Quantidade de modelos a cadastrar por iteração (max = qtd de marcas")
    Loop While qtdModelos < 1 Or qtdModelos > qtdmax
    For i = 1 To qtdIteracoes Step 1
        For j = 1 To qtdModelos Step 1
            idMarca = WorksheetFunction.RandBetween(1, qtdModelos)
            modelo = Range("B" & j + 1) & "-" & WorksheetFunction.RandBetween(100, 99999)
            comando = "INSERT INTO tb_modelo (nome_modelo,id_marca) VALUES ('" & modelo & "'," & idMarca & ")"
            Conexao.SQLServer (comando)
        Next
    Next
    MsgBox ("Cadastro finalizado")
End Sub