object MainView: TMainView
  Left = 0
  Top = 0
  Caption = 'Servidor EanPictures 2.3 - IP'
  ClientHeight = 729
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
    Top = 688
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
  end
  object Panel2: TPanel
    Left = 0
    Top = 41
    Width = 1008
    Height = 647
    Align = alClient
    TabOrder = 2
    object Bevel1: TBevel
      Left = 1
      Top = 501
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
    object GroupBox1: TGroupBox
      Left = 1
      Top = 186
      Width = 1006
      Height = 105
      Align = alTop
      Caption = 'Solicita'#231#245'es de Fotos ok'
      TabOrder = 1
      object MemoFotoOK: TMemo
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
    object GroupBox2: TGroupBox
      Left = 1
      Top = 396
      Width = 1006
      Height = 105
      Align = alTop
      Caption = 'Solicita'#231#245'es de fotos nao encontradas:'
      TabOrder = 2
      object MemoFotoErro: TMemo
        Left = 2
        Top = 15
        Width = 1002
        Height = 88
        Align = alClient
        TabOrder = 0
      end
    end
    object GroupBox3: TGroupBox
      Left = 1
      Top = 81
      Width = 1006
      Height = 105
      Align = alTop
      Caption = 'Solicita'#231#245'es de Descri'#231#245'es ok'
      TabOrder = 3
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
      Top = 291
      Width = 1006
      Height = 105
      Align = alTop
      Caption = 'Solicita'#231#245'es de Descri'#231#245'es nao encontradas:'
      TabOrder = 4
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
