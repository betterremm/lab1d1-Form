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
    OpenDialog: TOpenDialog;
    SaveDialog: TSaveDialog;
        Procedure InstructionNClick(Sender: TObject);
        Procedure DeveloperNClick(Sender: TObject);
        Procedure FormCreate(Sender: TObject);
        Procedure AnswerButtonClick(Sender: TObject);
        Procedure FormCloseQuery(Sender: TObject; Var CanClose: Boolean);
        Procedure FirstAngleEditKeyPress(Sender: TObject; Var Key: Char);
        Procedure SecondAngleEditKeyPress(Sender: TObject; Var Key: Char);
        Procedure FirstAngleEditChange(Sender: TObject);
        Procedure SecondAngleEditChange(Sender: TObject);
    procedure OpenNClick(Sender: TObject);
    procedure SaveNClick(Sender: TObject);
    Private
        IsFirstEditFilled: Boolean;
        IsSecondEditFilled: Boolean;
        IsFileSaved: Boolean;

    Public
        { Public declarations }
    End;

Var
    TAllowedKeys: Set Of Char = ['0' .. '9', #8];
    MainForm: TMainForm;

Implementation

{$R *.dfm}

Procedure TMainForm.FirstAngleEditChange(Sender: TObject);
Begin
    AnswerLabel.Visible := False;
    If (FirstAngleEdit.Text <> '') And (FirstAngleEdit.Text <> '0') Then
    Begin
        IsFirstEditFilled := True;
        If StrToInt(FirstAngleEdit.Text) > 178 Then
        Begin
            FirstAngleEdit.Text := '178';
            FirstAngleEdit.SelStart := Length(FirstAngleEdit.Text)
        End
        Else
            If IntToStr(StrToInt(FirstAngleEdit.Text)) <> FirstAngleEdit.Text Then
            Begin
                FirstAngleEdit.Text := IntToStr(StrToInt(FirstAngleEdit.Text));
                FirstAngleEdit.SelStart := Length(FirstAngleEdit.Text)
            End;
    End
    Else
        IsFirstEditFilled := False;

    If (IsFirstEditFilled = True) And (IsSecondEditFilled = True) And (StrToInt(SecondAngleEdit.Text) + StrToInt(FirstAngleEdit.Text) < 180) Then
        AnswerButton.Enabled := True
    Else
        AnswerButton.Enabled := False;
End;

Procedure TMainForm.FirstAngleEditKeyPress(Sender: TObject; Var Key: Char);
Begin
    If Not(Key In TAllowedKeys) Then
        Key := #0

End;

Procedure TMainForm.FormCloseQuery(Sender: TObject; Var CanClose: Boolean);
Begin
    If IsFileSaved = False Then
    //TODO: HANDLE FILES PLSSSSS

End;

Procedure TMainForm.FormCreate(Sender: TObject);
Begin
    Constraints.MinWidth := Width;
    Constraints.MaxWidth := Width;
    Constraints.MinHeight := Height;
    Constraints.MaxHeight := Height;
    AnswerLabel.Visible := False;
    AnswerButton.Enabled := True;
    IsFirstEditFilled := False;
    IsSecondEditFilled := False;
    IsFileSaved := False;

End;

Procedure TMainForm.InstructionNClick(Sender: TObject);
Begin
    InstructionForm.ShowModal();
    InstructionForm.Destroy();
    InstructionForm := Nil;
End;

procedure TMainForm.OpenNClick(Sender: TObject);
begin
    If OpenDialog.Execute() Then
    //TODO OPENING

end;

procedure TMainForm.SaveNClick(Sender: TObject);
begin
    If SaveDialog.Execute() Then
    //TODO SAVING
end;

Procedure TMainForm.SecondAngleEditChange(Sender: TObject);
Begin
    AnswerLabel.Visible := False;
    If (SecondAngleEdit.Text <> '') And (SecondAngleEdit.Text <> '0') Then
    Begin
        IsSecondEditFilled := True;
        If StrToInt(SecondAngleEdit.Text) > 178 Then
        Begin
            SecondAngleEdit.Text := '178';
            SecondAngleEdit.SelStart := Length(SecondAngleEdit.Text)
        End
        Else
            If IntToStr(StrToInt(SecondAngleEdit.Text)) <> SecondAngleEdit.Text Then
            Begin
                SecondAngleEdit.Text := IntToStr(StrToInt(SecondAngleEdit.Text));
                SecondAngleEdit.SelStart := Length(SecondAngleEdit.Text)
            End;
    End
    Else
        IsSecondEditFilled := False;

    If (IsSecondEditFilled = True) And (IsFirstEditFilled = True) And (StrToInt(SecondAngleEdit.Text) + StrToInt(FirstAngleEdit.Text) < 180) Then
        AnswerButton.Enabled := True
    Else
        AnswerButton.Enabled := False;

End;

Procedure TMainForm.SecondAngleEditKeyPress(Sender: TObject; Var Key: Char);
Begin
    If Not(Key In TAllowedKeys) Then
        Key := #0
End;

Procedure TMainForm.AnswerButtonClick(Sender: TObject);
Begin
    If (StrToInt(FirstAngleEdit.Text) = StrToInt(SecondAngleEdit.Text)) Or
        (2 * StrToInt(FirstAngleEdit.Text) = 180 - StrToInt(SecondAngleEdit.Text)) Or
        (180 - StrToInt(FirstAngleEdit.Text) = 2 * StrToInt(SecondAngleEdit.Text)) Then
        AnswerLabel.Caption := 'Треугольник равнобедренный!'
    Else
        AnswerLabel.Caption := 'Треугольник неравнобедренный!';
    AnswerLabel.Visible := True;
End;

Procedure TMainForm.DeveloperNClick(Sender: TObject);
Begin
    DeveloperForm.ShowModal();
    DeveloperForm.Destroy();
    DeveloperForm := Nil;
End;

End.
