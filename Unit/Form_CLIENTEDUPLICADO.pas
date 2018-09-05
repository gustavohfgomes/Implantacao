unit Form_CLIENTEDUPLICADO;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, IBX.IBCustomDataSet,
  IBX.IBQuery, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ComCtrls;

type
  TF_CLIENTEDUPLICADO = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    dbgrdCliente: TDBGrid;
    IBQueryCliente: TIBQuery;
    dsCliente: TDataSource;
    IBQueryClienteCLN_CODIGO: TIntegerField;
    IBQueryClienteCLN_CPFCNPJ: TIBStringField;
    IBQueryClienteCLN_NOME: TIBStringField;
    btnBuscar: TBitBtn;
    IBQueryCliente2: TIBQuery;
    IntegerField1: TIntegerField;
    IBStringField1: TIBStringField;
    IBStringField2: TIBStringField;
    pnl3: TPanel;
    spl1: TSplitter;
    mmoCliente: TMemo;
    pbProgresso: TProgressBar;
    lbl2: TLabel;
    lblTempo: TLabel;
    lbl7: TLabel;
    lblTempoEstimado: TLabel;
    btnParar: TButton;
    IBQueryExcluir: TIBQuery;
    IBQueryExcluirHistoricoCredito: TIBQuery;
    rgClienteFornecedor: TRadioGroup;
    edtCodigoDivisor: TEdit;
    lbl1: TLabel;
    chkInativar: TCheckBox;
    IBQueryInativar: TIBQuery;
    procedure btnBuscarClick(Sender: TObject);
    procedure btnPararClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_CLIENTEDUPLICADO: TF_CLIENTEDUPLICADO;
  parar : string;

implementation

uses
  MODULO;

{$R *.dfm}

procedure TF_CLIENTEDUPLICADO.btnBuscarClick(Sender: TObject);
var
  tempo : TDateTime;
  temporestante, i : Integer;
