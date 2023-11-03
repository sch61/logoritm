unit options_frm;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Buttons,
  FileUtil;

type

  { TfrmOptions }

  TfrmOptions = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    btDBPath: TBitBtn;
    edPathDB: TEdit;
    Label1: TLabel;
    dlgPath: TOpenDialog;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure btDBPathClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  frmOptions: TfrmOptions;

implementation

{$R *.lfm}

uses
  db_unit;

  { TfrmOptions }

procedure TfrmOptions.BitBtn1Click(Sender: TObject);
var
  s: string;
begin
  s := edPathDB.Text;
  if FileExists(s) then
  begin
    dmMyDB.dbConn.Connected := False;
    dmMyDB.dbFileName := s;
    dmMyDB.dbConn.DatabaseName := s;
    dmMyDB.dbConn.Connected := True;
    Close;
  end
  else
    ShowMessage('Файл ' + s + ' не найден');
end;

procedure TfrmOptions.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmOptions.btDBPathClick(Sender: TObject);
begin
  if dlgPath.Execute then
    edPathDB.Text := dlgPath.FileName;
end;

procedure TfrmOptions.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  CloseAction := caFree;
  frmOptions := nil;
end;

procedure TfrmOptions.FormCreate(Sender: TObject);
begin
  edPathDB.Text := dmMyDB.dbFileName;
  dlgPath.FileName := dmMyDB.dbFileName;
end;

end.
