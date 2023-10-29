unit lesscreator_frm;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, SQLite3DS, DB, SQLDB, Forms, Controls, Graphics, Dialogs,
  ExtCtrls, Buttons, DBCtrls, DBGrids, StdCtrls, PairSplitter, JSONPropStorage;

type

  { TfrmLessCreator }

  TfrmLessCreator = class(TForm)
    btInEx: TBitBtn;
    btOutEx: TBitBtn;
    dsLessExs: TDataSource;
    DBGrid4: TDBGrid;
    DBGrid5: TDBGrid;
    JSONPropStorage1: TJSONPropStorage;
    Panel6: TPanel;
    qr: TSQLQuery;
    vwLessExs: TSQLQuery;
    tbChildsid: TLongintField;
    tbExscomment: TMemoField;
    tbExsequipment: TMemoField;
    tbExsid: TLongintField;
    tbExsname: TStringField;
    tbExspath: TStringField;
    tbLessons: TSQLQuery;
    tbChildsfname: TStringField;
    tbChildssname: TStringField;
    BitBtn1: TBitBtn;
    btInCh: TBitBtn;
    btOutCh: TBitBtn;
    dsChilds: TDataSource;
    DBGrid2: TDBGrid;
    DBGrid3: TDBGrid;
    dsLessChild: TDataSource;
    dsExs: TDataSource;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBGroupBox1: TDBGroupBox;
    DBMemo1: TDBMemo;
    dsLessons: TDataSource;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    tbChilds: TSQLQuery;
    tbExs: TSQLQuery;
    vwLessChild: TSQLQuery;
    vwLessChildchild_id: TLongintField;
    vwLessChildfname: TStringField;
    vwLessChildid: TLongintField;
    vwLessChildless_id: TLongintField;
    vwLessChildsname: TStringField;
    tbLessonscomment: TMemoField;
    tbLessonsid: TAutoIncField;
    tbLessonsl_date: TStringField;
    tbLessonsl_hour: TLongintField;
    vwLessExsex_id: TLongintField;
    vwLessExsex_name: TStringField;
    vwLessExsid: TLongintField;
    vwLessExsless_id: TLongintField;
    vwLessExsseq: TLongintField;
    procedure btInChClick(Sender: TObject);
    procedure btInExClick(Sender: TObject);
    procedure btOutChClick(Sender: TObject);
    procedure btOutExClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  frmLessCreator: TfrmLessCreator;

implementation

{$R *.lfm}

uses
  db_unit;

  { TfrmLessCreator }

procedure TfrmLessCreator.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  tbLessons.Active := False;
  tbChilds.Active := False;
  tbExs.Active := False;
  vwLessChild.Active := False;
  vwLessExs.Active := False;

  CloseAction := caFree;
  frmLessCreator := nil;
end;

procedure TfrmLessCreator.btInChClick(Sender: TObject);
var
  s: String;
begin
  s :='INSERT INTO less_child (less_id, child_id) VALUES (:less_id, :child_id)';
  qr.SQL.Text := s;
  qr.ParamByName('less_id').AsInteger:=tbLessonsid.Value;
  qr.ParamByName('child_id').AsInteger:=tbChildsid.Value;
  qr.ExecSQL;
  vwLessChild.Refresh;
  tbChilds.Refresh;
end;

procedure TfrmLessCreator.btInExClick(Sender: TObject);
var
  s: String;
begin
  s :='INSERT INTO less_exerc (less_id, ex_id, seq) VALUES (:less_id, :ex_id, :seq)';
  qr.SQL.Text := s;
  qr.ParamByName('less_id').AsInteger:=tbLessonsid.Value;
  qr.ParamByName('ex_id').AsInteger:=tbExsid.Value;
//  qr.ParamByName('seq').AsInteger:=0;
  qr.ExecSQL;
  vwLessExs.Refresh;
  tbExs.Refresh;
end;

procedure TfrmLessCreator.btOutChClick(Sender: TObject);
var
  s: String;
begin
  s :='DELETE FROM less_child WHERE id = :id';
  qr.SQL.Text := s;
  qr.ParamByName('id').AsInteger:=vwLessChildid.Value;
  qr.ExecSQL;
  vwLessChild.Refresh;
  tbChilds.Refresh;
end;

procedure TfrmLessCreator.btOutExClick(Sender: TObject);
var
  s: String;
begin
  s :='DELETE FROM less_exerc WHERE id = :id';
  qr.SQL.Text := s;
  qr.ParamByName('id').AsInteger:=vwLessExsid.Value;
  qr.ExecSQL;
  vwLessExs.Refresh;
  tbExs.Refresh;
end;

procedure TfrmLessCreator.FormCreate(Sender: TObject);
begin
  tbLessons.Active := True;
  tbChilds.Active := True;
  tbExs.Active := True;
  vwLessChild.Active := True;
  vwLessExs.Active := True;
end;



end.