begin
  // INICIALIZANDO VARIAVEIS
  lblTempo.Caption := '00:00:00:000';
  i := 0;
  temporestante := 5;
  tempo := Now;
  mmoCliente.Clear;
  parar := 'N';

  IBQueryCliente2.Close;
  IBQueryCliente2.SQL.Clear;
  IBQueryCliente2.SQL.Add('SELECT CLIENTE.CLN_CODIGO,                           '+
                          '               CLIENTE.CLN_CPFCNPJ,                  '+
                          '               CLIENTE.CLN_NOME                      '+
                          '  FROM CLIENTE                                       '+
                          '  WHERE CLIENTE.CLN_CPFCNPJ = :CLN_CPFCNPJ           '+
                          '      AND CLIENTE.CLN_CODIGO <> :CLN_CODIGO          '+
                          '      AND CLIENTE.CLN_CODIGO > :CLN_CODIGO           ');
  case rgClienteFornecedor.ItemIndex of
    0 : IBQueryCliente2.SQL.Add(' AND CLIENTE.CLN_CODIGO < ' + edtCodigoDivisor.Text);
    1 : IBQueryCliente2.SQL.Add(' AND CLIENTE.CLN_CODIGO > ' + edtCodigoDivisor.Text);
  end;
  IBQueryCliente2.SQL.Add(' ORDER BY CLN_CODIGO ');

  IBQueryCliente.Close;
  IBQueryCliente.SQL.Clear;
  IBQueryCliente.SQL.Add('SELECT CLIENTE.CLN_CODIGO,                            '+
                         '                CLIENTE.CLN_CPFCNPJ,                  '+
                         '                CLIENTE.CLN_NOME                      '+
                         '   FROM CLIENTE                                       ');
  case rgClienteFornecedor.ItemIndex of
    0 : IBQueryCliente.SQL.Add(' WHERE CLIENTE.CLN_CODIGO < :DIVISOR ');
    1 : IBQueryCliente.SQL.Add(' WHERE CLIENTE.CLN_CODIGO > :DIVISOR ');
  end;
  IBQueryCliente.SQL.Add(' ORDER BY CLN_CODIGO ');

  IBQueryCliente.ParamByName('DIVISOR').AsInteger := StrToInt(edtCodigoDivisor.Text);

  IBQueryCliente.Open;
  IBQueryCliente.FetchAll;
  IBQueryCliente.First;

  // BARRA DE PROGRESSO
  pbProgresso.Max := IBQueryCliente.RecordCount -1;
  pbProgresso.Position := 0;

  while not IBQueryCliente.Eof do
  begin
    if parar = 'S' then Break;

    IBQueryCliente2.Close;
    IBQueryCliente2.ParamByName('CLN_CPFCNPJ').AsString := IBQueryCliente.FieldByName('CLN_CPFCNPJ').AsString;
    IBQueryCliente2.ParamByName('CLN_CODIGO').AsString := IBQueryCliente.FieldByName('CLN_CODIGO').AsString;
    IBQueryCliente2.Open;

    if not IBQueryCliente2.IsEmpty then
    begin
      IBQueryCliente2.First;
      while not IBQueryCliente2.Eof do
      begin
        mmoCliente.Lines.Add('CLIENTE DUPLICADO '
                              + IBQueryCliente.FieldByName('CLN_CODIGO').AsString + ' = '
                              + IBQueryCliente2.FieldByName('CLN_CODIGO').AsString + '    '
                              + IBQueryCliente.FieldByName('CLN_NOME').AsString);

        try
          IBQueryExcluirHistoricoCredito.Close;
          IBQueryExcluirHistoricoCredito.ParamByName('CLN_CODIGO').AsInteger := IBQueryCliente2.FieldByName('CLN_CODIGO').AsInteger;
          IBQueryExcluirHistoricoCredito.ExecSQL;

          IBQueryExcluir.Close;
          IBQueryExcluir.ParamByName('CLN_CODIGO').AsInteger := IBQueryCliente2.FieldByName('CLN_CODIGO').AsInteger;
          IBQueryExcluir.ExecSQL;

          DATAMODULO.IBTransaction.CommitRetaining;
          mmoCliente.Lines.Add('CLIENTE EXCLUIDO  ****** ' + IBQueryCliente2.FieldByName('CLN_CODIGO').AsString);
          mmoCliente.Lines.Add('');
        Except
          on e : Exception do
          begin
            DATAMODULO.IBTransaction.RollbackRetaining;
            mmoCliente.Lines.Add('ERRO AO EXCLUIR ****** ' + E.Message);
            try
              IBQueryInativar.Close;
              IBQueryInativar.ParamByName('CLN_CODIGO').AsInteger := IBQueryCliente2.FieldByName('CLN_CODIGO').AsInteger;
              IBQueryInativar.ExecSQL;
              DATAMODULO.IBTransaction.CommitRetaining;
              mmoCliente.Lines.Add('INATIVADO CLIENTE ****** ' + IBQueryCliente2.FieldByName('CLN_CODIGO').AsString);
            Except
              on e : Exception do
              begin
                mmoCliente.Lines.Add('ERRO AO INATIVAR ****** ' + E.Message);
              end;
            end;
            mmoCliente.Lines.Add('');
          end;
        end;
        IBQueryCliente2.Next;
      end;
    end;
    IBQueryCliente.Next;

    // INREMENTANDO BARRA DE PROGRESSO
    if i = temporestante then
    begin
      lblTempoEstimado.Caption := FormatDateTime('HH:MM:SS:ZZZ',(((tempo - now) / temporestante) * ((IBQueryCliente.FieldCount -1) - temporestante) ));
      temporestante := temporestante + 5;
    end;
    pbProgresso.Position := pbProgresso.Position + 1;
    lblTempo.Caption := FormatDateTime('HH:MM:SS:ZZZ', tempo - Now);
    i := i + 1;
    Application.ProcessMessages;
  end;
  ShowMessage('Processo Concluido!');

end;

procedure TF_CLIENTEDUPLICADO.btnPararClick(Sender: TObject);
begin
  parar := 'S';
end;

end.
