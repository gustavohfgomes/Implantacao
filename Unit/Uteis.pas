unit Uteis;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  MODULO, System.IniFiles, Vcl.ComCtrls, ShellApi,
  Vcl.CheckLst, System.AnsiStrings, Winapi.TlHelp32, Winapi.ShlObj, Winapi.ActiveX,
  System.Win.ComObj, System.Win.Registry, IdFTP, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdExplicitTLSClientServerBase, IBX.IBDatabase,
  Vcl.Samples.Gauges, Vcl.Imaging.jpeg, IdMessage, IdMessageClient, IdSMTPBase,
  IdSMTP, System.StrUtils, Data.DB, Vcl.Grids, Vcl.DBGrids, IBX.IBCustomDataSet,
  IBX.IBQuery, IBX.IBTable, Datasnap.DBClient, Vcl.DBCtrls, Vcl.Themes, Vcl.FileCtrl;



  // FUNCOES
  function ConectarBancoDados(Database : TIBDatabase; Base, Usuario, Senha : string) : Boolean;
  function ListaDrives : TStringList;
  function NomeComputador : String;
  function NomeUsuario : String;
  function ListarArquivosDiretorio(Diretorio: string; Extensao: string) : TStringList;
  function TemAtributo(Attr, Val: Integer): Boolean;
  function isCNPJ(CNPJ: string): boolean;
  function imprimeCNPJ(CNPJ: string): string;

  // PROCEDURES
  procedure CriarFormulario(aClasseForm: TComponentClass; var aForm);
  procedure LimparDiretorio(Diretorio, Extensao : string);
  procedure CriarAtalho (FileName, Parameters, InitialDir, ShortcutName, ShortcutFolder : String);
  procedure MarcarTodosCheckList (Sender : TObject);


implementation



function ConectarBancoDados(Database : TIBDatabase; Base, Usuario, Senha : string) : Boolean;
begin
  try
    Database.Close;
    Database.DatabaseName := Base;
    Database.Params.Clear;
    Database.Params.Add('user_name=' + Usuario);
    Database.Params.Add('password='  + Senha);
    Database.Open;
    Result := True;
  except
    on e : Exception do
    begin
      Result := False;
    end;
  end;
end;

function ListaDrives : TStringList;
var
  Lista : TStringList;
  DriveNum : Integer;
  LetraDrive : Char;
  DriveBits : set of 0..25;
  TipoDrive : TDriveType;
