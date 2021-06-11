object BaseDados: TBaseDados
  Left = 0
  Top = 0
  Caption = 'BaseDados'
  ClientHeight = 231
  ClientWidth = 375
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object ZConnection1: TZConnection
    ControlsCodePage = cCP_UTF16
    Catalog = ''
    HostName = ''
    Port = 3306
    Database = 'base_produtos'
    User = 'usuario'
    Password = 'Conectiva!@#$'
    Protocol = 'mysql'
    Left = 144
    Top = 80
  end
  object ZQuery1: TZQuery
    Connection = ZConnection1
    Params = <>
    Left = 208
    Top = 96
  end
end
