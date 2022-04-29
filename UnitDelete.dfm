object FormDelete: TFormDelete
  Left = 598
  Top = 639
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'FormDelete'
  ClientHeight = 56
  ClientWidth = 222
  Color = clMoneyGreen
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 5
    Top = 5
    Width = 211
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = 'Are you sure about deleting?'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object BDelete: TButton
    Left = 5
    Top = 25
    Width = 101
    Height = 25
    Caption = 'BDelete'
    TabOrder = 0
  end
  object BBack: TButton
    Left = 115
    Top = 25
    Width = 101
    Height = 25
    Caption = 'BBack'
    TabOrder = 1
  end
end
