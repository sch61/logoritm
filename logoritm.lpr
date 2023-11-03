program logoritm;

{$mode objfpc}{$H+}

uses
  cmem,
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  {$IFDEF HASAMIGA}
  athreads,
  {$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms,
  memdslaz,
  sqlite3laz,
  main_frm,
  db_unit,
  childs_frm,
  lessons_frm,
  langs_frm,
  exs_frm,
  lesscreator_frm,
  lessexec_frm,
  options_frm;

  {$R *.res}

begin
  RequireDerivedFormResource := True;
  Application.Scaled:=True;
  Application.Initialize;
  Application.CreateForm(TDMmydb, dmMydb);
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TfrmOptions, frmOptions);
  //  Application.CreateForm(TfrmLessExecute, frmLessExecute);
  //  Application.CreateForm(TfrmLessCreator, frmLessCreator);
  //  Application.CreateForm(TfrmExs, frmExs);
  //  Application.CreateForm(TfrmLangs, frmLangs);
  //  Application.CreateForm(TfrmChilds, frmChilds);
  //  Application.CreateForm(TfrmLessons, frmLessons);
  Application.Run;
end.
