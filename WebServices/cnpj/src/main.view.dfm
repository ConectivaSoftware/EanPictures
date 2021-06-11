object MainView: TMainView
  Left = 0
  Top = 0
  Caption = 'Servidor CNPJ'
  ClientHeight = 503
  ClientWidth = 1008
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1008
    Height = 41
    Align = alTop
    Caption = 'Server'
    TabOrder = 0
  end
  object Panel3: TPanel
    Left = 0
    Top = 462
    Width = 1008
    Height = 41
    Align = alBottom
    TabOrder = 1
    DesignSize = (
      1008
      41)
    object btnPower: TBitBtn
      Left = 862
      Top = 5
      Width = 142
      Height = 30
      Anchors = [akTop, akRight, akBottom]
      Caption = 'Start'
      TabOrder = 0
      OnClick = btnPowerClick
    end
    object btnSaveConfig: TBitBtn
      Left = 661
      Top = 5
      Width = 75
      Height = 30
      Anchors = []
      Caption = 'Save Config'
      TabOrder = 1
      OnClick = btnSaveConfigClick
    end
    object BtnNfe: TBitBtn
      Left = 488
      Top = 8
      Width = 75
      Height = 25
      Caption = 'NFE'
      TabOrder = 2
      OnClick = BtnNfeClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 41
    Width = 1008
    Height = 421
    Align = alClient
    TabOrder = 2
    object Bevel1: TBevel
      Left = 1
      Top = 291
      Width = 1006
      Height = 50
      Align = alTop
      ExplicitLeft = 160
      ExplicitTop = 376
      ExplicitWidth = 50
    end
    object ValueListEditor1: TValueListEditor
      Left = 1
      Top = 1
      Width = 1006
      Height = 80
      Align = alTop
      TabOrder = 0
      ColWidths = (
        150
        850)
      RowHeights = (
        18
        18)
    end
    object Memo1: TMemo
      Left = 1
      Top = 296
      Width = 1006
      Height = 124
      Align = alBottom
      Lines.Strings = (
        'ws:'
        '  api/cnpj/'
        ''
        'SetConfigs:'
        '  Path'
        '  Port'
        'Sample:'
        '  www.site.com:port/api/cnpj/:file'
        '  127.0.0.1:8000/api/cnpj/19600120000158')
      ScrollBars = ssVertical
      TabOrder = 1
    end
    object GroupBox3: TGroupBox
      Left = 1
      Top = 81
      Width = 1006
      Height = 105
      Align = alTop
      Caption = 'Solicita'#231#245'es de CNPJ ok'
      TabOrder = 2
      object MemoDescOK: TMemo
        Left = 2
        Top = 15
        Width = 1002
        Height = 88
        Align = alClient
        Lines.Strings = (
          'MemoOK')
        TabOrder = 0
      end
    end
    object GroupBox4: TGroupBox
      Left = 1
      Top = 186
      Width = 1006
      Height = 105
      Align = alTop
      Caption = 'Solicita'#231#245'es de CNPJ nao encontradas:'
      TabOrder = 3
      object MemoDescErro: TMemo
        Left = 2
        Top = 15
        Width = 1002
        Height = 88
        Align = alClient
        TabOrder = 0
      end
    end
  end
end
