program LanguageEditor;

uses
  Forms,
  UnitMain in 'UnitMain.pas' {FormMain},
  UnitDelete in 'UnitDelete.pas' {FormDelete},
  UnitConfirm in 'UnitConfirm.pas' {FormConfirm};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'LanguageEditor';
  Application.CreateForm(TFormMain, FormMain);
  Application.CreateForm(TFormDelete, FormDelete);
  Application.CreateForm(TFormConfirm, FormConfirm);
  Application.Run;
end.
