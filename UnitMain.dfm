object FormMain: TFormMain
  Left = 253
  Top = 228
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'FormMain'
  ClientHeight = 481
  ClientWidth = 912
  Color = clSkyBlue
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object LVText: TListView
    Left = 5
    Top = 5
    Width = 905
    Height = 261
    Checkboxes = True
    Columns = <
      item
        Caption = 'Form'
      end
      item
        Caption = 'Control'
      end
      item
        Caption = 'English'
        Width = 400
      end
      item
        Caption = 'Magyar'
        Width = 400
      end>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    GridLines = True
    HideSelection = False
    ReadOnly = True
    RowSelect = True
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    ViewStyle = vsReport
    OnSelectItem = LVTextSelectItem
  end
  object BDelete: TButton
    Left = 15
    Top = 300
    Width = 211
    Height = 25
    Caption = 'BDelete'
    TabOrder = 2
    OnClick = BDeleteClick
  end
  object BLoad: TButton
    Left = 685
    Top = 270
    Width = 211
    Height = 25
    Caption = 'BLoad'
    TabOrder = 5
    OnClick = BLoadClick
  end
  object BSave: TButton
    Left = 685
    Top = 300
    Width = 211
    Height = 25
    Caption = 'BSave'
    TabOrder = 6
    OnClick = BSaveClick
  end
  object GBStats: TGroupBox
    Left = 245
    Top = 270
    Width = 421
    Height = 86
    Caption = 'GBStats'
    TabOrder = 8
    object Label4: TLabel
      Left = 10
      Top = 25
      Width = 86
      Height = 17
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Number of Lines'
    end
    object Label6: TLabel
      Left = 10
      Top = 55
      Width = 86
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Selected Row'
    end
    object ELines: TEdit
      Left = 105
      Top = 20
      Width = 61
      Height = 21
      TabStop = False
      AutoSelect = False
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      Text = 'ELines'
    end
    object ERow: TEdit
      Left = 105
      Top = 50
      Width = 61
      Height = 21
      TabStop = False
      AutoSelect = False
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
      Text = 'ERow'
    end
    object MAbout: TMemo
      Left = 180
      Top = 15
      Width = 221
      Height = 61
      TabStop = False
      Enabled = False
      Lines.Strings = (
        'MAbout')
      ReadOnly = True
      TabOrder = 2
    end
  end
  object BSort: TButton
    Left = 15
    Top = 330
    Width = 211
    Height = 25
    Caption = 'BSort'
    TabOrder = 3
    OnClick = BSortClick
  end
  object BUncheck: TButton
    Left = 15
    Top = 270
    Width = 211
    Height = 25
    Caption = 'BUncheck'
    TabOrder = 1
    OnClick = BUncheckClick
  end
  object GBRecord: TGroupBox
    Left = 5
    Top = 360
    Width = 901
    Height = 116
    Caption = 'GBRecord'
    TabOrder = 4
    object Label1: TLabel
      Left = 5
      Top = 20
      Width = 81
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Form/Unit'
    end
    object Label2: TLabel
      Left = 5
      Top = 70
      Width = 81
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'English'
    end
    object Label3: TLabel
      Left = 5
      Top = 95
      Width = 81
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Magyar'
    end
    object LUkSize: TLabel
      Left = 840
      Top = 70
      Width = 51
      Height = 13
      AutoSize = False
      Caption = 'LUkSize'
    end
    object LHunSize: TLabel
      Left = 840
      Top = 95
      Width = 51
      Height = 13
      AutoSize = False
      Caption = 'LHunSize'
    end
    object Label5: TLabel
      Left = 5
      Top = 45
      Width = 81
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Control/Variable'
    end
    object BAdd: TButton
      Left = 410
      Top = 11
      Width = 156
      Height = 25
      Caption = 'BAdd'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      OnClick = BAddClick
    end
    object BModify: TButton
      Left = 570
      Top = 11
      Width = 156
      Height = 25
      Caption = 'BModify'
      TabOrder = 5
      OnClick = BModifyClick
    end
    object EForm: TEdit
      Left = 95
      Top = 15
      Width = 281
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clTeal
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Text = 'EForm'
      OnChange = EFormChange
      OnKeyPress = EFormKeyPress
    end
    object EUk: TEdit
      Left = 95
      Top = 65
      Width = 736
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      Text = 'EUk'
      OnChange = EUkChange
      OnKeyPress = EUkKeyPress
    end
    object EHun: TEdit
      Left = 95
      Top = 90
      Width = 736
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      Text = 'EHun'
      OnChange = EHunChange
      OnKeyPress = EHunKeyPress
    end
    object BClear: TButton
      Left = 730
      Top = 10
      Width = 156
      Height = 25
      Caption = 'BClear'
      TabOrder = 6
      OnClick = BClearClick
    end
    object EControl: TEdit
      Left = 95
      Top = 40
      Width = 281
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clTeal
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Text = 'EControl'
      OnChange = EControlChange
      OnKeyPress = EControlKeyPress
    end
  end
  object BExit: TButton
    Left = 685
    Top = 330
    Width = 211
    Height = 25
    Caption = 'BExit'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    OnClick = BExitClick
  end
  object OD: TOpenDialog
    Filter = 'Language Editor Files (*.lef)|*.lef'
    Options = [ofHideReadOnly, ofPathMustExist, ofFileMustExist, ofDontAddToRecent]
    Left = 650
    Top = 305
  end
  object SD: TSaveDialog
    Filter = 'Language Editor Files (*.lef)|*.lef'
    Options = [ofHideReadOnly, ofPathMustExist, ofDontAddToRecent]
    Left = 685
    Top = 305
  end
  object XPManifest1: TXPManifest
    Left = 720
    Top = 305
  end
end
