Unit DeveloperUnit;

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
    TDeveloperForm = Class(TForm)
        DevLabel: TLabel;
    CloseDevButton: TButton;
    procedure CloseDevButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    Private
        { Private declarations }
    Public
        { Public declarations }
    End;

Var
    DeveloperForm: TDeveloperForm;

Implementation

{$R *.dfm}

procedure TDeveloperForm.CloseDevButtonClick(Sender: TObject);
begin
    DeveloperForm.Close;
end;

procedure TDeveloperForm.FormCreate(Sender: TObject);
begin
    Constraints.MinWidth := Width;
    Constraints.MaxWidth := Width;
    Constraints.MinHeight := Height;
    Constraints.MaxHeight := Height;
end;

End.
