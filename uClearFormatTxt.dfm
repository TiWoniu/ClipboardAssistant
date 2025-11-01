object frmClearFormatTxt: TfrmClearFormatTxt
  Left = 686
  Top = 200
  Caption = #26684#24335#25991#26412#32431#25991#26412#21270
  ClientHeight = 232
  ClientWidth = 942
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  Position = poScreenCenter
  OnShow = FormShow
  TextHeight = 13
  object Label1: TLabel
    Left = 12
    Top = 16
    Width = 60
    Height = 13
    Caption = #21333#34892#25991#26412#65306
  end
  object Label2: TLabel
    Left = 12
    Top = 56
    Width = 60
    Height = 13
    Caption = #22810#34892#25991#26412#65306
  end
  object e: TEdit
    Left = 81
    Top = 8
    Width = 857
    Height = 33
    AutoSize = False
    Color = clBlack
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clLime
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    Text = 'e'
    OnChange = eChange
  end
  object m: TMemo
    Left = 82
    Top = 56
    Width = 856
    Height = 169
    Color = clBlack
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clLime
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = []
    Lines.Strings = (
      'm')
    ParentFont = False
    TabOrder = 1
    OnChange = mChange
  end
end
