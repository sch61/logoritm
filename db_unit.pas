unit db_unit;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, IDEWindowIntf, Controls, JSONPropStorage, SQLite3Conn,
  SQLDB, DB, SQLite3DS;

type

  { TDMdb }

  { TDMmydb }

  TDMmydb = class(TDataModule)
    dbConn: TSQLite3Connection;
    dbTrans: TSQLTransaction;
    imgList: TImageList;
    jsonStor: TJSONPropStorage;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure jsonStorRestoreProperties(Sender: TObject);
  private

  public
    dbFileName: string;

  end;

var
  dmMyDB: TDMmydb;

implementation

{$R *.lfm}

{ TDMmydb }

procedure TDMmydb.DataModuleCreate(Sender: TObject);
begin
end;

procedure TDMmydb.DataModuleDestroy(Sender: TObject);
begin
  dbConn.Connected := False;
end;

procedure TDMmydb.jsonStorRestoreProperties(Sender: TObject);
var
  s: string;
begin
  s := jsonStor.StoredValue['dbFileName'];
  if s.Length > 0 then
    dbFileName := s;
  dbConn.DatabaseName := dbFileName;
  dbConn.Connected := True;
end;

end.
