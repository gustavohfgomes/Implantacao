unit CT_PLANOCONTA_CONTAINTEGRACAO;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.ExtCtrls,
  Data.DB, IBX.IBCustomDataSet, MODULO, System.StrUtils;

type
  TF_CT_PLANOCONTA_INTEGRACAO = class(TForm)
    pnlTexto: TPanel;
    lbl1: TLabel;
    lbl2: TLabel;
    lblTempo: TLabel;
    lbl7: TLabel;
    lblTempoEstimado: TLabel;
    lbl6: TLabel;
    edtCaminhoArquivo: TEdit;
    btnSelecionarArquivo: TButton;
    btnInserirDados: TButton;
    pbProgresso: TProgressBar;
    btnParar: TButton;
    edtVersao: TEdit;
    pnl2: TPanel;
    dlgOpen: TOpenDialog;
    DataSet: TIBDataSet;
    mmoErros: TMemo;
    pnl1: TPanel;
    mmoComentarios: TMemo;
    pnl3: TPanel;
    pnl4: TPanel;
    stBar1: TStatusBar;
    spl1: TSplitter;
    procedure btnPararClick(Sender: TObject);
    procedure btnSelecionarArquivoClick(Sender: TObject);
    procedure btnInserirDadosClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_CT_PLANOCONTA_INTEGRACAO: TF_CT_PLANOCONTA_INTEGRACAO;
  parar : string;

implementation

{$R *.dfm}

procedure TF_CT_PLANOCONTA_INTEGRACAO.btnInserirDadosClick(Sender: TObject);
var
  tempo : TDateTime;
  temporestante, i : Integer;
  conta, contaquebra : TStringList;
  contatcar, contaterceiro : Integer;
begin
  if (edtCaminhoArquivo.Text <> '')
    and (edtVersao.Text <> '')
  then
  begin
    contatcar := 2-1;
    contaterceiro := 1-1;

    // INICIALIZANDO VARIAVEIS
    lblTempo.Caption := '00:00:00:000';
    tempo := Now;
    mmoComentarios.Clear;
    mmoErros.Clear;
    parar := 'N';
    temporestante := 5;

    // LENDO O ARQUIVO COMPLETO
    try
      contaquebra := TStringList.Create;
      conta := TStringList.Create;
      conta.LoadFromFile(edtCaminhoArquivo.Text);
      ShowMessage('Quantidade de Registros:  ' + IntToStr(conta.Count -1));
      // BARRA DE PROGRESSO
      pbProgresso.Max := conta.Count -1;
      pbProgresso.Position := 0;
    except
      on e:exception do
      begin
        ShowMessage(e.message);
      end;
    end;
    // QUEBRANDO O ARQUIVO PELO DELIMITADOR E LENDO E INSERINDO LINHA A LINHA
    for i := 0 to conta.Count -1 do
    begin
      // DELIMITANDO TEXTO
      contaquebra.StrictDelimiter := True;
      contaquebra.Delimiter := ';';
      contaquebra.DelimitedText := conta[i];

      // VERIFICANDO SITUACAO PROCESSO
      if parar = 'S' then Break;
      try
        // VERIFICANDO SE O ITEM POSSUI CADASTRO CASO POSSUA ATUALIZA
        DataSet.Close;
        DataSet.ParamByName('VERSAO').AsInteger := StrToInt(edtVersao.Text);
        DataSet.ParamByName('CODIGO').AsString := AnsiReplaceStr(contaquebra[contatcar],'.','');
        DataSet.Open;
        // CASO NAO ESTAJA CADASTRADO CADASTRA
        if DataSet.IsEmpty then
        begin
          mmoErros.Lines.Add('Conta nao cadastrada no TCar: ' + contaquebra[contatcar]);
        end
        else
        begin
          DataSet.Edit;
          // CASO ESTEJA CADASTRADO EDITA
          if contaquebra[contaterceiro] <> '' then
          begin
            if DataSet.FieldByName('CTPLC_CONTAINTEGRACAO').AsString = '' then
              DataSet.FieldByName('CTPLC_CONTAINTEGRACAO').AsString := ';' + contaquebra[contaterceiro] + ';'
            else  DataSet.FieldByName('CTPLC_CONTAINTEGRACAO').AsString := DataSet.FieldByName('CTPLC_CONTAINTEGRACAO').AsString +  contaquebra[contaterceiro] + ';' ;
            mmoComentarios.Lines.Add('Adicionado a conta: ' + contaquebra[contatcar] + ' Conta(s): ' + DataSet.FieldByName('CTPLC_CONTAINTEGRACAO').AsString);

            DataSet.Post;
            DATAMODULO.IBTransaction.Commit;
          end
          else
          begin
            mmoErros.Lines.Add('Conta outro sistema em branco!');
          end;
        end;
      except
        on e : Exception do
          mmoErros.Lines.Add('Erro ao atualizar conta: '+ contaquebra[contaterceiro] + e.Message)
      end;

      // INCREMENTANDO BARRA DE PROGRESSO
      if i = temporestante then
      begin
        lblTempoEstimado.Caption := FormatDateTime('HH:MM:SS:ZZZ',(((tempo - now) / temporestante) * ((conta.Count -1) - temporestante) ));
        temporestante := temporestante + 5;
      end;
      pbProgresso.Position := pbProgresso.Position + 1;
      lblTempo.Caption := FormatDateTime('HH:MM:SS:ZZZ', tempo - Now);
      Application.ProcessMessages;
    end;
    ShowMessage('Processo Concluído!');
  end
  else
  begin
    ShowMessage('Arquivo ou Versão não selecionados!');
  end;
end;

procedure TF_CT_PLANOCONTA_INTEGRACAO.btnPararClick(Sender: TObject);
begin
  parar := 'S';
end;

procedure TF_CT_PLANOCONTA_INTEGRACAO.btnSelecionarArquivoClick(
  Sender: TObject);
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

end.
