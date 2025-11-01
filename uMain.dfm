object frmMain: TfrmMain
  Left = 683
  Top = 258
  Caption = #21098#20999#26495#23567#21161#25163' V2.0'
  ClientHeight = 701
  ClientWidth = 1151
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 12
  object Panel1: TPanel
    Left = 0
    Top = 671
    Width = 1151
    Height = 30
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 0
    ExplicitTop = 670
    ExplicitWidth = 1147
    DesignSize = (
      1151
      30)
    object Label11: TLabel
      Left = 232
      Top = 10
      Width = 65
      Height = 12
      Cursor = crHandPoint
      Alignment = taCenter
      Caption = #20316#32773#65306#34583#29275
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clActiveCaption
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = [fsBold, fsUnderline]
      ParentFont = False
      Layout = tlCenter
      OnClick = Label11Click
    end
    object Button1: TButton
      Left = 926
      Top = 3
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = #20445#23384
      TabOrder = 0
      OnClick = Button1Click
      ExplicitLeft = 922
    end
    object Button2: TButton
      Left = 1020
      Top = 3
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = #38544#34255
      TabOrder = 1
      OnClick = Button2Click
      ExplicitLeft = 1016
    end
    object CheckBox1: TCheckBox
      Left = 12
      Top = 5
      Width = 76
      Height = 17
      Caption = #33258#21160#21551#21160
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clActiveCaption
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = CheckBox1Click
    end
    object CheckBox2: TCheckBox
      Left = 120
      Top = 7
      Width = 89
      Height = 17
      Caption = #26174#31034#20027#31383#21475
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clActiveCaption
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = CheckBox2Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 353
    Height = 671
    Align = alLeft
    BevelInner = bvLowered
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitHeight = 670
    object Label2: TLabel
      Left = 10
      Top = 124
      Width = 6
      Height = 12
      Caption = '0'
    end
    object Label1: TLabel
      Left = 10
      Top = 95
      Width = 6
      Height = 12
      Caption = '0'
    end
    object Label3: TLabel
      Left = 10
      Top = 159
      Width = 6
      Height = 12
      Caption = '0'
    end
    object Label4: TLabel
      Left = 10
      Top = 192
      Width = 6
      Height = 12
      Caption = '0'
    end
    object Label5: TLabel
      Left = 178
      Top = 73
      Width = 6
      Height = 12
      Caption = '0'
    end
    object Label6: TLabel
      Left = 178
      Top = 106
      Width = 6
      Height = 12
      Caption = '0'
    end
    object Label7: TLabel
      Left = 178
      Top = 138
      Width = 6
      Height = 12
      Caption = '0'
    end
    object Label8: TLabel
      Left = 178
      Top = 167
      Width = 6
      Height = 12
      Caption = '0'
    end
    object Label9: TLabel
      Left = 177
      Top = 195
      Width = 6
      Height = 12
      Caption = '0'
    end
    object Label0: TLabel
      Left = 10
      Top = 64
      Width = 6
      Height = 12
      Caption = '0'
    end
    object Label110: TLabel
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 345
      Height = 26
      Align = alTop
      Alignment = taCenter
      Caption = #24555#36895#22797#21046#38190#24207#21495'(Ctrl+Shift+)'
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = #24494#36719#38597#40657
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
      ExplicitWidth = 255
    end
    object Label10: TLabel
      Left = 74
      Top = 40
      Width = 52
      Height = 12
      Caption = #21161#35760#21517#65306
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label13: TLabel
      Left = 24
      Top = 40
      Width = 39
      Height = 12
      Caption = #24207#21495#65306
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label12: TLabel
      Left = 234
      Top = 40
      Width = 52
      Height = 12
      Caption = #21161#35760#21517#65306
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label14: TLabel
      Left = 184
      Top = 40
      Width = 39
      Height = 12
      Caption = #24207#21495#65306
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label16: TLabel
      Left = 33
      Top = 223
      Width = 50
      Height = 25
      Alignment = taCenter
      AutoSize = False
      Caption = 'DColor'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
    end
    object Label17: TLabel
      Left = 198
      Top = 222
      Width = 56
      Height = 25
      Alignment = taCenter
      AutoSize = False
      Caption = 'WebColor'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
    end
    object SpeedButton1: TSpeedButton
      Left = 164
      Top = 216
      Width = 23
      Height = 16
      Caption = '->'
      OnClick = SpeedButton1Click
    end
    object SpeedButton2: TSpeedButton
      Left = 164
      Top = 235
      Width = 23
      Height = 16
      Caption = '<-'
      OnClick = SpeedButton2Click
    end
    object Edit10: TEdit
      Left = 32
      Top = 64
      Width = 121
      Height = 20
      ImeName = #20013#25991' - '#21326#23431#25340#38899#36755#20837#27861'V6'
      TabOrder = 0
      Text = 'Edit10'
      OnClick = ClickEvent_WithNameEdit
      OnDblClick = DBClickEvent_WithNameEdit
    end
    object Edit11: TEdit
      Left = 33
      Top = 93
      Width = 121
      Height = 20
      ImeName = #20013#25991' - '#21326#23431#25340#38899#36755#20837#27861'V6'
      TabOrder = 1
      Text = 'Edit10'
      OnClick = ClickEvent_WithNameEdit
      OnDblClick = DBClickEvent_WithNameEdit
    end
    object Edit12: TEdit
      Left = 34
      Top = 124
      Width = 121
      Height = 20
      ImeName = #20013#25991' - '#21326#23431#25340#38899#36755#20837#27861'V6'
      TabOrder = 2
      Text = 'Edit10'
      OnClick = ClickEvent_WithNameEdit
      OnDblClick = DBClickEvent_WithNameEdit
    end
    object Edit13: TEdit
      Left = 34
      Top = 156
      Width = 121
      Height = 20
      ImeName = #20013#25991' - '#21326#23431#25340#38899#36755#20837#27861'V6'
      TabOrder = 3
      Text = 'Edit10'
      OnClick = ClickEvent_WithNameEdit
      OnDblClick = DBClickEvent_WithNameEdit
    end
    object Edit14: TEdit
      Left = 34
      Top = 188
      Width = 121
      Height = 20
      ImeName = #20013#25991' - '#21326#23431#25340#38899#36755#20837#27861'V6'
      TabOrder = 4
      Text = 'Edit10'
      OnClick = ClickEvent_WithNameEdit
      OnDblClick = DBClickEvent_WithNameEdit
    end
    object Edit15: TEdit
      Left = 202
      Top = 68
      Width = 121
      Height = 20
      ImeName = #20013#25991' - '#21326#23431#25340#38899#36755#20837#27861'V6'
      TabOrder = 5
      Text = 'Edit10'
      OnClick = ClickEvent_WithNameEdit
      OnDblClick = DBClickEvent_WithNameEdit
    end
    object Edit16: TEdit
      Left = 202
      Top = 100
      Width = 121
      Height = 20
      ImeName = #20013#25991' - '#21326#23431#25340#38899#36755#20837#27861'V6'
      TabOrder = 6
      Text = 'Edit10'
      OnClick = ClickEvent_WithNameEdit
      OnDblClick = DBClickEvent_WithNameEdit
    end
    object Edit17: TEdit
      Left = 202
      Top = 132
      Width = 121
      Height = 20
      ImeName = #20013#25991' - '#21326#23431#25340#38899#36755#20837#27861'V6'
      TabOrder = 7
      Text = 'Edit10'
      OnClick = ClickEvent_WithNameEdit
      OnDblClick = DBClickEvent_WithNameEdit
    end
    object Edit18: TEdit
      Left = 201
      Top = 160
      Width = 121
      Height = 20
      ImeName = #20013#25991' - '#21326#23431#25340#38899#36755#20837#27861'V6'
      TabOrder = 8
      Text = 'Edit10'
      OnClick = ClickEvent_WithNameEdit
      OnDblClick = DBClickEvent_WithNameEdit
    end
    object Edit19: TEdit
      Left = 200
      Top = 188
      Width = 121
      Height = 20
      ImeName = #20013#25991' - '#21326#23431#25340#38899#36755#20837#27861'V6'
      TabOrder = 9
      Text = 'Edit10'
      OnClick = ClickEvent_WithNameEdit
      OnDblClick = DBClickEvent_WithNameEdit
    end
    object GroupBox1: TGroupBox
      Left = 1
      Top = 257
      Width = 351
      Height = 413
      Align = alBottom
      Caption = #20445#23384#20869#23481#65306
      TabOrder = 10
      ExplicitTop = 256
      object Label_ChooseMC: TLabel
        Left = 11
        Top = 24
        Width = 96
        Height = 12
        Caption = #24403#21069#32534#36753#20869#23481#39033#65306
      end
      object mc: TMemo
        Left = 2
        Top = 51
        Width = 347
        Height = 360
        Align = alBottom
        Alignment = taCenter
        ImeName = #20013#25991' - '#21326#23431#25340#38899#36755#20837#27861'V6'
        TabOrder = 0
      end
      object Button3: TButton
        Left = 265
        Top = 16
        Width = 55
        Height = 29
        Caption = #20445' '#23384
        TabOrder = 1
        OnClick = Button3Click
      end
    end
    object edtDColor: TEdit
      Left = 94
      Top = 225
      Width = 61
      Height = 20
      ImeName = #20013#25991' - '#21326#23431#25340#38899#36755#20837#27861'V6'
      TabOrder = 11
      Text = '$00000000'
    end
    object EdtWebColor: TEdit
      Left = 260
      Top = 225
      Width = 61
      Height = 20
      ImeName = #20013#25991' - '#21326#23431#25340#38899#36755#20837#27861'V6'
      TabOrder = 12
    end
  end
  object GroupBox2: TGroupBox
    AlignWithMargins = True
    Left = 353
    Top = 2
    Width = 798
    Height = 669
    Margins.Left = 0
    Margins.Top = 2
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alClient
    Caption = #21160#24577#24555#25463#21015#34920
    Padding.Top = 3
    TabOrder = 2
    ExplicitWidth = 794
    ExplicitHeight = 668
    object Label18: TLabel
      Left = 4
      Top = 216
      Width = 56
      Height = 25
      Alignment = taCenter
      AutoSize = False
      Caption = #26597#35810
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
    end
    object Label19: TLabel
      Left = 412
      Top = 219
      Width = 189
      Height = 25
      Alignment = taCenter
      AutoSize = False
      Caption = #21452#20987#26465#30446#34892' '#22797#21046#21040#31995#32479#21098#20999#26495
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
    end
    object ls: TValueListEditor
      AlignWithMargins = True
      Left = 2
      Top = 245
      Width = 794
      Height = 422
      Margins.Left = 0
      Margins.Top = 32
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alClient
      Ctl3D = True
      DrawingStyle = gdsGradient
      FixedColor = clBackground
      GradientStartColor = 16776951
      KeyOptions = [keyEdit, keyAdd, keyDelete, keyUnique]
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goDrawFocusSelected, goColSizing, goTabs, goRowSelect, goThumbTracking, goFixedColClick]
      ParentCtl3D = False
      TabOrder = 0
      TitleCaptions.Strings = (
        #26631#39064
        #20869#23481)
      OnClick = lsClick
      OnDblClick = lsDblClick
      ExplicitWidth = 790
      ExplicitHeight = 421
      ColWidths = (
        166
        622)
    end
    object Panel4: TPanel
      Left = 2
      Top = 17
      Width = 794
      Height = 27
      Align = alTop
      Caption = 'Panel4'
      ShowCaption = False
      TabOrder = 1
      ExplicitWidth = 790
      object Label15: TLabel
        Left = 1
        Top = 1
        Width = 56
        Height = 25
        Align = alLeft
        Alignment = taCenter
        AutoSize = False
        Caption = #26631#39064#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        Layout = tlCenter
      end
      object Button4: TSpeedButton
        AlignWithMargins = True
        Left = 644
        Top = 4
        Width = 77
        Height = 19
        Margins.Left = 6
        Align = alRight
        Caption = #22686#21152#26465#30446
        Flat = True
        OnClick = Button4Click
        ExplicitLeft = 462
        ExplicitTop = 6
        ExplicitHeight = 25
      end
      object btnSaveMC2: TSpeedButton
        AlignWithMargins = True
        Left = 730
        Top = 1
        Width = 60
        Height = 25
        Margins.Left = 6
        Margins.Top = 0
        Margins.Bottom = 0
        Align = alRight
        Caption = #20445#23384
        Flat = True
        OnClick = btnSaveMC2Click
        ExplicitLeft = 741
        ExplicitTop = -1
      end
      object edtMC2Name: TEdit
        AlignWithMargins = True
        Left = 60
        Top = 4
        Width = 575
        Height = 19
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = #23435#20307
        Font.Style = []
        ImeName = #20013#25991' - '#21326#23431#25340#38899#36755#20837#27861'V6'
        ParentFont = False
        TabOrder = 0
        ExplicitWidth = 571
        ExplicitHeight = 23
      end
    end
    object mc2: TMemo
      Left = 2
      Top = 44
      Width = 794
      Height = 169
      Align = alTop
      ImeName = #20013#25991' - '#21326#23431#25340#38899#36755#20837#27861'V6'
      TabOrder = 2
      OnKeyDown = mc2KeyDown
      ExplicitWidth = 790
    end
    object SearchBox1: TSearchBox
      Left = 56
      Top = 219
      Width = 313
      Height = 20
      TabOrder = 3
      TextHint = #26597#25214#26631#39064
      OnInvokeSearch = SearchBox1InvokeSearch
    end
  end
  object TrayIcon: TTrayIcon
    PopupMenu = PopMenu
    Visible = True
    OnMouseDown = TrayIconMouseDown
    Left = 801
    Top = 394
  end
  object PopMenu: TPopupMenu
    AutoHotkeys = maManual
    AutoLineReduction = maManual
    AutoPopup = False
    Left = 953
    Top = 394
    object N2: TMenuItem
      Caption = #26174#31034#20027#31383#21475
      OnClick = N2Click
    end
    object N1: TMenuItem
      Caption = #38544#34255
      OnClick = N1Click
    end
  end
  object PopList: TPopupMenu
    AutoHotkeys = maManual
    AutoLineReduction = maManual
    AutoPopup = False
    Left = 873
    Top = 394
    object NPopListFixClickError: TMenuItem
      Caption = #28857#38169#21862#65281
      OnClick = NPopListFixClickErrorClick
    end
    object PopListFixLine: TMenuItem
      Caption = '-'
    end
    object PopListFixLineBottom: TMenuItem
      Caption = '-'
    end
    object NSeting: TMenuItem
      Caption = #35774#32622
      OnClick = NSetingClick
    end
  end
end
