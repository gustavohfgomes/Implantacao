unit IMPLANTACAOTCAR;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  MODULO, System.IniFiles, Vcl.ComCtrls, ShellApi,
  Vcl.CheckLst, System.AnsiStrings, Winapi.TlHelp32, Winapi.ShlObj, Winapi.ActiveX,
  System.Win.ComObj, System.Win.Registry, IdFTP, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdExplicitTLSClientServerBase,
  Vcl.Samples.Gauges, Vcl.Imaging.jpeg, IdMessage, IdMessageClient, IdSMTPBase,
  IdSMTP, System.StrUtils, Data.DB, Vcl.Grids, Vcl.DBGrids, IBX.IBCustomDataSet,
  IBX.IBQuery, IBX.IBTable, Datasnap.DBClient, Vcl.DBCtrls, Vcl.Themes,
  CT_MOVIMENTO, CT_PLANOCONTA_CONTAINTEGRACAO, Vcl.FileCtrl, Uteis, Vcl.DBLookup;

type
  TF_IMPLANTACAO = class(TForm)
    pnl2: TPanel;
    pgcImplantacao: TPageControl;
    tsConfiguracoes: TTabSheet;
    tsInformacoes: TTabSheet;
    tsFilial: TTabSheet;
    tsDados: TTabSheet;
    dlgOpen: TOpenDialog;
    pnl1: TPanel;
    pnl3: TPanel;
    pnl4: TPanel;
    mmoVoltaBackup: TMemo;
    lbl8: TLabel;
    lblTempo: TLabel;
    IdFTP: TIdFTP;
    tsAtualizarArquivos: TTabSheet;
    img1: TImage;
    lbl21: TLabel;
    btnLimparMemo: TBitBtn;
    tsFerramentas: TTabSheet;
    pnl7: TPanel;
    lbl28: TLabel;
    edtCaminhoBaseCopiar: TEdit;
    btnAbrirBaseCopiar: TBitBtn;
    btnConectarBaseCopiar: TBitBtn;
    btnCopiar: TBitBtn;
    lbl29: TLabel;
    lbl30: TLabel;
    edtFilialOrigemTabelaCopiar: TEdit;
    lbl31: TLabel;
    edtFilialNovaTabelaCopiar: TEdit;
    pnl8: TPanel;
    pnl9: TPanel;
    lbl14: TLabel;
    lbl15: TLabel;
    edtFilialOrigem: TEdit;
    edtFilialNova: TEdit;
    pnl10: TPanel;
    lbl23: TLabel;
    btnCriarFilial: TBitBtn;
    chklstTabelaFilial: TCheckListBox;
    btnMarcarTodosInsert: TBitBtn;
    pnl11: TPanel;
    lbl22: TLabel;
    chklstUpdateorInsert: TCheckListBox;
    btnMarcarTodosUpIns: TBitBtn;
    btnInserirAlterar: TBitBtn;
    chkMostrarScript: TCheckBox;
    pnl12: TPanel;
    lbl25: TLabel;
    chklstPG116: TCheckListBox;
    btnMarcarTodosPG116: TBitBtn;
    btnInserirAlterarPG116: TBitBtn;
    chkMostrarScriptCopiarTabelaBase: TCheckBox;
    dblkcbbNOME_TABELA: TDBLookupComboBox;
    pnl13: TPanel;
    btnInstalarHeimdall: TBitBtn;
    btnReiniciarHeindall: TBitBtn;
    btnCriarAtalho: TBitBtn;
    btnDesinstalarHeimdallGuardian: TBitBtn;
    btnInstalarIBExpert: TBitBtn;
    lbl32: TLabel;
    pnl14: TPanel;
    chklstModulosContratados: TCheckListBox;
    btnAplicarModulosContratados: TBitBtn;
    lbl1: TLabel;
    pnl15: TPanel;
    pnl16: TPanel;
    lbl10: TLabel;
    chklstTabelasLOG: TCheckListBox;
    btnLimparTabelasLog: TBitBtn;
    stBar1: TStatusBar;
    pnl20: TPanel;
    pnl21: TPanel;
    lbl17: TLabel;
    btnBaixarArquivos: TBitBtn;
    ListBoxArquivosAtualizacao: TListBox;
    btnAtualizar: TBitBtn;
    btnListarArquivosFTP: TBitBtn;
    GaugeProgressoAtualizacao: TGauge;
    lbl18: TLabel;
    lbl19: TLabel;
    lblTempoAtualizacao: TLabel;
    lbl20: TLabel;
    lblTempoAtualizacaoDecorrido: TLabel;
    btnCancelarAtualizacao: TBitBtn;
    pnl22: TPanel;
    pnl23: TPanel;
    lbl26: TLabel;
    cbbTema: TComboBox;
    btnSalvarTema: TBitBtn;
    btnListarArquivosBaixados: TBitBtn;
    lbl33: TLabel;
    lblBaixandoArquivo: TLabel;
    ListBoxTabelas: TListBox;
    lbl34: TLabel;
    btnListarDependencias: TBitBtn;
    pnl24: TPanel;
    btnRegistrarMidas: TBitBtn;
    pnl26: TPanel;
    lbl12: TLabel;
    lbl7: TLabel;
    lbl11: TLabel;
    edtApelidoEmpresa: TEdit;
    edtRazaoSocial: TEdit;
    edtCNPJ: TEdit;
    rgSistemaOperacional: TRadioGroup;
    pnl27: TPanel;
    lbl2: TLabel;
    lbl6: TLabel;
    lbl13: TLabel;
    btnConectar: TBitBtn;
    edtCaminhoBackup: TEdit;
    btnAbrirBackupTecinco: TBitBtn;
    edtDiretorioPastaTCar: TEdit;
    edtDiretorioBackupTecinco: TEdit;
    btnSalvarStart: TBitBtn;
    lbl36: TLabel;
    edtDiretorioServicosTCar: TEdit;
    cbbUnidadeRede: TComboBox;
    lbl38: TLabel;
    pnl28: TPanel;
    mmoInformacoes: TMemo;
    spl1: TSplitter;
    edtUsuarioTecinco: TEdit;
    btnAbrirBaseTecinco: TBitBtn;
    edtSenhaTecinco: TEdit;
    edtDiretorioBaseTecinco: TEdit;
    lbl16: TLabel;
    lbl5: TLabel;
    lbl4: TLabel;
    lbl3: TLabel;
    edtIPServidor: TEdit;
    lbl39: TLabel;
    lbl40: TLabel;
    tsDadosInstalado: TTabSheet;
    Panel1: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    btnConectarBaseInstalada: TBitBtn;
    edtBICAMINHOHEIMDALL: TEdit;
    edtBICAMINHOBACKUP: TEdit;
    btnSalvarConfiguracoesBaseInstalada: TBitBtn;
    edtBICAMINHOSERVICOSTCAR: TEdit;
    edtBIUSUARIOBANCO: TEdit;
    btnCaminhoBaseInstalada: TBitBtn;
    edtBISENHABANCO: TEdit;
    edtBICAMINHOBANCO: TEdit;
    edtBIIPSERVIDOR: TEdit;
    btnLimparDadosNovaInstalacao: TBitBtn;
    pnl19: TPanel;
    btnVerificarMidas: TBitBtn;
    cbbPacote: TComboBox;
    rgSistemaTcarMekanic: TRadioGroup;
    rgSistemaAtualizar: TRadioGroup;
    btnDesconectar: TBitBtn;
    pnl18: TPanel;
    lbl27: TLabel;
    lbl35: TLabel;
    chklstAtualizarNumeracoes: TCheckListBox;
    btnMarcarTodosAtualizarNumeracao: TBitBtn;
    btnAtualizarNumeracoes: TBitBtn;
    edtFilialNumeracao: TEdit;
    pnl25: TPanel;
    lbl37: TLabel;
    edtFilialImplantacao: TEdit;
    btnFilialModoImplantacao: TBitBtn;
    btnRetirarFilialModoImplantacao: TBitBtn;
    Label1: TLabel;
    btnClienteDuplicado: TBitBtn;
    Label5: TLabel;
    btnContaIntegracao: TBitBtn;
    Label11: TLabel;
    btnSaldoInicialSPED: TBitBtn;
    btn2: TBitBtn;
    Label12: TLabel;
    Label13: TLabel;
    tsSecur: TTabSheet;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    dblkcbbSST_NOME: TDBLookupComboBox;
    dblkcbbFRM_NOME: TDBLookupComboBox;
    dblkcbbGRP_ID: TDBLookupComboBox;
    Label17: TLabel;
    dblkcbbOBJ_NOME: TDBLookupComboBox;
    Panel5: TPanel;
    Panel6: TPanel;
    Label18: TLabel;
    Panel7: TPanel;
    btnMarcarTodosGrupos: TBitBtn;
    btnCopiarRestricoes: TBitBtn;
    Panel8: TPanel;
    chklstGRUPOSDISPONIVEIS: TCheckListBox;
    Panel9: TPanel;
    Label19: TLabel;
    Panel10: TPanel;
    dbgrdSECUR_RESTRICAO: TDBGrid;
    tsEAD: TTabSheet;
    Panel11: TPanel;
    Panel12: TPanel;
    Panel13: TPanel;
    Label20: TLabel;
    edtBASEEAD: TEdit;
    Label21: TLabel;
    edtTCAREAD: TEdit;
    Label22: TLabel;
    btnGerarBaseEAD: TBitBtn;
    btnInstalarHeimdallEAD: TBitBtn;
    btnConectarBaseEAD: TBitBtn;
    btnDesinstalarHeimdallEAD: TBitBtn;
    procedure btnAbrirBaseTecincoClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnConectarClick(Sender: TObject);
    procedure btnLimparTabelasLogClick(Sender: TObject);
    procedure btnAbrirBackupTecincoClick(Sender: TObject);
    procedure btnInstalarHeimdallClick(Sender: TObject);
    procedure edtCNPJExit(Sender: TObject);
    procedure edtCNPJEnter(Sender: TObject);
    procedure btnDesinstalarHeimdallGuardianClick(Sender: TObject);
    procedure btnAplicarModulosContratadosClick(Sender: TObject);
    procedure btnReiniciarHeindallClick(Sender: TObject);
    procedure btnCriarAtalhoClick(Sender: TObject);
    procedure btnCriarFilialClick(Sender: TObject);
    procedure btnSalvarStartClick(Sender: TObject);
    procedure btnBaixarArquivosClick(Sender: TObject);
    procedure IdFTPWorkBegin(ASender: TObject; AWorkMode: TWorkMode;
      AWorkCountMax: Int64);
    procedure IdFTPWork(ASender: TObject; AWorkMode: TWorkMode;
      AWorkCount: Int64);
    procedure btnCancelarAtualizacaoClick(Sender: TObject);
    procedure btnMarcarTodosInsertClick(Sender: TObject);
    procedure btnMarcarTodosUpInsClick(Sender: TObject);
    procedure btnInserirAlterarClick(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnMarcarTodosPG116Click(Sender: TObject);
    procedure btnInserirAlterarPG116Click(Sender: TObject);
    procedure btnLimparMemoClick(Sender: TObject);
    procedure cbbTemaChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSalvarTemaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnMarcarTodosAtualizarNumeracaoClick(Sender: TObject);
    procedure btnAtualizarNumeracoesClick(Sender: TObject);
    procedure btnInstalarIBExpertClick(Sender: TObject);
    procedure btnAbrirBaseCopiarClick(Sender: TObject);
    procedure btnConectarBaseCopiarClick(Sender: TObject);
    procedure btnCopiarClick(Sender: TObject);
    procedure btnSaldoInicialSPEDClick(Sender: TObject);
    procedure btnListarArquivosFTPClick(Sender: TObject);
    procedure btnListarArquivosBaixadosClick(Sender: TObject);
    procedure btnListarDependenciasClick(Sender: TObject);
    procedure btnFilialModoImplantacaoClick(Sender: TObject);
    procedure btnRetirarFilialModoImplantacaoClick(Sender: TObject);
    procedure btnVerificarMidasClick(Sender: TObject);
    procedure btnRegistrarMidasClick(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btnContaIntegracaoClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnClienteDuplicadoClick(Sender: TObject);
    procedure cbbUnidadeRedeSelect(Sender: TObject);
    procedure btnLimparDadosNovaInstalacaoClick(Sender: TObject);
    procedure edtApelidoEmpresaExit(Sender: TObject);
    procedure btnConectarBaseInstaladaClick(Sender: TObject);
    procedure btnSalvarConfiguracoesBaseInstaladaClick(Sender: TObject);
    procedure btnCaminhoBaseInstaladaClick(Sender: TObject);
    procedure rgSistemaTcarMekanicClick(Sender: TObject);
    procedure cbbPacoteChange(Sender: TObject);
    procedure btnDesconectarClick(Sender: TObject);
    procedure tsSecurEnter(Sender: TObject);
    procedure dblkcbbSST_NOMEExit(Sender: TObject);
    procedure dblkcbbFRM_NOMEExit(Sender: TObject);
    procedure dblkcbbGRP_IDExit(Sender: TObject);
    procedure btnMarcarTodosGruposClick(Sender: TObject);
    procedure btnCopiarRestricoesClick(Sender: TObject);
    procedure btnGerarBaseEADClick(Sender: TObject);
    procedure btnInstalarHeimdallEADClick(Sender: TObject);
    procedure btnConectarBaseEADClick(Sender: TObject);
    procedure btnDesinstalarHeimdallEADClick(Sender: TObject);
  private
    { Private declarations }
    // PROCEDURE
    procedure Insert(NomeTabela,FLL_ORIGEM, FLL_NOVA: string);
    procedure UpdateorInsert(NomeTabela,FLL_ORIGEM, FLL_NOVA: string);
    procedure CopiarTabela(Tabela, Dados, FLL_ORIGEM, FLL_NOVA : String);
    procedure CopiarTabelaEntreBancos(FLL_ORIGEM, FLL_NOVA, Tabela : string);
    procedure AtualizarModulosDisponiveisPG116;
    procedure AtualizarGruposDisponiveisSecur;
    procedure MKI;
    procedure MKE;
    procedure MKP;
    procedure TCar;
    procedure Diretorios;
    procedure Abas (VisivelInvisivel : String);
    procedure AtualizarModulosDisponiveis;
    procedure CriarPastasPadrao;
    procedure VoltarBackup;
    procedure CopiarPastaTCar;
    procedure AlterarStartini;
    procedure FazerBackupEAD;
    procedure VoltarBackupEAD;

    // FUNCTION
    function VerificarDependencias (Tabela : TStringList) : TStringList;

  public
    { Public declarations }
  end;

var
  F_IMPLANTACAO: TF_IMPLANTACAO;
  FBOK : string;
  bytesToTransfer: integer;
  cancelaratualizacao : string;
  tempo : TDateTime;
  Atualizar : string;
  Tema : string;
implementation

uses
  MODULOBASECOPIAR, Form_CLIENTEDUPLICADO, Dados;

{$R *.dfm}

procedure TF_IMPLANTACAO.AtualizarGruposDisponiveisSecur;
begin
  with DATAMODULO.IBQuery do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT SECUR_GRUPO.GRP_ID,                  '+
            '       SECUR_GRUPO.GRP_DESCRICAO            '+
            'FROM SECUR_GRUPO                            '+
            'WHERE SECUR_GRUPO.SST_NOME  = :SST_NOME     '+
            '    AND SECUR_GRUPO.GRP_ID <> :GRP_ID       '+
            'ORDER BY SECUR_GRUPO.GRP_ID');
    ParamByName('SST_NOME').AsString  := dblkcbbSST_NOME.KeyValue;
    ParamByName('GRP_ID').AsString    := dblkcbbGRP_ID.KeyValue;
    Open;
    if not IsEmpty then
    begin
      chklstGRUPOSDISPONIVEIS.Items.Clear;
      while not Eof do
      begin
        chklstGRUPOSDISPONIVEIS.Items.Add(Fields[0].AsString + ' - ' + Fields[1].AsString);
        Next;
      end;
    end;
  end;
end;

procedure TF_IMPLANTACAO.AlterarStartini;
begin
  if DATAMODULO.IBDatabase.Connected then
  begin
    // ALTERA CAMINHO DA BASE NO STAR NA PASTA DO TCAR
    try
      mmoInformacoes.Lines.Add('Iniciando alteração do Start.ini!');
      if FileExists(edtDiretorioPastaTCar.Text + '\Start.ini') then
      begin
        DADOS_GRAVARINIFILE(edtDiretorioPastaTCar.Text + '\Start.ini','params','Database', edtIPServidor.Text + ':'+ edtDiretorioBaseTecinco.Text);
        mmoInformacoes.Lines.Add('Start.ini Alterado!');
        mmoInformacoes.Lines.Add('');

        if FileExists(Copy(edtDiretorioPastaTCar.Text,0,Length(edtDiretorioPastaTCar.Text) - 1) + ' FDB2\' + '\Start.ini') then
        begin
          DADOS_GRAVARINIFILE(Copy(edtDiretorioPastaTCar.Text,0,Length(edtDiretorioPastaTCar.Text) - 1) + ' FDB2\' + '\Start.ini','params','Database', edtIPServidor.Text + ':'+ edtDiretorioBaseTecinco.Text + '2');
          mmoInformacoes.Lines.Add('Start.ini Alterado FDB2!');
          mmoInformacoes.Lines.Add('');
        end;
        if FileExists(edtTCAREAD.Text + '\Start.ini') then
        begin
          DADOS_GRAVARINIFILE(edtTCAREAD.Text + '\Start.ini','params','Database', edtIPServidor.Text + ':'+ edtBASEEAD.Text);
          mmoInformacoes.Lines.Add('Start.ini Alterado EAD!');
          mmoInformacoes.Lines.Add('');
        end;
      end
      else
      begin
        mmoInformacoes.Lines.Add('Não existe o arquivo Start.ini no diretório informado!');
        mmoInformacoes.Lines.Add('edtDiretorioPastaTCar.Text');
        mmoInformacoes.Lines.Add('Processo interrompido!');
      end;
    except
      on e:exception do
      begin
        mmoInformacoes.Lines.Add('Erro ao alterar Start.ini! ' + e.Message);
        mmoInformacoes.Lines.Add('');
      end;
    end;
  end;
end;

procedure TF_IMPLANTACAO.CopiarPastaTCar;
var
  executar : TextFile;
begin
  if DATAMODULO.IBDatabase.Connected then
  begin
    // OFICIAL
    mmoInformacoes.Lines.Add('Iniciando a cópia dos arquivos do TCar!');
    mmoInformacoes.Lines.Add('De: '+ ExtractFilePath(Application.ExeName) + 'TCar\');
    mmoInformacoes.Lines.Add('Para: '+ edtDiretorioPastaTCar.Text);
    DADOS_COPIARDIRETORIO(ExtractFilePath(Application.ExeName) + 'TCar',
                                    edtDiretorioPastaTCar.Text);
    mmoInformacoes.Lines.Add('Arquivos pasta TCar copiados!');
    mmoInformacoes.Lines.Add('');
    // FDB2
    mmoInformacoes.Lines.Add('Iniciando a cópia dos arquivos do TCar FDB2!');
    mmoInformacoes.Lines.Add('De: '+ ExtractFilePath(Application.ExeName) + 'TCar\');
    mmoInformacoes.Lines.Add('Para: '+ Copy(edtDiretorioPastaTCar.Text,0,Length(edtDiretorioPastaTCar.Text) - 1) + ' FDB2\');
    DADOS_COPIARDIRETORIO(ExtractFilePath(Application.ExeName) + 'TCar',
                                    Copy(edtDiretorioPastaTCar.Text,0,Length(edtDiretorioPastaTCar.Text) - 1) + ' FDB2\');
    mmoInformacoes.Lines.Add('Arquivos pasta TCar FBD2 copiados!');
    mmoInformacoes.Lines.Add('');
    // EAD
    mmoInformacoes.Lines.Add('Iniciando a cópia dos arquivos do TCar EAD!');
    mmoInformacoes.Lines.Add('De: '+ ExtractFilePath(Application.ExeName) + 'TCar\');
    mmoInformacoes.Lines.Add('Para: '+ Copy(edtDiretorioPastaTCar.Text,0,Length(edtDiretorioPastaTCar.Text) - 1) + '_EAD\');
    DADOS_COPIARDIRETORIO(ExtractFilePath(Application.ExeName) + 'TCar',
                                    Copy(edtDiretorioPastaTCar.Text,0,Length(edtDiretorioPastaTCar.Text) - 1) + '_EAD\');
    mmoInformacoes.Lines.Add('Arquivos pasta TCar EAD copiados!');
    mmoInformacoes.Lines.Add('');
  end;
end;

procedure TF_IMPLANTACAO.FazerBackupEAD;
var
  start : TIniFile;
  tempo : TDateTime;
begin
  Abas('LOG');
  Screen.Cursor:= crHourGlass;
  pnl4.Visible := True;
  // ZERANDO TEMPO
  lblTempo.Caption := '00:00:00:000';
  tempo := Now;

  if ConectarBancoDados(DATAMODULO.IBDatabase,edtIPServidor.Text +':'+ edtDiretorioBaseTecinco.Text,
                         edtUsuarioTecinco.Text,edtSenhaTecinco.Text) = True
  then
  begin
    with DATAMODULO.IBBackupService do
    begin
      Active := False;
      DatabaseName := edtDiretorioBaseTecinco.Text;
      ServerName   := edtIPServidor.Text;
      BackupFile.Clear;
      BackupFile.Add(edtDiretorioBackupTecinco.Text + edtApelidoEmpresa.Text + '_EAD.FBK');
      Params.Clear;
      Params.Add('user_name=' + edtUsuarioTecinco.Text);
      Params.Add('password=' + edtSenhaTecinco.Text);
      Verbose := True;
      Active := True;

      try
        ServiceStart;
        mmoInformacoes.Lines.Add('');
        mmoInformacoes.Lines.Add('Iniciando o backup da base de dados!');
        mmoInformacoes.Lines.Add('Backup: ' + edtIPServidor.Text + ':' + edtDiretorioBackupTecinco.Text + edtApelidoEmpresa.Text + '_EAD.FBK');
        mmoVoltaBackup.Lines.Add(ToString);
        while not Eof do
        begin
          mmoVoltaBackup.Lines.Add(GetNextLine);
          lblTempo.Caption := FormatDateTime('HH:MM:SS:ZZZ', tempo - Now);
          Application.ProcessMessages;
        end;

        Active := False;
        mmoInformacoes.Lines.Add('Backup criado com sucesso');
        mmoInformacoes.Lines.Add('');
        VoltarBackupEAD;
      except
        on e:exception do
        begin
          Screen.Cursor:= crDefault;
          mmoVoltaBackup.Lines.Add(E.Message);
          mmoVoltaBackup.Lines.Add('');
        end;
      end;
    end;
  end
  else
  begin
    btnSalvarStart.Click;
    mmoInformacoes.Lines.Add('Base de dados para Backup não existe!');
    mmoInformacoes.Lines.Add('Não foi possivel gerar a base de dados EAD!');
    mmoInformacoes.Lines.Add('');
  end;
  Screen.Cursor:= crDefault;
end;

procedure TF_IMPLANTACAO.VoltarBackupEAD;
var
  start : TIniFile;
  tempo : TDateTime;
begin
  Screen.Cursor:= crHourGlass;
  pnl4.Visible := True;
  // ZERANDO TEMPO
  lblTempo.Caption := '00:00:00:000';
  tempo := Now;

  if ConectarBancoDados(DATAMODULO.IBDatabaseEAD,edtIPServidor.Text +':'+ edtBASEEAD.Text,
                         edtUsuarioTecinco.Text,edtSenhaTecinco.Text) = True
  then
  begin
    btnSalvarStart.Click;
    mmoInformacoes.Lines.Add('Base de dados EAD já existe!');
    mmoInformacoes.Lines.Add('Base de Dados: ' + edtIPServidor.Text +':'+ edtBASEEAD.Text);
    mmoInformacoes.Lines.Add('');
    DATAMODULO.IBDatabaseEAD.Close;
  end
  else
  begin
    if FileExists(edtDiretorioBackupTecinco.Text + edtApelidoEmpresa.Text + '_EAD.FBK') then // VERIFICANDO SE EXISTE O BACKUP PARA VOLTAR
    begin
      with DATAMODULO.IBRestoreService do
      begin
        Active := False;
        DatabaseName.Add(edtBASEEAD.Text);
        ServerName   := edtIPServidor.Text;
        BackupFile.Clear;
        BackupFile.Add(edtDiretorioBackupTecinco.Text + edtApelidoEmpresa.Text + '_EAD.FBK');
        Params.Clear;
        Params.Add('user_name=' + edtUsuarioTecinco.Text);
        Params.Add('password=' + edtSenhaTecinco.Text);
        Verbose := True;
        Active := True;

        try
          ServiceStart;
          mmoInformacoes.Lines.Add('');
          mmoInformacoes.Lines.Add('Iniciando o restore da base de dados!');
          mmoInformacoes.Lines.Add('Base de Dados: ' + edtIPServidor.Text + ':' + edtBASEEAD.Text);
          mmoVoltaBackup.Lines.Add(ToString);
          while not Eof do
          begin
            mmoVoltaBackup.Lines.Add(GetNextLine);
            lblTempo.Caption := FormatDateTime('HH:MM:SS:ZZZ', tempo - Now);
            Application.ProcessMessages;
          end;

          Active := False;
          mmoInformacoes.Lines.Add('Backup base EAD restaurado com sucesso!');
          mmoInformacoes.Lines.Add('');
          btnConectarBaseEAD.Click;
        except
          on e:exception do
          begin
            mmoVoltaBackup.Lines.Add(E.Message);
            mmoVoltaBackup.Lines.Add('');
          end;
        end;
      end;
    end
    else
    begin
      MessageDlg('Arquivo de backup não encontrado', mtError,[mbOK],0);
    end;
  end;
  Screen.Cursor:= crDefault;
end;

procedure TF_IMPLANTACAO.VoltarBackup;
var
  start : TIniFile;
  tempo : TDateTime;
begin
  Screen.Cursor:= crHourGlass;
  pnl4.Visible := True;
  // ZERANDO TEMPO
  lblTempo.Caption := '00:00:00:000';
  tempo := Now;

  if ConectarBancoDados(DATAMODULO.IBDatabase,edtIPServidor.Text +':'+ edtDiretorioBaseTecinco.Text,
                         edtUsuarioTecinco.Text,edtSenhaTecinco.Text) = True
  then
  begin
    btnSalvarStart.Click;
    mmoInformacoes.Lines.Add('Base de dados já existe!');
    mmoInformacoes.Lines.Add('Conectado a base de dados!');
    mmoInformacoes.Lines.Add('');
  end
  else
  begin
    if FileExists(edtCaminhoBackup.Text) then // VERIFICANDO SE EXISTE O BACKUP PARA VOLTAR
    begin
      with DATAMODULO.IBRestoreService do
      begin
        Active := False;
        DatabaseName.Add(edtDiretorioBaseTecinco.Text);
        ServerName   := edtIPServidor.Text;
        BackupFile.Clear;
        BackupFile.Add(edtCaminhoBackup.Text);
        Params.Clear;
        Params.Add('user_name=' + edtUsuarioTecinco.Text);
        Params.Add('password=' + edtSenhaTecinco.Text);
        Verbose := True;
        Active := True;

        try
          ServiceStart;
          mmoInformacoes.Lines.Add('');
          mmoInformacoes.Lines.Add('Iniciando o restore da base de dados!');
          mmoVoltaBackup.Lines.Add(ToString);
          while not Eof do
          begin
            mmoVoltaBackup.Lines.Add(GetNextLine);
            lblTempo.Caption := FormatDateTime('HH:MM:SS:ZZZ', tempo - Now);
            Application.ProcessMessages;
          end;

          Active := False;
          mmoInformacoes.Lines.Add('Backup Restaurado com sucesso');
          mmoInformacoes.Lines.Add('');
        except
          on e:exception do
          begin
            mmoVoltaBackup.Lines.Add(E.Message);
            mmoVoltaBackup.Lines.Add('');
          end;
        end;
      end;
    end
    else
    begin
      MessageDlg('Arquivo de backup não encontrado', mtError,[mbOK],0);
    end;
  end;
  Screen.Cursor:= crDefault;
end;

procedure TF_IMPLANTACAO.CriarPastasPadrao;
var
  Executar : TStringList;
begin
  // APRESENTANDO ABA INFORMAÇOES
  mmoInformacoes.Lines.Add('Criando os diretórios padrões!');
  // DIRETORIO RAIZ C:\Tecinco\
  mmoInformacoes.Lines.Add(DADOS_CRIARDIRETORIO(edtDiretorioServicosTCar.Text));
  // DIRETORIO DE BACKUP C:\Tecinco\Backup\
  mmoInformacoes.Lines.Add(DADOS_CRIARDIRETORIO(edtDiretorioBackupTecinco.Text));
  // DIRETORIO DA BASE DE DADOS C:\Tecinco\BDS\
  mmoInformacoes.Lines.Add(DADOS_CRIARDIRETORIO(edtDiretorioServicosTCar.Text + 'BDS\'));
  // DIRETORIO PASTA TCAR C:\Tecinco\TCar_\
  mmoInformacoes.Lines.Add(DADOS_CRIARDIRETORIO(edtDiretorioPastaTCar.Text));
  // DIRETORIO PASTA TCAR FDB2 C:\Tecinco\TCar_FDB2\
  mmoInformacoes.Lines.Add(DADOS_CRIARDIRETORIO(Copy(edtDiretorioPastaTCar.Text,0,Length(edtDiretorioPastaTCar.Text) - 1) + ' FDB2\'));
  // DIRETORIO PASTA TCAR FDB2 C:\Tecinco\TCar_EAD\
  mmoInformacoes.Lines.Add(DADOS_CRIARDIRETORIO(Copy(edtDiretorioPastaTCar.Text,0,Length(edtDiretorioPastaTCar.Text) - 1) + '_EAD\'));
  mmoInformacoes.Lines.Add('');
  // DANDO PERMISSAO DE PASTA PARA AS PASTAS CRIADAS
  mmoInformacoes.Lines.Add('Iniciando a alteração de permissões de pasta');
  Executar := TStringList.Create;
  Executar.Add('cacls "'+ Copy(edtDiretorioServicosTCar.Text,0,
                Length(edtDiretorioServicosTCar.Text) - 1 )  +'" /E /T /G "Todos":F');
  mmoInformacoes.Lines.Add(DADOS_EXECUTARCOMANDODOS(Executar));
  mmoInformacoes.Lines.Add('Finalizado a alteração de permissões de pasta');
end;

procedure TF_IMPLANTACAO.dblkcbbFRM_NOMEExit(Sender: TObject);
begin
  if (dblkcbbSST_NOME.KeyValue <> null)
    and (dblkcbbFRM_NOME.KeyValue <> null)
  then
  begin
    chklstGRUPOSDISPONIVEIS.Items.Clear;
    DATAMODULO.IBQueryOBJ_NOME.Close;
    DATAMODULO.IBQueryGRP_ID.Close;
    DATAMODULO.IBQueryGRP_ID.ParamByName('SST_NOME').AsString := dblkcbbSST_NOME.KeyValue;
    DATAMODULO.IBQueryGRP_ID.ParamByName('FRM_NOME').AsString := dblkcbbFRM_NOME.KeyValue;
    DATAMODULO.IBQueryGRP_ID.Open;
    DATAMODULO.IBQueryGRP_ID.FetchAll;
  end;
end;

procedure TF_IMPLANTACAO.dblkcbbGRP_IDExit(Sender: TObject);
begin
  if (dblkcbbSST_NOME.KeyValue <> null)
    and (dblkcbbFRM_NOME.KeyValue <> null)
    and (dblkcbbGRP_ID.KeyValue <> null)
  then
  begin
    DATAMODULO.IBQueryOBJ_NOME.Close;
    DATAMODULO.IBQueryOBJ_NOME.ParamByName('SST_NOME').AsString := dblkcbbSST_NOME.KeyValue;
    DATAMODULO.IBQueryOBJ_NOME.ParamByName('FRM_NOME').AsString := dblkcbbFRM_NOME.KeyValue;
    DATAMODULO.IBQueryOBJ_NOME.ParamByName('GRP_ID').AsString   := dblkcbbGRP_ID.KeyValue;
    DATAMODULO.IBQueryOBJ_NOME.Open;
    DATAMODULO.IBQueryOBJ_NOME.FetchAll;
    AtualizarGruposDisponiveisSecur;
    with DATAMODULO.IBQuerySECUR_RESTRICAO do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * FROM SECUR_RESTRICAO                  '+
              'WHERE SECUR_RESTRICAO.SST_NOME   = :SST_NOME   '+
              '    AND SECUR_RESTRICAO.FRM_NOME = :FRM_NOME   '+
              '    AND SECUR_RESTRICAO.GRP_ID   = :GRP_ID ');
      ParamByName('SST_NOME').AsString := dblkcbbSST_NOME.KeyValue;
      ParamByName('FRM_NOME').AsString := dblkcbbFRM_NOME.KeyValue;
      ParamByName('GRP_ID').AsString   := dblkcbbGRP_ID.KeyValue;
      Open;
    end;
  end;
end;

procedure TF_IMPLANTACAO.dblkcbbSST_NOMEExit(Sender: TObject);
begin
  if dblkcbbSST_NOME.KeyValue <> null then
  begin
    chklstGRUPOSDISPONIVEIS.Items.Clear;
    DATAMODULO.IBQueryGRP_ID.Close;
    DATAMODULO.IBQueryOBJ_NOME.Close;
    DATAMODULO.IBQueryFRM_NOME.Close;
    DATAMODULO.IBQueryFRM_NOME.ParamByName('SST_NOME').AsString := dblkcbbSST_NOME.KeyValue;
    DATAMODULO.IBQueryFRM_NOME.Open;
    DATAMODULO.IBQueryFRM_NOME.FetchAll;
  end;
end;

procedure TF_IMPLANTACAO.Abas(VisivelInvisivel: string);
begin
  if VisivelInvisivel = 'V' then
  begin
    pgcImplantacao.Pages[3].TabVisible := True;
    pgcImplantacao.Pages[4].TabVisible := True;
    pgcImplantacao.Pages[5].TabVisible := True;
    pgcImplantacao.Pages[6].TabVisible := True;
    pgcImplantacao.Pages[7].TabVisible := True;
    pgcImplantacao.Pages[8].TabVisible := True;
    pgcImplantacao.Pages[3].Show;
  end
  else
  begin
    if VisivelInvisivel = 'I' then
    begin
      pgcImplantacao.Pages[3].TabVisible := False;
      pgcImplantacao.Pages[4].TabVisible := False;
      pgcImplantacao.Pages[5].TabVisible := False;
      pgcImplantacao.Pages[6].TabVisible := False;
      pgcImplantacao.Pages[7].TabVisible := False;
      pgcImplantacao.Pages[8].TabVisible := False;
      pgcImplantacao.Pages[0].Show;
    end
    else
    begin
      if VisivelInvisivel = 'LOG' then
      begin
        pgcImplantacao.Pages[3].TabVisible := True;
        pgcImplantacao.Pages[3].Show;
      end;
    end;
  end;
end;

procedure TF_IMPLANTACAO.Diretorios;
begin
  edtDiretorioBaseTecinco.Text :=     cbbUnidadeRede.Text + 'Tecinco\BDS\'+ edtApelidoEmpresa.Text +'.FDB';
  edtDiretorioServicosTCar.Text :=    cbbUnidadeRede.Text + 'Tecinco\';
  edtDiretorioPastaTCar.Text :=       cbbUnidadeRede.Text + 'Tecinco\Tcar\Tcar_' + edtApelidoEmpresa.Text + '\';
  edtDiretorioBackupTecinco.Text :=   cbbUnidadeRede.Text + 'Tecinco\Backup\';
  edtBASEEAD.Text                :=   cbbUnidadeRede.Text + 'Tecinco\BDS\'+ edtApelidoEmpresa.Text +'_EAD.FDB2';
  edtTCAREAD.Text                :=   Copy(edtDiretorioPastaTCar.Text,0,Length(edtDiretorioPastaTCar.Text) - 1) + '_EAD\';
  if rgSistemaTcarMekanic.ItemIndex = 0  then edtCaminhoBackup.Text := ExtractFilePath(Application.ExeName) + 'manMEKANIC.fbk';
  if rgSistemaTcarMekanic.ItemIndex = 1  then edtCaminhoBackup.Text := ExtractFilePath(Application.ExeName) + 'manBASEPADRAO.fbk';
end;

procedure TF_IMPLANTACAO.AtualizarModulosDisponiveisPG116;
begin
  // PREENCHENDO OS MODULOS DISPONIVEIS PARA NO PG116 PARA UPDATE
  with DATAMODULO.IBQuery do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT PARAMETRO.prm_modulo                   '+
            '  FROM PARAMETRO                              '+
            '  GROUP BY PARAMETRO.prm_modulo               '+
            '  ORDER BY PARAMETRO.prm_modulo');
    Open;
    if not IsEmpty then
    begin
      chklstPG116.Items.Clear;
      while not Eof do
      begin
        chklstPG116.Items.Add(Fields[0].AsString + ' - ' + DADOS_MODULOPG116(Fields[0].AsInteger));
        Next;
      end;
    end;
  end;

end;

procedure TF_IMPLANTACAO.AtualizarModulosDisponiveis;
begin
  // PREENCHENDO OS MODULOS DISPONIVEIS PARA SELECIONAR OS MODULOS CONTRATADOS
  with DATAMODULO.IBQuery do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT PACKAGE.pck_codigo,                             '+
            '      PACKAGE.pck_descricao,                           '+
            '      PACKAGE.pck_ativo                                '+
            '  FROM PACKAGE                                         '+
            '  ORDER BY PACKAGE.pck_codigo');
    Open;
    if not IsEmpty then
    begin
      chklstModulosContratados.Items.Clear;
      while not Eof do
      begin
        chklstModulosContratados.Items.Add(Fields[0].AsString + ' - ' + Fields[1].AsString);
        Next;
      end;
    end;
  end;
end;

procedure TF_IMPLANTACAO.IdFTPWork(ASender: TObject; AWorkMode: TWorkMode;
  AWorkCount: Int64);
begin
  Application.ProcessMessages;
  GaugeProgressoAtualizacao.Progress  := AWorkCount;
  lblTempoAtualizacao.Caption := FormatDateTime('HH:MM:SS:ZZZ',(((tempo - now) / AWorkCount) * ((bytesToTransfer) - AWorkCount) ));
  lblTempoAtualizacaoDecorrido.Caption := FormatDateTime('HH:MM:SS:ZZZ', tempo - Now);

  if cancelaratualizacao = 'S' then
  begin
   IdFTP.Abort;
   ShowMessage('Download Cancelado!');
  end;
end;

procedure TF_IMPLANTACAO.IdFTPWorkBegin(ASender: TObject; AWorkMode: TWorkMode;
  AWorkCountMax: Int64);
begin
    GaugeProgressoAtualizacao.Progress := 0;
    {if AWorkCountMax > 0 then
        GaugeProgressoAtualizacao.MaxValue := AWorkCountMax
    else}
        GaugeProgressoAtualizacao.MaxValue := bytesToTransfer;
end;

procedure TF_IMPLANTACAO.UpdateorInsert(NomeTabela: string; FLL_ORIGEM: string; FLL_NOVA: string);
var
  Comando, PossuiFLL_CODIGO, Valor, PossuiEPTPI_FILIAL, PossuiEPTPS_FILIAL : string;
  i : Integer;
begin
  PossuiFLL_CODIGO   := 'N';
  PossuiEPTPI_FILIAL := 'N';
  PossuiEPTPS_FILIAL := 'N';
  DATAMODULO.IBScript.Script.Clear;

  // PRIMARY KEY TABELA
  DATAMODULO.IBQueryPrimaryKey.Close;
  DATAMODULO.IBQueryPrimaryKey.Database := DATAMODULO.IBDatabase;
  DATAMODULO.IBQueryPrimaryKey.ParamByName('TABELA').AsString := NomeTabela;
  DATAMODULO.IBQueryPrimaryKey.Open;
  // CAMPOS DA TAMBELA
  DATAMODULO.IBQueryCamposTabela.Close;
  DATAMODULO.IBQueryCamposTabela.Database := DATAMODULO.IBDatabase;
  DATAMODULO.IBQueryCamposTabela.ParamByName('TABELA').AsString := NomeTabela;
  DATAMODULO.IBQueryCamposTabela.Open;

  // VERIFICANDO SE POSSUI O CAMPO FLL_CODIGO
  DATAMODULO.IBQueryCamposTabela.First;
  while not DATAMODULO.IBQueryCamposTabela.Eof do
  begin
    if Trim(DATAMODULO.IBQueryCamposTabela.FieldByName('NOME_CAMPO').AsString) = 'FLL_CODIGO' then
    begin
      PossuiFLL_CODIGO := 'S';
    end;
    if Trim(DATAMODULO.IBQueryCamposTabela.FieldByName('NOME_CAMPO').AsString) = 'EPTPI_FILIAL' then
    begin
      PossuiEPTPI_FILIAL := 'S';
    end;
    if Trim(DATAMODULO.IBQueryCamposTabela.FieldByName('NOME_CAMPO').AsString) = 'EPTPS_FILIAL' then
    begin
      PossuiEPTPS_FILIAL := 'S';
    end;
    DATAMODULO.IBQueryCamposTabela.Next;
  end;

  if (PossuiFLL_CODIGO = 'S')
    or (PossuiEPTPI_FILIAL = 'S')
    or (PossuiEPTPS_FILIAL = 'S')
  then // VALIDANDO SE POSSUI CAMPO FLL_CODIGO
  begin
    // BUSCANDO INFORMACOES PARA INSERIR
    DATAMODULO.IBQuery.Close;
    DATAMODULO.IBQuery.SQL.Clear;
    if PossuiFLL_CODIGO = 'S' then DATAMODULO.IBQuery.SQL.Add('SELECT * FROM ' + NomeTabela + ' WHERE FLL_CODIGO = :FLL_ORIGEM');
    if PossuiEPTPI_FILIAL = 'S' then DATAMODULO.IBQuery.SQL.Add('SELECT * FROM ' + NomeTabela + ' WHERE EPTPI_FILIAL = :FLL_ORIGEM');
    if PossuiEPTPS_FILIAL = 'S' then DATAMODULO.IBQuery.SQL.Add('SELECT * FROM ' + NomeTabela + ' WHERE EPTPS_FILIAL = :FLL_ORIGEM');
    DATAMODULO.IBQuery.ParamByName('FLL_ORIGEM').AsString := edtFilialOrigem.Text;
    DATAMODULO.IBQuery.Open;

    if not DATAMODULO.IBQuery.IsEmpty then // VERIFICANDO SE POSSUI INFORMACOES PARA INSERIR
    begin
      while not DATAMODULO.IBQuery.Eof do  // LOOP DADOS ENCONTRADOS PARA MONTAR O SCRIPT
      begin
        Comando := 'update or insert into '+ NomeTabela + ' (';
        // INSERINDO CAMPOS TABELA
        DATAMODULO.IBQueryCamposTabela.First;
        while not DATAMODULO.IBQueryCamposTabela.Eof do
        begin
          if DATAMODULO.IBQueryCamposTabela.Bof then Comando := Comando + Trim(DATAMODULO.IBQueryCamposTabela.FieldByName('NOME_CAMPO').AsString)
          else Comando := Comando + ',' + Trim(DATAMODULO.IBQueryCamposTabela.FieldByName('NOME_CAMPO').AsString);
          DATAMODULO.IBQueryCamposTabela.Next;
        end;
        Comando := Comando + ')';
        // INSERINDO VALORES
        Comando := Comando + ' values (';
        DATAMODULO.IBQueryCamposTabela.First;
        while not DATAMODULO.IBQueryCamposTabela.Eof do
        begin
          Valor := DATAMODULO.IBQuery.Fields[DATAMODULO.IBQueryCamposTabela.FieldByName('ORDENACAO').AsInteger].AsString;
          // CORRIGINDO DATA SE FOR DO TIPO TIMESTAMP
          if DATAMODULO.IBQueryCamposTabela.FieldByName('TIPO_CAMPO_INTEIRO').AsInteger = 35 then
            Valor := AnsiReplaceStr(Copy(DATAMODULO.IBQuery.Fields[DATAMODULO.IBQueryCamposTabela.FieldByName('ORDENACAO').AsInteger].AsString,0,10),'/','.');
          // CORRIGINDO CAMPO INT64
          if DATAMODULO.IBQueryCamposTabela.FieldByName('TIPO_CAMPO_INTEIRO').AsInteger = 16 then
            Valor := AnsiReplaceStr(Valor,',','.');
          // CORRIGINDO CAMPO STRING
          if DATAMODULO.IBQueryCamposTabela.FieldByName('TIPO_CAMPO_INTEIRO').AsInteger = 37 then
            Valor := AnsiReplaceStr(Valor,'''','''''');

          // INSERINDO INFORMACOES NO SCRIPT
          if DATAMODULO.IBQueryCamposTabela.Bof then
            if (Trim(DATAMODULO.IBQueryCamposTabela.FieldByName('NOME_CAMPO').AsString) = 'FLL_CODIGO')
             or (Trim(DATAMODULO.IBQueryCamposTabela.FieldByName('NOME_CAMPO').AsString) = 'EPTPI_FILIAL')
             or (Trim(DATAMODULO.IBQueryCamposTabela.FieldByName('NOME_CAMPO').AsString) = 'EPTPS_FILIAL')
            then Comando := Comando + '''' +  FLL_NOVA + ''''
            else if Valor = '' then Comando := Comando + 'null'
            else Comando := Comando + '''' + Valor + ''''
          else
          if (Trim(DATAMODULO.IBQueryCamposTabela.FieldByName('NOME_CAMPO').AsString) = 'FLL_CODIGO')
            or (Trim(DATAMODULO.IBQueryCamposTabela.FieldByName('NOME_CAMPO').AsString) = 'EPTPI_FILIAL')
            or (Trim(DATAMODULO.IBQueryCamposTabela.FieldByName('NOME_CAMPO').AsString) = 'EPTPS_FILIAL')
          then Comando := Comando + ',' + '''' +  FLL_NOVA + ''''
          else if Valor = '' then Comando := Comando + ',' + 'null'
          else Comando := Comando + ',' + '''' + Valor + '''';
          DATAMODULO.IBQueryCamposTabela.Next;
        end;
        Comando := Comando + ')';
        // INSERINDO MATCHING
        Comando := Comando + ' matching (';
        DATAMODULO.IBQueryPrimaryKey.First;
        if not DATAMODULO.IBQueryPrimaryKey.IsEmpty then
        begin
          while not DATAMODULO.IBQueryPrimaryKey.Eof do
          begin
            if DATAMODULO.IBQueryPrimaryKey.Bof then Comando := Comando + Trim(DATAMODULO.IBQueryPrimaryKey.Fields[0].AsString)
            else Comando := Comando + ',' + Trim(DATAMODULO.IBQueryPrimaryKey.Fields[0].AsString);
            DATAMODULO.IBQueryPrimaryKey.Next;
          end;
        end;
        Comando := Comando + ');';

        DATAMODULO.IBQuery.Next;
        Application.ProcessMessages;
        DATAMODULO.IBScript.Script.Add(Comando);
      end;

      try
        if chkMostrarScript.Checked then mmoInformacoes.Lines.Add(DATAMODULO.IBScript.Script.Text);
        DATAMODULO.IBScript.ExecuteScript;
        DATAMODULO.IBTransaction.CommitRetaining;
        mmoInformacoes.Lines.Add('Dados inseridos ou atualizados na Filial: ' + FLL_NOVA + ' Tabela: ' + NomeTabela);
      except
        on e : Exception do
        begin
          DATAMODULO.IBTransaction.RollbackRetaining;
          mmoInformacoes.Lines.Add('Erro ao executar Script tabela '+ NomeTabela);
          mmoInformacoes.Lines.Add(e.Message);
          mmoInformacoes.Lines.Add('');
        end;
      end;
    end
    else
    begin
      mmoInformacoes.Lines.Add('Nao encontrou dados para copiar Tabela: ' + NomeTabela);
    end;
  end
  else
  begin
    mmoInformacoes.Lines.Add('Tabela: ' + NomeTabela + ' Nao possui campo FLL_CODIGO, Verificar')
  end;
end;

procedure TF_IMPLANTACAO.CopiarTabelaEntreBancos(FLL_ORIGEM, FLL_NOVA, Tabela: string);
var
  Comando, PossuiFLL_CODIGO, Valor : string;
  i, Controle, ControleMax : Integer;
begin
  Screen.Cursor:= crHourGlass;
  PossuiFLL_CODIGO := 'N';
  DATAMODULO.IBScript.Script.Clear;

  // PRIMARY KEY TABELA
  DATAMODULO.IBQueryPrimaryKey.Close;
  DATAMODULO.IBQueryPrimaryKey.Database := DATAMODULO.IBDatabase;
  DATAMODULO.IBQueryPrimaryKey.ParamByName('TABELA').AsString := Tabela;
  DATAMODULO.IBQueryPrimaryKey.Open;
  // CAMPOS DA TAMBELA
  DATAMODULO.IBQueryCamposTabela.Close;
  DATAMODULO.IBQueryCamposTabela.Database := DATAMODULO.IBDatabase;
  DATAMODULO.IBQueryCamposTabela.ParamByName('TABELA').AsString := Tabela;
  DATAMODULO.IBQueryCamposTabela.Open;

  // VERIFICANDO SE POSSUI O CAMPO FLL_CODIGO
  DATAMODULO.IBQueryCamposTabela.First;
  while not DATAMODULO.IBQueryCamposTabela.Eof do
  begin
    if Trim(DATAMODULO.IBQueryCamposTabela.FieldByName('NOME_CAMPO').AsString) = 'FLL_CODIGO' then
    begin
      PossuiFLL_CODIGO := 'S';
    end;
    DATAMODULO.IBQueryCamposTabela.Next;
  end;

  // BUSCANDO INFORMACOES PARA INSERIR
  BASECOPIAR.IBQueryBaseCopiar.Close;
  BASECOPIAR.IBQueryBaseCopiar.SQL.Clear;
  BASECOPIAR.IBQueryBaseCopiar.SQL.Add('SELECT * FROM ' + Tabela);
  if (PossuiFLL_CODIGO = 'S') and (FLL_ORIGEM <> '') then
  BASECOPIAR.IBQueryBaseCopiar.SQL.Add(' WHERE FLL_CODIGO = ' + FLL_ORIGEM);
  BASECOPIAR.IBQueryBaseCopiar.Open;
  BASECOPIAR.IBQueryBaseCopiar.FetchAll;
  mmoInformacoes.Lines.Add('Total Registros: ' + IntToStr(BASECOPIAR.IBQueryBaseCopiar.RecordCount));
  Controle := 0;
  ControleMax := 10000;
  if not BASECOPIAR.IBQueryBaseCopiar.IsEmpty then // VERIFICANDO SE POSSUI INFORMACOES PARA INSERIR
  begin
    while not BASECOPIAR.IBQueryBaseCopiar.Eof do  // LOOP DADOS ENCONTRADOS PARA MONTAR O SCRIPT
    begin
      Comando := 'update or insert into '+ Tabela + ' (';
      // INSERINDO CAMPOS TABELA
      DATAMODULO.IBQueryCamposTabela.First;
      while not DATAMODULO.IBQueryCamposTabela.Eof do
      begin
        if DATAMODULO.IBQueryCamposTabela.Bof then Comando := Comando + Trim(DATAMODULO.IBQueryCamposTabela.FieldByName('NOME_CAMPO').AsString)
        else Comando := Comando + ',' + Trim(DATAMODULO.IBQueryCamposTabela.FieldByName('NOME_CAMPO').AsString);
        DATAMODULO.IBQueryCamposTabela.Next;
      end;
      Comando := Comando + ')';
      // INSERINDO VALORES
      Comando := Comando + ' values (';
      DATAMODULO.IBQueryCamposTabela.First;
      while not DATAMODULO.IBQueryCamposTabela.Eof do
      begin
        Valor := BASECOPIAR.IBQueryBaseCopiar.Fields[DATAMODULO.IBQueryCamposTabela.FieldByName('ORDENACAO').AsInteger].AsString;
        // CORRIGINDO DATA SE FOR DO TIPO TIMESTAMP
        if DATAMODULO.IBQueryCamposTabela.FieldByName('TIPO_CAMPO_INTEIRO').AsInteger = 35 then
          Valor := AnsiReplaceStr(Copy(BASECOPIAR.IBQueryBaseCopiar.Fields[DATAMODULO.IBQueryCamposTabela.FieldByName('ORDENACAO').AsInteger].AsString,0,10),'/','.');
        // CORRIGINDO CAMPO INT64
        if DATAMODULO.IBQueryCamposTabela.FieldByName('TIPO_CAMPO_INTEIRO').AsInteger = 16 then
          Valor := AnsiReplaceStr(Valor,',','.');
        // CORRIGINDO CAMPO STRING
        if DATAMODULO.IBQueryCamposTabela.FieldByName('TIPO_CAMPO_INTEIRO').AsInteger = 37 then
          Valor := AnsiReplaceStr(Valor,'''','''''');

        // INSERINDO INFORMACOES NO SCRIPT
        if DATAMODULO.IBQueryCamposTabela.Bof then
          if (Trim(DATAMODULO.IBQueryCamposTabela.FieldByName('NOME_CAMPO').AsString) = 'FLL_CODIGO') and (FLL_NOVA <> '')
          then Comando := Comando + '''' +  FLL_NOVA + ''''
          else if Valor = '' then Comando := Comando + 'null'
          else Comando := Comando + '''' + Valor + ''''
        else
        if (Trim(DATAMODULO.IBQueryCamposTabela.FieldByName('NOME_CAMPO').AsString) = 'FLL_CODIGO') and (FLL_NOVA <> '')
        then Comando := Comando + ',' + '''' +  FLL_NOVA + ''''
        else if Valor = '' then Comando := Comando + ',' + 'null'
        else Comando := Comando + ',' + '''' + Valor + '''';
        DATAMODULO.IBQueryCamposTabela.Next;
      end;
      Comando := Comando + ')';
      // INSERINDO MATCHING
      Comando := Comando + ' matching (';
      DATAMODULO.IBQueryPrimaryKey.First;
      if not DATAMODULO.IBQueryPrimaryKey.IsEmpty then
      begin
        while not DATAMODULO.IBQueryPrimaryKey.Eof do
        begin
          if DATAMODULO.IBQueryPrimaryKey.Bof then Comando := Comando + Trim(DATAMODULO.IBQueryPrimaryKey.Fields[0].AsString)
          else Comando := Comando + ',' + Trim(DATAMODULO.IBQueryPrimaryKey.Fields[0].AsString);
          DATAMODULO.IBQueryPrimaryKey.Next;
        end;
      end;
      Comando := Comando + ');';

      BASECOPIAR.IBQueryBaseCopiar.Next;
      Application.ProcessMessages;
      DATAMODULO.IBScript.Script.Add(Comando);
      Controle := Controle + 1;
      if Controle = ControleMax then
      begin
        ControleMax := ControleMax + 10000;
        try
          if chkMostrarScriptCopiarTabelaBase.Checked then
            mmoInformacoes.Lines.Add(DATAMODULO.IBScript.Script.Text);
          DATAMODULO.IBScript.ExecuteScript;
          DATAMODULO.IBTransaction.CommitRetaining;
          DATAMODULO.IBScript.Script.Clear;
          mmoInformacoes.Lines.Add('Dados inseridos ou atualizados Tabela: ' + Tabela);
        except
          on e : Exception do
          begin
            DATAMODULO.IBTransaction.RollbackRetaining;
            mmoInformacoes.Lines.Add('Erro ao executar Script tabela '+ Tabela);
            mmoInformacoes.Lines.Add(e.Message);
            mmoInformacoes.Lines.Add('');
          end;
        end;
      end;
    end;
    try
      if chkMostrarScriptCopiarTabelaBase.Checked then
        mmoInformacoes.Lines.Add(DATAMODULO.IBScript.Script.Text);
      DATAMODULO.IBScript.ExecuteScript;
      DATAMODULO.IBTransaction.CommitRetaining;
      mmoInformacoes.Lines.Add('Dados inseridos ou atualizados Tabela: ' + Tabela);
    except
      on e : Exception do
      begin
        DATAMODULO.IBTransaction.RollbackRetaining;
        mmoInformacoes.Lines.Add('Erro ao executar Script tabela '+ Tabela);
        mmoInformacoes.Lines.Add(e.Message);
        mmoInformacoes.Lines.Add('');
      end;
    end;
  end
  else
  begin
    mmoInformacoes.Lines.Add('Nao encontrou dados para copiar Tabela: ' + Tabela);
  end;
  Screen.Cursor:= crDefault;
end;

procedure TF_IMPLANTACAO.Insert(NomeTabela,FLL_ORIGEM, FLL_NOVA: string);
var
CamposTabela : TStringList;
SQL, PossuiFLL_CODIGO, PossuiEPTPI_FILIAL, PossuiEPTPS_FILIAL, PossuiGENERATOR : string;
ultimaposicao, i : Integer;
begin
  SQL := '';
  CamposTabela := TStringList.Create;
  SQL := 'insert into '+ NomeTabela + ' (';
  DATAMODULO.IBDatabase.GetFieldNames(NomeTabela, CamposTabela);
  ultimaposicao := CamposTabela.Count -1;
  PossuiFLL_CODIGO    := 'N';
  PossuiEPTPI_FILIAL  := 'N';
  PossuiEPTPS_FILIAL  := 'N';
  PossuiGENERATOR   := 'N';

  if ultimaposicao > 0 then
  begin
    for i := 0 to CamposTabela.Count -1 do
    begin
      if (CamposTabela[i] = 'FLL_CODIGO')
      then PossuiFLL_CODIGO := 'S';
      if (CamposTabela[i] = 'EPTPI_FILIAL')
      then PossuiEPTPI_FILIAL := 'S';
      if (CamposTabela[i] = 'EPTPS_FILIAL')
      then PossuiEPTPS_FILIAL := 'S';
    end;
    if (PossuiFLL_CODIGO = 'S')
      or (PossuiEPTPI_FILIAL = 'S')
      or (PossuiEPTPS_FILIAL = 'S')
    then
    begin
      for i := 0 to CamposTabela.Count -1 do
      begin
        if i <> ultimaposicao then SQL := SQL + CamposTabela[i] + ','
        else SQL := SQL + CamposTabela[i] + ')';
      end;
      SQL := SQL + ' select ';
      for i := 0 to CamposTabela.Count -1 do
      begin
        if i <> ultimaposicao then
        begin
          if CamposTabela[i] = 'FLL_CODIGO' then SQL := SQL + ':FLL_NOVA,'
          else if CamposTabela[i] = 'EPTPI_FILIAL' then SQL := SQL + ':FLL_NOVA,'
          else if CamposTabela[i] = 'EPTPS_FILIAL' then SQL := SQL + ':FLL_NOVA,'
          else SQL := SQL + CamposTabela[i] + ',';
        end
        else
        begin
          if CamposTabela[i] = 'FLL_CODIGO' then SQL := SQL + ':FLL_NOVA from ' + NomeTabela
          else if CamposTabela[i] = 'EPTPI_FILIAL' then SQL := SQL + ':FLL_NOVA from ' + NomeTabela
          else if CamposTabela[i] = 'EPTPS_FILIAL' then SQL := SQL + ':FLL_NOVA from ' + NomeTabela
          else SQL := SQL + CamposTabela[i] + ' from ' + NomeTabela;
        end;
      end;
      if PossuiFLL_CODIGO   = 'S' then SQL := SQL + ' where FLL_CODIGO   = :FLL_ORIGEM ';
      if PossuiEPTPI_FILIAL = 'S' then SQL := SQL + ' where EPTPI_FILIAL = :FLL_ORIGEM ';
      if PossuiEPTPS_FILIAL = 'S' then SQL := SQL + ' where EPTPS_FILIAL = :FLL_ORIGEM ';

      CopiarTabela(NomeTabela,SQL,FLL_ORIGEM,FLL_NOVA);

      if chkMostrarScript.Checked then
      begin
        mmoInformacoes.Lines.Add('');
        mmoInformacoes.Lines.Add('Comando: ' + SQL);
        mmoInformacoes.Lines.Add('');
      end;

    end
    else
    begin
      mmoInformacoes.Lines.Add('Tabela: ' + NomeTabela + ' Nao possui campo FLL_CODIGO, EPTPI_FILIAL, EPTPS_FILIAL Verificar')
    end;
  end
  else
  begin
    mmoInformacoes.Lines.Add('Tabela: ' + NomeTabela + 'Invalida');
  end;
end;

procedure TF_IMPLANTACAO.CopiarTabela(Tabela, Dados, FLL_ORIGEM, FLL_NOVA : String);
begin
  try
    with DATAMODULO.IBQuery do
    begin
      Close;
      SQL.Clear;
      SQL.Add(Dados);
      ParamByName('FLL_NOVA').AsString := FLL_NOVA;
      ParamByName('FLL_ORIGEM').AsString := FLL_ORIGEM;
      ExecSQL;
      mmoInformacoes.Lines.Add('Inserindo registros na Tabela: ' + Tabela);
      mmoInformacoes.Lines.Add('Registros inseridos: ' + IntToStr(DATAMODULO.IBQuery.RowsAffected));
      DATAMODULO.IBTransaction.Commit;
    end;
  except
    on e : Exception do
    begin
      mmoInformacoes.Lines.Add('Erro ao inserir registros na tabela: ' + Tabela);
      mmoInformacoes.Lines.Add(e.Message);
      mmoInformacoes.Lines.Add('');
    end;
  end;
end;

procedure TF_IMPLANTACAO.btnLimparDadosNovaInstalacaoClick(Sender: TObject);
begin
  if DADOS_ARQUITETURASISTEMA = True then rgSistemaOperacional.ItemIndex := 0
  else rgSistemaOperacional.ItemIndex := 1;
  rgSistemaTcarMekanic.ItemIndex      := 0;
  edtApelidoEmpresa.Text              := '';
  edtCNPJ.Text                        := '';
  edtRazaoSocial.Text                 := '';
  edtIPServidor.Text                  := '127.0.0.1';
  edtDiretorioBaseTecinco.Text        := cbbUnidadeRede.Text + 'Tecinco\BDS\.FDB';
  edtUsuarioTecinco.Text              := 'SYSDBA';
  edtSenhaTecinco.Text                := 'masterkey';
  edtDiretorioServicosTCar.Text       := cbbUnidadeRede.Text + 'Tecinco\';
  edtDiretorioPastaTCar.Text          := cbbUnidadeRede.Text + 'Tecinco\Tcar\Tcar_\';
  edtDiretorioBackupTecinco.Text      := cbbUnidadeRede.Text + 'Tecinco\Backup\';
  edtTCAREAD.Text                     := cbbUnidadeRede.Text + 'Tecinco\Tcar\Tcar__EAD\';
  edtBASEEAD.Text                     := cbbUnidadeRede.Text + 'Tecinco\BDS\_EAD.FDB2';
  if rgSistemaTcarMekanic.ItemIndex = 0  then edtCaminhoBackup.Text := ExtractFilePath(Application.ExeName) + 'manMEKANIC.fbk';
  if rgSistemaTcarMekanic.ItemIndex = 1  then edtCaminhoBackup.Text := ExtractFilePath(Application.ExeName) + 'manBASEPADRAO.fbk';

  edtApelidoEmpresa.SetFocus;
end;

procedure TF_IMPLANTACAO.btnLimparMemoClick(Sender: TObject);
begin
  mmoInformacoes.Clear;
  mmoVoltaBackup.Clear;
  pnl4.Visible := False;
end;

procedure TF_IMPLANTACAO.btnLimparTabelasLogClick(Sender: TObject);
begin
  Abas('LOG');
  with DATAMODULO.IBScript do
  begin
    try
      Script.Clear;
      if chklstTabelasLOG.ItemEnabled[0] = True then Script.Add('DELETE FROM AED_AUDITOREVENTODETALHE;');
      if chklstTabelasLOG.ItemEnabled[1] = True then Script.Add('DELETE FROM AEV_AUDITOREVENTO;');
      if chklstTabelasLOG.ItemEnabled[2] = True then Script.Add('DELETE FROM HDL_RAGNAROK;');
      ExecuteScript;
      DATAMODULO.IBTransaction.Commit;
      mmoInformacoes.Lines.Add('Tabelas limpas!');
      mmoInformacoes.Lines.Add('');
    except
      on e:exception do
      begin
        mmoInformacoes.Lines.Add('Erro ao limpar as tabelas!'+ e.message);
        mmoInformacoes.Lines.Add('');
      end;
    end;
  end;
end;

procedure TF_IMPLANTACAO.btnMarcarTodosInsertClick(Sender: TObject);
begin
  MarcarTodosCheckList(chklstTabelaFilial);
end;

procedure TF_IMPLANTACAO.btnMarcarTodosPG116Click(Sender: TObject);
begin
  MarcarTodosCheckList(chklstPG116);
end;

procedure TF_IMPLANTACAO.btnMarcarTodosUpInsClick(Sender: TObject);
begin
  MarcarTodosCheckList(chklstUpdateorInsert);
end;

procedure TF_IMPLANTACAO.btnVerificarMidasClick(Sender: TObject);
var
 executar : TextFile;
begin
  Screen.Cursor:= crHourGlass;
  AssignFile ( executar, ExtractFilePath(Application.ExeName) + 'Executar.cmd');
  Rewrite ( executar );
  Writeln(executar, 'c:');
  Writeln(executar, 'cd\');
  Writeln(executar, 'dir /S midas.dll');
  Writeln(executar, 'pause');
  CloseFile(executar);
  ShellExecute(Handle, 'runas', PWideChar(ExtractFilePath(Application.ExeName)+'Executar.cmd'), '', '', SW_SHOWMAXIMIZED);
  Screen.Cursor:= crDefault;
end;

procedure TF_IMPLANTACAO.cbbPacoteChange(Sender: TObject);
begin
  if cbbPacote.ItemIndex = 1 then MKI;
  if cbbPacote.ItemIndex = 2 then MKE;
  if cbbPacote.ItemIndex = 3 then MKP;
  if cbbPacote.ItemIndex = 4 then TCar;
end;

procedure TF_IMPLANTACAO.cbbTemaChange(Sender: TObject);
begin
  btnSalvarTema.Click;
  TStyleManager.TrySetStyle(cbbTema.Items[cbbTema.ItemIndex]);
end;

procedure TF_IMPLANTACAO.cbbUnidadeRedeSelect(Sender: TObject);
begin
  Diretorios;
end;

procedure TF_IMPLANTACAO.edtApelidoEmpresaExit(Sender: TObject);
begin
  Diretorios;
end;

procedure TF_IMPLANTACAO.edtCNPJEnter(Sender: TObject);
begin
  edtCNPJ.Text := StringReplace(edtCNPJ.Text,'.','',[rfReplaceAll, rfIgnoreCase]);
  edtCNPJ.Text := StringReplace(edtCNPJ.Text,'-','',[rfReplaceAll, rfIgnoreCase]);
  edtCNPJ.Text := StringReplace(edtCNPJ.Text,'/','',[rfReplaceAll, rfIgnoreCase]);
end;

procedure TF_IMPLANTACAO.edtCNPJExit(Sender: TObject);
begin
  if edtCNPJ.Text <> '' then
  begin
    edtCNPJ.Text := StringReplace(edtCNPJ.Text,'.','',[rfReplaceAll, rfIgnoreCase]);
    edtCNPJ.Text := StringReplace(edtCNPJ.Text,'-','',[rfReplaceAll, rfIgnoreCase]);
    edtCNPJ.Text := StringReplace(edtCNPJ.Text,'/','',[rfReplaceAll, rfIgnoreCase]);

    if isCNPJ(edtCNPJ.Text) then
    begin
      edtCNPJ.Text := imprimeCNPJ(edtCNPJ.Text);
    end
    else
    begin
      edtCNPJ.SetFocus;
      edtCNPJ.SelectAll;
      MessageDlg('        CNPJ Inválido!        ', mtError, [mbOK],0);
    end;
  end;
end;

procedure TF_IMPLANTACAO.btnMarcarTodosAtualizarNumeracaoClick(Sender: TObject);
begin
  MarcarTodosCheckList(chklstAtualizarNumeracoes);
end;

procedure TF_IMPLANTACAO.btnMarcarTodosGruposClick(Sender: TObject);
begin
  MarcarTodosCheckList(chklstGRUPOSDISPONIVEIS);
end;

function TF_IMPLANTACAO.VerificarDependencias (Tabela : TStringList) : TStringList;
var
  Enviar : TStringList;
  I, X, Contador : Integer;
  Existe : string;
begin
  Enviar := TStringList.Create;
  Contador := Tabela.Count;
  i:= 0;

  while i < contador do
  begin
    BASECOPIAR.IBQueryForeignKey.Close;
    BASECOPIAR.IBQueryForeignKey.ParamByName('TABELA').AsString := Trim(Tabela[I]);
    BASECOPIAR.IBQueryForeignKey.Open;

    if not BASECOPIAR.IBQueryForeignKey.IsEmpty then
    begin
      while not BASECOPIAR.IBQueryForeignKey.Eof do
      begin
        Existe := 'N';
        for X := 1 to Tabela.Count -1 do
        begin
          if Trim(BASECOPIAR.strIBQueryForeignKeyTABELA_ORIGEM_DADOS.AsString) = Trim(Tabela[X])  then
            Existe := 'S';
        end;
        if Existe = 'N' then Tabela.Add(Trim(BASECOPIAR.strIBQueryForeignKeyTABELA_ORIGEM_DADOS.AsString));
        BASECOPIAR.IBQueryForeignKey.Next;
      end;
    end;
    i := i + 1;
    Contador := Tabela.Count;
  end;
  Contador := Tabela.Count - 1;
  for I := 0 to Tabela.Count - 1 do
  begin
    Enviar.Add(Tabela[Contador]);
    Contador := Contador -1;
  end;
  BASECOPIAR.IBQueryForeignKey.Close;
  Result := Enviar;
end;

procedure TF_IMPLANTACAO.btnCopiarClick(Sender: TObject);
var
  I, X: Integer;
  MSG : string;
  tempo : TDateTime;
begin
  // ZERANDO TEMPO
  lblTempo.Caption := '00:00:00:000';
  tempo := Now;

  Screen.Cursor:= crHourGlass;
  if (DATAMODULO.IBDatabase.Connected)
    and (BASECOPIAR.IBDatabaseBaseCopiar.Connected)
    and (dblkcbbNOME_TABELA.KeyValue <> null)
  then
  begin
    for I := 0 to ListBoxTabelas.Count -1 do
    begin
      if ListBoxTabelas.Selected[I] = True then
      begin
        mmoInformacoes.Lines.Add('Inserindo/Atualizando dados Tabela:  ' + Trim(ListBoxTabelas.Items.Strings[I]) +
          ' Base de dados origem: ' + edtCaminhoBaseCopiar.Text + ' Para Base de dados: ' + edtDiretorioBaseTecinco.Text);

        try
          DATAMODULO.IBTableOrigem.Close;
          DATAMODULO.IBTableOrigem.TableName := Trim(ListBoxTabelas.Items.Strings[I]);
          DATAMODULO.IBTableOrigem.Open;
          ShowMessage(DATAMODULO.IBTableOrigem.IndexDefs[0].Fields);
          //DATAMODULO.IBTableOrigem.FetchAll;
          mmoInformacoes.Lines.Add('Total de Registros: ' + IntToStr(DATAMODULO.IBTableOrigem.RecordCount));
          mmoInformacoes.Lines.Add('');
          DATAMODULO.IBTableOrigem.First;
          while not DATAMODULO.IBTableOrigem.Eof do
          begin
            try
              MSG := '';
              X := 0;
              BASECOPIAR.IBTableDestino.Close;
              BASECOPIAR.IBTableDestino.TableName := Trim(ListBoxTabelas.Items.Strings[I]);
              BASECOPIAR.IBTableDestino.Open;
              BASECOPIAR.IBTableDestino.Locate(BASECOPIAR.IBTableDestino.IndexDefs[0].Fields,DATAMODULO.IBTableOrigem.FieldByName(BASECOPIAR.IBTableDestino.IndexDefs[0].Fields).Value,[loCaseInsensitive]);
              if BASECOPIAR.IBTableDestino.IsEmpty then BASECOPIAR.IBTableDestino.Append
              else BASECOPIAR.IBTableDestino.Edit;
              while X < DATAMODULO.IBTableOrigem.Fields.Count do
              begin
                BASECOPIAR.IBTableDestino.Fields[X].Value := DATAMODULO.IBTableOrigem.Fields[X].Value;
                X := X+1;
              end;
              if chkMostrarScriptCopiarTabelaBase.Checked then
              if BASECOPIAR.IBTableDestino.State in [dsInsert] then MSG := 'INSERIDO REGISTRO ' + DATAMODULO.IBTableOrigem.FieldByName(BASECOPIAR.IBTableDestino.IndexDefs[0].Fields).AsString;
              if chkMostrarScriptCopiarTabelaBase.Checked then
              if BASECOPIAR.IBTableDestino.State in [dsEdit]   then MSG := 'ALTERADO REGISTRO ' + DATAMODULO.IBTableOrigem.FieldByName(BASECOPIAR.IBTableDestino.IndexDefs[0].Fields).AsString;

              BASECOPIAR.IBTableDestino.Post;
              BASECOPIAR.IBTransactionBaseCopiar.CommitRetaining;
              if chkMostrarScriptCopiarTabelaBase.Checked then mmoInformacoes.Lines.Add(MSG);
            Except
              on e : Exception do
              begin
                BASECOPIAR.IBTransactionBaseCopiar.RollbackRetaining;
                mmoInformacoes.Lines.Add('Erro *****  ' + e.Message);
                mmoInformacoes.Lines.Add(BASECOPIAR.IBTableDestino.IndexDefs[0].Fields + ' = '+ DATAMODULO.IBTableOrigem.FieldByName(BASECOPIAR.IBTableDestino.IndexDefs[0].Fields).AsString)
              end;
            end;
            DATAMODULO.IBTableOrigem.Next;
            lblTempo.Caption := FormatDateTime('HH:MM:SS:ZZZ', tempo - Now);
            Application.ProcessMessages;
          end;
        Except
          on e : Exception do
          begin
            BASECOPIAR.IBTransactionBaseCopiar.RollbackRetaining;
            mmoInformacoes.Lines.Add('Erro 2 *****  ' + e.Message);
          end;
        end;

        //CopiarTabelaEntreBancos(edtFilialOrigemTabelaCopiar.Text, edtFilialNovaTabelaCopiar.Text, Trim(ListBoxTabelas.Items.Strings[I]));
        mmoInformacoes.Lines.Add('');
        mmoInformacoes.Lines.Add('Next');
      end;
      lblTempo.Caption := FormatDateTime('HH:MM:SS:ZZZ', tempo - Now);
    end;

    mmoInformacoes.Lines.Add('Processo concluido');
    mmoInformacoes.Lines.Add('');
  end
  else
  begin
    if not DATAMODULO.IBDatabase.Connected then mmoInformacoes.Lines.Add('Nao conectado a base de dados!');
    if not BASECOPIAR.IBDatabaseBaseCopiar.Connected then mmoInformacoes.Lines.Add('Nao conectado a base de dados de origem!');
    if dblkcbbNOME_TABELA.KeyValue = null then mmoInformacoes.Lines.Add('Nao informado o nome da tabela!');
    mmoInformacoes.Lines.Add('');
  end;
  ListBoxTabelas.Clear;
  Screen.Cursor:= crDefault;
end;

procedure TF_IMPLANTACAO.btnCopiarRestricoesClick(Sender: TObject);
var
  i, qtde : Integer;
begin
  if not DATAMODULO.IBQuerySECUR_RESTRICAO.IsEmpty then
  begin
    Abas('LOG');
    mmoInformacoes.Lines.Add('Copiando para os grupos!!');
    mmoInformacoes.Lines.Add('');

    for i:= 0 to chklstGRUPOSDISPONIVEIS.Items.Count -1 do
    begin
      if chklstGRUPOSDISPONIVEIS.Checked[i] then
      begin
        mmoInformacoes.Lines.Add(chklstGRUPOSDISPONIVEIS.Items.Strings[i]);
        if not DATAMODULO.IBQuerySECUR_RESTRICAO.IsEmpty then
        begin
          DATAMODULO.IBQuerySECUR_RESTRICAO.FetchAll;
          qtde := DATAMODULO.IBQuerySECUR_RESTRICAO.RecordCount;
          mmoInformacoes.Lines.Add('Registros: ' + IntToStr(qtde));
          DATAMODULO.IBQuerySECUR_RESTRICAO.First;
          while not DATAMODULO.IBQuerySECUR_RESTRICAO.Eof do
          begin
            with DATAMODULO.IBQuery do
            begin
              Close;
              SQL.Clear;
              SQL.Add('update or insert into SECUR_RESTRICAO (GRP_ID, FRM_NOME, SST_NOME, OBJ_NOME, RST_RESTRICAO, RST_HABILITARCAMPO) '+
                      'values (:GRP_ID, :FRM_NOME, :SST_NOME, :OBJ_NOME, :RST_RESTRICAO, :RST_HABILITARCAMPO)');
              ParamByName('GRP_ID').AsInteger             := StrToInt(Copy(chklstGRUPOSDISPONIVEIS.Items.Strings[i],1 , (Pos('-',chklstGRUPOSDISPONIVEIS.Items.Strings[i])) - 2));
              ParamByName('FRM_NOME').AsString            := DATAMODULO.IBQuerySECUR_RESTRICAO.FieldByName('FRM_NOME').AsString;
              ParamByName('SST_NOME').AsString            := DATAMODULO.IBQuerySECUR_RESTRICAO.FieldByName('SST_NOME').AsString;
              ParamByName('OBJ_NOME').AsString            := DATAMODULO.IBQuerySECUR_RESTRICAO.FieldByName('OBJ_NOME').AsString;
              ParamByName('RST_RESTRICAO').AsString       := DATAMODULO.IBQuerySECUR_RESTRICAO.FieldByName('RST_RESTRICAO').AsString;
              if DATAMODULO.IBQuerySECUR_RESTRICAO.FieldByName('RST_HABILITARCAMPO').AsString <> '' then
                ParamByName('RST_HABILITARCAMPO').AsString  := DATAMODULO.IBQuerySECUR_RESTRICAO.FieldByName('RST_HABILITARCAMPO').AsString;
              ExecSQL;
              DATAMODULO.IBTransaction.CommitRetaining;
            end;
            DATAMODULO.IBQuerySECUR_RESTRICAO.Next;
          end;
        end;
      end;
    end;
    mmoInformacoes.Lines.Add('');
    mmoInformacoes.Lines.Add('Processo Concluído!!');
  end;
end;

procedure TF_IMPLANTACAO.btnSaldoInicialSPEDClick(Sender: TObject);
begin
  if DATAMODULO.IBDatabase.Connected then
  begin
    CriarFormulario(TF_CT_MOVIMENTO,F_CT_MOVIMENTO);
  end
  else
  begin
    MessageDlg('Não Conectado!',mtError,[mbOK],0);
  end;
end;

procedure TF_IMPLANTACAO.btnListarArquivosBaixadosClick(Sender: TObject);
begin
  lblBaixandoArquivo.Caption := 'Lista de Arquivos';
  ListBoxArquivosAtualizacao.Clear;
  ListBoxArquivosAtualizacao.Items.AddStrings(ListarArquivosDiretorio(ExtractFilePath(Application.ExeName) + 'Backup\','7z'));
end;

procedure TF_IMPLANTACAO.btnListarArquivosFTPClick(Sender: TObject);
var
  indice :Integer;
begin
  try
    cancelaratualizacao := 'N';
    if IdFTP.Connected then IdFTP.Disconnect;
    IdFTP.Host := 'zginformatica.com';
    IdFTP.Port := 21;
    IdFTP.Username := 'zginfobr';
    IdFTP.Password := 'FTS20112l';
    IdFTP.Passive := True; // usa modo ativo false
    try
      IdFTP.Connect();
      if rgSistemaAtualizar.ItemIndex = 0  then IdFTP.ChangeDir('/Arquivos/BasePadraoMekanic/');
      if rgSistemaAtualizar.ItemIndex = 1  then IdFTP.ChangeDir('/Arquivos/BasePadrao/');

      IdFTP.List(ListBoxArquivosAtualizacao.Items,'*.*',false);
    except
      on e : Exception do
      begin
        ShowMessage('Erro conexao FTP');
        ShowMessage(e.Message);
      end;
    end;
    if ListBoxArquivosAtualizacao.Items.Count = 0 then
    begin
      MessageDlg('Não existem arquivos no servidor!',mtError,[mbOK],0);
      Abort;
    end;
    lblTempoAtualizacao.Caption := '00:00:00:000';
    lblTempoAtualizacaoDecorrido.Caption := '00:00:00:000';
  except
    on e : Exception do
      MessageDlg('Erro conexão FTP!' +#13+ E.Message,mtError,[mbOK],0);
  end;
end;

procedure TF_IMPLANTACAO.btnListarDependenciasClick(Sender: TObject);
var
  Tabelas : TStringList;
  I: Integer;
begin
  if dblkcbbNOME_TABELA.KeyValue <> null then
  begin
    ListBoxTabelas.Clear;
    Tabelas := TStringList.Create;
    Tabelas.Add(Trim(dblkcbbNOME_TABELA.KeyValue));
    Tabelas := VerificarDependencias(Tabelas);
    for I := 0 to Tabelas.Count -1 do
    begin
      ListBoxTabelas.Items.Add(Tabelas[I]);
    end;
  end;
end;

procedure TF_IMPLANTACAO.btnRetirarFilialModoImplantacaoClick(Sender: TObject);
var
  i : Integer;
  Filial : string;
begin
  Screen.Cursor:= crHourGlass;
  if DATAMODULO.IBDatabase.Connected then
  begin
    Abas('LOG');
    if Trim(edtFilialImplantacao.Text) = '' then
    begin
      with DATAMODULO.IBQuery1 do
      begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT FLL_CODIGO FROM FILIAL');
        SQL.Add(' ORDER BY FLL_CODIGO');
        Open;
      end;
      while not DATAMODULO.IBQuery1.Eof do
      begin
        Filial := DATAMODULO.IBQuery1.Fields[0].AsString;

        DATAMODULO.IBQuery.Close;
        DATAMODULO.IBQuery.SQL.Clear;
        DATAMODULO.IBQuery.SQL.Add('UPDATE FILIAL');
        DATAMODULO.IBQuery.SQL.Add(' SET FLL_IMPLANTACAO = ''1''');
        DATAMODULO.IBQuery.SQL.Add(' WHERE FLL_CODIGO = :FLL_CODIGO');
        DATAMODULO.IBQuery.ParamByName('FLL_CODIGO').AsString := Filial;
        DATAMODULO.IBQuery.ExecSQL;

        mmoInformacoes.Lines.Add('Filial: ' + Filial + '      Retirada do processo de implantação');
        DATAMODULO.IBTransaction.CommitRetaining;
        DATAMODULO.IBQuery1.Next;
      end;
    end
    else
    begin
      Filial := edtFilialImplantacao.Text;

      DATAMODULO.IBQuery.Close;
      DATAMODULO.IBQuery.SQL.Clear;
      DATAMODULO.IBQuery.SQL.Add('UPDATE FILIAL');
      DATAMODULO.IBQuery.SQL.Add(' SET FLL_IMPLANTACAO = ''1''');
      DATAMODULO.IBQuery.SQL.Add(' WHERE FLL_CODIGO = :FLL_CODIGO');
      DATAMODULO.IBQuery.ParamByName('FLL_CODIGO').AsString := Filial;
      DATAMODULO.IBQuery.ExecSQL;

      mmoInformacoes.Lines.Add('Filial: ' + Filial + '      Retirada do processo de implantação');
      DATAMODULO.IBTransaction.CommitRetaining;
    end;
    mmoInformacoes.Lines.Add('Processo concluído');
    mmoInformacoes.Lines.Add('');
  end
  else
  begin
    MessageDlg('Não conectado a base de dados!', mtInformation,[mbOK],0);
  end;
  Screen.Cursor:= crDefault;
end;

procedure TF_IMPLANTACAO.btn2Click(Sender: TObject);
var
 executar : TextFile;
begin
  Screen.Cursor:= crHourGlass;
  Abas('LOG');
  AssignFile ( executar, ExtractFilePath(Application.ExeName) + 'Executar.cmd');
  Rewrite ( executar );
  Writeln(executar, Copy(edtDiretorioPastaTCar.Text,0,2));
  Writeln(executar, 'cd ' + edtDiretorioPastaTCar.Text);
  Writeln(executar, 'CarregaBinarioBancoDados.exe -programa TCar.exe -dir ' + ExtractFilePath(Application.ExeName) + 'CarregaBinario\');
  Writeln(executar, 'pause');
  CloseFile(executar);
  ShellExecute(Handle, 'runas', PWideChar(ExtractFilePath(Application.ExeName)+'Executar.cmd'), '', '', SW_SHOWMAXIMIZED);
  Screen.Cursor:= crDefault;
end;

procedure TF_IMPLANTACAO.btnAbrirBackupTecincoClick(Sender: TObject);
begin
  try
    dlgOpen.Title := 'Abrir Arquivo';
    if dlgOpen.Execute then
    begin
      edtCaminhoBackup.Text := dlgOpen.FileName;
    end;
  except
    on e:exception do
    begin
      ShowMessage(e.message);
    end;
  end;
end;

procedure TF_IMPLANTACAO.btnAbrirBaseCopiarClick(Sender: TObject);
begin
  try
    dlgOpen.InitialDir := edtDiretorioBaseTecinco.Text;
    dlgOpen.Title := 'Abrir Arquivo';
    if dlgOpen.Execute then
    begin
      edtCaminhoBaseCopiar.Text := dlgOpen.FileName;
    end;
  except
    on e:exception do
    begin
      ShowMessage(e.message);
    end;
  end;
end;

procedure TF_IMPLANTACAO.btnAbrirBaseTecincoClick(Sender: TObject);
begin
  try
    dlgOpen.InitialDir := edtDiretorioBaseTecinco.Text;
    dlgOpen.Title := 'Abrir Arquivo';
    if dlgOpen.Execute then
    begin
      edtDiretorioBaseTecinco.Text := dlgOpen.FileName;
    end;
  except
    on e:exception do
    begin
      ShowMessage(e.message);
    end;
  end;
end;

procedure TF_IMPLANTACAO.btnAplicarModulosContratadosClick(Sender: TObject);
var I : Integer;
begin
  if cbbPacote.ItemIndex <> 0 then
  begin
    Abas('LOG');
    if DATAMODULO.IBDatabase.Connected then
    begin
      if MessageDlg('Esta operação é ireversivel! Deseja continuar?',mtInformation,[mbYes,mbNo],0) = 6 then
      begin
        for I:= 0 to chklstModulosContratados.Items.Count -1 do
        begin
          if not chklstModulosContratados.Checked[I] then
          mmoInformacoes.Lines.Add(DADOS_EXCLUIRPACKAGE(StrToInt(Copy(chklstModulosContratados.Items.Strings[I],1,Pos('-',chklstModulosContratados.Items.Strings[I])-2))));
        end;
        with DATAMODULO.IBScript do
        begin
          Script.Clear;
          Script.Add('UPDATE USUARIO SET USUARIO.PRF_CODIGO = NULL;');
          ExecuteScript;
          DATAMODULO.IBTransaction.Commit;
          mmoInformacoes.Lines.Add('');
          mmoInformacoes.Lines.Add('Setado perfil nos usuários como null!');
          mmoInformacoes.Lines.Add('');
        end;
        if cbbPacote.ItemIndex <> 1 then //Mekanic Inicial
        begin
          with DATAMODULO.IBScript do
          begin
            Script.Clear;
            Script.Add('DELETE FROM SECUR_RESTRICAO WHERE SECUR_RESTRICAO.GRP_ID >= 2000 AND SECUR_RESTRICAO.GRP_ID <= 4000;');
            Script.Add('DELETE FROM SECUR_GRUPO_PERFIL WHERE SECUR_GRUPO_PERFIL.GRP_ID >= 2000 AND SECUR_GRUPO_PERFIL.GRP_ID <= 4000;');
            Script.Add('DELETE FROM SECUR_USUARIO_GRUPO WHERE SECUR_USUARIO_GRUPO.GRP_ID >= 2000 AND SECUR_USUARIO_GRUPO.GRP_ID <= 4000;');
            Script.Add('DELETE FROM SECUR_GRUPO WHERE SECUR_GRUPO.GRP_ID >= 2000 AND SECUR_GRUPO.GRP_ID < 4000;');
            Script.Add('DELETE FROM SECUR_PERFIL WHERE SECUR_PERFIL.PRF_CODIGO >= 100 AND SECUR_PERFIL.PRF_CODIGO <= 199;');
            ExecuteScript;
            DATAMODULO.IBTransaction.Commit;
            mmoInformacoes.Lines.Add('');
            mmoInformacoes.Lines.Add('Excluido os grupos e perfil MKE!');
            mmoInformacoes.Lines.Add('');
          end;
        end
        else
        begin
          with DATAMODULO.IBScript do
          begin
            Script.Clear;
            Script.Add('UPDATE USUARIO SET USUARIO.PRF_CODIGO = 101 WHERE USUARIO.USR_CODIGO = 1;');
            Script.Add('UPDATE USUARIO SET USUARIO.PRF_CODIGO = 103 WHERE USUARIO.USR_CODIGO = 2;');
            Script.Add('UPDATE USUARIO SET USUARIO.PRF_CODIGO = 119 WHERE USUARIO.USR_CODIGO = 3;');
            Script.Add('UPDATE USUARIO SET USUARIO.PRF_CODIGO = 102 WHERE USUARIO.USR_CODIGO = 4;');
            Script.Add('UPDATE USUARIO SET USUARIO.PRF_CODIGO = 121 WHERE USUARIO.USR_CODIGO = 5;');
            Script.Add('UPDATE USUARIO SET USUARIO.PRF_CODIGO = 105 WHERE USUARIO.USR_CODIGO = 6;');
            ExecuteScript;
            mmoInformacoes.Lines.Add('');
            mmoInformacoes.Lines.Add('Atualizado os usuários padrão para os perfis do MKE!');
            mmoInformacoes.Lines.Add('');
          end;
        end;
        if cbbPacote.ItemIndex <> 2 then //Mekanic Essencial
        begin
          with DATAMODULO.IBScript do
          begin
            Script.Clear;
            Script.Add('DELETE FROM SECUR_RESTRICAO WHERE SECUR_RESTRICAO.GRP_ID >= 4000 AND SECUR_RESTRICAO.GRP_ID <= 6000;');
            Script.Add('DELETE FROM SECUR_GRUPO_PERFIL WHERE SECUR_GRUPO_PERFIL.GRP_ID >= 4000 AND SECUR_GRUPO_PERFIL.GRP_ID <= 6000;');
            Script.Add('DELETE FROM SECUR_USUARIO_GRUPO WHERE SECUR_USUARIO_GRUPO.GRP_ID >= 4000 AND SECUR_USUARIO_GRUPO.GRP_ID <= 6000;');
            Script.Add('DELETE FROM SECUR_GRUPO WHERE SECUR_GRUPO.GRP_ID >= 4000 AND SECUR_GRUPO.GRP_ID < 6000;');
            Script.Add('DELETE FROM SECUR_PERFIL WHERE SECUR_PERFIL.PRF_CODIGO >= 200 AND SECUR_PERFIL.PRF_CODIGO <= 299;');
            ExecuteScript;
            DATAMODULO.IBTransaction.Commit;
            mmoInformacoes.Lines.Add('');
            mmoInformacoes.Lines.Add('Excluido os grupos e perfil MKE!');
            mmoInformacoes.Lines.Add('');
          end;
        end
        else
        begin
          with DATAMODULO.IBScript do
          begin
            Script.Clear;
            Script.Add('UPDATE USUARIO SET USUARIO.PRF_CODIGO = 201 WHERE USUARIO.USR_CODIGO = 1;');
            Script.Add('UPDATE USUARIO SET USUARIO.PRF_CODIGO = 203 WHERE USUARIO.USR_CODIGO = 2;');
            Script.Add('UPDATE USUARIO SET USUARIO.PRF_CODIGO = 219 WHERE USUARIO.USR_CODIGO = 3;');
            Script.Add('UPDATE USUARIO SET USUARIO.PRF_CODIGO = 202 WHERE USUARIO.USR_CODIGO = 4;');
            Script.Add('UPDATE USUARIO SET USUARIO.PRF_CODIGO = 221 WHERE USUARIO.USR_CODIGO = 5;');
            Script.Add('UPDATE USUARIO SET USUARIO.PRF_CODIGO = 205 WHERE USUARIO.USR_CODIGO = 6;');
            ExecuteScript;
            mmoInformacoes.Lines.Add('');
            mmoInformacoes.Lines.Add('Atualizado os usuários padrão para os perfis do MKE!');
            mmoInformacoes.Lines.Add('');
          end;
        end;
        if cbbPacote.ItemIndex <> 3 then //Mekanic Profissional
        begin
          with DATAMODULO.IBScript do
          begin
            Script.Clear;
            Script.Add('DELETE FROM SECUR_RESTRICAO WHERE SECUR_RESTRICAO.GRP_ID >= 6000 AND SECUR_RESTRICAO.GRP_ID <= 8000;');
            Script.Add('DELETE FROM SECUR_GRUPO_PERFIL WHERE SECUR_GRUPO_PERFIL.GRP_ID >= 6000 AND SECUR_GRUPO_PERFIL.GRP_ID <= 8000;');
            Script.Add('DELETE FROM SECUR_USUARIO_GRUPO WHERE SECUR_USUARIO_GRUPO.GRP_ID >= 6000 AND SECUR_USUARIO_GRUPO.GRP_ID <= 8000;');
            Script.Add('DELETE FROM SECUR_GRUPO WHERE SECUR_GRUPO.GRP_ID >= 6000 AND SECUR_GRUPO.GRP_ID < 8000;');
            Script.Add('DELETE FROM SECUR_PERFIL WHERE SECUR_PERFIL.PRF_CODIGO >= 300 AND SECUR_PERFIL.PRF_CODIGO <= 399;');
            ExecuteScript;
            DATAMODULO.IBTransaction.Commit;
            mmoInformacoes.Lines.Add('');
            mmoInformacoes.Lines.Add('Excluido os grupos e perfil MKP!');
            mmoInformacoes.Lines.Add('');
          end;
        end
        else
        begin
          with DATAMODULO.IBScript do
          begin
            Script.Clear;
            Script.Add('UPDATE USUARIO SET USUARIO.PRF_CODIGO = 301 WHERE USUARIO.USR_CODIGO = 1;');
            Script.Add('UPDATE USUARIO SET USUARIO.PRF_CODIGO = 303 WHERE USUARIO.USR_CODIGO = 2;');
            Script.Add('UPDATE USUARIO SET USUARIO.PRF_CODIGO = 319 WHERE USUARIO.USR_CODIGO = 3;');
            Script.Add('UPDATE USUARIO SET USUARIO.PRF_CODIGO = 302 WHERE USUARIO.USR_CODIGO = 4;');
            Script.Add('UPDATE USUARIO SET USUARIO.PRF_CODIGO = 321 WHERE USUARIO.USR_CODIGO = 5;');
            Script.Add('UPDATE USUARIO SET USUARIO.PRF_CODIGO = 330 WHERE USUARIO.USR_CODIGO = 6;');
            ExecuteScript;
            mmoInformacoes.Lines.Add('');
            mmoInformacoes.Lines.Add('Atualizado os usuários padrão para os perfis do MKP!');
            mmoInformacoes.Lines.Add('');
          end;
        end;
        if cbbPacote.ItemIndex <> 4 then //TCar
        begin
          with DATAMODULO.IBScript do
          begin
            Script.Clear;
            Script.Add('DELETE FROM SECUR_RESTRICAO WHERE SECUR_RESTRICAO.GRP_ID >= 100 AND SECUR_RESTRICAO.GRP_ID <= 2000;');
            Script.Add('DELETE FROM SECUR_GRUPO_PERFIL WHERE SECUR_GRUPO_PERFIL.GRP_ID >= 100 AND SECUR_GRUPO_PERFIL.GRP_ID <= 2000;');
            Script.Add('DELETE FROM SECUR_USUARIO_GRUPO WHERE SECUR_USUARIO_GRUPO.GRP_ID >= 100 AND SECUR_USUARIO_GRUPO.GRP_ID <= 2000;');
            Script.Add('DELETE FROM SECUR_GRUPO WHERE SECUR_GRUPO.GRP_ID >= 100 AND SECUR_GRUPO.GRP_ID < 2000;');
            Script.Add('DELETE FROM SECUR_PERFIL WHERE SECUR_PERFIL.PRF_CODIGO >= 1 AND SECUR_PERFIL.PRF_CODIGO <= 99;');
            ExecuteScript;
            DATAMODULO.IBTransaction.Commit;
            mmoInformacoes.Lines.Add('');
            mmoInformacoes.Lines.Add('Excluido os grupos e perfil TCar!');
            mmoInformacoes.Lines.Add('');
          end;
        end
        else
        begin
          with DATAMODULO.IBScript do
          begin
            Script.Clear;
            Script.Add('UPDATE USUARIO SET USUARIO.PRF_CODIGO = 1   WHERE USUARIO.USR_CODIGO = 1;');
            Script.Add('UPDATE USUARIO SET USUARIO.PRF_CODIGO = 3   WHERE USUARIO.USR_CODIGO = 2;');
            Script.Add('UPDATE USUARIO SET USUARIO.PRF_CODIGO = 19  WHERE USUARIO.USR_CODIGO = 3;');
            Script.Add('UPDATE USUARIO SET USUARIO.PRF_CODIGO = 2   WHERE USUARIO.USR_CODIGO = 4;');
            Script.Add('UPDATE USUARIO SET USUARIO.PRF_CODIGO = 21  WHERE USUARIO.USR_CODIGO = 5;');
            Script.Add('UPDATE USUARIO SET USUARIO.PRF_CODIGO = 5   WHERE USUARIO.USR_CODIGO = 6;');
            ExecuteScript;
            mmoInformacoes.Lines.Add('');
            mmoInformacoes.Lines.Add('Atualizado os usuários padrão para os perfis do TCar!');
            mmoInformacoes.Lines.Add('');
          end;
        end;
      end
      else
      begin
        mmoInformacoes.Lines.Add('Operação abortada!');
      end;
    end
    else
    begin
      MessageDlg('Base de dados nao conectada!',mtInformation,[mbOK],0);
    end;
  end
  else
  begin
    MessageDlg('É necessario selecionar um pacote!',mtInformation,[mbOK],0)
  end;

end;

procedure TF_IMPLANTACAO.btnAtualizarClick(Sender: TObject);
var
  indice :Integer;
  executar : TextFile;
begin
  if ListBoxArquivosAtualizacao.Items.Count <> 0 then
  begin
    AssignFile(executar,ExtractFilePath(Application.ExeName) + 'Executar.cmd');
    Rewrite(executar);
    Writeln(executar, Copy(ExtractFilePath(Application.ExeName), 0, 2));
    Writeln(executar, 'cd ' + ExtractFilePath(Application.ExeName));
    Writeln(executar, 'timeout 10');
    for indice := 0 to ListBoxArquivosAtualizacao.Items.Count - 1 do
    begin
      if ListBoxArquivosAtualizacao.Selected[indice] = true then
      begin
        if ListBoxArquivosAtualizacao.Items.Strings[indice] = 'TCar.7z' then Writeln(executar, 'rd TCar /s /q');
        if ListBoxArquivosAtualizacao.Items.Strings[indice] = 'IBExpert.7z' then Writeln(executar, 'rd IBExpert /s /q');
        if ListBoxArquivosAtualizacao.Items.Strings[indice] = 'Arquivos.7z' then
        begin
          Writeln(executar, 'del [T5]TCarLiberacaoSistema.exe');
          Writeln(executar, 'del Firebird32.exe');
          Writeln(executar, 'del Firebird64.exe');
        end;
        if Copy(ListBoxArquivosAtualizacao.Items.Strings[indice],0,10) = 'BASEPADRAO' then
        begin
          Writeln(executar, 'del manBASEPADRAO.fbk.backup.txt');
          Writeln(executar, 'del manBASEPADRAO.fbk.restore.txt');
          Writeln(executar, 'del manBASEPADRAO.fbk');
        end;
        if ListBoxArquivosAtualizacao.Items.Strings[indice] = 'Implantacao.7z' then Writeln(executar, 'del Implantacao.exe');
      end;
    end;
    for indice:= 0 to ListBoxArquivosAtualizacao.Items.Count -1 do
    begin
      try
        if ListBoxArquivosAtualizacao.Selected[indice] = true then
        begin
          Writeln(executar, ExtractFilePath(Application.ExeName) + '7za.exe x ' + ExtractFilePath(Application.ExeName) + 'Backup\' + ListBoxArquivosAtualizacao.Items.Strings[indice]);
        end;
      except on e:exception do
        showmessage(e.Message);
      end;
    end;
    Writeln(executar, 'start Implantacao.exe');
    CloseFile(executar);

    if (cancelaratualizacao = 'N')
      and (MessageDlg('Para completar a atualizacao é necessario encerrar a aplicacao! Deseja encerrar agora?',mtInformation,[mbYes,mbNo],0) = 6 )
    then
    begin
      Atualizar := 'S';
      Close;
    end;
  end;
end;

procedure TF_IMPLANTACAO.btnAtualizarNumeracoesClick(Sender: TObject);
var
  i, UltimaNumeracao : Integer;
  Filial : string;
begin
  Abas('LOG');
  Screen.Cursor:= crHourGlass;
  if DATAMODULO.IBDatabase.Connected then
  begin
    if Trim(edtFilialNumeracao.Text) = '' then
    begin
      with DATAMODULO.IBQuery1 do
      begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT FLL_CODIGO FROM FILIAL');
        SQL.Add(' ORDER BY FLL_CODIGO');
        Open;
      end;
    end
    else
    begin
      with DATAMODULO.IBQuery1 do
      begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT FLL_CODIGO FROM FILIAL WHERE FLL_CODIGO = ' + edtFilialNumeracao.Text);
        Open;
      end;
    end;
    while not DATAMODULO.IBQuery1.Eof do
    begin
      Filial := DATAMODULO.IBQuery1.Fields[0].AsString;
      mmoInformacoes.Lines.Add('Atualizando numeracoes Filial: ' + Filial);
      for i:= 0 to chklstAtualizarNumeracoes.Items.Count -1 do
      begin
        if chklstAtualizarNumeracoes.Checked[i] then
        begin
          case i of
            0 : begin // CODIGO DE CLIENTES
              DATAMODULO.IBQuery.Close;
              DATAMODULO.IBQuery.SQL.Clear;
              DATAMODULO.IBQuery.SQL.Add('SELECT MAX(C.CLN_CODIGO) FROM CLIENTE C WHERE C.CLN_CODIGO < 900000');
              DATAMODULO.IBQuery.Open;
              if (not DATAMODULO.IBQuery.IsEmpty)
                and (DATAMODULO.IBQuery.Fields[0].AsInteger <> 0)
              then
              begin
                UltimaNumeracao := DATAMODULO.IBQuery.Fields[0].AsInteger;
                try
                  DATAMODULO.IBQuery.Close;
                  DATAMODULO.IBQuery.SQL.Clear;
                  DATAMODULO.IBQuery.SQL.Add('UPDATE PARAMETRO P');
                  DATAMODULO.IBQuery.SQL.Add(' SET P.PRM_CAMPO1 = :ULTIMANUMERACAO');
                  DATAMODULO.IBQuery.SQL.Add(' WHERE P.fll_codigo = :FLL_CODIGO AND P.prm_modulo = :PRM_MODULO AND P.prm_codigo = :PRM_CODIGO');
                  DATAMODULO.IBQuery.ParamByName('ULTIMANUMERACAO').AsInteger := UltimaNumeracao;
                  DATAMODULO.IBQuery.ParamByName('FLL_CODIGO').AsString := Filial;
                  DATAMODULO.IBQuery.ParamByName('PRM_MODULO').AsString := '1';
                  DATAMODULO.IBQuery.ParamByName('PRM_CODIGO').AsString := '32';
                  DATAMODULO.IBQuery.ExecSQL;
                  mmoInformacoes.Lines.Add('Ultimo codigo de cliente: ' + IntToStr(UltimaNumeracao));
                except
                  on e : Exception do
                    mmoInformacoes.Lines.Add('Erro ao alterar ultimo codigo de cliente: ' + e.Message);
                end;
              end
              else
              begin
                try
                  DATAMODULO.IBQuery.Close;
                  DATAMODULO.IBQuery.SQL.Clear;
                  DATAMODULO.IBQuery.SQL.Add('UPDATE PARAMETRO P');
                  DATAMODULO.IBQuery.SQL.Add(' SET P.PRM_CAMPO1 = :ULTIMANUMERACAO');
                  DATAMODULO.IBQuery.SQL.Add(' WHERE P.fll_codigo = :FLL_CODIGO AND P.prm_modulo = :PRM_MODULO AND P.prm_codigo = :PRM_CODIGO');
                  DATAMODULO.IBQuery.ParamByName('ULTIMANUMERACAO').AsInteger := 1;
                  DATAMODULO.IBQuery.ParamByName('FLL_CODIGO').AsString := Filial;
                  DATAMODULO.IBQuery.ParamByName('PRM_MODULO').AsString := '1';
                  DATAMODULO.IBQuery.ParamByName('PRM_CODIGO').AsString := '32';
                  DATAMODULO.IBQuery.ExecSQL;
                  mmoInformacoes.Lines.Add('Não possui clientes cadastrados, inserido codigo: 1');
                except
                  on e : Exception do
                    mmoInformacoes.Lines.Add('Erro ao alterar ultimo codigo de cliente: ' + e.Message);
                end;
              end;
            end;
            1 : begin // CODIGO DE FORNECEDORES
              DATAMODULO.IBQuery.Close;
              DATAMODULO.IBQuery.SQL.Clear;
              DATAMODULO.IBQuery.SQL.Add('SELECT MAX(C.CLN_CODIGO) FROM CLIENTE C WHERE C.CLN_CODIGO > 900000');
              DATAMODULO.IBQuery.Open;
              if (not DATAMODULO.IBQuery.IsEmpty)
                and (DATAMODULO.IBQuery.Fields[0].AsInteger <> 0)
              then
              begin
                UltimaNumeracao := DATAMODULO.IBQuery.Fields[0].AsInteger;
                try
                  DATAMODULO.IBQuery.Close;
                  DATAMODULO.IBQuery.SQL.Clear;
                  DATAMODULO.IBQuery.SQL.Add('UPDATE PARAMETRO P');
                  DATAMODULO.IBQuery.SQL.Add(' SET P.PRM_CAMPO1 = :ULTIMANUMERACAO');
                  DATAMODULO.IBQuery.SQL.Add(' WHERE P.fll_codigo = :FLL_CODIGO AND P.prm_modulo = :PRM_MODULO AND P.prm_codigo = :PRM_CODIGO');
                  DATAMODULO.IBQuery.ParamByName('ULTIMANUMERACAO').AsInteger := UltimaNumeracao;
                  DATAMODULO.IBQuery.ParamByName('FLL_CODIGO').AsString := Filial;
                  DATAMODULO.IBQuery.ParamByName('PRM_MODULO').AsString := '1';
                  DATAMODULO.IBQuery.ParamByName('PRM_CODIGO').AsString := '33';
                  DATAMODULO.IBQuery.ExecSQL;
                  mmoInformacoes.Lines.Add('Ultimo codigo de fornecedor: ' + IntToStr(UltimaNumeracao));
                except
                  on e : Exception do
                    mmoInformacoes.Lines.Add('Erro ao alterar ultimo codigo de fornecedor: ' + e.Message);
                end;
              end
              else
              begin
                try
                  DATAMODULO.IBQuery.Close;
                  DATAMODULO.IBQuery.SQL.Clear;
                  DATAMODULO.IBQuery.SQL.Add('UPDATE PARAMETRO P');
                  DATAMODULO.IBQuery.SQL.Add(' SET P.PRM_CAMPO1 = :ULTIMANUMERACAO');
                  DATAMODULO.IBQuery.SQL.Add(' WHERE P.fll_codigo = :FLL_CODIGO AND P.prm_modulo = :PRM_MODULO AND P.prm_codigo = :PRM_CODIGO');
                  DATAMODULO.IBQuery.ParamByName('ULTIMANUMERACAO').AsInteger := 900001;
                  DATAMODULO.IBQuery.ParamByName('FLL_CODIGO').AsString := Filial;
                  DATAMODULO.IBQuery.ParamByName('PRM_MODULO').AsString := '1';
                  DATAMODULO.IBQuery.ParamByName('PRM_CODIGO').AsString := '33';
                  DATAMODULO.IBQuery.ExecSQL;
                  mmoInformacoes.Lines.Add('Não possui fornecedores cadastrados, inserido codigo: 900001');
                except
                  on e : Exception do
                    mmoInformacoes.Lines.Add('Erro ao alterar ultimo codigo de fornecedor: ' + e.Message);
                end;
              end;
            end;
            2 : begin // CODIGO DE ORDENS DE SERVICO
              DATAMODULO.IBQuery.Close;
              DATAMODULO.IBQuery.SQL.Clear;
              DATAMODULO.IBQuery.SQL.Add('SELECT MAX(A.ATCSO_OS) FROM AT_CSO A WHERE FLL_CODIGO = :FLL_CODIGO');
              DATAMODULO.IBQuery.ParamByName('FLL_CODIGO').AsInteger := StrToInt(Filial);
              DATAMODULO.IBQuery.Open;
              if (not DATAMODULO.IBQuery.IsEmpty)
                and (DATAMODULO.IBQuery.Fields[0].AsInteger <> 0)
              then
              begin
                UltimaNumeracao := DATAMODULO.IBQuery.Fields[0].AsInteger;
                try
                  DATAMODULO.IBQuery.Close;
                  DATAMODULO.IBQuery.SQL.Clear;
                  DATAMODULO.IBQuery.SQL.Add('UPDATE PARAMETRO P');
                  DATAMODULO.IBQuery.SQL.Add(' SET P.PRM_CAMPO1 = :ULTIMANUMERACAO');
                  DATAMODULO.IBQuery.SQL.Add(' WHERE P.fll_codigo = :FLL_CODIGO AND P.prm_modulo = :PRM_MODULO AND P.prm_codigo = :PRM_CODIGO');
                  DATAMODULO.IBQuery.ParamByName('ULTIMANUMERACAO').AsInteger := UltimaNumeracao;
                  DATAMODULO.IBQuery.ParamByName('FLL_CODIGO').AsString := Filial;
                  DATAMODULO.IBQuery.ParamByName('PRM_MODULO').AsString := '31';
                  DATAMODULO.IBQuery.ParamByName('PRM_CODIGO').AsString := '6';
                  DATAMODULO.IBQuery.ExecSQL;
                  mmoInformacoes.Lines.Add('Ultimo codigo de Ordem de Serviço: ' + IntToStr(UltimaNumeracao));
                except
                  on e : Exception do
                    mmoInformacoes.Lines.Add('Erro ao alterar ultimo codigo de ordem de servico: ' + e.Message);
                end;
              end
              else
              begin
                try
                  DATAMODULO.IBQuery.Close;
                  DATAMODULO.IBQuery.SQL.Clear;
                  DATAMODULO.IBQuery.SQL.Add('UPDATE PARAMETRO P');
                  DATAMODULO.IBQuery.SQL.Add(' SET P.PRM_CAMPO1 = :ULTIMANUMERACAO');
                  DATAMODULO.IBQuery.SQL.Add(' WHERE P.fll_codigo = :FLL_CODIGO AND P.prm_modulo = :PRM_MODULO AND P.prm_codigo = :PRM_CODIGO');
                  DATAMODULO.IBQuery.ParamByName('ULTIMANUMERACAO').AsInteger := 0;
                  DATAMODULO.IBQuery.ParamByName('FLL_CODIGO').AsString := Filial;
                  DATAMODULO.IBQuery.ParamByName('PRM_MODULO').AsString := '31';
                  DATAMODULO.IBQuery.ParamByName('PRM_CODIGO').AsString := '6';
                  DATAMODULO.IBQuery.ExecSQL;
                  mmoInformacoes.Lines.Add('Não possui ordens de servico, inserido codigo:  0');
                except
                  on e : Exception do
                    mmoInformacoes.Lines.Add('Erro ao alterar ultimo codigo de ordem de servico: ' + e.Message);
                end;
              end;
            end;
          end;
        end;
      end;
      mmoInformacoes.Lines.Add('');
      DATAMODULO.IBTransaction.CommitRetaining;
      DATAMODULO.IBQuery1.Next;
    end;
    mmoInformacoes.Lines.Add('');
  end
  else
  begin
    MessageDlg('Não conectado a base de dados!', mtInformation,[mbOK],0);
  end;
  Screen.Cursor:= crDefault;
end;

procedure TF_IMPLANTACAO.btnBaixarArquivosClick(Sender: TObject);
var
  I :Integer;
  Mensagem : TStringList;
  sr: TSearchRec;
begin
  if ListBoxArquivosAtualizacao.Items.Count <> 0 then
  begin
    Mensagem := TStringList.Create;
    Mensagem.Add('Data e Hora de Inicio: ' + DateToStr(now) + ' ' + TimeToStr(now));
    Mensagem.Add('Computador: '+ NomeComputador);
    Mensagem.Add('Usuário: '+ NomeUsuario);
    lblTempoAtualizacao.Caption := '00:00:00:000';
    lblTempoAtualizacaoDecorrido.Caption := '00:00:00:000';
    tempo := Now;

    if not DirectoryExists(ExtractFilePath(Application.ExeName) + 'Backup\') then
    begin
      try
        ForceDirectories(ExtractFilePath(Application.ExeName) + 'Backup\');
      except
      end;
    end
    else
    begin
      // LIMPANDO DIRETORIO BACKUP
      I := FindFirst(ExtractFilePath(Application.ExeName) + 'Backup\*.*', faAnyFile, SR);
      while I = 0 do
      begin
        DeleteFile(ExtractFilePath(Application.ExeName) + 'Backup\' + SR.Name);
        I := FindNext(SR);
      end;
    end;

    try
      if ListBoxArquivosAtualizacao.Items.Count = 0 then
      begin
        Abort;
      end;
      for I:= 0 to ListBoxArquivosAtualizacao.Items.Count -1 do
      begin
        try
          if ListBoxArquivosAtualizacao.Selected[I] = true then
          begin
            lblBaixandoArquivo.Caption := ListBoxArquivosAtualizacao.Items.Strings[I];
            bytesToTransfer := IdFTP.Size(ListBoxArquivosAtualizacao.Items.Strings[I]);
            IdFTP.Get(ListBoxArquivosAtualizacao.Items.Strings[I], ExtractFilePath(Application.ExeName)
                        + 'Backup\' + ListBoxArquivosAtualizacao.Items.Strings[I],true);
            if cancelaratualizacao <> 'S' then Mensagem.Add('Arquivo Baixado: '+ ListBoxArquivosAtualizacao.Items.Strings[I]);
          end;
        except
          on e:exception do
          begin
            showmessage(e.Message);
            Mensagem.Add('Erro Baixar Arquivo: ' + ListBoxArquivosAtualizacao.Items.Strings[I]);
            Mensagem.Add(e.Message);
          end;
        end;
      end;
      ListBoxArquivosAtualizacao.Clear;
      MessageDlg('Arquivos baixados!', mtInformation, [mbOK],0);
    finally
      IdFTP.Disconnect;
    end;
    Mensagem.Add('Data e Hora de Termino: ' + DateToStr(now) + ' ' + TimeToStr(now));
    btnListarArquivosBaixados.Click;
  end
  else
  begin
    MessageDlg('Não listado arquivos!',mtError,[mbOK],0);
  end;

end;

procedure TF_IMPLANTACAO.btnCaminhoBaseInstaladaClick(Sender: TObject);
begin
  try
    dlgOpen.InitialDir := edtBICAMINHOBANCO.Text;
    dlgOpen.Title := 'Abrir Arquivo';
    if dlgOpen.Execute then
    begin
      edtBICAMINHOBANCO.Text := dlgOpen.FileName;
    end;
  except
    on e:exception do
    begin
      ShowMessage(e.message);
    end;
  end;
end;

procedure TF_IMPLANTACAO.btnCancelarAtualizacaoClick(Sender: TObject);
begin
  cancelaratualizacao := 'S';
end;

procedure TF_IMPLANTACAO.btnClienteDuplicadoClick(Sender: TObject);
begin
  if DATAMODULO.IBDatabase.Connected then
  begin
    CriarFormulario(TF_CLIENTEDUPLICADO,F_CLIENTEDUPLICADO);
  end
  else
  begin
    MessageDlg('Não Conectado!',mtError,[mbOK],0);
  end;
end;

procedure TF_IMPLANTACAO.btnConectarBaseCopiarClick(Sender: TObject);
begin
  Screen.Cursor:= crHourGlass;
  if (FileExists(edtCaminhoBaseCopiar.Text))
    and (edtCaminhoBaseCopiar.Text <> '')
  then // VERIFICANDO SE A BASE EXISTE
  begin
    with BASECOPIAR.IBDatabaseBaseCopiar do
    begin
      // INSERINDO OS DADOS DA CONEXAO
      try
        Close;
        DatabaseName := edtCaminhoBaseCopiar.Text;
        Params.Clear;
        Params.Add('user_name=' + edtUsuarioTecinco.Text);
        Params.Add('password='  + edtSenhaTecinco.Text);
        Open;
      except
        on e : Exception do
        begin
          mmoInformacoes.Lines.Add('Erro ao tentar conexão!!');
          mmoInformacoes.Lines.Add(e.Message);
          mmoInformacoes.Lines.Add('');
        end;
      end;

      // VERIFICANDO A CONEXAO
      if Connected then
      begin
        mmoInformacoes.Lines.Add('Conectado a base de dados a copiar!!');
        mmoInformacoes.Lines.Add('');
        BASECOPIAR.IBQueryTabela.Close;
        BASECOPIAR.IBQueryTabela.Open;
        BASECOPIAR.IBQueryTabela.FetchAll;
      end
    end;
  end
  else
  begin
    mmoInformacoes.Lines.Add('Base de dados nao existe!!');
    mmoInformacoes.Lines.Add('');
  end;
  Screen.Cursor:= crDefault;
end;

procedure TF_IMPLANTACAO.btnConectarBaseEADClick(Sender: TObject);
begin
  Abas('LOG');
  if ConectarBancoDados(DATAMODULO.IBDatabaseEAD,edtIPServidor.Text +':'+ edtBASEEAD.Text,
                         edtUsuarioTecinco.Text,edtSenhaTecinco.Text) = True
  then
  begin
    mmoInformacoes.Lines.Add('Base de dados EAD já existe!');
    mmoInformacoes.Lines.Add('Conectado a base de dados: ' + edtIPServidor.Text +':'+ edtBASEEAD.Text);
    mmoInformacoes.Lines.Add('');
  end
  else
  begin
    mmoInformacoes.Lines.Add('Base de dados EAD não existe!');
    mmoInformacoes.Lines.Add('Não foi possível conectar a base: ' + edtIPServidor.Text +':'+ edtBASEEAD.Text);
    mmoInformacoes.Lines.Add('');
  end;
end;

procedure TF_IMPLANTACAO.btnConectarBaseInstaladaClick(Sender: TObject);
begin
  if DADOS_CONEXAO(edtBIIPSERVIDOR.Text ,
              edtBICAMINHOBANCO.Text,
              edtBIUSUARIOBANCO.Text,
              edtBISENHABANCO.Text)
  then
  begin
    btnSalvarConfiguracoesBaseInstalada.Click;
    mmoInformacoes.Lines.Add('Conectado a base de dados!');
    mmoInformacoes.Lines.Add(edtBIIPSERVIDOR.Text + ':' + edtBICAMINHOBANCO.Text);
    mmoInformacoes.Lines.Add('');
    AtualizarModulosDisponiveis;
    AtualizarModulosDisponiveisPG116;
    Abas('V');
    with DATAMODULO.IBQuery do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT THR_CONFIGURACAO.DIRETORIOBACKUP FROM THR_CONFIGURACAO');
      Open;
      edtBICAMINHOBACKUP.Text := Fields[0].AsString;
      Close;
      SQL.Clear;
      SQL.Add('SELECT HDL_CONTROLE.LOCALEXECUCAO FROM HDL_CONTROLE');
      Open;
      edtBICAMINHOHEIMDALL.Text := Fields[0].AsString;
      edtBICAMINHOSERVICOSTCAR.Text := Fields[0].AsString;
    end;
  end
  else
  begin
    mmoInformacoes.Lines.Add('Não foi possivel conectar a base de dados!');
    mmoInformacoes.Lines.Add(edtBIIPSERVIDOR.Text + ':' + edtBICAMINHOBANCO.Text);
    mmoInformacoes.Lines.Add('');
    Abas('I');
  end;
end;

procedure TF_IMPLANTACAO.btnConectarClick(Sender: TObject);
var
  start : TIniFile;
  msg : string;

begin
  // COLOCANDO O FOCO NA ABA DE INFORMACOES
  if (Trim(edtApelidoEmpresa.Text) <> '')
    AND (Trim(edtCNPJ.Text) <> '')
    AND (Trim(edtRazaoSocial.Text) <> '')
  then
  begin
    if DADOS_CONEXAO(edtIPServidor.Text ,
                edtDiretorioBaseTecinco.Text,
                edtUsuarioTecinco.Text,
                edtSenhaTecinco.Text)
    then
    begin
      MessageDlg('Esta base de dados já existe!' + #13 + 'Não será possivel iniciar a instalação',mtInformation,[mbOK],0);
    end
    else
    begin
      Abas('LOG');
      // SALVANDO AS INFORMAÇÕES NO START
      btnSalvarStart.Click;
      // VERIFICANDO SE O FIREBIRD ESTA INSTALADO
      if DADOS_INSTALARFIREBIRD then
      begin
        mmoInformacoes.Lines.Add('Firebird Instalado!');
        mmoInformacoes.Lines.Add('');

        //CRIAR AS PASTAS PADROES
        CriarPastasPadrao;
        //VOLTANDO O BACKUP
        VoltarBackup;
        //VALIDANDO A CONEXÃO COM O BANCO PARA CONTINUAR
        if DADOS_CONEXAO(edtIPServidor.Text ,
                    edtDiretorioBaseTecinco.Text,
                    edtUsuarioTecinco.Text,
                    edtSenhaTecinco.Text)
        then
        begin
          mmoInformacoes.Lines.Add('Consegui conectar no banco de dados!!');
          mmoInformacoes.Lines.Add('Vamos continuar com a instalação...');
          mmoInformacoes.Lines.Add('');
          // COPIANDO ARQUIVOS DA PASTA DO TCAR
          CopiarPastaTCar;
          // ALTERANDO O START.INI
          if FileExists(edtDiretorioPastaTCar.Text + '\Start.ini') then
          begin
            AlterarStartini;
            // INSTALANDO O HEINDALL
            btnInstalarHeimdall.Click;
            // CRIAR OS ATALHOS DO SISTEMA
            btnCriarAtalho.Click;
            mmoInformacoes.Lines.Add('Processo de instalação concluido!!');

            AtualizarModulosDisponiveis;
            AtualizarModulosDisponiveisPG116;

          end
          else
          begin
            MessageDlg('Não existe o arquivo Start.ini no diretório informado' + #13 + edtDiretorioPastaTCar.Text,mtError,[mbOK],0);
          end;
        end
        else
        begin
          mmoInformacoes.Lines.Add('Não foi possivel realizar a conexão com o banco de dados!');
          mmoInformacoes.Lines.Add('Processo de instalação abortado!');
        end;

      end
      else
      begin
        mmoInformacoes.Lines.Add('Firebird não Instalado');
        MessageDlg('Processo interrompido!' + #13 + 'Para a instalação é obrigatório a instalação do Firebird!',mtError,[mbOK],0);
      end;
    end;

  end
  else
  begin
    msg := 'Campos obrigatórios não preenchidos:';
    if Trim(edtApelidoEmpresa.Text) = '' then msg := msg + #13 + '  *Apelido';
    if Trim(edtCNPJ.Text)           = '' then msg := msg + #13 + '  *CNPJ';
    if Trim(edtRazaoSocial.Text)    = '' then msg := msg + #13 + '  *Razão Social';
    MessageDlg(msg,mtError,[mbOK],0);
    Abas('I');
  end;
end;

procedure TF_IMPLANTACAO.btnContaIntegracaoClick(Sender: TObject);
begin
  if DATAMODULO.IBDatabase.Connected then
  begin
    CriarFormulario(TF_CT_PLANOCONTA_INTEGRACAO,F_CT_PLANOCONTA_INTEGRACAO);
  end
  else
  begin
    MessageDlg('Não Conectado!',mtError,[mbOK],0);
  end;

end;

procedure TF_IMPLANTACAO.btnCriarAtalhoClick(Sender: TObject);
begin
  if DATAMODULO.IBDatabase.Connected then
  begin
    //COLOCA O FOCO NA ABA INFROMACOES
    // CRIA OS ATALHOS
    mmoInformacoes.Lines.Add('Criando os atalhos do sistema!');
    CriarAtalho(edtDiretorioPastaTCar.Text + '\Tcar.exe','',edtDiretorioPastaTCar.Text,'Tcar - ' + edtApelidoEmpresa.Text,'');
    CriarAtalho(Copy(edtDiretorioPastaTCar.Text,0,Length(edtDiretorioPastaTCar.Text) - 1) + ' FDB2\' + '\Tcar.exe','',Copy(edtDiretorioPastaTCar.Text,0,Length(edtDiretorioPastaTCar.Text) - 1) + ' FDB2\','Tcar - ' + edtApelidoEmpresa.Text + ' FDB2','');
    CriarAtalho(edtTCAREAD.Text + '\Tcar.exe','',edtTCAREAD.Text,'Tcar - ' + edtApelidoEmpresa.Text + ' EAD','');
    CriarAtalho(edtDiretorioPastaTCar.Text + '\Heimdallsrv.exe','-config',edtDiretorioPastaTCar.Text,'Heimdall - ' + edtApelidoEmpresa.Text,'');
    CriarAtalho(edtDiretorioPastaTCar.Text + '\Secur.exe','',edtDiretorioPastaTCar.Text,'Secur - ' + edtApelidoEmpresa.Text,'');
    CriarAtalho(edtDiretorioPastaTCar.Text + '\Thor.exe','',edtDiretorioPastaTCar.Text,'Thor - ' + edtApelidoEmpresa.Text,'');
    CriarAtalho(edtDiretorioPastaTCar.Text + '\Bifrostcln.exe','',edtDiretorioPastaTCar.Text,'Bifrost - ' + edtApelidoEmpresa.Text,'');
    mmoInformacoes.Lines.Add('Atalhos Criados!');
    mmoInformacoes.Lines.Add('');
  end;
end;

procedure TF_IMPLANTACAO.btnCriarFilialClick(Sender: TObject);
var
  i : Integer;
begin
  Abas('LOG');
  Screen.Cursor:= crHourGlass;
  if (DATAMODULO.IBDatabase.Connected) then
  begin
    if    (edtFilialOrigem.Text <> '')
      and (edtFilialNova.Text <> '')
    then
    begin
      mmoInformacoes.Lines.Add('Criando Filial ' + edtFilialNova.Text);
      for i:= 0 to chklstTabelaFilial.Items.Count -1 do
      begin
        if chklstTabelaFilial.Checked[i] then
        begin
          Insert(chklstTabelaFilial.Items.Strings[i], edtFilialOrigem.Text,edtFilialNova.Text);
        end;
      end;
    end
    else
    begin
      mmoInformacoes.Lines.Add('Informe a filial de destino e origem!');
      mmoInformacoes.Lines.Add('');
    end;
    mmoInformacoes.Lines.Add('');
  end
  else
  begin
    MessageDlg('Não conectado a base de dados!', mtInformation,[mbOK],0);
  end;
  Screen.Cursor:= crDefault;
end;

procedure TF_IMPLANTACAO.btnDesconectarClick(Sender: TObject);
begin
  with DATAMODULO.IBDatabase do
  begin
    if DATAMODULO.IBTransaction.Active then DATAMODULO.IBTransaction.Rollback;
    Close;
    btnLimparMemo.Click;
    edtBICAMINHOBACKUP.Clear;
    edtBICAMINHOHEIMDALL.Clear;
    edtBICAMINHOSERVICOSTCAR.Clear;
    Abas('I');
  end;
  if DATAMODULO.IBTransactionEAD.Active then DATAMODULO.IBTransactionEAD.Rollback;
  DATAMODULO.IBDatabaseEAD.Close;
end;

procedure TF_IMPLANTACAO.btnDesinstalarHeimdallEADClick(Sender: TObject);
var
 Executar : TStringList;
begin
  Executar := TStringList.Create;
  Executar.Add(Copy(edtTCAREAD.Text,0,2));
  Executar.Add('cd '+ edtTCAREAD.Text);
  Executar.Add('NET STOP HeimdallGuard_'+ Trim(edtApelidoEmpresa.Text)+ 'EAD');
  Executar.Add('NET STOP HeimdallGuard_'+ Trim(edtApelidoEmpresa.Text));
  Executar.Add('HeimdallGuardian.exe -empresa="'+ Trim(edtApelidoEmpresa.Text)+ 'EAD' +'" -uninstall');
  Executar.Add('taskkill /F /IM Heimdall*');
  Executar.Add('NET START HeimdallGuard_'+ Trim(edtApelidoEmpresa.Text));
  Executar.Add('pause');
  DADOS_EXECUTARCOMANDODOS(Executar);

  mmoInformacoes.Lines.Add('Desinstalando o Heindall!');
  mmoInformacoes.Lines.Add('');
end;


procedure TF_IMPLANTACAO.btnDesinstalarHeimdallGuardianClick(Sender: TObject);
var
 Executar : TStringList;
begin
  Executar := TStringList.Create;
  Executar.Add(Copy(edtDiretorioPastaTCar.Text,0,2));
  Executar.Add('cd '+ edtDiretorioPastaTCar.Text);
  Executar.Add('NET STOP HeimdallGuard_'+ Trim(edtApelidoEmpresa.Text));
  Executar.Add('HeimdallGuardian.exe -empresa="'+ Trim(edtApelidoEmpresa.Text)+'" -uninstall');
  Executar.Add('taskkill /F /IM Heimdall*');
  Executar.Add('pause');
  DADOS_EXECUTARCOMANDODOS(Executar);

  mmoInformacoes.Lines.Add('Desinstalando o Heindall!');
  mmoInformacoes.Lines.Add('');
end;

procedure TF_IMPLANTACAO.btnFilialModoImplantacaoClick(Sender: TObject);
var
  i : Integer;
  Filial : string;
begin
  Screen.Cursor:= crHourGlass;
  if DATAMODULO.IBDatabase.Connected then
  begin
    Abas('LOG');
    if Trim(edtFilialImplantacao.Text) = '' then
    begin
      with DATAMODULO.IBQuery1 do
      begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT FLL_CODIGO FROM FILIAL');
        SQL.Add(' ORDER BY FLL_CODIGO');
        Open;
      end;

      while not DATAMODULO.IBQuery1.Eof do
      begin
        Filial := DATAMODULO.IBQuery1.Fields[0].AsString;

        DATAMODULO.IBQuery.Close;
        DATAMODULO.IBQuery.SQL.Clear;
        DATAMODULO.IBQuery.SQL.Add('UPDATE FILIAL');
        DATAMODULO.IBQuery.SQL.Add(' SET FLL_IMPLANTACAO = ''0''');
        DATAMODULO.IBQuery.SQL.Add(' WHERE FLL_CODIGO = :FLL_CODIGO');
        DATAMODULO.IBQuery.ParamByName('FLL_CODIGO').AsString := Filial;
        DATAMODULO.IBQuery.ExecSQL;

        mmoInformacoes.Lines.Add('Filial: ' + Filial + '      Alterado para Filial em processo de implantação');
        DATAMODULO.IBTransaction.CommitRetaining;
        DATAMODULO.IBQuery1.Next;
      end;
    end
    else
    begin
      Filial := edtFilialImplantacao.Text;

      DATAMODULO.IBQuery.Close;
      DATAMODULO.IBQuery.SQL.Clear;
      DATAMODULO.IBQuery.SQL.Add('UPDATE FILIAL');
      DATAMODULO.IBQuery.SQL.Add(' SET FLL_IMPLANTACAO = ''0''');
      DATAMODULO.IBQuery.SQL.Add(' WHERE FLL_CODIGO = :FLL_CODIGO');
      DATAMODULO.IBQuery.ParamByName('FLL_CODIGO').AsString := Filial;
      DATAMODULO.IBQuery.ExecSQL;

      mmoInformacoes.Lines.Add('Filial: ' + Filial + '      Alterado para Filial em processo de implantação');
      DATAMODULO.IBTransaction.CommitRetaining;
    end;
    mmoInformacoes.Lines.Add('Processo concluído');
    mmoInformacoes.Lines.Add('');
  end
  else
  begin
    MessageDlg('Não conectado a base de dados!', mtInformation,[mbOK],0);
  end;
  Screen.Cursor:= crDefault;
end;

procedure TF_IMPLANTACAO.btnGerarBaseEADClick(Sender: TObject);
begin
  FazerBackupEAD;
end;

procedure TF_IMPLANTACAO.btnRegistrarMidasClick(Sender: TObject);
var
  executar : TextFile;
begin
  Screen.Cursor:= crHourGlass;
  AssignFile ( executar, ExtractFilePath(Application.ExeName) + 'Executar.cmd');
  Rewrite ( executar );
  Writeln(executar, 'cd '+ Copy(edtDiretorioPastaTCar.Text,0,2));
  Writeln(executar, 'cd '+ edtDiretorioPastaTCar.Text);
  Writeln(executar, 'REGSVR32 midas.dll');
  CloseFile(executar);
  ShellExecute(Handle, 'runas', PWideChar(ExtractFilePath(Application.ExeName)+'Executar.cmd'), '', '', SW_SHOWMAXIMIZED);
  Screen.Cursor:= crDefault;
end;

procedure TF_IMPLANTACAO.btnReiniciarHeindallClick(Sender: TObject);
var
 Executar : TStringList;
begin
  Screen.Cursor:= crHourGlass;
  Executar := TStringList.Create;
  Executar.Add(Copy(edtDiretorioPastaTCar.Text,0,2));
  Executar.Add('cd '+ edtDiretorioPastaTCar.Text);
  Executar.Add('NET STOP HeimdallGuard_'+ Trim(edtApelidoEmpresa.Text));
  Executar.Add('taskkill /F /IM Heimdall*');
  Executar.Add('NET START HeimdallGuard_'+ Trim(edtApelidoEmpresa.Text));
  DADOS_EXECUTARCOMANDODOS(Executar);
  Screen.Cursor:= crDefault;
  Application.ProcessMessages;
end;

procedure TF_IMPLANTACAO.btnSalvarConfiguracoesBaseInstaladaClick(
  Sender: TObject);
begin
  DADOS_GRAVARINIFILE(ExtractFilePath(Application.ExeName) + 'Start.ini','BASEINSTALADA','ipservidor',edtBIIPSERVIDOR.Text);
  DADOS_GRAVARINIFILE(ExtractFilePath(Application.ExeName) + 'Start.ini','BASEINSTALADA','database', edtBICAMINHOBANCO.Text);
  DADOS_GRAVARINIFILE(ExtractFilePath(Application.ExeName) + 'Start.ini','BASEINSTALADA','user_name', edtBIUSUARIOBANCO.Text);
  DADOS_GRAVARINIFILE(ExtractFilePath(Application.ExeName) + 'Start.ini','BASEINSTALADA','password', edtBISENHABANCO.Text);
end;

procedure TF_IMPLANTACAO.btnSalvarStartClick(Sender: TObject);
begin
  DADOS_GRAVARINIFILE(ExtractFilePath(Application.ExeName) + 'Start.ini','BASE','apelido',edtApelidoEmpresa.Text);
  case rgSistemaOperacional.ItemIndex of
    0 : DADOS_GRAVARINIFILE(ExtractFilePath(Application.ExeName) + 'Start.ini','BASE','sistemaop', '0');
    1 : DADOS_GRAVARINIFILE(ExtractFilePath(Application.ExeName) + 'Start.ini','BASE','sistemaop', '1');
    2 : DADOS_GRAVARINIFILE(ExtractFilePath(Application.ExeName) + 'Start.ini','BASE','sistemaop', '2');
  end;
  DADOS_GRAVARINIFILE(ExtractFilePath(Application.ExeName) + 'Start.ini','BASE','cnpj', edtCNPJ.Text);
  DADOS_GRAVARINIFILE(ExtractFilePath(Application.ExeName) + 'Start.ini','BASE','razaosocial', edtRazaoSocial.Text);
  DADOS_GRAVARINIFILE(ExtractFilePath(Application.ExeName) + 'Start.ini','BASE','ipservidor',edtIPServidor.Text);
  DADOS_GRAVARINIFILE(ExtractFilePath(Application.ExeName) + 'Start.ini','BASE','database', edtDiretorioBaseTecinco.Text);
  DADOS_GRAVARINIFILE(ExtractFilePath(Application.ExeName) + 'Start.ini','BASE','user_name', edtUsuarioTecinco.Text);
  DADOS_GRAVARINIFILE(ExtractFilePath(Application.ExeName) + 'Start.ini','BASE','password', edtSenhaTecinco.Text);
  DADOS_GRAVARINIFILE(ExtractFilePath(Application.ExeName) + 'Start.ini','BASE','servicostcar', edtDiretorioServicosTCar.Text);
  DADOS_GRAVARINIFILE(ExtractFilePath(Application.ExeName) + 'Start.ini','BASE','pastatcar', edtDiretorioPastaTCar.Text);
  DADOS_GRAVARINIFILE(ExtractFilePath(Application.ExeName) + 'Start.ini','BASE','backuptecinco', edtDiretorioBackupTecinco.Text);
  DADOS_GRAVARINIFILE(ExtractFilePath(Application.ExeName) + 'Start.ini','BASE','backup', edtCaminhoBackup.Text);
  DADOS_GRAVARINIFILE(ExtractFilePath(Application.ExeName) + 'Start.ini','BASE','baseead', edtBASEEAD.Text);
  DADOS_GRAVARINIFILE(ExtractFilePath(Application.ExeName) + 'Start.ini','BASE','tcaread', edtTCAREAD.Text);

  // ATUALIZANDO CONEXAO BASE INSTALADA
  edtBIIPSERVIDOR.Text      := edtIPServidor.Text;
  edtBICAMINHOBANCO.Text    := edtDiretorioBaseTecinco.Text;
  edtBIUSUARIOBANCO.Text    := edtUsuarioTecinco.Text;
  edtBISENHABANCO.Text      := edtSenhaTecinco.Text;
  btnSalvarConfiguracoesBaseInstalada.Click;

end;

procedure TF_IMPLANTACAO.btnSalvarTemaClick(Sender: TObject);
var
  start : TIniFile;
begin
  start := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'start.ini');
  start.WriteString('BASE','tema', cbbTema.Items[cbbTema.ItemIndex]);
  start.Free;
  MessageDlg('Tema selecionado com sucesso!!!!! Uhullll!!!!',mtInformation,[mbOK],0);
end;

procedure TF_IMPLANTACAO.btnInserirAlterarClick(Sender: TObject);
var
  i, x : Integer;
  Filial : string;
begin
  Abas('LOG');
  Screen.Cursor:= crHourGlass;
  if DATAMODULO.IBDatabase.Connected then
  begin
    if (edtFilialOrigem.Text <> '') then
    begin
      if Trim(edtFilialNova.Text) = '' then
      begin
        with DATAMODULO.IBQuery1 do
        begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT FLL_CODIGO FROM FILIAL WHERE FLL_CODIGO <> ' + edtFilialOrigem.Text);
          SQL.Add(' ORDER BY FLL_CODIGO');
          Open;
        end;

        while not DATAMODULO.IBQuery1.Eof do
        begin
          Filial := DATAMODULO.IBQuery1.Fields[0].AsString;
          mmoInformacoes.Lines.Add('Inserindo/Alterando dados Filial: ' + Filial);
          for i:= 0 to chklstUpdateorInsert.Items.Count -1 do
          begin
            if chklstUpdateorInsert.Checked[i] then
            begin
              UpdateorInsert(chklstUpdateorInsert.Items.Strings[i], edtFilialOrigem.Text, Filial);
            end;
          end;
          mmoInformacoes.Lines.Add('');
          DATAMODULO.IBQuery1.Next;
        end;

      end
      else
      begin
          Filial := edtFilialNova.Text;
          mmoInformacoes.Lines.Add('Inserindo/Alterando dados Filial: ' + Filial);
          for i:= 0 to chklstUpdateorInsert.Items.Count -1 do
          begin
            if chklstUpdateorInsert.Checked[i] then
            begin
              UpdateorInsert(chklstUpdateorInsert.Items.Strings[i], edtFilialOrigem.Text, Filial);
            end;
          end;
          mmoInformacoes.Lines.Add('');
      end;
    end
    else
    begin
      mmoInformacoes.Lines.Add('Informe a filial de origem!');
      mmoInformacoes.Lines.Add('');
    end;
    mmoInformacoes.Lines.Add('');
  end
  else
  begin
    MessageDlg('Não conectado a base de dados!', mtInformation,[mbOK],0);
  end;
  Screen.Cursor:= crDefault;
end;

procedure TF_IMPLANTACAO.btnInserirAlterarPG116Click(Sender: TObject);
var
  i, contador : Integer;
  Filial : string;
begin
  Abas('LOG');
  // VERIFICANDO A CONEXAO COM O BANCO DE DADOS
  if DATAMODULO.IBDatabase.Connected then
  begin
    // VERIFICANDO SE A FILIAL DE ORIGEM ESTA PREENCHIDA
    if (edtFilialOrigem.Text <> '') then
    begin
      // CASO A FILIAL DE DESTINO ESTEJA EM BRANCO SELECIONA TODAS AS FILIAIS
      if Trim(edtFilialNova.Text) = '' then
      begin
        with DATAMODULO.IBQuery1 do
        begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT FLL_CODIGO FROM FILIAL WHERE FLL_CODIGO <> ' + edtFilialOrigem.Text);
          SQL.Add(' ORDER BY FLL_CODIGO');
          Open;
        end;
      end
      else
      begin
        // SELECIONA SOMENTE A FILIAL DESEJADA
        with DATAMODULO.IBQuery1 do
        begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT FLL_CODIGO FROM FILIAL WHERE FLL_CODIGO = ' + edtFilialNova.Text);
          Open;
        end;
      end;

      // LOOP NAS FILIAIS SELECIONADAS
      while not DATAMODULO.IBQuery1.Eof do
      begin
        // SELECIONA A PRIMEIRA FILIAL
        Filial := DATAMODULO.IBQuery1.Fields[0].AsString;
        contador := 0;
        mmoInformacoes.Lines.Add('Alterando dados PG116 Filial: ' + Filial);

        // LOOP DOS MODULOS SELECIONADOS EXECUTANDO A ALTERACAO
        for i:= 0 to chklstPG116.Items.Count -1 do
        begin
          if chklstPG116.Checked[i] then
          begin
            mmoInformacoes.Lines.Add(DADOS_COPIARPG116(Copy(chklstPG116.Items.Strings[i],1,Pos('-',chklstPG116.Items.Strings[i])-2), edtFilialOrigem.Text, Filial));
          end;
          contador := contador + DATAMODULO.IBQuery.RowsAffected;
        end;

        mmoInformacoes.Lines.Add('Total de registros alterados: '+ IntToStr(contador));
        mmoInformacoes.Lines.Add('');
        // GRAVANDO AS ALTERACOES
        DATAMODULO.IBTransaction.CommitRetaining;
        DATAMODULO.IBQuery1.Next;
      end;
    end
    else
    begin
      mmoInformacoes.Lines.Add('Informe a filial de origem!');
      mmoInformacoes.Lines.Add('');
    end;
    mmoInformacoes.Lines.Add('');
  end
  else
  begin
    MessageDlg('Não conectado a base de dados!', mtInformation,[mbOK],0);
  end;
  Screen.Cursor:= crDefault;
end;

procedure TF_IMPLANTACAO.btnInstalarHeimdallClick(Sender: TObject);
var
 Executar : TStringList;
 CNPJ : string;
begin
  // VALIDANDO SE OS CAMPOS CNPJ RAZAO SOCIAL E APELIDO ESTAO PREENCHIDOS
  if (edtCNPJ.Text <> '')
    and (edtRazaoSocial.Text <> '')
    and (edtApelidoEmpresa.Text <> '')
  then
  begin
    // VERIFICNDO CONEXAO
    if DATAMODULO.IBDatabase.Connected = True then
    begin
      // LIMPANDO CARACTERES ESPECIAS DO CNPJ
      CNPJ := DADOS_LIMPARCNPJ(edtCNPJ.Text);

      with DATAMODULO.IBScript do
      begin
        try
          // EXECUTANDO SCRIPT PARA ZERAR AS INFORMACOES DA BASE PADRAO
          // EXECUTANDO STRIPT PARA INSERIR AS NOVAS INFORMACOES
          mmoInformacoes.Lines.Add('');
          mmoInformacoes.Lines.Add('Iniciando processo de limpeza e tabelas e atualização de informações!');
          Script.Clear;
          Script.Add('DELETE FROM HDL_RAGNAROK;');
          Script.Add('DELETE FROM THR_BASEAUDITOR;');
          Script.Add('DELETE FROM THR_BACKUPLOG;');
          Script.Add('UPDATE THR_CONFIGURACAO SET DIRETORIOBACKUP = ''' + edtDiretorioBackupTecinco.Text +''';');
          Script.Add('UPDATE THR_CONFIGURACAO SET SERVIDORAUDITOR = '''';');
          Script.Add('UPDATE HDL_AGENDAMENTOS SET AGN_SITUACAO = ''I'';');
          Script.Add('UPDATE EMPRESA SET EMPRESA.EMP_RAZAOSOCIAL = '''+edtRazaoSocial.Text +''', EMPRESA.EMP_CNPJ = '''+cnpj+''';');
          Script.Add('UPDATE FILIAL SET FILIAL.FLL_NOME = '''+edtRazaoSocial.Text+''', FILIAL.FLL_CNPJ = '''+cnpj+''' WHERE FILIAL.FLL_CODIGO = 1;');
          ExecuteScript;
          DATAMODULO.IBTransaction.Commit;

          mmoInformacoes.Lines.Add('Tabela HDL_RAGNAROK limpa!');
          mmoInformacoes.Lines.Add('Tabela THR_BASEAUDITOR limpa!');
          mmoInformacoes.Lines.Add('Tabela THR_BACKUPLOG limpa!');
          mmoInformacoes.Lines.Add('Tabela HDL_AGENDAMENTOS alterada, inativado todos os agendamentos!');
          mmoInformacoes.Lines.Add('Tabela EMPRESA alterada!');
          mmoInformacoes.Lines.Add('Tabela FILIAL alterada!');
          mmoInformacoes.Lines.Add('');
          mmoInformacoes.Lines.Add('Iniciando o processo de instalação do Heindall');
          Application.ProcessMessages;

          // CRIANDO ARQUIVO CMD PARA EXECUCAO DOS SERVICOS DO HEINDALL, BACKUP E AUDITORIA
          Executar := TStringList.Create;
          Executar.Add(Copy(edtDiretorioPastaTCar.Text,0,2));
          Executar.Add('cd '+ edtDiretorioPastaTCar.Text);
          Executar.Add('TCarSincroniza.exe -programa TCar.exe -run ' + edtDiretorioPastaTCar.Text + 'TCar.exe');
          Executar.Add('start Heimdallsrv.exe -empresa="' + Trim(edtApelidoEmpresa.Text)+'" -install');
          Executar.Add('timeout 60');
          Executar.Add('Heimdallsrv.exe -ragnarok -configura');
          Executar.Add('taskkill /F /IM Heimdall*');
          Executar.Add('NET START Heimdall_'+ Trim(edtApelidoEmpresa.Text));
          Executar.Add('Thor.exe -moveauditor');
          Executar.Add('Heimdallsrv.exe -ragnarok');
          Executar.Add('Heimdallsrv.exe -config');
          Executar.Add('NET STOP HeimdallGuard_'+ Trim(edtApelidoEmpresa.Text));
          Executar.Add('taskkill /F /IM Heimdall*');
          Executar.Add('NET START HeimdallGuard_'+ Trim(edtApelidoEmpresa.Text));
          Executar.Add('Heimdallsrv.exe -config');
          Executar.Add('pause');
          DADOS_EXECUTARCOMANDODOS(Executar);

          Application.ProcessMessages;

          mmoInformacoes.Lines.Add('Sincronizando o sistema!');
          mmoInformacoes.Lines.Add('Instalando servicos!');
          mmoInformacoes.Lines.Add('Iniciando Servicos!');
          mmoInformacoes.Lines.Add('Configurado empresa!');
          mmoInformacoes.Lines.Add('Criando base de auditoria!');
          mmoInformacoes.Lines.Add('Caso não tenha apresentado nenhuma mensagem de erro Heindall Instalado!!');
        except
          on e:exception do
          begin
            ShowMessage(e.message);
          end;
        end;
      end;
    end
    else
    begin
      MessageDlg('Base de dados nao conectada!',mtInformation,[mbOK],0);
    end;
  end
  else
  begin
    MessageDlg('Necessario informar Razão Social, CNPJ, Apelido!',mtInformation,[mbOK],0);
  end;
  Screen.Cursor:= crDefault;
end;

procedure TF_IMPLANTACAO.btnInstalarHeimdallEADClick(Sender: TObject);
var
 Executar : TStringList;
 CNPJ : string;
begin
  // VALIDANDO SE OS CAMPOS CNPJ RAZAO SOCIAL E APELIDO ESTAO PREENCHIDOS
  if (edtCNPJ.Text <> '')
    and (edtRazaoSocial.Text <> '')
    and (edtApelidoEmpresa.Text <> '')
  then
  begin
    // VERIFICNDO CONEXAO
    if DATAMODULO.IBDatabaseEAD.Connected = True then
    begin
      // LIMPANDO CARACTERES ESPECIAS DO CNPJ
      CNPJ := DADOS_LIMPARCNPJ(edtCNPJ.Text);

      with DATAMODULO.IBScriptEAD do
      begin
        try
          // EXECUTANDO SCRIPT PARA ZERAR AS INFORMACOES DA BASE PADRAO
          // EXECUTANDO STRIPT PARA INSERIR AS NOVAS INFORMACOES
          mmoInformacoes.Lines.Add('');
          mmoInformacoes.Lines.Add('Iniciando processo de limpeza e tabelas e atualização de informações!');
          Script.Clear;
          //Script.Add('DELETE FROM HDL_RAGNAROK;');
          Script.Add('DELETE FROM THR_BASEAUDITOR;');
          Script.Add('DELETE FROM THR_BACKUPLOG;');
          //Script.Add('UPDATE THR_CONFIGURACAO SET DIRETORIOBACKUP = ''' + edtDiretorioBackupTecinco.Text +''';');
          Script.Add('UPDATE THR_CONFIGURACAO SET SERVIDORAUDITOR = '''';');
          Script.Add('UPDATE HDL_AGENDAMENTOS SET AGN_SITUACAO = ''I'';');
          //Script.Add('UPDATE EMPRESA SET EMPRESA.EMP_RAZAOSOCIAL = '''+edtRazaoSocial.Text +''', EMPRESA.EMP_CNPJ = '''+cnpj+''';');
          //Script.Add('UPDATE FILIAL SET FILIAL.FLL_NOME = '''+edtRazaoSocial.Text+''', FILIAL.FLL_CNPJ = '''+cnpj+''' WHERE FILIAL.FLL_CODIGO = 1;');
          ExecuteScript;
          DATAMODULO.IBTransactionEAD.Commit;

          //mmoInformacoes.Lines.Add('Tabela HDL_RAGNAROK limpa!');
          mmoInformacoes.Lines.Add('Tabela THR_BASEAUDITOR limpa!');
          mmoInformacoes.Lines.Add('Tabela THR_BACKUPLOG limpa!');
          mmoInformacoes.Lines.Add('Tabela HDL_AGENDAMENTOS alterada, inativado todos os agendamentos!');
          //mmoInformacoes.Lines.Add('Tabela EMPRESA alterada!');
          //mmoInformacoes.Lines.Add('Tabela FILIAL alterada!');
          mmoInformacoes.Lines.Add('');
          mmoInformacoes.Lines.Add('Iniciando o processo de instalação do Heindall');
          Application.ProcessMessages;

          // CRIANDO ARQUIVO CMD PARA EXECUCAO DOS SERVICOS DO HEINDALL, BACKUP E AUDITORIA
          Executar := TStringList.Create;
          Executar.Add(Copy(edtTCAREAD.Text,0,2));
          Executar.Add('cd '+ edtTCAREAD.Text);
          Executar.Add('TCarSincroniza.exe -programa TCar.exe -run ' + edtTCAREAD.Text + 'TCar.exe');
          Executar.Add('start Heimdallsrv.exe -empresa="' + Trim(edtApelidoEmpresa.Text) + 'EAD' +'" -install');
          Executar.Add('timeout 60');
          //Executar.Add('Heimdallsrv.exe -ragnarok -configura');
          Executar.Add('taskkill /F /IM Heimdall*');
          Executar.Add('NET START Heimdall_'+ Trim(edtApelidoEmpresa.Text + 'EAD'));
          //Executar.Add('Thor.exe -moveauditor');
          Executar.Add('Heimdallsrv.exe -ragnarok');
          Executar.Add('Heimdallsrv.exe -config');
          Executar.Add('NET STOP HeimdallGuard_'+ Trim(edtApelidoEmpresa.Text + 'EAD'));
          Executar.Add('NET STOP HeimdallGuard_'+ Trim(edtApelidoEmpresa.Text));
          Executar.Add('taskkill /F /IM Heimdall*');
          Executar.Add('NET START HeimdallGuard_'+ Trim(edtApelidoEmpresa.Text + 'EAD'));
          Executar.Add('NET START HeimdallGuard_'+ Trim(edtApelidoEmpresa.Text));
          Executar.Add('Heimdallsrv.exe -config');
          Executar.Add('pause');
          DADOS_EXECUTARCOMANDODOS(Executar);

          Application.ProcessMessages;

          mmoInformacoes.Lines.Add('Sincronizando o sistema!');
          mmoInformacoes.Lines.Add('Instalando servicos!');
          mmoInformacoes.Lines.Add('Iniciando Servicos!');
          //mmoInformacoes.Lines.Add('Configurado empresa!');
          //mmoInformacoes.Lines.Add('Criando base de auditoria!');
          mmoInformacoes.Lines.Add('Caso não tenha apresentado nenhuma mensagem de erro Heindall Instalado!!');
        except
          on e:exception do
          begin
            ShowMessage(e.message);
          end;
        end;
      end;
    end
    else
    begin
      MessageDlg('Base de dados nao conectada!',mtInformation,[mbOK],0);
    end;
  end
  else
  begin
    MessageDlg('Necessario informar Razão Social, CNPJ, Apelido!',mtInformation,[mbOK],0);
  end;
  Screen.Cursor:= crDefault;
end;


procedure TF_IMPLANTACAO.btnInstalarIBExpertClick(Sender: TObject);
begin
  // INSTALANDO O IBEXPERT
  if DADOS_INSTALARIBEXPERT then mmoInformacoes.Lines.Add('Instalado IBExpert!')
  else mmoInformacoes.Lines.Add('IBExpert não instalado');
end;

procedure TF_IMPLANTACAO.FormActivate(Sender: TObject);
var
  drives : TStringList;
  I: Integer;
begin
  // CASO TENHA FICADO A CONEXAO ABERTA ENCERRA
  DATAMODULO.IBDatabase.Close;
  DATAMODULO.IBDatabaseEAD.Close;

  // VERIFICANDO AS UNIDADES DE REDE DISPONIVEIS NA MAQUINA
  cbbUnidadeRede.Clear;
  drives := ListaDrives;
  for I := 0 to drives.Count -1 do
    cbbUnidadeRede.Items.Add(drives[I]);
  cbbUnidadeRede.ItemIndex := 0;

  // OCULTANDO AS ABAS
  Abas('I');

  // RECUPERANDO AS INFORMAÇÕES DO START
  edtApelidoEmpresa.Text :=           DADOS_LERINIFILE(ExtractFilePath(Application.ExeName) + 'Start.ini','BASE','apelido');
  if DADOS_LERINIFILE(ExtractFilePath(Application.ExeName) + 'Start.ini','BASE','sistemaop') = '0' then rgSistemaOperacional.ItemIndex := 0;
  if DADOS_LERINIFILE(ExtractFilePath(Application.ExeName) + 'Start.ini','BASE','sistemaop') = '1' then rgSistemaOperacional.ItemIndex := 1;
  if DADOS_LERINIFILE(ExtractFilePath(Application.ExeName) + 'Start.ini','BASE','sistemaop') = '2' then rgSistemaOperacional.ItemIndex := 2;
  edtCNPJ.Text :=                     DADOS_LERINIFILE(ExtractFilePath(Application.ExeName) + 'Start.ini','BASE','cnpj');
  edtRazaoSocial.Text :=              DADOS_LERINIFILE(ExtractFilePath(Application.ExeName) + 'Start.ini','BASE','razaosocial');
  edtIPServidor.Text :=               DADOS_LERINIFILE(ExtractFilePath(Application.ExeName) + 'Start.ini','BASE','ipservidor');
  edtDiretorioBaseTecinco.Text :=     DADOS_LERINIFILE(ExtractFilePath(Application.ExeName) + 'Start.ini','BASE','database');
  edtUsuarioTecinco.Text :=           DADOS_LERINIFILE(ExtractFilePath(Application.ExeName) + 'Start.ini','BASE','user_name');
  edtSenhaTecinco.Text :=             DADOS_LERINIFILE(ExtractFilePath(Application.ExeName) + 'Start.ini','BASE','password');
  edtDiretorioServicosTCar.Text :=    DADOS_LERINIFILE(ExtractFilePath(Application.ExeName) + 'Start.ini','BASE','servicostcar');
  edtDiretorioPastaTCar.Text :=       DADOS_LERINIFILE(ExtractFilePath(Application.ExeName) + 'Start.ini','BASE','pastatcar');
  edtDiretorioBackupTecinco.Text :=   DADOS_LERINIFILE(ExtractFilePath(Application.ExeName) + 'Start.ini','BASE','backuptecinco');
  edtBASEEAD.Text :=                  DADOS_LERINIFILE(ExtractFilePath(Application.ExeName) + 'Start.ini','BASE','baseead');
  edtTCAREAD.Text :=                  DADOS_LERINIFILE(ExtractFilePath(Application.ExeName) + 'Start.ini','BASE','tcaread');
  edtBIIPSERVIDOR.Text  :=            DADOS_LERINIFILE(ExtractFilePath(Application.ExeName) + 'Start.ini','BASEINSTALADA','ipservidor');
  edtBICAMINHOBANCO.Text :=           DADOS_LERINIFILE(ExtractFilePath(Application.ExeName) + 'Start.ini','BASEINSTALADA','database');
  edtBIUSUARIOBANCO.Text :=           DADOS_LERINIFILE(ExtractFilePath(Application.ExeName) + 'Start.ini','BASEINSTALADA','user_name');
  edtBISENHABANCO.Text   :=           DADOS_LERINIFILE(ExtractFilePath(Application.ExeName) + 'Start.ini','BASEINSTALADA','password');

  if rgSistemaTcarMekanic.ItemIndex = 0  then edtCaminhoBackup.Text := ExtractFilePath(Application.ExeName) + 'manMEKANIC.fbk';
  if rgSistemaTcarMekanic.ItemIndex = 1  then edtCaminhoBackup.Text := ExtractFilePath(Application.ExeName) + 'manBASEPADRAO.fbk';

  // INICIALIZANDO VARIAVEIS DE ATUALIZACAO
  Atualizar := 'N';
  cancelaratualizacao := 'N';

  // CRIANDO DIRETORIO CARREGA BINARIO CASO NAO EXISTA
  DADOS_CRIARDIRETORIO(ExtractFilePath(Application.ExeName) + 'CarregaBinario\');

end;

procedure TF_IMPLANTACAO.FormCreate(Sender: TObject);
begin
  if DADOS_LERINIFILE('BASE','tema','') <> '' then TStyleManager.TrySetStyle(DADOS_LERINIFILE('BASE','tema',''));
end;

procedure TF_IMPLANTACAO.FormDestroy(Sender: TObject);
begin
  if Atualizar = 'S' then
  begin
    ShellExecute(Handle, 'runas', PWideChar(ExtractFilePath(Application.ExeName)+'Executar.cmd'), '', '', SW_SHOWMAXIMIZED);
  end;
end;

procedure TF_IMPLANTACAO.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_ESCAPE) then
    if MessageDlg('Deseja Sair?',mtWarning,[mbYes,mbNo],0) = 6 then
       F_IMPLANTACAO.Close;
  if (Key = VK_RETURN) then SelectNext(ActiveControl,True,True);
end;

procedure TF_IMPLANTACAO.FormShow(Sender: TObject);
var
  s: String;
begin
  cbbTema.Items.BeginUpdate;
  try
    cbbTema.Items.Clear;
    for s in TStyleManager.StyleNames do
       cbbTema.Items.Add(s);
    cbbTema.Sorted := True;
    // Select the style that's currently in use in the combobox
    cbbTema.ItemIndex := cbbTema.Items.IndexOf(TStyleManager.ActiveStyle.Name);
  finally
    cbbTema.Items.EndUpdate;
  end;
end;

procedure TF_IMPLANTACAO.rgSistemaTcarMekanicClick(Sender: TObject);
begin
  if rgSistemaTcarMekanic.ItemIndex = 0  then edtCaminhoBackup.Text := ExtractFilePath(Application.ExeName) + 'manMEKANIC.fbk';
  if rgSistemaTcarMekanic.ItemIndex = 1  then edtCaminhoBackup.Text := ExtractFilePath(Application.ExeName) + 'manBASEPADRAO.fbk';
end;

procedure TF_IMPLANTACAO.MKI;
begin
  chklstModulosContratados.Checked[0] := True; // PG
  chklstModulosContratados.Checked[1] := True; // EP
  chklstModulosContratados.Checked[2] := True; // AT
  chklstModulosContratados.Checked[3] := False; // CV
  chklstModulosContratados.Checked[4] := True; // FN
  chklstModulosContratados.Checked[5] := True; // CT
  chklstModulosContratados.Checked[6] := True; // LF
  chklstModulosContratados.Checked[7] := False; // FORD
  chklstModulosContratados.Checked[8] := False; // VW
  chklstModulosContratados.Checked[9] := False; // POS VENDAS
  chklstModulosContratados.Checked[10] := False; // SUNDOWN
  chklstModulosContratados.Checked[11] := True; // GERENCIAL
  chklstModulosContratados.Checked[12] := False; // INDUSTRIA
  chklstModulosContratados.Checked[13] := False; // PATRIMONIO
  chklstModulosContratados.Checked[14] := False; // COMISSAO
  chklstModulosContratados.Checked[15] := False; // COMPRAS
  chklstModulosContratados.Checked[16] := False; // GARANTIA MASSEY
  chklstModulosContratados.Checked[17] := False; // SALAO DE VENDAS
  chklstModulosContratados.Checked[18] := False; // CRONOTACOGRAFO
  chklstModulosContratados.Checked[19] := False;  // KIA
  chklstModulosContratados.Checked[20] := False; // ALMOXARIFADO
  chklstModulosContratados.Checked[21] := False; // CONTROLE DE TRANSPORTE
  chklstModulosContratados.Checked[22] := False; // CONTROLE DE DESCONTAMINACAO
  chklstModulosContratados.Checked[23] := False; // SUZUKI
  chklstModulosContratados.Checked[24] := False; // GESTAO ORCAMENTARIA
  chklstModulosContratados.Checked[25] := False; // CONTRATOS
  chklstModulosContratados.Checked[26] := True; // IMPLANTACAO
  chklstModulosContratados.Checked[27] := False; // GESTAO CLIENTES CRM
end;

procedure TF_IMPLANTACAO.MKE;
begin
  chklstModulosContratados.Checked[0] := True; // PG
  chklstModulosContratados.Checked[1] := True; // EP
  chklstModulosContratados.Checked[2] := True; // AT
  chklstModulosContratados.Checked[3] := False; // CV
  chklstModulosContratados.Checked[4] := True; // FN
  chklstModulosContratados.Checked[5] := True; // CT
  chklstModulosContratados.Checked[6] := True; // LF
  chklstModulosContratados.Checked[7] := False; // FORD
  chklstModulosContratados.Checked[8] := False; // VW
  chklstModulosContratados.Checked[9] := True; // POS VENDAS
  chklstModulosContratados.Checked[10] := False; // SUNDOWN
  chklstModulosContratados.Checked[11] := True; // GERENCIAL
  chklstModulosContratados.Checked[12] := False; // INDUSTRIA
  chklstModulosContratados.Checked[13] := False; // PATRIMONIO
  chklstModulosContratados.Checked[14] := False; // COMISSAO
  chklstModulosContratados.Checked[15] := True; // COMPRAS
  chklstModulosContratados.Checked[16] := False; // GARANTIA MASSEY
  chklstModulosContratados.Checked[17] := False; // SALAO DE VENDAS
  chklstModulosContratados.Checked[18] := False; // CRONOTACOGRAFO
  chklstModulosContratados.Checked[19] := False;  // KIA
  chklstModulosContratados.Checked[20] := True; // ALMOXARIFADO
  chklstModulosContratados.Checked[21] := False; // CONTROLE DE TRANSPORTE
  chklstModulosContratados.Checked[22] := False; // CONTROLE DE DESCONTAMINACAO
  chklstModulosContratados.Checked[23] := False; // SUZUKI
  chklstModulosContratados.Checked[24] := False; // GESTAO ORCAMENTARIA
  chklstModulosContratados.Checked[25] := False; // CONTRATOS
  chklstModulosContratados.Checked[26] := True; // IMPLANTACAO
  chklstModulosContratados.Checked[27] := False; // GESTAO CLIENTES CRM
end;

procedure TF_IMPLANTACAO.MKP;
begin
  chklstModulosContratados.Checked[0] := True; // PG
  chklstModulosContratados.Checked[1] := True; // EP
  chklstModulosContratados.Checked[2] := True; // AT
  chklstModulosContratados.Checked[3] := False; // CV
  chklstModulosContratados.Checked[4] := True; // FN
  chklstModulosContratados.Checked[5] := True; // CT
  chklstModulosContratados.Checked[6] := True; // LF
  chklstModulosContratados.Checked[7] := False; // FORD
  chklstModulosContratados.Checked[8] := False; // VW
  chklstModulosContratados.Checked[9] := True; // POS VENDAS
  chklstModulosContratados.Checked[10] := False; // SUNDOWN
  chklstModulosContratados.Checked[11] := True; // GERENCIAL
  chklstModulosContratados.Checked[12] := False; // INDUSTRIA
  chklstModulosContratados.Checked[13] := False; // PATRIMONIO
  chklstModulosContratados.Checked[14] := False; // COMISSAO
  chklstModulosContratados.Checked[15] := True; // COMPRAS
  chklstModulosContratados.Checked[16] := False; // GARANTIA MASSEY
  chklstModulosContratados.Checked[17] := False; // SALAO DE VENDAS
  chklstModulosContratados.Checked[18] := False; // CRONOTACOGRAFO
  chklstModulosContratados.Checked[19] := False;  // KIA
  chklstModulosContratados.Checked[20] := True; // ALMOXARIFADO
  chklstModulosContratados.Checked[21] := False; // CONTROLE DE TRANSPORTE
  chklstModulosContratados.Checked[22] := False; // CONTROLE DE DESCONTAMINACAO
  chklstModulosContratados.Checked[23] := False; // SUZUKI
  chklstModulosContratados.Checked[24] := False; // GESTAO ORCAMENTARIA
  chklstModulosContratados.Checked[25] := False; // CONTRATOS
  chklstModulosContratados.Checked[26] := True; // IMPLANTACAO
  chklstModulosContratados.Checked[27] := True; // GESTAO CLIENTES CRM
end;

procedure TF_IMPLANTACAO.TCar;
begin
  chklstModulosContratados.Checked[0] := True; // PG
  chklstModulosContratados.Checked[1] := True; // EP
  chklstModulosContratados.Checked[2] := True; // AT
  chklstModulosContratados.Checked[3] := True; // CV
  chklstModulosContratados.Checked[4] := True; // FN
  chklstModulosContratados.Checked[5] := True; // CT
  chklstModulosContratados.Checked[6] := True; // LF
  chklstModulosContratados.Checked[7] := False; // FORD
  chklstModulosContratados.Checked[8] := False; // VW
  chklstModulosContratados.Checked[9] := False; // POS VENDAS
  chklstModulosContratados.Checked[10] := False; // SUNDOWN
  chklstModulosContratados.Checked[11] := True; // GERENCIAL
  chklstModulosContratados.Checked[12] := False; // INDUSTRIA
  chklstModulosContratados.Checked[13] := True; // PATRIMONIO
  chklstModulosContratados.Checked[14] := False; // COMISSAO
  chklstModulosContratados.Checked[15] := False; // COMPRAS
  chklstModulosContratados.Checked[16] := False; // GARANTIA MASSEY
  chklstModulosContratados.Checked[17] := True; // SALAO DE VENDAS
  chklstModulosContratados.Checked[18] := False; // CRONOTACOGRAFO
  chklstModulosContratados.Checked[19] := False;  // KIA
  chklstModulosContratados.Checked[20] := True; // ALMOXARIFADO
  chklstModulosContratados.Checked[21] := False; // CONTROLE DE TRANSPORTE
  chklstModulosContratados.Checked[22] := False; // CONTROLE DE DESCONTAMINACAO
  chklstModulosContratados.Checked[23] := False; // SUZUKI
  chklstModulosContratados.Checked[24] := False; // GESTAO ORCAMENTARIA
  chklstModulosContratados.Checked[25] := False; // CONTRATOS
  chklstModulosContratados.Checked[26] := True; // IMPLANTACAO
  chklstModulosContratados.Checked[27] := True; // GESTAO CLIENTES CRM
end;

procedure TF_IMPLANTACAO.tsSecurEnter(Sender: TObject);
begin
  // ATUALIZAR OS MODULOS COM RESTRICAO
  DATAMODULO.IBQuerySST_NOME.Close;
  DATAMODULO.IBQuerySST_NOME.Open;
  DATAMODULO.IBQuerySST_NOME.FetchAll;

end;

end.
