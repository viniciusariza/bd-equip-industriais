'Conexão com SQL server e inserção
Sub SQLServer(comando As String)
    Dim Cn As ADODB.Connection
    Dim Server_Name As String
    Dim Database_Name As String
    Dim User_ID As String
    Dim Password As String
    Dim SQLStr As String
    Dim rs As ADODB.Recordset
    Set rs = New ADODB.Recordset
    Server_Name = "DESKTOP-2UEK5JE\SQLEXPRESS"
    Database_Name = "db_manutencaoei"
    User_ID = "admin"
    Password = "admin"
    Set Cn = New ADODB.Connection
    Cn.Open "Driver={SQL Server};Server=" & Server_Name & ";Database=" & Database_Name & _
    ";Uid=" & User_ID & ";Pwd=" & Password & ";"
    Sql = comando
    Cn.Execute Sql
    Cn.Close
    Set Cn = Nothing
End Sub
'Conexão com SQL server e consulta
Sub SelectSQLServer(comando As String)
    Dim Cn As ADODB.Connection
    Dim Server_Name As String
    Dim Database_Name As String
    Dim User_ID As String
    Dim Password As String
    Dim SQLStr As String
    Dim rs As ADODB.Recordset
    Set rs = New ADODB.Recordset
    Server_Name = "DESKTOP-2UEK5JE\SQLEXPRESS"
    Database_Name = "db_manutencaoei"
    User_ID = "admin"
    Password = "admin"
    Set Cn = New ADODB.Connection
    Cn.Open "Driver={SQL Server};Server=" & Server_Name & ";Database=" & Database_Name & _
    ";Uid=" & User_ID & ";Pwd=" & Password & ";"
    selectSQL = comando
    rs.Open selectSQL, Cn, adOpenStatic
    With Range("G1")
    .ClearContents
    .CopyFromRecordset rs
    End With
    rs.Close
    Set rs = Nothing
    Cn.Close
    Set Cn = Nothing
End Sub