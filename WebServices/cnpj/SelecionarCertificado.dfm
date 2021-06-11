object frmSelecionarCertificado: TfrmSelecionarCertificado
  Left = 355
  Top = 229
  ActiveControl = StringGrid1
  Caption = 'frmSelecionarCertificado'
  ClientHeight = 237
  ClientWidth = 658
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  Position = poOwnerFormCenter
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 13
  object StringGrid1: TStringGrid
    Left = 0
    Top = 0
    Width = 658
    Height = 192
    Align = alClient
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goDrawFocusSelected, goColSizing]
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 0
    Top = 192
    Width = 658
    Height = 45
    Align = alBottom
    TabOrder = 1
    DesignSize = (
      658
      45)
    object BitBtn1: TBitBtn
      Left = 444
      Top = 5
      Width = 88
      Height = 30
      Anchors = [akTop, akRight]
      DoubleBuffered = True
      Kind = bkCancel
      ParentDoubleBuffered = False
      TabOrder = 0
    end
    object BitBtn2: TBitBtn
      Left = 556
      Top = 5
      Width = 88
      Height = 30
      Anchors = [akTop, akRight]
      DoubleBuffered = True
      Kind = bkOK
      ParentDoubleBuffered = False
      TabOrder = 1
    end
  end
end
