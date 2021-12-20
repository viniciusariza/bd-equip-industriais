'Gera nomes aleatórios através de nomes consumidos dos repositórios
'https://github.com/centraldedados/nomes_proprios
'https://github.com/centraldedados/apelidos

Function GerarNomePessoa(intervaloNome As Range, intervaloApelido1 As Range, intervaloApelido2 As Range) As String
    Dim nome As String, apelido1 As String, apelido2 As String
    nome = Range("A1").Offset(WorksheetFunction.RandBetween(2, intervaloNome.CurrentRegion.Rows.Count - 1), 1)
    apelido1 = Range("A1").Offset(WorksheetFunction.RandBetween(2, intervaloApelido1.CurrentRegion.Rows.Count - 1), 2)
    apelido2 = Range("A1").Offset(WorksheetFunction.RandBetween(2, intervaloApelido2.CurrentRegion.Rows.Count - 1), 3)
    GerarNomePessoa = nome & " " & apelido1 & " " & apelido2
End Function

'Gera telefones aleatórios
Function GerarTelefone() As String
    Dim i As Byte, tel As String
    tel = WorksheetFunction.RandBetween(241, 296)
    For i = 1 To 6 Step 1
        tel = tel & WorksheetFunction.RandBetween(1, 9)
    Next
    GerarTelefone = tel
End Function

'Gera moradas aleatórias através de nomes consumidos dos repositórios
'https://github.com/centraldedados/nomes_proprios
'https://github.com/centraldedados/apelidos

Function GerarMorada(intervaloNome As Range, intervaloApelido1 As Range, intervaloApelido2 As Range) As String
    Dim prefix As String, nome As String, apelido1 As String, apelido2 As String
    Dim numAleat As Byte, numMorada As Integer
    numAleat = WorksheetFunction.RandBetween(1, 10)
    If (numAleat <= 5) Then
        prefix = "Rua"
    Else
        prefix = "Av."
    End If
    nome = Range("A1").Offset(WorksheetFunction.RandBetween(2, intervaloNome.CurrentRegion.Rows.Count - 1), 1)
    apelido1 = Range("A1").Offset(WorksheetFunction.RandBetween(2, intervaloApelido1.CurrentRegion.Rows.Count - 1), 2)
    apelido2 = Range("A1").Offset(WorksheetFunction.RandBetween(2, intervaloApelido2.CurrentRegion.Rows.Count - 1), 3)
    numMorada = WorksheetFunction.RandBetween(10, 999)
    GerarMorada = prefix & " " & nome & " " & apelido1 & " " & apelido2 & ", " & numMorada
End Function

'Gera documentos aleatórios
Function GerarDoc() As String
    Dim i As Byte, doc As String
    doc = ""
    For i = 1 To 9 Step 1
        doc = doc & WorksheetFunction.RandBetween(1, 9)
    Next
    GerarDoc = doc
End Function