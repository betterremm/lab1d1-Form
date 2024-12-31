program lab1d1;

uses
  Vcl.Forms,
  MainUnit in 'MainUnit.pas' {MainForm},
  DeveloperUnit in 'DeveloperUnit.pas' {DeveloperForm},
  InstructionUnit in 'InstructionUnit.pas' {InstructionForm},
  UnitClose in 'UnitClose.pas' {CloseForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TDeveloperForm, DeveloperForm);
  Application.CreateForm(TInstructionForm, InstructionForm);
  Application.CreateForm(TCloseForm, CloseForm);
  Application.Run;
end.
