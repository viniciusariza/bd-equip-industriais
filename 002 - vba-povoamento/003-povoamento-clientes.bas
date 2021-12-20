'Povoamento da tabela tb_clientes através de nomes, telefones, moradas e docs gerados aleatóriamente no módulo Gerador

Private Sub gerarClientes_Click()
    Dim qtd As Integer, i As Integer
    qtd = InputBox("Quantidade de clientes a cadastrar")
    For i = 1 To qtd Step 1
        nome = Gerador.GerarNomePessoa(Range("B2:B880"), Range("C2:C880"), Range("D2:D880"))
        telefone = Gerador.GerarTelefone()
        morada = Gerador.GerarMorada(Range("B2:B880"), Range("C2:C880"), Range("D2:D880"))
        doc = Gerador.GerarDoc()
        comando = "INSERT INTO tb_cliente (nome_cliente, telefone_cliente, morada_cliente, doc_cliente) values ('" & nome & "','" & telefone & "','" & morada & "','" & doc & "')"
        Conexao.SQLServer (comando)
    Next
    MsgBox ("Cadastro finalizado")
End Sub