begin
  Lista := TStringList.Create;
  Integer (DriveBits) := GetLogicalDrives;
  for DriveNum := 0 to 25 do
    begin
      if not (DriveNum in DriveBits) then
        Continue;
      LetraDrive := UpCase (Char (DriveNum + ord ('a')));
      TipoDrive := TDriveType (GetDriveType (PChar (LetraDrive + ':')));
      case TipoDrive of
        //dtFloppy : Lista.Add ('Drive ' + LetraDrive + ': - Disco flexível');
        dtFixed  : Lista.Add (LetraDrive + ':\');
        //dtCDROM  : Lista.Add ('Drive ' + LetraDrive + ': - CD-ROM');
        //dtRAM    : Lista.Add ('Drive ' + LetraDrive + ': - RAM Disk');
        //dtNetwork: Lista.Add ('Drive ' + LetraDrive + ': - Drive derede');
      end;
    end;
  Result := Lista;
end;



function NomeComputador : String;
var
  lpBuffer : PChar;
  nSize : DWord;
const
  Buff_Size = MAX_COMPUTERNAME_LENGTH + 1;
begin
  nSize := Buff_Size;
  lpBuffer := StrAlloc(Buff_Size);
  GetComputerName(lpBuffer,nSize);
  Result := String(lpBuffer);
  StrDispose(lpBuffer);
end;

function NomeUsuario : String;
var
  lpBuffer : PChar;
  nSize : DWord;
const
  Buff_Size = MAX_COMPUTERNAME_LENGTH + 1;
begin
  nSize := Buff_Size;
  lpBuffer := StrAlloc(Buff_Size);
  GetUserName(lpBuffer,nSize);
  Result := String(lpBuffer);
  StrDispose(lpBuffer);
end;

function ListarArquivosDiretorio(Diretorio: string; Extensao: string) : TStringList;
var
  F: TSearchRec;
  Ret, i: Integer;
  TempNome: string;
  Arquivos : TStringList;
begin
  Arquivos := TStringList.Create;
  Ret := FindFirst(Diretorio+'\*.' + Extensao, faAnyFile, F);
  try
    while Ret = 0 do
    begin
      if TemAtributo(F.Attr, faDirectory) then
      begin
        if (F.Name <> '.') And (F.Name <> '..') then
        begin
          TempNome := Diretorio+'\'+ F.Name;
        end;
      end
      else
      begin
        if F.Name <> '..' then
        begin
          try
            Arquivos.Add(F.Name);
          except
            on e:exception do
            begin
              ShowMessage(F.Name +#13+ e.message);
            end;
          end;
        end;
      end;
      Ret := FindNext(F);
    end;
    Result := Arquivos;
  finally
    begin
      FindClose(F);
    end;
  end;
end;

function TemAtributo(Attr, Val: Integer): Boolean;
begin
  Result := Attr and Val = Val;
end;


procedure CriarAtalho (FileName, Parameters, InitialDir, ShortcutName, ShortcutFolder : String);
var
  MyObject : IUnknown;
  MySLink : IShellLink;
  MyPFile : IPersistFile;
  Directory : String;
  WFileName : WideString;
  MyReg : TRegIniFile;
begin
  MyObject := CreateComObject(CLSID_ShellLink);
  MySLink := MyObject as IShellLink;
  MyPFile := MyObject as IPersistFile;
  with MySLink do
  begin
    SetArguments(PWideChar(Parameters));
    SetPath(PChar(FileName));
    SetWorkingDirectory(PChar(InitialDir));
  end;
  MyReg := TRegIniFile.Create('Software\MicroSoft\Windows\CurrentVersion\Explorer');
  Directory := MyReg.ReadString ('Shell Folders','Desktop','');
  WFileName := Directory + '\' + ShortcutName + '.lnk';
  MyPFile.Save (PWChar (WFileName), False);
  MyReg.Free;
end;

procedure CriarFormulario(aClasseForm: TComponentClass; var aForm);
begin
  Application.CreateForm(aClasseForm, aForm);
  try
    TForm(aForm).ShowModal;
  finally
    FreeAndNil(TForm(aForm));
  end;
end;

procedure LimparDiretorio(Diretorio, Extensao : string);
var
  I: integer;
  sr: TSearchRec;
begin
  I := FindFirst(Diretorio + '*.' + Extensao, faAnyFile, SR);
  while I = 0 do
  begin
    DeleteFile(Diretorio + SR.Name);
    I := FindNext(SR);
  end;
end;

procedure MarcarTodosCheckList (Sender : TObject);
var
  i : Integer;
begin
  for i:= 0 to TCheckListBox(Sender).Items.Count -1 do
  begin
    TCheckListBox(Sender).Checked[i] := True;
  end;
end;



function isCNPJ(CNPJ: string): boolean;
var   dig13, dig14: string;
      sm, i, r, peso: integer;
begin
  if CNPJ <> '11111111111111' then
  begin
  // length - retorna o tamanho da string do CNPJ (CNPJ é um número formado por 14 dígitos)
    if ((CNPJ = '00000000000000') or (CNPJ = '11111111111111') or
      (CNPJ = '22222222222222') or (CNPJ = '33333333333333') or
      (CNPJ = '44444444444444') or (CNPJ = '55555555555555') or
      (CNPJ = '66666666666666') or (CNPJ = '77777777777777') or
      (CNPJ = '88888888888888') or (CNPJ = '99999999999999') or
      (length(CNPJ) <> 14))
    then
    begin
      isCNPJ := false;
      exit;
    end;

  // "try" - protege o código para eventuais erros de conversão de tipo através da função "StrToInt"

    try { *-- Cálculo do 1o. Digito Verificador --* }
      sm := 0;
      peso := 2;
      for i := 12 downto 1 do
      begin
        // StrToInt converte o i-ésimo caractere do CNPJ em um número
        sm := sm + (StrToInt(CNPJ[i]) * peso);
        peso := peso + 1;
        if (peso = 10)
        then peso := 2;
      end;
      r := sm mod 11;
      if ((r = 0) or (r = 1))
      then dig13 := '0'
      else str((11-r):1, dig13); // converte um número no respectivo caractere numérico

      { *-- Cálculo do 2o. Digito Verificador --* }
      sm := 0;
      peso := 2;
      for i := 13 downto 1 do
      begin
        sm := sm + (StrToInt(CNPJ[i]) * peso);
        peso := peso + 1;
        if (peso = 10)
        then peso := 2;
      end;
      r := sm mod 11;
      if ((r = 0) or (r = 1))
      then dig14 := '0'
      else str((11-r):1, dig14);
    { Verifica se os digitos calculados conferem com os digitos informados. }
      if ((dig13 = CNPJ[13]) and (dig14 = CNPJ[14]))
      then isCNPJ := true
      else isCNPJ := false;

    except
        isCNPJ := false
    end;
  end
  else
  begin
    isCNPJ := True;
  end;
end;

function imprimeCNPJ(CNPJ: string): string;
begin
  { máscara do CNPJ: 99.999.999/9999-99 }
  imprimeCNPJ := copy(CNPJ, 1, 2) + '.' + copy(CNPJ, 3, 3) + '.' +
  copy(CNPJ, 6, 3) + '/' + copy(CNPJ, 9, 4) + '-' + copy(CNPJ, 13, 2);
end;


end.
