unit exs_frm;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, SQLite3DS, DB, SQLDB, Forms, Controls, Graphics, Dialogs,
  ExtCtrls, Buttons, ComCtrls, DBGrids, DBCtrls, StdCtrls, IniPropStorage,
  LCLIntf, JSONPropStorage;

type

  { TfrmExs }

  TfrmExs = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    DBGrid3: TDBGrid;
    DBMemo4: TDBMemo;
    dsChilds: TDataSource;
    DBGrid2: TDBGrid;
    DBMemo3: TDBMemo;
    dsLess: TDataSource;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBMemo1: TDBMemo;
    DBMemo2: TDBMemo;
    dsExs: TDataSource;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    JSONPropStorage1: TJSONPropStorage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    qrChildsccomment: TMemoField;
    qrChildsex_cnt: TLongintField;
    qrChildsfname: TStringField;
    qrChildsml_date: TStringField;
    qrChildssname: TStringField;
    qrLess: TSQLQuery;
    qrLesslcomment: TMemoField;
    qrLessl_date: TStringField;
    qrLessl_hour: TLongintField;
    qrChilds: TSQLQuery;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    tbExscomment: TMemoField;
    tbExsequipment: TMemoField;
    tbExsid: TLongintField;
    tbExsname: TStringField;
    tbExspath: TStringField;
    OpenDialog1: TOpenDialog;
    PageControl1: TPageControl;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    tbExs: TSQLQuery;
    TabSheet1: TTabSheet;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure DBNavigator1BeforeAction(Sender: TObject; Button: TDBNavButtonType);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  frmExs: TfrmExs;

implementation

{$R *.lfm}

uses
  db_unit;

  { TfrmExs }

procedure TfrmExs.FormCreate(Sender: TObject);
begin
  tbExs.Active := True;
  qrLess.Active := True;
  qrChilds.Active := True;
end;


procedure TfrmExs.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  tbExs.Active := False;
  qrLess.Active := False;
  qrChilds.Active := False;

  CloseAction := caFree;
  frmExs := nil;
end;

procedure TfrmExs.DBNavigator1BeforeAction(Sender: TObject; Button: TDBNavButtonType);
begin
  if (Button = nbEdit) or (Button = nbInsert) then
    DBEdit1.SetFocus;
end;

procedure TfrmExs.BitBtn2Click(Sender: TObject);
begin
  if (dsExs.State = dsEdit) or (dsExs.State = dsInsert) then
  begin
    if OpenDialog1.Execute then
      tbExs.FieldByName('path').AsString := OpenDialog1.FileName;
  end;
end;

procedure TfrmExs.BitBtn3Click(Sender: TObject);
var
  s: string;
begin
  s := tbExs.FieldByName('path').AsString;
  if s.Length > 0 then
    OpenDocument(s);
end;

end.
