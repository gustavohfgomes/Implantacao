object F_CT_PLANOCONTA_INTEGRACAO: TF_CT_PLANOCONTA_INTEGRACAO
  Left = 0
  Top = 0
  Caption = 'Plano de Contas - Conta Integracao'
  ClientHeight = 497
  ClientWidth = 1047
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
    Left = 529
    Top = 113
    Height = 365
    ExplicitLeft = 544
    ExplicitTop = 280
    ExplicitHeight = 100
  end
  object pnlTexto: TPanel
    Left = 0
    Top = 0
    Width = 1047
    Height = 113
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 944
    object lbl1: TLabel
      Left = 16
      Top = 22
      Width = 85
      Height = 13
      Caption = 'Caminho Arquivo:'
    end
    object lbl2: TLabel
      Left = 16
      Top = 94
      Width = 36
      Height = 13
      Caption = 'Tempo:'
    end
    object lblTempo: TLabel
      Left = 65
      Top = 94
      Width = 66
      Height = 13
      Caption = '00:00:00:000'
    end
    object lbl7: TLabel
      Left = 176
      Top = 94
      Width = 82
      Height = 13
      Caption = 'Tempo Estimado:'
    end
    object lblTempoEstimado: TLabel
      Left = 274
      Top = 94
      Width = 66
      Height = 13
      Caption = '00:00:00:000'
    end
    object lbl6: TLabel
      Left = 16
      Top = 49
      Width = 66
      Height = 13
      Caption = 'Vers'#227'o Plano:'
    end
    object edtCaminhoArquivo: TEdit
      Left = 107
      Top = 18
      Width = 487
      Height = 21
      TabOrder = 0
    end
    object btnSelecionarArquivo: TButton
      Left = 600
      Top = 17
      Width = 25
      Height = 25
      Caption = '...'
      TabOrder = 1
      OnClick = btnSelecionarArquivoClick
    end
    object btnInserirDados: TButton
      Left = 631
      Top = 16
      Width = 122
      Height = 25
      Caption = 'Inserir Dados'
      TabOrder = 3
      OnClick = btnInserirDadosClick
    end
    object pbProgresso: TProgressBar
      Left = 16
      Top = 72
      Width = 865
      Height = 17
      TabOrder = 5
    end
    object btnParar: TButton
      Left = 759
      Top = 17
      Width = 122
      Height = 25
      Caption = 'Parar'
      TabOrder = 4
      OnClick = btnPararClick
    end
    object edtVersao: TEdit
      Left = 107
      Top = 45
      Width = 86
      Height = 21
      TabOrder = 2
    end
  end
  object pnl2: TPanel
    Left = 0
    Top = 113
    Width = 529
    Height = 365
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 1
    object mmoErros: TMemo
      Left = 0
      Top = 25
      Width = 529
      Height = 340
      Align = alClient
      ScrollBars = ssVertical
      TabOrder = 0
      ExplicitLeft = 49
      ExplicitTop = 52
      ExplicitWidth = 352
      ExplicitHeight = 295
    end
    object pnl3: TPanel
      Left = 0
      Top = 0
      Width = 529
      Height = 25
      Align = alTop
      Caption = 'Erros:'
      TabOrder = 1
      ExplicitWidth = 473
    end
  end
  object pnl1: TPanel
    Left = 532
    Top = 113
    Width = 515
    Height = 365
    Align = alClient
    BevelOuter = bvNone
    Caption = 'pnl1'
    TabOrder = 2
    ExplicitLeft = 560
    ExplicitTop = 119
    ExplicitWidth = 509
    ExplicitHeight = 384
    object mmoComentarios: TMemo
      Left = 0
      Top = 25
      Width = 515
      Height = 340
      Align = alClient
      ScrollBars = ssVertical
      TabOrder = 0
      ExplicitLeft = 22
      ExplicitTop = 31
      ExplicitWidth = 531
    end
    object pnl4: TPanel
      Left = 0
      Top = 0
      Width = 515
      Height = 25
      Align = alTop
      Caption = 'Coment'#225'rios:'
      TabOrder = 1
      ExplicitLeft = 64
      ExplicitWidth = 479
    end
  end
  object stBar1: TStatusBar
    Left = 0
    Top = 478
    Width = 1047
    Height = 19
    Panels = <>
    ExplicitLeft = 1
    ExplicitTop = 296
    ExplicitWidth = 920
  end
  object dlgOpen: TOpenDialog
    Left = 608
    Top = 144
  end
  object DataSet: TIBDataSet
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from CT_MOVIMENTO'
      'where'
      '  CTMOV_DATA = :OLD_CTMOV_DATA and'
      '  CTMOV_LOTE = :OLD_CTMOV_LOTE and'
      '  CTMOV_SEQUENCIA = :OLD_CTMOV_SEQUENCIA and'
      '  FLL_CODIGO = :OLD_FLL_CODIGO')
    InsertSQL.Strings = (
      'insert into CT_MOVIMENTO'
      
        '  (CTHIS_CODIGO, CTMOV_CONCILIADA, CTMOV_CTRTP, CTMOV_DATA, CTMO' +
        'V_DOCUMENTO, '
      
        '   CTMOV_DTAALT, CTMOV_DTAINS, CTMOV_HISTORICO, CTMOV_LOTE, CTMO' +
        'V_OPEALT, '
      
        '   CTMOV_OPEINS, CTMOV_ORIGEMCHAVE, CTMOV_ORIGEMTABELA, CTMOV_SE' +
        'Q_CONCILIADA, '
      
        '   CTMOV_SEQUENCIA, CTMOV_TIPOLANCAMENTO, CTMOV_TIPOMOVIMENTO, C' +
        'TMOV_VALOR, '
      
        '   CTPLC_CONTACREDITO, CTPLC_CONTADEBITO, CTRAT_CODIGOCREDITO, C' +
        'TRAT_CODIGODEBITO, '
      '   CTVER_CODIGO, FLL_CODIGO, TPD_CODIGO)'
      'values'
      
        '  (:CTHIS_CODIGO, :CTMOV_CONCILIADA, :CTMOV_CTRTP, :CTMOV_DATA, ' +
        ':CTMOV_DOCUMENTO, '
      
        '   :CTMOV_DTAALT, :CTMOV_DTAINS, :CTMOV_HISTORICO, :CTMOV_LOTE, ' +
        ':CTMOV_OPEALT, '
      
        '   :CTMOV_OPEINS, :CTMOV_ORIGEMCHAVE, :CTMOV_ORIGEMTABELA, :CTMO' +
        'V_SEQ_CONCILIADA, '
      
        '   :CTMOV_SEQUENCIA, :CTMOV_TIPOLANCAMENTO, :CTMOV_TIPOMOVIMENTO' +
        ', :CTMOV_VALOR, '
      
        '   :CTPLC_CONTACREDITO, :CTPLC_CONTADEBITO, :CTRAT_CODIGOCREDITO' +
        ', :CTRAT_CODIGODEBITO, '
      '   :CTVER_CODIGO, :FLL_CODIGO, :TPD_CODIGO)')
    RefreshSQL.Strings = (
      'Select '
      '  FLL_CODIGO,'
      '  CTMOV_DATA,'
      '  CTMOV_LOTE,'
      '  CTMOV_SEQUENCIA,'
      '  CTVER_CODIGO,'
      '  CTPLC_CONTADEBITO,'
      '  CTPLC_CONTACREDITO,'
      '  CTHIS_CODIGO,'
      '  CTMOV_DOCUMENTO,'
      '  CTMOV_HISTORICO,'
      '  CTMOV_VALOR,'
      '  CTMOV_ORIGEMCHAVE,'
      '  CTMOV_ORIGEMTABELA,'
      '  CTMOV_CONCILIADA,'
      '  CTMOV_CTRTP,'
      '  CTMOV_OPEINS,'
      '  CTMOV_DTAINS,'
      '  CTMOV_OPEALT,'
      '  CTMOV_DTAALT,'
      '  CTMOV_TIPOLANCAMENTO,'
      '  CTRAT_CODIGODEBITO,'
      '  CTRAT_CODIGOCREDITO,'
      '  CTMOV_TIPOMOVIMENTO,'
      '  CTMOV_SEQ_CONCILIADA,'
      '  TPD_CODIGO'
      'from CT_MOVIMENTO '
      'where'
      '  CTMOV_DATA = :CTMOV_DATA and'
      '  CTMOV_LOTE = :CTMOV_LOTE and'
      '  CTMOV_SEQUENCIA = :CTMOV_SEQUENCIA and'
      '  FLL_CODIGO = :FLL_CODIGO')
    SelectSQL.Strings = (
      'SELECT * FROM CT_MOVIMENTO'
      'where'
      '  CTMOV_DATA = :CTMOV_DATA and'
      '  CTMOV_LOTE = :CTMOV_LOTE and'
      '  CTMOV_SEQUENCIA = :CTMOV_SEQUENCIA and'
      '  FLL_CODIGO = :FLL_CODIGO')
    ModifySQL.Strings = (
      'update CT_MOVIMENTO'
      'set'
      '  CTHIS_CODIGO = :CTHIS_CODIGO,'
      '  CTMOV_CONCILIADA = :CTMOV_CONCILIADA,'
      '  CTMOV_CTRTP = :CTMOV_CTRTP,'
      '  CTMOV_DATA = :CTMOV_DATA,'
      '  CTMOV_DOCUMENTO = :CTMOV_DOCUMENTO,'
      '  CTMOV_DTAALT = :CTMOV_DTAALT,'
      '  CTMOV_DTAINS = :CTMOV_DTAINS,'
      '  CTMOV_HISTORICO = :CTMOV_HISTORICO,'
      '  CTMOV_LOTE = :CTMOV_LOTE,'
      '  CTMOV_OPEALT = :CTMOV_OPEALT,'
      '  CTMOV_OPEINS = :CTMOV_OPEINS,'
      '  CTMOV_ORIGEMCHAVE = :CTMOV_ORIGEMCHAVE,'
      '  CTMOV_ORIGEMTABELA = :CTMOV_ORIGEMTABELA,'
      '  CTMOV_SEQ_CONCILIADA = :CTMOV_SEQ_CONCILIADA,'
      '  CTMOV_SEQUENCIA = :CTMOV_SEQUENCIA,'
      '  CTMOV_TIPOLANCAMENTO = :CTMOV_TIPOLANCAMENTO,'
      '  CTMOV_TIPOMOVIMENTO = :CTMOV_TIPOMOVIMENTO,'
      '  CTMOV_VALOR = :CTMOV_VALOR,'
      '  CTPLC_CONTACREDITO = :CTPLC_CONTACREDITO,'
      '  CTPLC_CONTADEBITO = :CTPLC_CONTADEBITO,'
      '  CTRAT_CODIGOCREDITO = :CTRAT_CODIGOCREDITO,'
      '  CTRAT_CODIGODEBITO = :CTRAT_CODIGODEBITO,'
      '  CTVER_CODIGO = :CTVER_CODIGO,'
      '  FLL_CODIGO = :FLL_CODIGO,'
      '  TPD_CODIGO = :TPD_CODIGO'
      'where'
      '  CTMOV_DATA = :OLD_CTMOV_DATA and'
      '  CTMOV_LOTE = :OLD_CTMOV_LOTE and'
      '  CTMOV_SEQUENCIA = :OLD_CTMOV_SEQUENCIA and'
      '  FLL_CODIGO = :OLD_FLL_CODIGO')
    ParamCheck = True
    UniDirectional = False
    Left = 656
    Top = 144
  end
end
