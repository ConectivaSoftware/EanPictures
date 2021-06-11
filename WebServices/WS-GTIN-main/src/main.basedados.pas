unit main.basedados;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, ZAbstractConnection, ZConnection;

type
  TBaseDados = class(TForm)
    ZConnection1: TZConnection;
    ZQuery1: TZQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  BaseDados: TBaseDados;

implementation

{$R *.dfm}

end.
