unit main_frm;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, ComCtrls,
  Buttons, JSONPropStorage, FileInfo;

type

  { TMainForm }

  TMainForm = class(TForm)
    JSONPropStorage1: TJSONPropStorage;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem10: TMenuItem;
    MenuItem11: TMenuItem;
    MenuItem12: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    MenuItem9: TMenuItem;
    sbtnLang: TSpeedButton;
    Separator1: TMenuItem;
    statBar: TStatusBar;
    ToolBar1: TToolBar;
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure MenuItem11Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure MenuItem5Click(Sender: TObject);
    procedure MenuItem6Click(Sender: TObject);
    procedure MenuItem8Click(Sender: TObject);
  private

  public

  end;

var
  MainForm: TMainForm;

implementation

{$R *.lfm}

uses
  childs_frm, lessons_frm, langs_frm, exs_frm, db_unit, lesscreator_frm;

  { TMainForm }

procedure TMainForm.MenuItem4Click(Sender: TObject);
begin
  try
    if not Assigned(frmChilds) then
    begin
      Application.CreateForm(TfrmChilds, frmChilds);
    end;
    frmChilds.Show;
  except
    ShowMessage('Error Childs');
  end;
end;

procedure TMainForm.MenuItem5Click(Sender: TObject);
begin
  if not Assigned(frmExs) then
  begin
    Application.CreateForm(TfrmExs, frmExs);
  end;
  frmExs.Show;
end;

procedure TMainForm.MenuItem6Click(Sender: TObject);
begin
  if not Assigned(frmLessons) then
  begin
    Application.CreateForm(TfrmLessons, frmLessons);
  end;
  frmLessons.Show;
end;

procedure TMainForm.MenuItem8Click(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.FormCreate(Sender: TObject);
var
  s: string;
  inf: TVersionInfo;
begin
  DefaultFormatSettings.DateSeparator := '.';
  DefaultFormatSettings.ShortDateFormat := 'dd.mm.yyyy';
  s := DMMyDB.dbFileName;
  if s.Length = 0 then
  begin
    s := '/home/andrey/Projects/Lazarus/Logoritm/db/logoritm.db3';
    DMMyDB.dbFileName := s;
    DMMyDB.jsonStor.WriteString('dbFileName', s);
  end;
  inf := TVersionInfo.Create;
  statBar.Panels[0].Text := 'Версия ' +
                         IntToStr(inf.FixedInfo.FileVersion[0])+
                         '.'+IntToStr(inf.FixedInfo.FileVersion[1])+
                         '.'+IntToStr(inf.FixedInfo.FileVersion[2])+
                         '.'+IntToStr(inf.FixedInfo.FileVersion[3]);
  inf.Free;
  //  Showmessage(s);
end;

procedure TMainForm.MenuItem11Click(Sender: TObject);
begin
  if not Assigned(frmLessCreator) then
  begin
    Application.CreateForm(TfrmLessCreator, frmLessCreator);
  end;
  frmLessCreator.Show;
end;

procedure TMainForm.MenuItem3Click(Sender: TObject);
begin
  if not Assigned(frmLangs) then
  begin
    Application.CreateForm(TfrmLangs, frmLangs);
  end;
  frmLangs.Show;
end;

procedure TMainForm.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  CloseAction := caFree;
end;

end.
