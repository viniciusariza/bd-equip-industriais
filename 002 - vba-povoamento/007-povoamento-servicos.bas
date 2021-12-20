'Povoamento da tabela tb_servicos através dos serviços contidos na Planilha 3, que foram buscados aleatóriamente na internet
Private Sub povoarServicos_Click()
    Dim i As Integer, qtd As Integer, marca As String, qtdmax As Integer
    qtdmax = Range("A1").CurrentRegion.Rows.Count - 1
    Do
        qtd = InputBox("Quantidade de serviços")
    Loop While qtd < 1 Or qtd > qtdmax
    For i = 2 To qtd Step 1
        servico = Range("A" & i)
        comando = "INSERT INTO tb_servico (nome_servico) values ('" & servico & "')"
        Conexao.SQLServer (comando)
    Next
    MsgBox ("Cadastro finalizado")
End Sub