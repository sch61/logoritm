unit lesscreator_frm;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, SQLite3DS, DB, SQLDB, Forms, Controls, Graphics, Dialogs,
  ExtCtrls, Buttons, DBCtrls, DBGrids, StdCtrls, PairSplitter, JSONPropStorage
  , DateUtils;

type

  { TfrmLessCreator }

  TfrmLessCreator = class(TForm)
    btInCh: TBitBtn;
    btInEx: TBitBtn;
    btOutCh: TBitBtn;
    btOutEx: TBitBtn;
    DBGrid2: TDBGrid;
    DBGrid3: TDBGrid;
    DBGrid4: TDBGrid;
    DBGrid5: TDBGrid;
    dsLessExs: TDataSource;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    JSONPropStorage1: TJSONPropStorage;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    qr: TSQLQuery;
    Splitter1: TSplitter;
    vwLessChildage: TFloatField;
    vwLessChildbd: TDateField;
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
    dsChilds: TDataSource;
    dsLessChild: TDataSource;
    dsExs: TDataSource;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBGroupBox1: TDBGroupBox;
    DBMemo1: TDBMemo;
    dsLessons: TDataSource;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    Label1: TLabel;
    Label2: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
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
    procedure vwLessChildCalcFields(DataSet: TDataSet);
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
  s: string;
begin
  s := 'INSERT INTO less_child (less_id, child_id) VALUES (:less_id, :child_id)';
  qr.SQL.Text := s;
  qr.ParamByName('less_id').AsInteger := tbLessonsid.Value;
  qr.ParamByName('child_id').AsInteger := tbChildsid.Value;
  qr.ExecSQL;
  vwLessChild.Refresh;
  tbChilds.Refresh;
end;

procedure TfrmLessCreator.btInExClick(Sender: TObject);
var
  s: string;
begin
  s := 'INSERT INTO less_exerc (less_id, ex_id, seq) VALUES (:less_id, :ex_id, :seq)';
  qr.SQL.Text := s;
  qr.ParamByName('less_id').AsInteger := tbLessonsid.Value;
  qr.ParamByName('ex_id').AsInteger := tbExsid.Value;
  //  qr.ParamByName('seq').AsInteger:=0;
  qr.ExecSQL;
  vwLessExs.Refresh;
  tbExs.Refresh;
end;

procedure TfrmLessCreator.btOutChClick(Sender: TObject);
var
  s: string;
begin
  s := 'DELETE FROM less_child WHERE id = :id';
  qr.SQL.Text := s;
  qr.ParamByName('id').AsInteger := vwLessChildid.Value;
  qr.ExecSQL;
  vwLessChild.Refresh;
  tbChilds.Refresh;
end;

procedure TfrmLessCreator.btOutExClick(Sender: TObject);
var
  s: string;
begin
  s := 'DELETE FROM less_exerc WHERE id = :id';
  qr.SQL.Text := s;
  qr.ParamByName('id').AsInteger := vwLessExsid.Value;
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

procedure TfrmLessCreator.vwLessChildCalcFields(DataSet: TDataSet);
begin
  vwLessChildage.Value := YearSpan(Now, vwLessChildbd.Value);
end;



end.
