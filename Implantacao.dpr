program Implantacao;

{$R 'Win7UAC.res' 'Win32\Debug\Win7UAC.rc'}

uses
  Vcl.Forms,
  IMPLANTACAOTCAR in 'Unit\IMPLANTACAOTCAR.pas' {F_IMPLANTACAO},
  Vcl.Themes,
  Vcl.Styles,
  MODULO in 'Unit\MODULO.pas' {DATAMODULO: TDataModule},
  CT_MOVIMENTO in 'Unit\CT_MOVIMENTO.pas' {F_CT_MOVIMENTO},
  CT_PLANOCONTA_CONTAINTEGRACAO in 'Unit\CT_PLANOCONTA_CONTAINTEGRACAO.pas' {F_CT_PLANOCONTA_INTEGRACAO},
  Uteis in 'Unit\Uteis.pas',
  MODULOBASECOPIAR in 'Unit\MODULOBASECOPIAR.pas' {BASECOPIAR: TDataModule},
  Form_CLIENTEDUPLICADO in 'Unit\Form_CLIENTEDUPLICADO.pas' {F_CLIENTEDUPLICADO},
  Dados in 'Unit\Dados.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Silver');
  Application.CreateForm(TF_IMPLANTACAO, F_IMPLANTACAO);
  Application.CreateForm(TDATAMODULO, DATAMODULO);
  Application.CreateForm(TBASECOPIAR, BASECOPIAR);
  Application.Run;
end.
