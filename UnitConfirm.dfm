object FormConfirm: TFormConfirm
  Left = 563
  Top = 463
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'FormConfirm'
  ClientHeight = 56
  ClientWidth = 345
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
    Width = 336
    Height = 17
    Alignment = taCenter
    AutoSize = False
    Caption = 'The list has been changed! Do you want to save the list?'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object BYes: TButton
    Left = 10
    Top = 25
    Width = 101
    Height = 25
    Caption = 'BYes'
    TabOrder = 0
  end
  object BNo: TButton
    Left = 120
    Top = 25
    Width = 101
    Height = 25
    Caption = 'BNo'
    TabOrder = 1
  end
  object BBack: TButton
    Left = 235
    Top = 25
    Width = 101
    Height = 25
    Caption = 'BBack'
    TabOrder = 2
  end
end
