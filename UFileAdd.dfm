object frmFileAdd: TfrmFileAdd
  Left = 757
  Top = 140
  Width = 535
  Height = 731
  Caption = #54028#51068#52628#44032
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 153
    Width = 527
    Height = 547
    Align = alClient
    TabOrder = 0
    object Panel3: TPanel
      Left = 1
      Top = 505
      Width = 525
      Height = 41
      Align = alBottom
      TabOrder = 0
      object Button1: TButton
        Left = 352
        Top = 8
        Width = 75
        Height = 25
        Caption = #54869#51064
        TabOrder = 0
      end
      object Button2: TButton
        Left = 432
        Top = 8
        Width = 75
        Height = 25
        Caption = #52712#49548
        TabOrder = 1
      end
    end
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 525
      Height = 80
      Align = alTop
      TabOrder = 1
      object Label1: TLabel
        Left = 3
        Top = 40
        Width = 58
        Height = 13
        Caption = #48373#49324#54624' '#44221#47196
      end
      object Label2: TLabel
        Left = 2
        Top = 12
        Width = 58
        Height = 13
        Caption = #54028#51068' '#44396#48516#51088
      end
      object Label3: TLabel
        Left = 130
        Top = 12
        Width = 58
        Height = 13
        Caption = #54028#51068' '#54869#51109#51088
      end
      object cmInsert: TButton
        Left = 280
        Top = 8
        Width = 75
        Height = 25
        Caption = #54028#51068' '#52628#44032' '#8595
        TabOrder = 0
        OnClick = cmInsertClick
      end
      object cmDelete: TButton
        Left = 360
        Top = 8
        Width = 147
        Height = 25
        Caption = #49440#53469#54620' '#54028#51068' '#47785#47197#50640#49436' '#49325#51228
        TabOrder = 1
      end
      object edFromDir: TEdit
        Left = 3
        Top = 54
        Width = 504
        Height = 21
        TabOrder = 2
      end
      object edFindFile: TEdit
        Left = 65
        Top = 9
        Width = 59
        Height = 21
        TabOrder = 3
      end
      object edFindFileExt: TEdit
        Left = 190
        Top = 9
        Width = 54
        Height = 21
        TabOrder = 4
      end
    end
    object lbx_FileList: TListBox
      Left = 1
      Top = 81
      Width = 525
      Height = 424
      Align = alClient
      Color = clMoneyGreen
      ItemHeight = 13
      MultiSelect = True
      TabOrder = 2
    end
  end
  object memo1: TMemo
    Left = 0
    Top = 0
    Width = 527
    Height = 153
    Align = alTop
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Lines.Strings = (
      '1. '#54028#51068#47749' = LDW_* = '#54028#51068#47749#51032' '#50526' '#47928#44396#47196' '#46104#50612#51080#45716' '#54028#51068' '#47784#46160' '#52628#44032'.'
      '   = LDW_001.JPG, LDW_002.JPG..'
      ''
      '2. '#54028#51068#47749' = *001* = '#54644#45817' '#47928#44396#44032' '#54252#54632#46108' '#54028#51068#47749' '#47784#46160' '#52628#44032'.'
      '   = LDW_001.JPG, LDW_001.PNG, PGN_001.JPG.. '
      ''
      '3. '#54028#51068#47749' + '#54028#51068#54869#51109#51088' = '#44060#48324#54028#51068#52628#44032
      '   = LDW_001 + .JPG')
    ParentFont = False
    ReadOnly = True
    TabOrder = 1
  end
end
