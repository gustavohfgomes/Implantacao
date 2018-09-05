unit CT_MOVIMENTO;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls,
  Data.DB, IBX.IBCustomDataSet, MODULO, System.StrUtils;

type
  TF_CT_MOVIMENTO = class(TForm)
    pnlTexto: TPanel;
    lbl1: TLabel;
    lbl2: TLabel;
    lblTempo: TLabel;
    lbl7: TLabel;
    lblTempoEstimado: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl8: TLabel;
    lbl9: TLabel;
    edtCaminhoArquivo: TEdit;
    btnSelecionarArquivo: TButton;
    btnInserirDados: TButton;
    pbProgresso: TProgressBar;
    btnParar: TButton;
    edtFilial: TEdit;
    edtLote: TEdit;
    dtpDataInsercao: TDateTimePicker;
    edtVersaoPlanoContas: TEdit;
    dtpDataInicial: TDateTimePicker;
    dtpDataFinal: TDateTimePicker;
    btnValidarContaIntegracaoDuplicada: TButton;
    dlgOpen: TOpenDialog;
    DataSet: TIBDataSet;
    pnl1: TPanel;
    mmoComentarios: TMemo;
    pnl4: TPanel;
    pnl2: TPanel;
    mmoErros: TMemo;
    pnl3: TPanel;
    spl1: TSplitter;
    stBar1: TStatusBar;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSelecionarArquivoClick(Sender: TObject);
    procedure btnPararClick(Sender: TObject);
    procedure btnInserirDadosClick(Sender: TObject);
    procedure btnValidarContaIntegracaoDuplicadaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_CT_MOVIMENTO: TF_CT_MOVIMENTO;
  parar : string;

implementation

{$R *.dfm}

procedure TF_CT_MOVIMENTO.btnInserirDadosClick(Sender: TObject);
var
  tempo : TDateTime;
  temporestante, i : Integer;
  sped, spedquebra : TStringList;
  sequencia, campo, conta, valor, debitocredito,datainicial, datafinal : Integer;
  validacaodatas, contacontabil : string;
  erros, comentarios, saldozero : TextFile;
  totaldebito, totalcredito : Double;
