'Povoamento da tabela tb_funcionarios através de nomes, telefones, moradas e docs gerados aleatóriamente no módulo Gerador

Private Sub gerarFuncionarios_Click()
    Dim qtd As Integer, unidade As Integer, i As Integer, situacao As Byte, aleat As Byte
    qtd = InputBox("Quantidade de funcionários a cadastrar")
    For i = 1 To qtd Step 1
        aleat = WorksheetFunction.RandBetween(1, 10)
        If (aleat <= 8) Then
            situacao = 1
        Else
            'Colocar 0 quando quiser gerar funcionários inativos
            situacao = 1
        End If
        unidade = WorksheetFunction.RandBetween(1, 10)
        nome = Gerador.GerarNomePessoa(Range("B2:B880"), Range("C2:C880"), Range("D2:D880"))
        telefone = Gerador.GerarTelefone()
        morada = Gerador.GerarMorada(Range("B2:B880"), Range("C2:C880"), Range("D2:D880"))
        doc = Gerador.GerarDoc()
        comando = "INSERT INTO tb_funcionario (nome_funcionario, telefone_funcionario, morada_funcionario, doc_funcionario, situacao_funcionario,id_unidade) values ('" & nome & "','" & telefone & "','" & morada & "','" & doc & "'," & situacao & "," & unidade & ")"
        Conexao.SQLServer (comando)
    Next
    MsgBox ("Cadastro finalizado")
End Sub