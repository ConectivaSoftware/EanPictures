program Project1;

uses
  Forms,
  Unit1 in 'Unit1.pas' {frmEanPictures_DataLoad},
  dataloadcnpj in 'dataloadcnpj.pas',
  dataloadproduct in 'dataloadproduct.pas',
  Pkg.Json.DTO in 'Pkg.Json.DTO.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'EanPictures_DataLoad - DEMO';
  Application.CreateForm(TfrmEanPictures_DataLoad, frmEanPictures_DataLoad);
  Application.Run;
end.
