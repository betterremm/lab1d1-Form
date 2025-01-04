object MainForm: TMainForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1051#1072#1073#1086#1088#1072#1090#1086#1088#1085#1072#1103' 1.1 '#1056#1072#1081#1095#1091#1082' '#1052#1080#1093#1072#1080#1083' 451004'
  ClientHeight = 500
  ClientWidth = 705
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = TopMainMenu
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  TextHeight = 15
  object FirstAngleLabel: TLabel
    Left = 72
    Top = 88
    Width = 116
    Height = 15
    Caption = #1042#1074#1077#1076#1080#1090#1077' '#1087#1077#1088#1074#1099#1081' '#1091#1075#1086#1083
  end
  object SecondAngleLabel: TLabel
    Left = 72
    Top = 216
    Width = 113
    Height = 15
    Caption = #1042#1074#1077#1076#1080#1090#1077' '#1074#1090#1086#1088#1086#1081' '#1091#1075#1086#1083
  end
  object AnswerLabel: TLabel
    Left = 496
    Top = 192
    Width = 67
    Height = 15
    Caption = 'AnswerLabel'
    Visible = False
  end
  object FirstAngleEdit: TEdit
    Left = 72
    Top = 120
    Width = 121
    Height = 23
    Hint = '1-178'
    TabOrder = 0
    OnChange = FirstAngleEditChange
    OnKeyPress = FirstAngleEditKeyPress
  end
  object SecondAngleEdit: TEdit
    Left = 72
    Top = 248
    Width = 121
    Height = 23
    Hint = '1-178'
    TabOrder = 1
    OnChange = SecondAngleEditChange
    OnKeyPress = SecondAngleEditKeyPress
  end
  object AnswerButton: TButton
    Left = 320
    Top = 188
    Width = 105
    Height = 25
    Caption = #1054#1090#1074#1077#1090
    TabOrder = 2
    OnClick = AnswerButtonClick
  end
  object TopMainMenu: TMainMenu
    Left = 640
    Top = 24
    object NoneN: TMenuItem
      Caption = #1060#1072#1081#1083
      object OpenN: TMenuItem
        Caption = #1054#1090#1082#1088#1099#1090#1100
        OnClick = OpenNClick
      end
      object SaveN: TMenuItem
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
        OnClick = SaveNClick
      end
      object N0: TMenuItem
        Caption = '-'
      end
      object ExitN: TMenuItem
        Caption = #1042#1099#1093#1086#1076
      end
    end
    object InstructionN: TMenuItem
      Caption = #1048#1085#1089#1090#1088#1091#1082#1094#1080#1103
      OnClick = InstructionNClick
    end
    object DeveloperN: TMenuItem
      Caption = #1054' '#1088#1072#1079#1088#1072#1073#1086#1090#1095#1080#1082#1077
      OnClick = DeveloperNClick
    end
  end
  object OpenDialog: TOpenDialog
    Filter = 'Text files (*.txt)|*.txt'
    Left = 640
    Top = 88
  end
  object SaveDialog: TSaveDialog
    Filter = 'Text files (*.txt)|*.txt'
    Left = 640
    Top = 144
  end
end
