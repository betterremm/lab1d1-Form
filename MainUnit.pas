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
    Label1: TLabel;
        Procedure InstructionNClick(Sender: TObject);
        Procedure DeveloperNClick(Sender: TObject);
        Procedure FormCreate(Sender: TObject);
        Procedure AnswerButtonClick(Sender: TObject);
        Procedure FormCloseQuery(Sender: TObject; Var CanClose: Boolean);
        Procedure FirstAngleEditKeyPress(Sender: TObject; Var Key: Char);
        Procedure SecondAngleEditKeyPress(Sender: TObject; Var Key: Char);
        Procedure FirstAngleEditChange(Sender: TObject);
        Procedure SecondAngleEditChange(Sender: TObject);
        Procedure OpenNClick(Sender: TObject);
        Procedure SaveNClick(Sender: TObject);
        Procedure ExitNClick(Sender: TObject);
        Procedure FirstAngleEditContextPopup(Sender: TObject; MousePos: TPoint; Var Handled: Boolean);
        Procedure SecondAngleEditContextPopup(Sender: TObject; MousePos: TPoint; Var Handled: Boolean);
    function FormHelp(Command: Word; Data: THelpEventData;
      var CallHelp: Boolean): Boolean;
    Private
        IsFirstEditFilled: Boolean;
        IsSecondEditFilled: Boolean;
        IsFileSaved: Boolean;

    Public
        { Public declarations }
    End;

