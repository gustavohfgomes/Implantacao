unit MODULO;

interface

uses
  System.SysUtils, System.Classes, IBX.IBServices, Data.DB, IBX.IBDatabase,
  IBX.IBCustomDataSet, IBX.IBQuery, IBX.IBScript, IdMessage, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdExplicitTLSClientServerBase,
  IdMessageClient, IdSMTPBase, IdSMTP, IBX.IBTable;

type
  TDATAMODULO = class(TDataModule)
    IBBackupService: TIBBackupService;
    IBRestoreService: TIBRestoreService;
    IBDatabase: TIBDatabase;
    IBTransaction: TIBTransaction;
    IBQuery: TIBQuery;
    IBQuery1: TIBQuery;
    IBScript: TIBScript;
    IBQueryCamposTabela: TIBQuery;
    IBQueryPrimaryKey: TIBQuery;
    IdSMTP: TIdSMTP;
    IdMessage: TIdMessage;
    IBTableOrigem: TIBTable;
    IBQuerySST_NOME: TIBQuery;
    dsSST_NOME: TDataSource;
    IBQueryFRM_NOME: TIBQuery;
    dsFRM_NOME: TDataSource;
    IBQueryGRP_ID: TIBQuery;
    dsGRP_ID: TDataSource;
    IBQueryOBJ_NOME: TIBQuery;
    dsOBJ_NOME: TDataSource;
    dsSECUR_RESTRICAO: TDataSource;
    IBQuerySECUR_RESTRICAO: TIBQuery;
    IBQuerySECUR_RESTRICAOGRP_ID: TIntegerField;
    IBQuerySECUR_RESTRICAOFRM_NOME: TIBStringField;
    IBQuerySECUR_RESTRICAOSST_NOME: TIBStringField;
    IBQuerySECUR_RESTRICAOOBJ_NOME: TIBStringField;
    IBQuerySECUR_RESTRICAORST_RESTRICAO: TIBStringField;
    IBQuerySECUR_RESTRICAORST_HABILITARCAMPO: TIBStringField;
    IBDatabaseEAD: TIBDatabase;
    IBTransactionEAD: TIBTransaction;
    IBScriptEAD: TIBScript;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DATAMODULO: TDATAMODULO;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
