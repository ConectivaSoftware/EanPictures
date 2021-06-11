program WsGTin.Aplication;

uses
  Vcl.Forms,
  main.view in 'src\main.view.pas' {MainView},
  wsHorse in 'src\wsHorse.pas',
  main.control in 'src\main.control.pas',
  main.basedados in 'src\main.basedados.pas' {BaseDados},
  ParametrosNFE in 'ParametrosNFE.pas' {FrmParametrosNFE},
  SelecionarCertificado in 'SelecionarCertificado.pas' {frmSelecionarCertificado};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainView, MainView);
  Application.CreateForm(TBaseDados, BaseDados);
  Application.CreateForm(TFrmParametrosNFE, FrmParametrosNFE);
  Application.CreateForm(TfrmSelecionarCertificado, frmSelecionarCertificado);
  application.Run;
end.