begin
  if (edtCaminhoArquivo.Text <> '')
    and (edtVersaoPlanoContas.Text <> '')
    and (edtFilial.Text <> '')
    and (edtLote.Text <> '')
  then
  begin
    campo := 1;
    conta := 2;
    valor := 4;
    debitocredito := 5;
    datainicial := 2;
    datafinal := 3;

    // ARQUIVOS DE TEXTO
    AssignFile ( erros, ExtractFilePath(Application.ExeName) + 'SaldoInicial_Erros.txt');
    Rewrite ( erros );
    AssignFile ( comentarios, ExtractFilePath(Application.ExeName) + 'SaldoInicial_Comentarios.txt');
    Rewrite ( comentarios );
    AssignFile ( saldozero, ExtractFilePath(Application.ExeName) + 'SaldoInicial_SaldoZero.txt');
    Rewrite ( saldozero );

    // INICIALIZANDO VARIAVEIS
    lblTempo.Caption := '00:00:00:000';
    tempo := Now;
    mmoComentarios.Clear;
    mmoErros.Clear;
    parar := 'N';
    temporestante := 5;
    sequencia := 1;
    validacaodatas := 'N';
    contacontabil := '';
    totaldebito := 0;
    totalcredito := 0;

    // LENDO O ARQUIVO COMPLETO
    try
      spedquebra := TStringList.Create;
      sped := TStringList.Create;
      sped.LoadFromFile(edtCaminhoArquivo.Text);
      ShowMessage('Quantidade de Registros:  ' + IntToStr(sped.Count -1));
      // BARRA DE PROGRESSO
      pbProgresso.Max := sped.Count -1;
      pbProgresso.Position := 0;
    except
      on e:exception do
      begin
        ShowMessage(e.message);
      end;
    end;
    // QUEBRANDO O ARQUIVO PELO DELIMITADOR E LENDO E INSERINDO LINHA A LINHA
    for i := 0 to sped.Count -1 do
    begin
      // DELIMITANDO TEXTO
      spedquebra.StrictDelimiter := True;
      spedquebra.Delimiter := '|';
      spedquebra.DelimitedText := sped[i];

      // VERIFICANDO SITUACAO PROCESSO
      if parar = 'S' then Break;

      if Trim(spedquebra[campo]) = 'I150' then
      begin
        Writeln(comentarios, 'Data Inicial: ' + spedquebra[datainicial] + ' Data Final: ' + spedquebra [datafinal]);
        mmoComentarios.Lines.Add('Data Inicial: ' + spedquebra[datainicial] + ' Data Final: ' + spedquebra [datafinal]);
        Writeln(erros, 'Data Inicial: ' + spedquebra[datainicial] + ' Data Final: ' + spedquebra [datafinal]);
        mmoErros.Lines.Add('Data Inicial: ' + spedquebra[datainicial] + ' Data Final: ' + spedquebra [datafinal]);
        if (Copy(spedquebra[datainicial],0,2)+'/'+Copy(spedquebra[datainicial],3,2)+'/'+Copy(spedquebra[datainicial],5,4) = DateToStr(dtpDataInicial.Date))
          and (Copy(spedquebra[datafinal],0,2)+'/'+Copy(spedquebra[datafinal],3,2)+'/'+Copy(spedquebra[datafinal],5,4) = DateToStr(dtpDataFinal.Date))
        then validacaodatas := 'S'
        else validacaodatas := 'N'
      end;

      if (Trim(spedquebra[campo]) = 'I155')
        and (validacaodatas = 'S')
      then
      begin
        if (Trim(spedquebra[valor]) <> '0,00') then
        begin
          try
            contacontabil := '';
            // CONTA CONTABIL
            DataModulo.IBQuery.Close;
            DataModulo.IBQuery.SQL.Clear;
            DataModulo.IBQuery.SQL.Add('SELECT CTPLC_CONTA FROM CT_PLANOCONTA');
            DataModulo.IBQuery.SQL.Add('WHERE CTPLC_CONTAINTEGRACAO LIKE ''%;' + spedquebra[conta] + ';%''');
            DataModulo.IBQuery.Open;
            if not DataModulo.IBQuery.IsEmpty then
            begin
              contacontabil := DataModulo.IBQuery.Fields[0].AsString;
            end
            else
            begin
              DataModulo.IBQuery.Close;
              DataModulo.IBQuery.SQL.Clear;
              DataModulo.IBQuery.SQL.Add('SELECT CTPLC_CONTA FROM CT_PLANOCONTA');
              DataModulo.IBQuery.SQL.Add('WHERE CTPLC_CONTA = :CONTA');
              DataModulo.IBQuery.ParamByName('CONTA').AsString := AnsiReplaceStr(spedquebra[conta],'.','');
              DataModulo.IBQuery.Open;
              if not DataModulo.IBQuery.IsEmpty then
              begin
                contacontabil := DataModulo.IBQuery.Fields[0].AsString;
              end
              else
              begin
                Writeln(erros, 'Conta não localizada ' + spedquebra[conta]);
                mmoErros.Lines.Add('Conta não localizada ' + spedquebra[conta]);
              end;
            end;

            if contacontabil <> '' then
            begin
              // VERIFICANDO SE O ITEM POSSUI CADASTRO CASO POSSUA ATUALIZA
              DataSet.Close;
              DataSet.ParamByName('CTMOV_DATA').AsDate := dtpDataInsercao.Date;
              DataSet.ParamByName('CTMOV_LOTE').AsString := Copy(edtLote.Text,0,3);
              DataSet.ParamByName('FLL_CODIGO').AsInteger := StrToInt(edtFilial.Text);
              DataSet.ParamByName('CTMOV_SEQUENCIA').AsInteger := sequencia;
              DataSet.Open;
              // CASO NAO ESTAJA CADASTRADO CADASTRA
              if not DataSet.IsEmpty then
              begin
                mmoErros.Lines.Add('Sequencia ja utilizada: '+ IntToStr(sequencia));
                Writeln(erros, 'Sequencia ja utilizada: '+ IntToStr(sequencia));
              end
              else
              begin
                DataSet.Append;
                DataSet.FieldByName('CTMOV_DATA').AsDateTime := dtpDataInsercao.Date;
                DataSet.FieldByName('CTMOV_LOTE').AsString := Copy(edtLote.Text,0,3);
                DataSet.FieldByName('FLL_CODIGO').AsInteger := StrToInt(edtFilial.Text);
                DataSet.FieldByName('CTMOV_SEQUENCIA').AsInteger := sequencia;

                // VERSAO DO PLANO DE CONTAS
                DataSet.FieldByName('CTVER_CODIGO').AsInteger := StrToInt(edtVersaoPlanoContas.Text);
                // HISTORICO
                DataSet.FieldByName('CTMOV_HISTORICO').AsString := 'IMPLANTACAO SALDO SPED LINHA ' + IntToStr(i+1);
                // VALOR
                DataSet.FieldByName('CTMOV_VALOR').AsFloat := StrToFloat(spedquebra[valor]);
                // TIPO DE LANCAMENTO
                DataSet.FieldByName('CTMOV_TIPOLANCAMENTO').AsString := 'M';
                // CONCILIADA
                DataSet.FieldByName('CTMOV_CONCILIADA').AsString := '1';
                // CONTA CANTABIL
                if spedquebra[debitocredito] = 'D' then begin
                  DataSet.FieldByName('CTPLC_CONTADEBITO').AsString := contacontabil;
                  totaldebito := totaldebito + DataSet.FieldByName('CTMOV_VALOR').AsFloat;
                end;
                if spedquebra[debitocredito] = 'C' then begin
                  DataSet.FieldByName('CTPLC_CONTACREDITO').AsString := contacontabil;
                  totalcredito := totalcredito + DataSet.FieldByName('CTMOV_VALOR').AsFloat;
                end;
                // ORIGEM DA CHAVE
                DataSet.FieldByName('CTMOV_ORIGEMCHAVE').AsString := 'IMPORTADO SPED LINHA ' + IntToStr(i+1) + ' FILIAL ' + edtFilial.Text;
                // ORIGEM TABELA
                DataSet.FieldByName('CTMOV_ORIGEMTABELA').AsString := 'IMPORTADO SPED LINHA ' + IntToStr(i+1) + ' FILIAL ' + edtFilial.Text;
                // TIPO DE MOVIMENTO
                DataSet.FieldByName('CTMOV_TIPOMOVIMENTO').AsString := 'N';

                sequencia := sequencia + 1;
                // GRAVANDO INFORMACOES EP_BASICO
                DataSet.Post;
                DataModulo.IBTransaction.Commit;
                Writeln(comentarios,'Campo: '+spedquebra[campo]+' Conta: '+spedquebra[conta]+' Valor: '+spedquebra[valor]+' DebitoCredito: ' +spedquebra[debitocredito]);
                mmoComentarios.Lines.Add('Campo: '+spedquebra[campo]+' Conta: '+spedquebra[conta]+' Valor: '+spedquebra[valor]+' DebitoCredito: ' +spedquebra[debitocredito]);
              end;
            end;
          except
            on e : Exception do
            begin
              mmoErros.Lines.Add('Erro operacao: ' + e.Message);
              Writeln(erros,'Erro operacao: ' + e.Message);
            end;
          end;
        end
        else
        begin
          Writeln(saldozero,'Saldo Zero, não importado Campo: '+spedquebra[campo]+' Conta: '+spedquebra[conta]+' Valor: '+spedquebra[valor]+' DebitoCredito: ' +spedquebra[debitocredito]);
          mmoComentarios.Lines.Add('Saldo Zero, não importado Campo: '+spedquebra[campo]+' Conta: '+spedquebra[conta]+' Valor: '+spedquebra[valor]+' DebitoCredito: ' +spedquebra[debitocredito]);

          // CONTA CONTABIL
          DataModulo.IBQuery.Close;
          DataModulo.IBQuery.SQL.Clear;
          DataModulo.IBQuery.SQL.Add('SELECT CTPLC_CONTA FROM CT_PLANOCONTA');
          DataModulo.IBQuery.SQL.Add('WHERE CTPLC_CONTAINTEGRACAO LIKE ''%;' + spedquebra[conta] + ';%''');
          DataModulo.IBQuery.Open;
          if not DataModulo.IBQuery.IsEmpty then
          begin
            contacontabil := DataModulo.IBQuery.Fields[0].AsString;
          end
          else
          begin
            DataModulo.IBQuery.Close;
            DataModulo.IBQuery.SQL.Clear;
            DataModulo.IBQuery.SQL.Add('SELECT CTPLC_CONTA FROM CT_PLANOCONTA');
            DataModulo.IBQuery.SQL.Add('WHERE CTPLC_CONTA = :CONTA');
            DataModulo.IBQuery.ParamByName('CONTA').AsString := AnsiReplaceStr(spedquebra[conta],'.','');
            DataModulo.IBQuery.Open;
            if not DataModulo.IBQuery.IsEmpty then
            begin
              contacontabil := DataModulo.IBQuery.Fields[0].AsString;
            end
            else
            begin
              Writeln(erros, 'Conta não localizada ' + spedquebra[conta] + ' (SaldoZero)');
              mmoErros.Lines.Add('Conta não localizada ' + spedquebra[conta] + ' (SaldoZero)') ;
            end;
          end;
        end;
      end
      else
      begin
        if (Trim(spedquebra[campo]) = 'I155') then
        begin
          // CONTA CONTABIL
          DataModulo.IBQuery.Close;
          DataModulo.IBQuery.SQL.Clear;
          DataModulo.IBQuery.SQL.Add('SELECT CTPLC_CONTA FROM CT_PLANOCONTA');
          DataModulo.IBQuery.SQL.Add('WHERE CTPLC_CONTAINTEGRACAO LIKE ''%;' + spedquebra[conta] + ';%''');
          DataModulo.IBQuery.Open;
          if not DataModulo.IBQuery.IsEmpty then
          begin
            contacontabil := DataModulo.IBQuery.Fields[0].AsString;
          end
          else
          begin
            DataModulo.IBQuery.Close;
            DataModulo.IBQuery.SQL.Clear;
            DataModulo.IBQuery.SQL.Add('SELECT CTPLC_CONTA FROM CT_PLANOCONTA');
            DataModulo.IBQuery.SQL.Add('WHERE CTPLC_CONTA = :CONTA');
            DataModulo.IBQuery.ParamByName('CONTA').AsString := AnsiReplaceStr(spedquebra[conta],'.','');
            DataModulo.IBQuery.Open;
            if not DataModulo.IBQuery.IsEmpty then
            begin
              contacontabil := DataModulo.IBQuery.Fields[0].AsString;
            end
            else
            begin
              if (Trim(spedquebra[valor]) <> '0,00') then
              begin
                Writeln(erros, 'Conta não localizada ' + spedquebra[conta] + ' Meses Seguintes');
                mmoErros.Lines.Add('Conta não localizada ' + spedquebra[conta] + ' Meses Seguintes') ;
              end
              else
              begin
                Writeln(erros, 'Conta não localizada ' + spedquebra[conta] + ' Meses Seguintes (SaldoZero)');
                mmoErros.Lines.Add('Conta não localizada ' + spedquebra[conta] + ' Meses Seguintes (SaldoZero)') ;
              end;
            end;
          end;
        end;

      end;
      // INREMENTANDO BARRA DE PROGRESSO
      if i = temporestante then
      begin
        lblTempoEstimado.Caption := FormatDateTime('HH:MM:SS:ZZZ',(((tempo - now) / temporestante) * ((sped.Count -1) - temporestante) ));
        temporestante := temporestante + 5;
      end;
      pbProgresso.Position := pbProgresso.Position + 1;
      lblTempo.Caption := FormatDateTime('HH:MM:SS:ZZZ', tempo - Now);
      Application.ProcessMessages;
    end;
    mmoComentarios.Lines.Add('Total de Debitos: ' + FormatFloat('###,##0.00',totaldebito));
    mmoComentarios.Lines.Add('Total de Creditos: ' + FormatFloat('###,##0.00',totalcredito));
    mmoComentarios.Lines.Add('Total Diferenca: ' + FormatFloat('###,##0.00',totaldebito - totalcredito));
    Writeln(comentarios,'Total de Debitos: ' + FormatFloat('###,##0.00',totaldebito));
    Writeln(comentarios,'Total de Creditos: ' + FormatFloat('###,##0.00',totalcredito));
    Writeln(comentarios,'Total Diferenca: ' + FormatFloat('###,##0.00',totaldebito - totalcredito));
    CloseFile(erros);
    CloseFile(comentarios);
    CloseFile(saldozero);

    ShowMessage('Processo Concluído!');
  end
  else
  begin
    ShowMessage('Campos Obrigatorios nao preenchidos!');
  end;
