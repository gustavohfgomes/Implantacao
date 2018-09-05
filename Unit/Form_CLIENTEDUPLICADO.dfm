object F_CLIENTEDUPLICADO: TF_CLIENTEDUPLICADO
  Left = 0
  Top = 0
  Caption = 'Cliente Duplicado'
  ClientHeight = 393
  ClientWidth = 830
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object spl1: TSplitter
    Left = 569
    Top = 81
    Width = 16
    Height = 312
    ExplicitLeft = 425
    ExplicitTop = 57
    ExplicitHeight = 336
  end
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 830
    Height = 81
    Align = alTop
    TabOrder = 0
    ExplicitTop = -5
    object lbl2: TLabel
      Left = 16
      Top = 63
      Width = 36
      Height = 13
      Caption = 'Tempo:'
    end
    object lblTempo: TLabel
      Left = 65
      Top = 63
      Width = 66
      Height = 13
      Caption = '00:00:00:000'
    end
    object lbl7: TLabel
      Left = 176
      Top = 63
      Width = 82
      Height = 13
      Caption = 'Tempo Estimado:'
    end
    object lblTempoEstimado: TLabel
      Left = 274
      Top = 63
      Width = 66
      Height = 13
      Caption = '00:00:00:000'
    end
    object lbl1: TLabel
      Left = 175
      Top = 14
      Width = 72
      Height = 13
      Caption = 'C'#243'digo Divisor:'
    end
    object btnBuscar: TBitBtn
      Left = 552
      Top = 9
      Width = 113
      Height = 25
      Caption = 'Excluir'
      TabOrder = 3
      OnClick = btnBuscarClick
    end
    object pbProgresso: TProgressBar
      Left = 16
      Top = 40
      Width = 777
      Height = 17
      TabOrder = 4
    end
    object btnParar: TButton
      Left = 671
      Top = 9
      Width = 122
      Height = 25
      Caption = 'Parar'
      TabOrder = 5
      OnClick = btnPararClick
    end
    object rgClienteFornecedor: TRadioGroup
      Left = 16
      Top = 0
      Width = 145
      Height = 34
      Caption = 'Cadastro     '
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Cliente'
        'Fornecedor')
      TabOrder = 0
    end
    object edtCodigoDivisor: TEdit
      Left = 264
      Top = 11
      Width = 65
      Height = 21
      TabOrder = 1
      Text = '900000'
    end
    object chkInativar: TCheckBox
      Left = 351
      Top = 13
      Width = 177
      Height = 17
      Caption = 'Inativar caso n'#227'o consiga exluir'
      Checked = True
      State = cbChecked
      TabOrder = 2
    end
  end
  object pnl2: TPanel
    Left = 0
    Top = 81
    Width = 569
    Height = 312
    Align = alLeft
    TabOrder = 1
    ExplicitTop = 97
    ExplicitHeight = 296
    object dbgrdCliente: TDBGrid
      Left = 1
      Top = 1
      Width = 567
      Height = 310
      Align = alClient
      DataSource = dsCliente
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
  end
  object pnl3: TPanel
    Left = 585
    Top = 81
    Width = 245
    Height = 312
    Align = alClient
    TabOrder = 2
    ExplicitTop = 97
    ExplicitHeight = 296
    object mmoCliente: TMemo
      Left = 1
      Top = 1
      Width = 243
      Height = 310
      Align = alClient
      TabOrder = 0
      ExplicitHeight = 294
    end
  end
  object IBQueryCliente: TIBQuery
    Database = DATAMODULO.IBDatabase
    Transaction = DATAMODULO.IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'SELECT CLIENTE.CLN_CODIGO,'
      '             CLIENTE.CLN_CPFCNPJ,'
      '             CLIENTE.CLN_NOME'
      'FROM CLIENTE'
      ' WHERE CLIENTE.CLN_CODIGO < 900000'
      'ORDER BY CLN_CODIGO')
    Left = 40
    Top = 120
    object IBQueryClienteCLN_CODIGO: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CLN_CODIGO'
      Origin = '"CLIENTE"."CLN_CODIGO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IBQueryClienteCLN_CPFCNPJ: TIBStringField
      DisplayLabel = 'CPF / CNPJ'
      FieldName = 'CLN_CPFCNPJ'
      Origin = '"CLIENTE"."CLN_CPFCNPJ"'
      Required = True
      Size = 15
    end
    object IBQueryClienteCLN_NOME: TIBStringField
      DisplayLabel = 'Nome'
      FieldName = 'CLN_NOME'
      Origin = '"CLIENTE"."CLN_NOME"'
      Required = True
      Size = 255
    end
  end
  object dsCliente: TDataSource
    DataSet = IBQueryCliente
    Left = 40
    Top = 176
  end
  object IBQueryCliente2: TIBQuery
    Database = DATAMODULO.IBDatabase
    Transaction = DATAMODULO.IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'SELECT CLIENTE.CLN_CODIGO,'
      '             CLIENTE.CLN_CPFCNPJ,'
      '             CLIENTE.CLN_NOME'
      'FROM CLIENTE'
      'WHERE CLIENTE.CLN_CPFCNPJ = :CLN_CPFCNPJ'
      '    AND CLIENTE.CLN_CODIGO <> :CLN_CODIGO'
      '    AND CLIENTE.CLN_CODIGO > :CLN_CODIGO'
      '    AND CLIENTE.CLN_CODIGO < 900000'
      'ORDER BY CLN_CODIGO')
    Left = 128
    Top = 120
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CLN_CPFCNPJ'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CLN_CODIGO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CLN_CODIGO'
        ParamType = ptUnknown
      end>
    object IntegerField1: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CLN_CODIGO'
      Origin = '"CLIENTE"."CLN_CODIGO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IBStringField1: TIBStringField
      DisplayLabel = 'CPF / CNPJ'
      FieldName = 'CLN_CPFCNPJ'
      Origin = '"CLIENTE"."CLN_CPFCNPJ"'
      Required = True
      Size = 15
    end
    object IBStringField2: TIBStringField
      DisplayLabel = 'Nome'
      FieldName = 'CLN_NOME'
      Origin = '"CLIENTE"."CLN_NOME"'
      Required = True
      Size = 255
    end
  end
  object IBQueryExcluir: TIBQuery
    Database = DATAMODULO.IBDatabase
    Transaction = DATAMODULO.IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'DELETE FROM CLIENTE '
      'WHERE CLIENTE.CLN_CODIGO = :CLN_CODIGO')
    Left = 368
    Top = 120
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CLN_CODIGO'
        ParamType = ptUnknown
      end>
  end
  object IBQueryExcluirHistoricoCredito: TIBQuery
    Database = DATAMODULO.IBDatabase
    Transaction = DATAMODULO.IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'DELETE FROM CLIENTECREDITOHISTORICO '
      'WHERE CLIENTECREDITOHISTORICO.CLN_CODIGO = :CLN_CODIGO')
    Left = 248
    Top = 120
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CLN_CODIGO'
        ParamType = ptUnknown
      end>
  end
  object IBQueryInativar: TIBQuery
    Database = DATAMODULO.IBDatabase
    Transaction = DATAMODULO.IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'UPDATE CLIENTE'
      'SET CLIENTE.CLN_CREDITO = '#39'I'#39
      'WHERE CLIENTE.cln_codigo = :CLN_CODIGO')
    Left = 448
    Top = 121
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CLN_CODIGO'
        ParamType = ptUnknown
      end>
  end
end
