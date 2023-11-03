unit lessexec_frm;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, DBCtrls, DB,
  SQLDB, Buttons, DBGrids, StdCtrls, JSONPropStorage, DateUtils, LCLIntf;

type

  { TfrmLessExecute }

  TfrmLessExecute = class(TForm)
    BitBtn1: TBitBtn;
    btPlay: TBitBtn;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    DBGrid3: TDBGrid;
    DBMemo1: TDBMemo;
    DBMemo2: TDBMemo;
    DBMemo3: TDBMemo;
    DBMemo4: TDBMemo;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    DBText4: TDBText;
    DBText5: TDBText;
    dsChilds: TDataSource;
    dsExs: TDataSource;
    dsLessons: TDataSource;
    imgPhoto: TImage;
    JSONPropStorage1: TJSONPropStorage;
    Panel1: TPanel;
    Panel10: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    qrChilds: TSQLQuery;
    qrChildsage: TFloatField;
    qrChildsbd: TDateField;
    qrChildsccomment: TMemoField;
    qrChildsfname: TStringField;
    qrChildspath_photo: TStringField;
    qrChildspr_fname: TStringField;
    qrChildspr_sname: TStringField;
    qrChildssname: TStringField;
    qrExs: TSQLQuery;
    qrExsecomment: TMemoField;
    qrExsename: TStringField;
    qrExsepath: TStringField;
    qrExsequipment: TMemoField;
    tbLessons: TSQLQuery;
    tbLessonscomment: TMemoField;
    tbLessonsid: TAutoIncField;
    tbLessonsl_date: TStringField;
    tbLessonsl_hour: TLongintField;
    procedure btPlayClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure qrChildsAfterScroll(DataSet: TDataSet);
    procedure qrChildsCalcFields(DataSet: TDataSet);
    procedure qrExsAfterScroll(DataSet: TDataSet);
  private

  public

  end;

var
  frmLessExecute: TfrmLessExecute;

implementation

{$R *.lfm}
uses
  db_unit;

{ TfrmLessExecute }

procedure TfrmLessExecute.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
  tbLessons.Active:=False;
  qrChilds.Active:=False;
  qrExs.Active:=False;

  CloseAction := caFree;
  frmLessExecute := nil;
end;

procedure TfrmLessExecute.btPlayClick(Sender: TObject);
var
  s: string;
begin
  s := qrExs.FieldByName('epath').AsString;
  if s.Length > 0 then
    OpenDocument(s);
end;

procedure TfrmLessExecute.FormCreate(Sender: TObject);
begin
  tbLessons.Active:=True;
  tbLessons.Last;
  qrChilds.Active:=True;
  qrExs.Active:=True;
end;

procedure TfrmLessExecute.qrChildsAfterScroll(DataSet: TDataSet);
var
  s: string;
begin
  //  Showmessage('aferScroll');
  s := qrChildspath_photo.Value;
  if s.Length > 0 then
    imgPhoto.Picture.LoadFromFile(s)
  else
    imgPhoto.Picture.Clear;
end;

procedure TfrmLessExecute.qrChildsCalcFields(DataSet: TDataSet);
begin
  qrChildsage.Value := YearSpan(Now, qrChildsbd.Value);
end;

procedure TfrmLessExecute.qrExsAfterScroll(DataSet: TDataSet);
begin
  if qrExsepath.Value.Length>0 then
    btPlay.Enabled:=True
  else
    btPlay.Enabled:=False;
end;

end.

