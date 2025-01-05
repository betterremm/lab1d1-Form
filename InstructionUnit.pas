Unit InstructionUnit;

Interface

Uses
    Winapi.Windows,
    Winapi.Messages,
    System.SysUtils,
    System.Variants,
    System.Classes,
    Vcl.Graphics,
    Vcl.Controls,
    Vcl.Forms,
    Vcl.Dialogs,
    Vcl.StdCtrls;

Type
    TInstructionForm = Class(TForm)
    InstrLabel: TLabel;
    CloseInstrButton: TButton;
    procedure CloseInstrButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    Private
        { Private declarations }
    Public
        { Public declarations }
    End;

Var
    InstructionForm: TInstructionForm;

Implementation

{$R *.dfm}


procedure TInstructionForm.CloseInstrButtonClick(Sender: TObject);
begin
    InstructionForm.Close;
end;

procedure TInstructionForm.FormCreate(Sender: TObject);
begin
    Constraints.MinWidth := Width;
    Constraints.MaxWidth := Width;
    Constraints.MinHeight := Height;
    Constraints.MaxHeight := Height;
end;

End.
