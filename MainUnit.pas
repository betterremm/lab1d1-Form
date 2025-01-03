Unit MainUnit;

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
    Vcl.StdCtrls,
    Vcl.Menus,
    InstructionUnit,
    DeveloperUnit;

Type
    TMainForm = Class(TForm)
        FirstAngleLabel: TLabel;
        SecondAngleLabel: TLabel;
        AnswerLabel: TLabel;
    TopMainMenu: TMainMenu;
    NoneN: TMenuItem;
    OpenN: TMenuItem;
    SaveN: TMenuItem;
    N0: TMenuItem;
    ExitN: TMenuItem;
    InstructionN: TMenuItem;
    DeveloperN: TMenuItem;
        FirstAngleEdit: TEdit;
        SecondAngleEdit: TEdit;
    AnswerButton: TButton;
        Procedure InstructionNClick(Sender: TObject);
        Procedure DeveloperNClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure AnswerButtonClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    Private
        { Private declarations }
    Public
        { Public declarations }
    End;

Var
    MainForm: TMainForm;

Implementation

{$R *.dfm}

procedure TMainForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
    //TODO: FILEHANDLE


end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
    Constraints.MinWidth := Width;
    Constraints.MaxWidth := Width;
    Constraints.MinHeight := Height;
    Constraints.MaxHeight := Height;
    AnswerLabel.Visible := False;
    AnswerButton.Enabled := True;

end;

Procedure TMainForm.InstructionNClick(Sender: TObject);
Begin
    InstructionForm.ShowModal();
End;

procedure TMainForm.AnswerButtonClick(Sender: TObject);
begin
    If (StrToInt(FirstAngleEdit.Text) = StrToInt(SecondAngleEdit.Text)) Or
       (StrToInt(FirstAngleEdit.Text) = 180 - StrToInt(SecondAngleEdit.Text)) Or
       (180 - StrToInt(FirstAngleEdit.Text) = StrToInt(SecondAngleEdit.Text)) Then
        AnswerLabel.Caption := 'Треугольник равнобедренный!'
    Else
        AnswerLabel.Caption := 'Треугольник неравнобедренный!';
    AnswerLabel.Visible := True;
end;

Procedure TMainForm.DeveloperNClick(Sender: TObject);
Begin
    DeveloperForm.ShowModal();
End;

End.
