unit langs_frm;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, SQLite3DS, DB, SQLDB, Forms, Controls, Graphics, Dialogs,
  ExtCtrls, Buttons, DBCtrls, DBGrids, JSONPropStorage;

type

  { TfrmLangs }

  TfrmLangs = class(TForm)
    BitBtn1: TBitBtn;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    dsLangs: TDataSource;
    JSONPropStorage1: TJSONPropStorage;
    Panel1: TPanel;
    tbLangs: TSQLQuery;
    tbLangsid: TLongintField;
    tbLangslname: TStringField;
    procedure DBNavigator1BeforeAction(Sender: TObject; Button: TDBNavButtonType
      );
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  frmLangs: TfrmLangs;

implementation

{$R *.lfm}

uses
  db_unit;

  { TfrmLangs }

procedure TfrmLangs.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  tbLangs.Active := False;
  CloseAction := caFree;
  frmLangs := nil;
end;

procedure TfrmLangs.DBNavigator1BeforeAction(Sender: TObject;
  Button: TDBNavButtonType);
begin
    if (Button = nbEdit) or (Button = nbInsert) then
    DBGrid1.SetFocus;
end;

procedure TfrmLangs.FormCreate(Sender: TObject);
begin
  tbLangs.Active := True;
end;


end.