end;

procedure TF_CT_MOVIMENTO.btnPararClick(Sender: TObject);
begin
  parar := 'S';
end;

procedure TF_CT_MOVIMENTO.btnSelecionarArquivoClick(Sender: TObject);
begin
  try
    dlgOpen.Title := 'Abrir Arquivo';
    if dlgOpen.Execute then
    begin
      edtCaminhoArquivo.Text := dlgOpen.FileName;
    end;
  except
    on e:exception do
    begin
      ShowMessage(e.message);
    end;
  end;
end;

procedure TF_CT_MOVIMENTO.btnValidarContaIntegracaoDuplicadaClick(
  Sender: TObject);
var
  tempo : TDateTime;
  containtegracao : TStringList;
  quantidadecontas, i, temporestante : integer;
begin
  if edtVersaoPlanoContas.Text <> '' then
  begin
    containtegracao := TStringList.Create;
    lblTempo.Caption := '00:00:00:000';
    tempo := Now;
    temporestante := 5;

    DataModulo.IBQuery.Close;
    DataModulo.IBQuery.SQL.Clear;
    DataModulo.IBQuery.SQL.Add('SELECT C.ctplc_conta, C.ctplc_containtegracao FROM CT_PLANOCONTA C');
    DataModulo.IBQuery.SQL.Add(' WHERE C.ctplc_containtegracao IS NOT NULL ');
    DataModulo.IBQuery.SQL.Add(' AND C.ctver_codigo = :CTVER_CODIGO ');
    DataModulo.IBQuery.ParamByName('CTVER_CODIGO').AsInteger := StrToInt(edtVersaoPlanoContas.Text);
    DataModulo.IBQuery.Open;
    DATAMODULO.IBQuery.FetchAll;

    DATAMODULO.IBQuery.First;
    if not DataModulo.IBQuery.IsEmpty then
    begin
      // BARRA DE PROGRESSO
      pbProgresso.Max := DATAMODULO.IBQuery.RecordCount -1;
      pbProgresso.Position := 0;

      while not DataModulo.IBQuery.Eof do
      begin
        quantidadecontas := 0;
        for i := 0 to Length(DataModulo.IBQuery.FieldByName('ctplc_containtegracao').AsString) do
        begin
          if DataModulo.IBQuery.FieldByName('ctplc_containtegracao').AsString[i] = ';' then
            quantidadecontas := quantidadecontas + 1;
        end;

        containtegracao.StrictDelimiter := True;
        containtegracao.Delimiter := ';';
        containtegracao.DelimitedText := DataModulo.IBQuery.FieldByName('ctplc_containtegracao').AsString;

        for i := 0 to quantidadecontas - 1 do
        begin
          if containtegracao[i] <> '' then
          begin
            DataModulo.IBQuery1.Close;
            DataModulo.IBQuery1.SQL.Clear;
            DataModulo.IBQuery1.SQL.Add('SELECT C.ctplc_conta, C.ctplc_containtegracao FROM CT_PLANOCONTA C');
            DataModulo.IBQuery1.SQL.Add(' WHERE C.ctplc_containtegracao LIKE ''%;' + containtegracao[i] +';%''');
            DataModulo.IBQuery1.SQL.Add(' AND C.ctver_codigo = :CTVER_CODIGO ');
            DataModulo.IBQuery1.ParamByName('CTVER_CODIGO').AsInteger := StrToInt(edtVersaoPlanoContas.Text);
            DataModulo.IBQuery1.Open;
            DataModulo.IBQuery1.FetchAll;
            if DataModulo.IBQuery1.RecordCount = 1 then mmoComentarios.Lines.Add('Conta integracao ok: ' + containtegracao[i])
            else begin
              mmoErros.Lines.Add('Conta integracao: ' + containtegracao[i] + ' Cadastrada para as contas');
              while not DataModulo.IBQuery1.Eof do
              begin
                mmoErros.Lines.Add(DataModulo.IBQuery1.FieldByName('ctplc_conta').AsString);
                DataModulo.IBQuery1.Next;
              end;
            end;
          end;
        end;
        DataModulo.IBQuery.Next;
        if pbProgresso.Position = temporestante then
        begin
          lblTempoEstimado.Caption := FormatDateTime('HH:MM:SS:ZZZ',(((tempo - now) / temporestante) * ((DATAMODULO.IBQuery.RecordCount -1) - temporestante) ));
          temporestante := temporestante + 5;
        end;
        pbProgresso.Position := pbProgresso.Position + 1;
        lblTempo.Caption := FormatDateTime('HH:MM:SS:ZZZ', tempo - Now);
        Application.ProcessMessages;
      end;
    end;
    ShowMessage('Processo Finalizado!');
  end
  else
  begin
    edtVersaoPlanoContas.SetFocus;
    ShowMessage('Informe a versao do plano de contas');
  end;
end;

procedure TF_CT_MOVIMENTO.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  F_CT_MOVIMENTO := nil;
end;

end.