Const
    TAllowedKeys: Set Of Char = ['0' .. '9', #8];

Var
    MainForm: TMainForm;

Implementation

{$R *.dfm}

Procedure TMainForm.FirstAngleEditChange(Sender: TObject);
Begin
    AnswerLabel.Visible := False;
    SaveN.Enabled := False;
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

    If (IsFirstEditFilled = True) And (IsSecondEditFilled = True) And
        (StrToInt(SecondAngleEdit.Text) + StrToInt(FirstAngleEdit.Text) < 180) Then
        AnswerButton.Enabled := True
    Else
        AnswerButton.Enabled := False;
End;

Procedure TMainForm.FirstAngleEditContextPopup(Sender: TObject; MousePos: TPoint; Var Handled: Boolean);
Begin
    Handled := True;
End;

Procedure TMainForm.FirstAngleEditKeyPress(Sender: TObject; Var Key: Char);
Begin
    If Not(Key In TAllowedKeys) Then
        Key := #0

End;

Procedure TMainForm.FormCloseQuery(Sender: TObject; Var CanClose: Boolean);
Begin

    If AnswerLabel.Visible And (IsFileSaved = False) Then
        Repeat

            ExitCode := MessageBox(MainForm.Handle, 'sohranit?', 'podtverzhdenie', MB_ICONQUESTION + MB_YESNOCANCEL);
            If ExitCode = ID_Yes Then
            Begin
                SaveNClick(MainForm);
                CanClose := True
            End
            Else
                If ExitCode = ID_NO Then
                    CanClose := True
                Else
                    If ExitCode = ID_CANCEL Then
                        CanClose := False;

        Until IsFileSaved Or (ExitCode = ID_NO) Or (ExitCode = ID_CANCEL);

End;

Procedure TMainForm.FormCreate(Sender: TObject);
Begin
    Constraints.MinWidth := Width;
    Constraints.MaxWidth := Width;
    Constraints.MinHeight := Height;
    Constraints.MaxHeight := Height;
    AnswerLabel.Visible := False;
    AnswerButton.Enabled := False;
    IsFirstEditFilled := False;
    IsSecondEditFilled := False;
    IsFileSaved := False;
    SaveN.Enabled := False;

End;

function TMainForm.FormHelp(Command: Word; Data: THelpEventData;
  var CallHelp: Boolean): Boolean;
begin
    CallHelp := False;
end;

Procedure TMainForm.InstructionNClick(Sender: TObject);
Begin
    InstructionForm.ShowModal();
End;

Procedure TMainForm.OpenNClick(Sender: TObject);
Var
    FilePath: String;
    InputFile: TextFile;
    Num1, Num2, ErrNum: Integer;
Begin
    If OpenDialog.Execute() Then
    Begin

        FilePath := OpenDialog.FileName;
        If Not FilePath.EndsWith('.txt') Then
            MessageBox(MainForm.Handle, 'TXTERR', 'pizda ne .txt', MB_ICONWARNING + MB_OK)
        Else
        Begin
            {$I-}
            AssignFile(InputFile, FilePath);
            Reset(InputFile);
            {$I+}
            ErrNum := IOResult;
            If ErrNum = 0 Then
            Begin
                {$I-}
                ReadLn(InputFile, Num1);
                ReadLn(InputFile, Num2);
                {$I+}
                ErrNum := IOResult;
                If (ErrNum = 0) And EOF(InputFile) Then
                Begin
                    FirstAngleEdit.Text := IntToStr(Num1);
                    SecondAngleEdit.Text := IntToStr(Num2);
                End
                Else
                    If ErrNum = 106 { INVALID NUMBER } Then
                        MessageBox(MainForm.Handle, 'Ne Chisla', 'pizda ne chisla', MB_ICONWARNING + MB_OK)
                    Else
                        If (ErrNum = 105) Or (ErrNum = 100) Or (ErrNum = 104) { NOT OPEN FOR OUTPUT } Then
                            MessageBox(MainForm.Handle, 'FileErr', 'pizda ne otkrivayetsa', MB_ICONWARNING + MB_OK)
                        Else
                            If Not EOF(InputFile) And (ErrNum = 0) Then
                                MessageBox(MainForm.Handle, 'TooMuch', 'pizda dohera infi', MB_ICONWARNING + MB_OK)
                            Else
                                MessageBox(MainForm.Handle, 'FileFatErr', 'pizda ne assignitsya', MB_ICONWARNING + MB_OK);

            End
            Else
                MessageBox(MainForm.Handle, 'FileFatErr', 'pizda ne assignitsya', MB_ICONWARNING + MB_OK);
            {$I-}
            CloseFile(InputFile);
            {$I+}
        End;
    End;

End;

Procedure TMainForm.SaveNClick(Sender: TObject);
Var
    FilePath: String;
    OutputFile: TextFile;

Begin
    If SaveDialog.Execute() Then
    Begin
        FilePath := SaveDialog.FileName;
        If Not FilePath.EndsWith('.txt') Then
            MessageBox(MainForm.Handle, 'TXTERR', 'pizda ne .txt', MB_ICONWARNING + MB_OK)
        Else
        Begin
            {$I-}
            AssignFile(OutputFile, FilePath);
            Rewrite(OutputFile);
            {$I+}
            If IOResult = 0 Then
            Begin
                Write(OutputFile, 'Первый угол - ');
                WriteLn(OutputFile, FirstAngleEdit.Text);
                Write(OutputFile, 'Второй угол - ');
                WriteLn(OutputFile, SecondAngleEdit.Text);
                Write(OutputFile, 'Результат - ');
                WriteLn(OutputFile, AnswerLabel.Caption);
                IsFileSaved := True;
            End
            Else
                MessageBox(MainForm.Handle, 'FileErr', 'pizda ne sohranyaetsa', MB_ICONWARNING + MB_OK);
        End;
        {$I-}
        CloseFile(OutputFile);
        {$I+}
    End;
End;

Procedure TMainForm.SecondAngleEditChange(Sender: TObject);
Begin
    AnswerLabel.Visible := False;
    SaveN.Enabled := False;
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

    If (IsSecondEditFilled = True) And (IsFirstEditFilled = True) And
        (StrToInt(SecondAngleEdit.Text) + StrToInt(FirstAngleEdit.Text) < 180) Then
        AnswerButton.Enabled := True
    Else
        AnswerButton.Enabled := False;

End;

Procedure TMainForm.SecondAngleEditContextPopup(Sender: TObject; MousePos: TPoint; Var Handled: Boolean);
Begin
    Handled := True;
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
    SaveN.Enabled := True;
End;

Procedure TMainForm.DeveloperNClick(Sender: TObject);
Begin
    DeveloperForm.ShowModal();
End;

Procedure TMainForm.ExitNClick(Sender: TObject);
Begin
    MainForm.Close;
End;

End.
