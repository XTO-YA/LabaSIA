object Form1: TForm1
  Left = 300
  Top = 168
  Width = 745
  Height = 480
  Caption = '1 '#1079#1072#1076#1072#1085#1080#1077
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object inputPnl: TGroupBox
    Left = 0
    Top = 0
    Width = 729
    Height = 185
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 392
      Top = 184
      Width = 145
      Height = 1
      Caption = 'Label1'
    end
    object btnPanel: TPanel
      Left = 561
      Top = 15
      Width = 166
      Height = 168
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
      object DeleteBtn: TButton
        Left = 8
        Top = 40
        Width = 145
        Height = 81
        Caption = #1059#1076#1072#1083#1077#1085#1080#1077
        TabOrder = 0
        OnClick = DeleteBtnClick
      end
    end
    object memoPnl: TPanel
      Left = 2
      Top = 15
      Width = 559
      Height = 168
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object lbl1: TLabel
        Left = 16
        Top = 24
        Width = 86
        Height = 13
        Caption = #1042#1074#1077#1076#1080#1090#1077'  '#1076#1077#1088#1077#1074#1086
      end
      object lbl2: TLabel
        Left = 392
        Top = 24
        Width = 114
        Height = 13
        Caption = #1042#1074#1077#1076#1080#1090#1077' '#1085#1072#1095#1072#1083#1086' '#1089#1083#1086#1074#1072
      end
      object inputMemo: TMemo
        Left = 0
        Top = 48
        Width = 377
        Height = 120
        TabOrder = 0
        OnKeyPress = edtInputKeyPress
      end
      object WrdEdit: TEdit
        Left = 376
        Top = 48
        Width = 169
        Height = 21
        TabOrder = 1
        OnKeyPress = WrdEditKeyPress
      end
    end
  end
  object resulPnl: TGroupBox
    Left = 0
    Top = 185
    Width = 729
    Height = 257
    Align = alClient
    TabOrder = 1
    object lbl3: TLabel
      Left = 32
      Top = 0
      Width = 101
      Height = 16
      Caption = #1048#1089#1093#1086#1076#1085#1086#1077' '#1076#1077#1088#1077#1074#1086
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbl4: TLabel
      Left = 416
      Top = 0
      Width = 59
      Height = 16
      Caption = #1056#1077#1079#1091#1083#1100#1090#1072#1090
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object ResTreeView: TTreeView
      Left = 376
      Top = 16
      Width = 537
      Height = 241
      Indent = 19
      TabOrder = 0
    end
    object SourceTreeView: TTreeView
      Left = -8
      Top = 16
      Width = 385
      Height = 241
      Indent = 19
      TabOrder = 1
    end
  end
end
