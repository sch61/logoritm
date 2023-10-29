unit childs_frm;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, SQLDB, SQLite3DS, DB, memds, Forms, Controls, Graphics,
  Dialogs, ExtCtrls, DBCtrls, DBGrids, ComCtrls, StdCtrls, Buttons,
  IniPropStorage, DBExtCtrls, JSONPropStorage, ExtDlgs;

type

  { TfrmChilds }

  TfrmChilds = class(TForm)
    BitBtn1: TBitBtn;
    DBLookupComboBox1: TDBLookupComboBox;
    dsLangs: TDataSource;
    dsChilds: TDataSource;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit7: TDBEdit;
    DBGrid1: TDBGrid;
    DBGroupBox1: TDBGroupBox;
    DBGroupBox2: TDBGroupBox;
    DBMemo1: TDBMemo;
    DBNavigator1: TDBNavigator;
    imgPhoto: TImage;
    JSONPropStorage1: TJSONPropStorage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    dlgPhoto: TOpenPictureDialog;
    tbChildsbd: TDateField;
    tbChildscomments: TMemoField;
    tbChildsfname: TStringField;
    tbChildsid: TLongintField;
    tbChildslang: TLongintField;
    tbChildspath_photo: TStringField;
    tbChildspr_fname: TStringField;
    tbChildspr_sname: TStringField;
    tbChildssname: TStringField;
    tbChildstel_num: TStringField;
    PageControl1: TPageControl;
    Panel1: TPanel;
    tbChilds: TSQLQuery;
    lu_langs: TSQLQuery;
    lu_langsid: TAutoIncField;
    lu_langslname: TStringField;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    procedure DBImage1Click(Sender: TObject);
    procedure DBNavigator1BeforeAction(Sender: TObject; Button: TDBNavButtonType);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure tbChildsAfterScroll(DataSet: TDataSet);
  private

  public

  end;

var
  frmChilds: TfrmChilds;

implementation

{$R *.lfm}

uses
  db_unit;

  { TfrmChilds }

procedure TfrmChilds.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  lu_langs.Active := False;
  tbChilds.Active := False;
  CloseAction := caFree;
  frmChilds := nil;
end;

procedure TfrmChilds.DBNavigator1BeforeAction(Sender: TObject;
  Button: TDBNavButtonType);
begin
  if (Button = nbEdit) or (Button = nbInsert) then
    DBEdit2.SetFocus;
end;


procedure TfrmChilds.DBImage1Click(Sender: TObject);
var
  s: string;
begin
  if (dsChilds.State = dsEdit) or (dsChilds.State = dsInsert) then
  begin
    if dlgPhoto.Execute then
    begin
      s := dlgPhoto.FileName;
      imgPhoto.Picture.LoadFromFile(s);
      tbChildspath_photo.Value := s;
    end;

  end;
end;

procedure TfrmChilds.FormCreate(Sender: TObject);
begin
  lu_langs.Active := True;
  tbChilds.Active := True;
end;

procedure TfrmChilds.tbChildsAfterScroll(DataSet: TDataSet);
var
  s: string;
begin
//  Showmessage('aferScroll');
  s := tbChildspath_photo.Value;
  if s.Length > 0 then
    imgPhoto.Picture.LoadFromFile(s)
  else
    imgPhoto.Picture.Clear;
end;

end.
