unit Dados;

interface
  uses System.IniFiles, Winapi.Windows, System.SysUtils, Vcl.Forms, Vcl.Dialogs,
  Winapi.TlHelp32, ShellApi, System.StrUtils, System.Classes;

  function DADOS_CONEXAO(IP,BASE,USUARIO,SENHA : string) : Boolean;
  function DADOS_LERINIFILE (ARQUIVO,BLOCO,CAMPO : string) : string;
  function DADOS_PROCESSOEXISTE(Executavel: string): Boolean;
  function DADOS_ARQUITETURASISTEMA : Boolean;
  function DADOS_INSTALARFIREBIRD : Boolean;
  function DADOS_EXECUTAREAGUARDAR(Operation, FileName, Parameter, Directory:
            String; Show: Word; bWait: Boolean): Longint;
  function DADOS_EXECUTARCOMANDODOS(Comandos : TStringList) : string;
  function DADOS_CRIARDIRETORIO(Diretorio : String) : String;
  function DADOS_INSTALARIBEXPERT : Boolean;
  function DADOS_LIMPARCNPJ(CNPJ : string) : string;
  function DADOS_MODULOPG116(MODULO : Integer) : string;
  function DADOS_COPIARPG116(CODIGOMODULO: string; FLL_ORIGEM: string; FLL_NOVA: string) : string;
  function DADOS_EXCLUIRPACKAGE(PACKAGE : Integer) : string;

  procedure DADOS_GRAVARINIFILE (ARQUIVO,BLOCO,CAMPO,INFORMACAO : string);
  procedure DADOS_COPIARDIRETORIO(Origem, Destino: String);

implementation

uses
  MODULO;

