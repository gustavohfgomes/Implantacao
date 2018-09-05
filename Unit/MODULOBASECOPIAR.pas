unit MODULOBASECOPIAR;

interface

uses
  System.SysUtils, System.Classes, IBX.IBDatabase, Data.DB, IBX.IBCustomDataSet,
  IBX.IBQuery, IBX.IBTable;

type
  TBASECOPIAR = class(TDataModule)
    IBDatabaseBaseCopiar: TIBDatabase;
    IBQueryBaseCopiar: TIBQuery;
    IBQueryTabela: TIBQuery;
    dsTabela: TDataSource;
    IBTransactionBaseCopiar: TIBTransaction;
    IBQueryForeignKey: TIBQuery;
    strIBQueryForeignKeyNOME_FK: TIBStringField;
    strIBQueryForeignKeyTABELA_PESQUISADA: TIBStringField;
    strIBQueryForeignKeyCAMPO_FK_TABELAPESQUISADA: TIBStringField;
    strIBQueryForeignKeyTABELA_ORIGEM_DADOS: TIBStringField;
    IBTableDestino: TIBTable;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  BASECOPIAR: TBASECOPIAR;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
