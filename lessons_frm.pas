unit lessons_frm;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, SQLite3DS, DB, SQLDB, Forms, Controls, Graphics, Dialogs,
  ExtCtrls, DBCtrls, Buttons, ComCtrls, DBGrids, StdCtrls, JSONPropStorage;

type

  { TfrmLessons }

  TfrmLessons = class(TForm)
    BitBtn1: TBitBtn;
    dsLessons: TDataSource;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBGrid1: TDBGrid;
    DBMemo1: TDBMemo;
    DBNavigator1: TDBNavigator;
    JSONPropStorage1: TJSONPropStorage;
    Label1: TLabel;
    Label2: TLabel;
    tbLessonscomment: TMemoField;
    tbLessonsid: TLongintField;
    tbLessonsl_date: TStringField;
    tbLessonsl_hour: TLongintField;
    PageControl1: TPageControl;
    Panel1: TPanel;
    tbLessons: TSQLQuery;
    TabSheet1: TTabSheet;
    procedure DBNavigator1BeforeAction(Sender: TObject; Button: TDBNavButtonType);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure tbLessonsAfterPost(DataSet: TDataSet);
  private

  public

  end;

var
  frmLessons: TfrmLessons;

implementation

{$R *.lfm}

uses
  db_unit;

  { TfrmLessons }

procedure TfrmLessons.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  tbLessons.Active := False;
  CloseAction := caFree;
  frmLessons := nil;
end;

procedure TfrmLessons.DBNavigator1BeforeAction(Sender: TObject;
  Button: TDBNavButtonType);
begin
  if (Button = nbEdit) or (Button = nbInsert) then
    DBEdit1.SetFocus;
end;

procedure TfrmLessons.FormCreate(Sender: TObject);
begin
//  tbLessons.FileName := DMMyDB.dbFileName;
  tbLessons.Active := True;
end;

procedure TfrmLessons.tbLessonsAfterPost(DataSet: TDataSet);
var
  id: integer;
begin
{  id := tbLessons.FieldByName('id').AsInteger;
  tbLessons.Locate('id', id, []);}
end;

end.
