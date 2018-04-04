object frmUmain: TfrmUmain
  Left = 469
  Top = 192
  Width = 765
  Height = 600
  Caption = #44036#45800#54620' '#54028#51068#48373#49324
  Color = clBtnFace
  DefaultMonitor = dmDesktop
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
    Top = 0
    Width = 757
    Height = 65
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object memo1: TMemo
      Left = 0
      Top = 0
      Width = 757
      Height = 65
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Lines.Strings = (
        #54028#51068' '#47785#47197#51012' '#51648#51221#54620' '#44221#47196#47196' '#48373#49324#54616#45716' '#44592#45733'.'
        #54028#51068' '#47785#47197#51008' '#51648#51221#46108' '#44221#47196#50640#49436' '#54028#51068' '#48520#47084#50724#44592' '#48143', '#51649#51217' '#51077#47141#46020' '#44032#45733#54633#45768#45796'.')
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 65
    Width = 757
    Height = 504
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object Panel3: TPanel
      Left = 0
      Top = 0
      Width = 250
      Height = 504
      Align = alLeft
      TabOrder = 0
      object Panel6: TPanel
        Left = 1
        Top = 1
        Width = 248
        Height = 83
        Align = alTop
        TabOrder = 0
        object Label1: TLabel
          Left = 3
          Top = 40
          Width = 58
          Height = 13
          Caption = #48373#49324#54624' '#44221#47196
        end
        object Label3: TLabel
          Left = 2
          Top = 12
          Width = 58
          Height = 13
          Caption = #54028#51068' '#44396#48516#51088
        end
        object Label4: TLabel
          Left = 130
          Top = 12
          Width = 58
          Height = 13
          Caption = #54028#51068' '#54869#51109#51088
        end
        object edFromDir: TEdit
          Left = 2
          Top = 55
          Width = 241
          Height = 21
          TabOrder = 0
        end
        object edFindFile: TEdit
          Left = 65
          Top = 9
          Width = 59
          Height = 21
          TabOrder = 1
          OnKeyDown = edFindFileKeyDown
        end
        object edFindFileExt: TEdit
          Left = 190
          Top = 9
          Width = 54
          Height = 21
          TabOrder = 2
          OnKeyDown = edFindFileKeyDown
        end
      end
      object sh_FromList: TShellTreeView
        Left = 1
        Top = 84
        Width = 248
        Height = 419
        ObjectTypes = [otFolders]
        Root = 'rfDesktop'
        UseShellImages = True
        Align = alClient
        AutoRefresh = False
        Color = clMoneyGreen
        HideSelection = False
        Indent = 19
        ParentColor = False
        ParentShowHint = False
        RightClickSelect = True
        ShowHint = False
        ShowRoot = False
        TabOrder = 1
        OnChange = sh_FromListChange
      end
    end
    object Panel4: TPanel
      Left = 250
      Top = 0
      Width = 257
      Height = 504
      Align = alClient
      TabOrder = 1
      object Panel7: TPanel
        Left = 1
        Top = 1
        Width = 255
        Height = 69
        Align = alTop
        TabOrder = 0
        object cmInsert: TButton
          Left = 8
          Top = 8
          Width = 75
          Height = 25
          Caption = #54028#51068' '#52628#44032' '#8595
          TabOrder = 0
          OnClick = cmInsertClick
        end
        object cmCopyFiles: TButton
          Left = 88
          Top = 8
          Width = 75
          Height = 25
          Caption = #54028#51068#48373#49324' >>'
          TabOrder = 1
          OnClick = cmCopyFilesClick
        end
        object cmDelete: TButton
          Left = 8
          Top = 34
          Width = 235
          Height = 25
          Caption = #49440#53469#54620' '#54028#51068' '#47785#47197#50640#49436' '#49325#51228
          TabOrder = 2
          OnClick = cmDeleteClick
        end
        object cmFolderCopy: TButton
          Left = 168
          Top = 8
          Width = 75
          Height = 25
          Caption = #54260#45908#48373#49324' >>'
          TabOrder = 3
          OnClick = cmFolderCopyClick
        end
      end
      object lbx_FileList: TListBox
        Left = 1
        Top = 70
        Width = 255
        Height = 433
        Align = alClient
        Color = clMoneyGreen
        ItemHeight = 13
        MultiSelect = True
        TabOrder = 1
      end
    end
    object Panel5: TPanel
      Left = 507
      Top = 0
      Width = 250
      Height = 504
      Align = alRight
      TabOrder = 2
      object Panel8: TPanel
        Left = 1
        Top = 1
        Width = 248
        Height = 48
        Align = alTop
        TabOrder = 0
        object Label2: TLabel
          Left = 8
          Top = 8
          Width = 58
          Height = 13
          Caption = #48373#49324#46112' '#44221#47196
        end
        object edToDir: TEdit
          Left = 7
          Top = 23
          Width = 234
          Height = 21
          TabOrder = 0
        end
      end
      object sh_ToList: TShellTreeView
        Left = 1
        Top = 49
        Width = 248
        Height = 454
        ObjectTypes = [otFolders]
        Root = 'rfDesktop'
        UseShellImages = True
        Align = alClient
        AutoRefresh = False
        Color = clMoneyGreen
        HideSelection = False
        Indent = 19
        ParentColor = False
        RightClickSelect = True
        ShowRoot = False
        TabOrder = 1
        OnChange = sh_ToListChange
      end
    end
  end
end