function DADOS_CONEXAO(IP,BASE,USUARIO,SENHA : string) : Boolean;
begin
  try
    with DATAMODULO.IBDatabase do
    begin
      Close;
      DatabaseName := IP +':'+ Base;
      Params.Clear;
      Params.Add('user_name=' + USUARIO);
      Params.Add('password='  + SENHA);
      Params.Add('lc_ctype=WIN1252');
      Open;
      if Connected then  Result := True
      else Result := False;
    end;
  except
    on e: Exception do
    begin
      MessageDlg('Erro de Conexão: ' +#13+ e.Message, mtError, [mbOK],0);
      Result := False;
    end;
  end;
end;

procedure DADOS_GRAVARINIFILE (ARQUIVO,BLOCO,CAMPO,INFORMACAO : string);
var INIFILE : TIniFile;
begin
  INIFILE := TIniFile.Create(ARQUIVO);
  INIFILE.WriteString(BLOCO,CAMPO,Trim(INFORMACAO));
  INIFILE.Free;
end;

function DADOS_LERINIFILE (ARQUIVO,BLOCO,CAMPO : string) : string;
var INIFILE : TIniFile;
  RET : string;
begin
  INIFILE := TIniFile.Create(ARQUIVO);
  RET := INIFILE.ReadString(BLOCO,CAMPO,'');
  INIFILE.Free;
  Result := RET;
end;

function DADOS_INSTALARFIREBIRD : Boolean;
begin
  if   (((not DADOS_PROCESSOEXISTE('fbserver.exe'))
    or (not DADOS_PROCESSOEXISTE('fbguard.exe'))))
  then
  begin
    if MessageDlg('Firebird não iniciado ou instalado!!' +#13+ 'Deseja instalar agora?' ,mtConfirmation,[mbYes,mbNo],0) = 6 then
    begin
      if DADOS_ARQUITETURASISTEMA then
      begin
        DADOS_EXECUTAREAGUARDAR('open', PWideChar(ExtractFilePath(Application.ExeName)+'Firebird64.exe'), '','', SW_SHOWNORMAL, True);
      end
      else
      begin
        DADOS_EXECUTAREAGUARDAR('open', PWideChar(ExtractFilePath(Application.ExeName)+'Firebird32.exe'), '','', SW_SHOWNORMAL, True);
      end;
      if   (((not DADOS_PROCESSOEXISTE('fbserver.exe'))
          or (not DADOS_PROCESSOEXISTE('fbguard.exe'))))
      then Result := False
      else Result := True;
    end
    else
    begin
      Result := False;
    end;
  end
  else
  begin
    Result := True;
  end;
end;

function DADOS_PROCESSOEXISTE(Executavel: string): Boolean;
var
  ContinueLoop: BOOL;
  FSnapshotHandle: THandle;
  FProcessEntry32: TProcessEntry32;
begin
  FSnapshotHandle := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
  FProcessEntry32.dwSize := SizeOf(FProcessEntry32);
  ContinueLoop := Process32First(FSnapshotHandle, FProcessEntry32);
  Result := False;
  while Integer(ContinueLoop) <> 0 do
  begin
    if ((UpperCase(ExtractFileName(FProcessEntry32.szExeFile)) =
      UpperCase(Executavel)) or (UpperCase(FProcessEntry32.szExeFile) =
      UpperCase(Executavel))) then
    begin
      Result := True;
    end;
    ContinueLoop := Process32Next(FSnapshotHandle, FProcessEntry32);
  end;
  CloseHandle(FSnapshotHandle);
end;

function DADOS_ARQUITETURASISTEMA : Boolean;
const
  PROCESSOR_ARCHITECTURE_INTEL = $0000;
  PROCESSOR_ARCHITECTURE_IA64 = $0006;
  PROCESSOR_ARCHITECTURE_AMD64 = $0009;
  PROCESSOR_ARCHITECTURE_UNKNOWN = $FFFF;
var
  xSysInfo: TSystemInfo;
begin
  GetNativeSystemInfo(xSysInfo);
  case xSysInfo.wProcessorArchitecture of
    PROCESSOR_ARCHITECTURE_AMD64, PROCESSOR_ARCHITECTURE_IA64:
      Result := True;
  else
    Result := False;
  end;
end;

function DADOS_EXECUTAREAGUARDAR(Operation, FileName, Parameter, Directory:
          String; Show: Word; bWait: Boolean): Longint;
var
  bOK: Boolean;
  Info: TShellExecuteInfo;
begin
  FillChar(Info, SizeOf(Info), Chr(0));
  Info.cbSize := SizeOf(Info);
  Info.fMask := SEE_MASK_NOCLOSEPROCESS;
  Info.lpVerb := PChar(Operation);
  Info.lpFile := PChar(FileName);
  Info.lpParameters := PChar(Parameter);
  Info.lpDirectory := PChar(Directory);
  Info.nShow := Show;
  bOK := Boolean(ShellExecuteEx(@Info));
  if bOK then
  begin
    if bWait then
    begin
      while WaitForSingleObject(Info.hProcess, 100) = WAIT_TIMEOUT do
        Application.ProcessMessages;
      bOK := GetExitCodeProcess(Info.hProcess, DWORD(Result));
    end
    else
      Result := 0;
  end;
  if not bOK then
    Result := -1;
end;

function DADOS_EXECUTARCOMANDODOS(Comandos : TStringList) : string;
var
  I: Integer;
  Executar : TextFile;
begin
  AssignFile (Executar, ExtractFilePath(Application.ExeName) + 'Executar.cmd');
  Rewrite (Executar);
  for I := 0 to Comandos.Count -1 do
  begin
    Writeln(Executar, Comandos[I]);
  end;
  CloseFile(executar);
  DADOS_EXECUTAREAGUARDAR('open', PWideChar(ExtractFilePath(Application.ExeName)+'Executar.cmd'), '','', SW_SHOWMAXIMIZED, True);
end;

procedure DADOS_COPIARDIRETORIO(Origem, Destino: String);
var
   Parametros: Pchar;
   I: integer;
begin
  try
   Parametros := Pchar('"' + Origem + '" "' + Destino + '" /S /Y ');
   I := DADOS_EXECUTAREAGUARDAR('open', 'xCopy', Parametros, '', SW_SHOWMAXIMIZED, True);
  Except
    on E:Exception do
      ShowMessage('Erro ao copiar: '+E.Message);
  end;
end;

function DADOS_CRIARDIRETORIO(Diretorio : String) : String;
begin
  if not DirectoryExists(Diretorio) then
  begin
    try
      ForceDirectories(Diretorio);
      Result := 'Criado Diretório: ' + Diretorio;
    except
      on e:exception do
      begin
        Result := 'Não foi possivel criar o diretorio: ' + Diretorio + ' Erro: ' + e.Message;
      end;
    end;
  end
  else
  begin
    Result := 'Diretório já existe: ' + Diretorio;
  end;
end;

function DADOS_INSTALARIBEXPERT : Boolean;
begin
  if FileExists('C:\Program Files (x86)\HK-Software\IBExpert\ibexpert.exe') then // VERIFICANDO SE A BASE EXISTE
  begin
    Result := True;
  end
  else
  begin
    try
      DADOS_EXECUTAREAGUARDAR('open', PWideChar(ExtractFilePath(Application.ExeName)+'IBExpert\setup_trial.exe'), '','', SW_SHOWNORMAL, True);
      DADOS_EXECUTAREAGUARDAR('open', PWideChar(ExtractFilePath(Application.ExeName)+'IBExpert\IBEScript.exe'), '','', SW_SHOWNORMAL, True);
      DADOS_COPIARDIRETORIO(ExtractFilePath(Application.ExeName) + 'IBExpert\ibexpert.exe', 'C:\Program Files (x86)\HK-Software\IBExpert\');
      Result := True;
    except
      on e : Exception do
      begin
        ShowMessage('Erro ao instalar IBExpert!  ' + #13 + e.Message);
        Result := False;
      end;
    end;
  end;
end;

function DADOS_LIMPARCNPJ(CNPJ : string) : string;
begin
  CNPJ := StringReplace(CNPJ,'.','',[rfReplaceAll, rfIgnoreCase]);
  CNPJ := StringReplace(CNPJ,'-','',[rfReplaceAll, rfIgnoreCase]);
  CNPJ := StringReplace(CNPJ,'/','',[rfReplaceAll, rfIgnoreCase]);
  Result := CNPJ;
end;

function DADOS_MODULOPG116(MODULO : Integer) : string;
begin
  case MODULO of
    1 : Result := ('PARAMETROS GERAIS');
    2 : Result := ('CONTABILIDADE');
    4 : Result := ('CONTAS A RECEBER');
    5 : Result := ('CONTAS A PAGAR');
    6 : Result := ('FLUXO DE CAIXA');
    7 : Result := ('LIVRO FISCAL');
    21 : Result := ('GARANTIA MF');
    30 : Result := ('ESTOQUE DE PECAS');
    31 : Result := ('ASSISTENCIA TECNICA');
    32 : Result := ('CONTROLE DE VEICULOS');
    33 : Result := ('INDUSTRIA');
    34 : Result := ('COMPRAS');
    35 : Result := ('INTEGRACAO PALM');
    36 : Result := ('PROCESSO CONTROLE');
    40 : Result := ('SALAO DE VENDAS');
    99 : Result := ('RELATORIOS');
    41 : Result := ('CRONOTACOGRAFO');
    42 : Result := ('CONTROLE DE TRANSPORTE');
    43 : Result := ('DESCONTAMINACAO');
    44 : Result := ('SUZUKI');
  else
    Result := 'Sem informação'
  end;
end;

function DADOS_COPIARPG116(CODIGOMODULO: string; FLL_ORIGEM: string; FLL_NOVA: string) : string;
begin
  with DATAMODULO.IBQuery do
  begin
    try
      Close;
      SQL.Clear;
      SQL.Add('UPDATE PARAMETRO');
      SQL.Add(' SET PARAMETRO.PRM_CAMPO1 = (SELECT P.PRM_CAMPO1 FROM PARAMETRO P WHERE P.PRM_MODULO = :CODIGOMODULO ');
      SQL.Add(' AND P.FLL_CODIGO = :FLL_ORIGEM AND PARAMETRO.PRM_CODIGO = P.PRM_CODIGO)');
      SQL.Add(' WHERE PARAMETRO.FLL_CODIGO = :FLL_NOVA AND PARAMETRO.PRM_MODULO = :CODIGOMODULO');
      ParamByName('CODIGOMODULO').AsString := CODIGOMODULO;
      ParamByName('FLL_ORIGEM').AsString := FLL_ORIGEM;
      ParamByName('FLL_NOVA').AsString := FLL_NOVA;
      ExecSQL;
      Result := 'Copiado Parametros Filial: ' + FLL_ORIGEM + ' Para a Filial: ' +
                  FLL_NOVA + ' Módulo: ' + DADOS_MODULOPG116(StrToInt(CODIGOMODULO))
    except
      on e : Exception do
      Result := 'Erro ao Copiar os Parametros Filial: ' + FLL_ORIGEM + ' Para a Filial: ' +
                  FLL_NOVA + ' Módulo: ' + CODIGOMODULO+' - '+DADOS_MODULOPG116(StrToInt(CODIGOMODULO)) +
                  ' Erro: ' + e.Message;
    end;
  end;
end;

function DADOS_EXCLUIRPACKAGE (PACKAGE : Integer): string;
var SST_NOME : string;
begin
  try
    // ZERANDO SCRIPT
    DATAMODULO.IBScript.Script.Clear;
    // ALTERANDO PARA INVISIVEL O PACKAGE
    DATAMODULO.IBScript.Script.Add('UPDATE PACKAGE SET PCK_ATIVO = ''1'' WHERE PCK_CODIGO = ' + IntToStr(PACKAGE) + ';');
    // DELETANDO O PACKAGE DOS USUARIOS
    DATAMODULO.IBScript.Script.Add('DELETE FROM USUARIOPACKAGE WHERE PCK_CODIGO = ' + IntToStr(PACKAGE) + ';');
    // BUSCANDO O NOME DO MODULO SECUR
    DATAMODULO.IBQuery.Close;
    DATAMODULO.IBQuery.SQL.Clear;
    DATAMODULO.IBQuery.SQL.Add('SELECT PACKAGE.pck_nomearquivo           '+
                               '   FROM PACKAGE                          '+
                               '   WHERE PACKAGE.pck_codigo = :PCK_CODIGO');
    DATAMODULO.IBQuery.ParamByName('PCK_CODIGO').AsInteger := PACKAGE;
    DATAMODULO.IBQuery.Open;
    SST_NOME := Trim(AnsiReplaceStr(DATAMODULO.IBQuery.Fields[0].AsString,'.bpl',''));

    // BUSCANDO OS GRUPOS DESTE PACOTE
    DATAMODULO.IBQuery.Close;
    DATAMODULO.IBQuery.SQL.Clear;
    DATAMODULO.IBQuery.SQL.Add('SELECT GRP_ID                '+
                                ' FROM SECUR_GRUPO           '+
                                ' WHERE SST_NOME = :SST_NOME');
    DATAMODULO.IBQuery.ParamByName('SST_NOME').AsString := SST_NOME;
    DATAMODULO.IBQuery.Open;


    while not DATAMODULO.IBQuery.Eof do
    begin
      // EXCLUINDO GRUPO DO PERFIL
      DATAMODULO.IBScript.Script.Add('DELETE FROM SECUR_GRUPO_PERFIL WHERE GRP_ID = '+ DATAMODULO.IBQuery.Fields[0].AsString + ';');
      // EXCLUINDO GRUPO DO USUARIO
      DATAMODULO.IBScript.Script.Add('DELETE FROM SECUR_USUARIO_GRUPO WHERE GRP_ID = '+ DATAMODULO.IBQuery.Fields[0].AsString + ';');
      // EXCLUINDO GRUPO DAS RESTRICOES
      DATAMODULO.IBScript.Script.Add('DELETE FROM SECUR_RESTRICAO WHERE GRP_ID = '+ DATAMODULO.IBQuery.Fields[0].AsString + ';');
      // EXCLUINDO GRUPO DO SECUR
      DATAMODULO.IBScript.Script.Add('DELETE FROM SECUR_GRUPO WHERE GRP_ID = '+ DATAMODULO.IBQuery.Fields[0].AsString + ';');
      DATAMODULO.IBQuery.Next;
    end;
    DATAMODULO.IBScript.ExecuteScript;
    DATAMODULO.IBTransaction.Commit;
    Result := 'Ocultado Modulo, Excluido Modulo dos usuários, Excluido todos os vinculos dos grupos do secur relacionados com o Modulo    ' + IntToStr(PACKAGE)+' - '+SST_NOME;
  except
    on e : Exception do
    begin
      Result := 'Erro ao excluir grupo ' + SST_NOME + #13 + e.Message;
    end;
  end;
end;


end.
