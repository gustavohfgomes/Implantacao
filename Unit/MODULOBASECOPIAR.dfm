object BASECOPIAR: TBASECOPIAR
  OldCreateOrder = False
  Height = 199
  Width = 421
  object IBDatabaseBaseCopiar: TIBDatabase
    Connected = True
    DatabaseName = 'D:\Tecinco\BDS\OIMASA.FDB2'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey'
      'lc_ctype=WIN1252')
    LoginPrompt = False
    ServerType = 'IBServer'
    Left = 56
    Top = 8
  end
  object IBQueryBaseCopiar: TIBQuery
    Database = IBDatabaseBaseCopiar
    Transaction = IBTransactionBaseCopiar
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    Left = 56
    Top = 69
  end
  object IBQueryTabela: TIBQuery
    Database = IBDatabaseBaseCopiar
    Transaction = IBTransactionBaseCopiar
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select rdb$relation_name as NOME_TABELA from rdb$relations'
      'where rdb$system_flag = 0'
      'ORDER BY rdb$relation_name')
    Left = 160
    Top = 69
  end
  object dsTabela: TDataSource
    DataSet = IBQueryTabela
    Left = 247
    Top = 69
  end
  object IBTransactionBaseCopiar: TIBTransaction
    Active = True
    DefaultDatabase = IBDatabaseBaseCopiar
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 184
    Top = 8
  end
  object IBQueryForeignKey: TIBQuery
    Database = IBDatabaseBaseCopiar
    Transaction = IBTransactionBaseCopiar
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      
        'SELECT C.RDB$INDEX_NAME AS NOME_FK, C.RDB$RELATION_NAME AS TABEL' +
        'A_PESQUISADA, I.RDB$FIELD_NAME AS CAMPO_FK_TABELAPESQUISADA,'
      '    (SELECT I2.RDB$RELATION_NAME'
      '    FROM RDB$INDICES I1'
      
        '    INNER JOIN RDB$INDICES I2 ON I2.RDB$INDEX_NAME = I1.RDB$FORE' +
        'IGN_KEY'
      
        '    WHERE I1.RDB$INDEX_NAME=I.RDB$INDEX_NAME) AS TABELA_ORIGEM_D' +
        'ADOS'
      'FROM RDB$INDEX_SEGMENTS I'
      'INNER JOIN RDB$RELATION_CONSTRAINTS C'
      
        'ON C.RDB$INDEX_NAME = I.RDB$INDEX_NAME AND C.RDB$CONSTRAINT_TYPE' +
        ' = '#39'FOREIGN KEY'#39' AND C.RDB$RELATION_NAME = :TABELA')
    Left = 56
    Top = 126
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'TABELA'
        ParamType = ptUnknown
      end>
    object strIBQueryForeignKeyNOME_FK: TIBStringField
      FieldName = 'NOME_FK'
      Origin = '"RDB$RELATION_CONSTRAINTS"."RDB$INDEX_NAME"'
      FixedChar = True
      Size = 93
    end
    object strIBQueryForeignKeyTABELA_PESQUISADA: TIBStringField
      FieldName = 'TABELA_PESQUISADA'
      Origin = '"RDB$RELATION_CONSTRAINTS"."RDB$RELATION_NAME"'
      FixedChar = True
      Size = 93
    end
    object strIBQueryForeignKeyCAMPO_FK_TABELAPESQUISADA: TIBStringField
      FieldName = 'CAMPO_FK_TABELAPESQUISADA'
      Origin = '"RDB$INDEX_SEGMENTS"."RDB$FIELD_NAME"'
      FixedChar = True
      Size = 93
    end
    object strIBQueryForeignKeyTABELA_ORIGEM_DADOS: TIBStringField
      FieldName = 'TABELA_ORIGEM_DADOS'
      ProviderFlags = []
      FixedChar = True
      Size = 31
    end
  end
  object IBTableDestino: TIBTable
    Database = IBDatabaseBaseCopiar
    Transaction = IBTransactionBaseCopiar
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'CLIENTE'
    UniDirectional = False
    Left = 344
    Top = 16
  end
end
