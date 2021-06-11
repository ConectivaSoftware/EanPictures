unit ParametrosNFE;

interface

uses IniFiles, ShellAPI, ACBrTEFDClass, ACBrTEFDCliSiTef,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, ComCtrls, OleCtrls, SHDocVw,
  ACBrNFe, pcnConversao, ACBrUtil,
  ACBrBase, ACBrDFe, XMLIntf, XMLDoc, zlib, ACBrDevice,
  ACBrTEFD, Spin, ACBrEAD, printers,
  DBCtrls, DB, Mask,
  jpeg;

type
  TFrmParametrosNFE = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    OpenDialog1: TOpenDialog;
    Panel2: TPanel;
    btnSalvarConfig: TBitBtn;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    PageControl4: TPageControl;
    TabSheet3: TTabSheet;
    gbCertificado: TGroupBox;
    Label25: TLabel;
    sbtnGetCert: TSpeedButton;
    edtNumSerie: TEdit;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    TabSheet4: TTabSheet;
    GroupBox3: TGroupBox;
    sbtnPathSalvar: TSpeedButton;
    Label29: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label42: TLabel;
    spPathSchemas: TSpeedButton;
    edtPathLogs: TEdit;
    ckSalvar: TCheckBox;
    cbFormaEmissao: TComboBox;
    cbxAtualizarXML: TCheckBox;
    cbxExibirErroSchema: TCheckBox;
    edtFormatoAlerta: TEdit;
    cbxRetirarAcentos: TCheckBox;
    cbVersaoDF: TComboBox;
    edtPathSchemas: TEdit;
    TabSheet7: TTabSheet;
    gbProxy: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    edtProxyHost: TEdit;
    edtProxyPorta: TEdit;
    edtProxyUser: TEdit;
    edtProxySenha: TEdit;
    gbxRetornoEnvio: TGroupBox;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    cbxAjustarAut1: TCheckBox;
    edtTentativas: TEdit;
    edtIntervalo: TEdit;
    edtAguardar: TEdit;
    TabSheet13: TTabSheet;
    sbPathNFe: TSpeedButton;
    Label35: TLabel;
    Label39: TLabel;
    sbPathCan: TSpeedButton;
    Label46: TLabel;
    sbPathCCe: TSpeedButton;
    Label40: TLabel;
    sbPathInu: TSpeedButton;
    Label41: TLabel;
    sbPathDPEC: TSpeedButton;
    Label47: TLabel;
    sbPathEvento: TSpeedButton;
    cbxSalvarArqs: TCheckBox;
    cbxPastaMensal1: TCheckBox;
    cbxAdicionaLiteral: TCheckBox;
    cbxEmissaoPathNFe1: TCheckBox;
    cbxSalvaPathEvento: TCheckBox;
    cbxSepararPorCNPJ1: TCheckBox;
    edtPathCCe: TEdit;
    edtPathNFe: TEdit;
    edtPathCan: TEdit;
    edtPathInu: TEdit;
    edtPathDPEC: TEdit;
    edtPathEvento: TEdit;
    cbxSepararPorModelo1: TCheckBox;
    lblSSLLib: TLabel;
    lblCryptLib: TLabel;
    lblHttpLib: TLabel;
    lblXmlSign: TLabel;
    cbSSLLib: TComboBox;
    cbCryptLib: TComboBox;
    cbHttpLib: TComboBox;
    cbXmlSignLib: TComboBox;
    GroupBox4: TGroupBox;
    Label6: TLabel;
    lTimeOut: TLabel;
    lSSLLib1: TLabel;
    cbxVisualizar: TCheckBox;
    cbUF: TComboBox;
    rgTipoAmb: TRadioGroup;
    cbxSalvarSOAP: TCheckBox;
    seTimeOut: TSpinEdit;
    cbSSLType: TComboBox;
    BitBtn4: TBitBtn;
    Button6: TButton;
    PanelNomeEmp: TPanel;
    LBLNOMEARQCFG: TLabel;
    imganaosalvo: TImage;
    imgsalvo: TImage;
    Timer1: TTimer;
    ACBrNFe1: TACBrNFe;
    TabSheet2: TTabSheet;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    EditConsultaUF: TEdit;
    EditConsultaCPFCNPJ: TEdit;
    BtnConsultaCadastro: TBitBtn;
    memoRespWS: TMemo;
    MemoResp: TMemo;
    Panel3: TPanel;
    wbresposta: TWebBrowser;
    procedure sbPathNFeClick(Sender: TObject);
    procedure sbPathCanClick(Sender: TObject);
    procedure sbPathCCeClick(Sender: TObject);
    procedure sbPathInuClick(Sender: TObject);
    procedure sbPathDPECClick(Sender: TObject);
    procedure sbPathEventoClick(Sender: TObject);
    procedure spPathSchemasClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure PathClick(Sender: TObject);
    procedure sbtnGetCertClick(Sender: TObject);
    procedure btnSalvarConfigClick(Sender: TObject);
    procedure sbtnPathSalvarClick(Sender: TObject);
    procedure cbCryptLibChange(Sender: TObject);
    procedure cbHttpLibChange(Sender: TObject);
    procedure cbXmlSignLibChange(Sender: TObject);
    procedure cbSSLLibChange(Sender: TObject);
    procedure cbSSLTypeChange(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure Timer1Timer(
      Sender: TObject);
    procedure EdtCaminhoDBChange(
      Sender: TObject);
    procedure edtNumSerieChange(
      Sender: TObject);
    procedure cbxAtualizarXMLClick(
      Sender: TObject);
    procedure cbxExibirErroSchemaClick(
      Sender: TObject);
    procedure edtFormatoAlertaChange(
      Sender: TObject);
    procedure cbFormaEmissaoChange(
      Sender: TObject);
    procedure cbVersaoDFChange(
      Sender: TObject);
    procedure DBCheckBox1Click(
      Sender: TObject);
    procedure cbxRetirarAcentosClick(
      Sender: TObject);
    procedure ckSalvarClick(
      Sender: TObject);
    procedure edtPathLogsChange(
      Sender: TObject);
    procedure edtPathSchemasChange(
      Sender: TObject);
    procedure cbUFChange(
      Sender: TObject);
    procedure rgTipoAmbClick(
      Sender: TObject);
    procedure cbxVisualizarClick(
      Sender: TObject);
    procedure cbxSalvarSOAPClick(
      Sender: TObject);
    procedure seTimeOutClick(
      Sender: TObject);
    procedure cbxAjustarAut1Click(
      Sender: TObject);
    procedure edtAguardarChange(
      Sender: TObject);
    procedure edtTentativasChange(
      Sender: TObject);
    procedure edtIntervaloChange(
      Sender: TObject);
    procedure edtProxyHostChange(
      Sender: TObject);
    procedure edtProxyPortaChange(
      Sender: TObject);
    procedure edtProxyUserChange(
      Sender: TObject);
    procedure edtProxySenhaChange(
      Sender: TObject);
    procedure cbxSalvarArqsClick(
      Sender: TObject);
    procedure edtPathNFeChange(
      Sender: TObject);
    procedure FormShow(
      Sender: TObject);
    procedure BtnConsultaCadastroClick(Sender: TObject);
  private
    { Private declarations }

    procedure GravarConfiguracao ;
    procedure AtualizaSSLLibsCombo;

  public
    { Public declarations }
    //acbrnfe1 : TACBrNFe;
    procedure LerConfiguracao;
    procedure IniciarConfiguracao(acbrnfe : TACBrNFe);
    procedure gravafalso; //apenas seta o alterado como false
    function inverteboolean(const a: boolean): boolean;
    procedure LoadXML(MyMemo: TMemo; MyWebBrowser: TWebBrowser);
    function consultaieMT(const cnpj: string): string;
  end;
var
  FrmParametrosNFE: TFrmParametrosNFE;
  nomearquivo: string;
  alteradocfgnfe: boolean; //se alterou alguma coisa na tela

implementation

uses
  strutils, math, TypInfo, DateUtils, synacode, pcnNFe, pcnConversaoNFe, ACBrDFeConfiguracoes, pcnAuxiliar, ACBrDFeSSL, pcnNFeRTXT,
  FileCtrl, blcksock,
  SelecionarCertificado;

const
  SELDIRHELP = 1000;




{$R *.dfm}

procedure TFrmParametrosNFE.GravarConfiguracao;
Var IniFile : String ;
    Ini     : TIniFile ;
    StreamMemo : TMemoryStream;
begin

  IniFile :=

  acbrutil.applicationpath+'NFE.INI';
//  IniFile := ChangeFileExt(PASTASISTEMA+'NFe', '.ini');
  Ini := TIniFile.Create( IniFile );
  try
    Ini.WriteInteger( 'Certificado','SSLLib' , cbSSLLib.ItemIndex) ;
    Ini.WriteInteger( 'Certificado','CryptLib' , cbCryptLib.ItemIndex) ;
    Ini.WriteInteger( 'Certificado','HttpLib' , cbHttpLib.ItemIndex) ;
    Ini.WriteInteger( 'Certificado','XmlSignLib' , cbXmlSignLib.ItemIndex) ;
    Ini.WriteString( 'Certificado','NumSerie',edtNumSerie.Text) ;

    Ini.WriteBool(   'Geral','AtualizarXML',cbxAtualizarXML.Checked) ;
    Ini.WriteBool(   'Geral','ExibirErroSchema',cbxExibirErroSchema.Checked) ;
    Ini.WriteString( 'Geral','FormatoAlerta',edtFormatoAlerta.Text) ;
    Ini.WriteInteger( 'Geral','FormaEmissao',cbFormaEmissao.ItemIndex) ;

    Ini.WriteInteger( 'Geral','VersaoDF',cbVersaoDF.ItemIndex) ;
    Ini.WriteBool(   'Geral','RetirarAcentos',cbxRetirarAcentos.Checked) ;
    Ini.WriteBool(   'Geral','Salvar',ckSalvar.Checked) ;
    Ini.WriteString( 'Geral','PathSalvar',edtPathLogs.Text) ;
    Ini.WriteString( 'Geral','PathSchemas',edtPathSchemas.Text) ;

    Ini.WriteString( 'WebService','UF',cbUF.Text) ;
    Ini.WriteInteger( 'WebService','Ambiente'  ,rgTipoAmb.ItemIndex) ;
    Ini.WriteBool(   'WebService','Visualizar',cbxVisualizar.Checked) ;
    Ini.WriteBool(   'WebService','SalvarSOAP',cbxSalvarSOAP.Checked) ;
    Ini.WriteBool(   'WebService','AjustarAut',cbxAjustarAut1.Checked) ;
    Ini.WriteString( 'WebService','Aguardar'    ,edtAguardar.Text) ;
    Ini.WriteString( 'WebService','Tentativas'  ,edtTentativas.Text) ;
    Ini.WriteString( 'WebService','Intervalo'  ,edtIntervalo.Text) ;
    Ini.WriteInteger( 'WebService','TimeOut'   ,seTimeOut.Value) ;
    Ini.WriteInteger( 'WebService','SSLType' , cbSSLType.ItemIndex) ;

    Ini.WriteString( 'Proxy','Host'   ,edtProxyHost.Text) ;
    Ini.WriteString( 'Proxy','Porta'  ,edtProxyPorta.Text) ;
    Ini.WriteString( 'Proxy','User'   ,edtProxyUser.Text) ;
    Ini.WriteString( 'Proxy','Pass'   ,edtProxySenha.Text) ;

    Ini.WriteBool(   'Arquivos','Salvar'          ,cbxSalvarArqs.Checked) ;
    Ini.WriteBool(   'Arquivos','AddLiteral'      ,cbxAdicionaLiteral.Checked) ;
    Ini.WriteBool(   'Arquivos','SalvarPathEvento',cbxSalvaPathEvento.Checked) ;
    Ini.WriteString( 'Arquivos','PathNFe'    ,edtPathNFe.Text) ;
    Ini.WriteString( 'Arquivos','PathCan'    ,edtPathCan.Text) ;
    Ini.WriteString( 'Arquivos','PathInu'    ,edtPathInu.Text) ;
    Ini.WriteString( 'Arquivos','PathDPEC'   ,edtPathDPEC.Text) ;
    Ini.WriteString( 'Arquivos','PathCCe'    ,edtPathCCe.Text) ;
    Ini.WriteString( 'Arquivos','PathEvento' ,edtPathEvento.Text) ;
  finally
    Ini.Free ;
  end;

end;

procedure TFrmParametrosNFE.AtualizaSSLLibsCombo;
begin
  with ACBrNFe1 do
  begin
    cbSSLLib.ItemIndex := Integer( Configuracoes.Geral.SSLLib );
    cbCryptLib.ItemIndex := Integer( Configuracoes.Geral.SSLCryptLib );
    cbHttpLib.ItemIndex := Integer( Configuracoes.Geral.SSLHttpLib );
    cbXmlSignLib.ItemIndex := Integer( Configuracoes.Geral.SSLXmlSignLib );
    cbSSLType.Enabled := ( Configuracoes.Geral.SSLHttpLib in [httpWinHttp, httpOpenSSL]) ;
  end;
end;

procedure TFrmParametrosNFE.LerConfiguracao;
Var IniFile  : String ;
    Ini     : TIniFile ;
    Ok : Boolean;
    StreamMemo : TMemoryStream;
begin
  IniFile := acbrutil.applicationpath+'NFE.INI';
  LBLNOMEARQCFG.Caption:=acbrutil.applicationpath+'NFE.INI';
  Ini := TIniFile.Create( IniFile );
  try
    cbSSLLib.ItemIndex:= Ini.ReadInteger( 'Certificado','SSLLib' ,4) ;
    cbCryptLib.ItemIndex := Ini.ReadInteger( 'Certificado','CryptLib' , 3) ;
    cbHttpLib.ItemIndex := Ini.ReadInteger( 'Certificado','HttpLib' , 2) ;
    cbXmlSignLib.ItemIndex := Ini.ReadInteger( 'Certificado','XmlSignLib' , 2) ;

    cbSSLLibChange(Self);


    edtNumSerie.Text := Ini.ReadString( 'Certificado','NumSerie','') ;

    ACBrNFe1.Configuracoes.Certificados.NumeroSerie := edtNumSerie.Text;

    cbxAtualizarXML.Checked    := Ini.ReadBool(   'Geral','AtualizarXML',True) ;
    cbxExibirErroSchema.Checked    := Ini.ReadBool(   'Geral','ExibirErroSchema',True) ;
    edtFormatoAlerta.Text    := Ini.ReadString( 'Geral','FormatoAlerta'  ,'TAG:%TAGNIVEL% ID:%ID%/%TAG%(%DESCRICAO%) - %MSG%.') ;
    cbFormaEmissao.ItemIndex := Ini.ReadInteger( 'Geral','FormaEmissao',0) ;
    cbVersaoDF.ItemIndex := Ini.ReadInteger( 'Geral','VersaoDF',2) ;
    ckSalvar.Checked     := Ini.ReadBool(   'Geral','Salvar'      ,True) ;
    cbxRetirarAcentos.Checked := Ini.ReadBool(   'Geral','RetirarAcentos',True) ;
    edtPathLogs.Text     := Ini.ReadString( 'Geral','PathSalvar'  ,PathWithDelim(ExtractFilePath(Application.ExeName))+'Logs') ;
    edtPathSchemas.Text  := Ini.ReadString( 'Geral','PathSchemas'  ,acbrutil.applicationpath+'Schemas') ;

    with ACBrNFe1.Configuracoes.Geral do
    begin
      try
      ExibirErroSchema := cbxExibirErroSchema.Checked;
      RetirarAcentos   := cbxRetirarAcentos.Checked;
      FormatoAlerta    := edtFormatoAlerta.Text;
      FormaEmissao     := TpcnTipoEmissao(cbFormaEmissao.ItemIndex);
      VersaoDF         := TpcnVersaoDF(cbVersaoDF.ItemIndex);
      Salvar           := true; //sempre digo pra salvar porque o usuario pode alterar e fazer uma baita de uma zona aqui

      except
        showmessage('Existe um problema no seu arquivo de configuração da NFE. Apague o mesmo e faça a configuração novamente.');
      end;
    end;

    cbUF.ItemIndex        := cbUF.Items.IndexOf(Ini.ReadString( 'WebService','UF','SP')) ;
    rgTipoAmb.ItemIndex   := Ini.ReadInteger( 'WebService','Ambiente'  ,0) ;
    cbxVisualizar.Checked  := Ini.ReadBool(    'WebService','Visualizar',False) ;
    cbxSalvarSOAP.Checked := Ini.ReadBool(    'WebService','SalvarSOAP',False) ;
    cbxAjustarAut1.Checked  := Ini.ReadBool(   'WebService','AjustarAut' ,False) ;

    edtAguardar.Text       := Ini.ReadString( 'WebService','Aguardar'  ,'0') ;
    edtTentativas.Text     := Ini.ReadString( 'WebService','Tentativas','5') ;
    edtIntervalo.Text      := Ini.ReadString( 'WebService','Intervalo' ,'0') ;
    seTimeOut.Value        := Ini.ReadInteger('WebService','TimeOut'  ,5000) ;
    cbSSLType.ItemIndex    := Ini.ReadInteger('WebService','SSLType' , 0) ;

    edtProxyHost.Text  := Ini.ReadString( 'Proxy','Host'   ,'') ;
    edtProxyPorta.Text := Ini.ReadString( 'Proxy','Porta'  ,'') ;
    edtProxyUser.Text  := Ini.ReadString( 'Proxy','User'   ,'') ;
    edtProxySenha.Text := Ini.ReadString( 'Proxy','Pass'   ,'') ;

    with ACBrNFe1.Configuracoes.WebServices do
    begin
      UF         := cbUF.Text;
      Ambiente   := StrToTpAmb(Ok,IntToStr(rgTipoAmb.ItemIndex+1));
      Visualizar := cbxVisualizar.Checked;
      Salvar     := cbxSalvarSOAP.Checked;
      AjustaAguardaConsultaRet := cbxAjustarAut1.Checked;
      if NaoEstaVazio(edtAguardar.Text)then
         AguardarConsultaRet := ifThen(StrToInt(edtAguardar.Text)<1000,StrToInt(edtAguardar.Text)*1000,StrToInt(edtAguardar.Text))
      else
         edtAguardar.Text := IntToStr(AguardarConsultaRet);

      if NaoEstaVazio(edtTentativas.Text) then
        Tentativas          := StrToInt(edtTentativas.Text)
      else
        edtTentativas.Text := IntToStr(Tentativas);

      if NaoEstaVazio(edtIntervalo.Text) then
        IntervaloTentativas := ifThen(StrToInt(edtIntervalo.Text)<1000,StrToInt(edtIntervalo.Text)*1000,StrToInt(edtIntervalo.Text))
      else
        edtIntervalo.Text := IntToStr(ACBrNFe1.Configuracoes.WebServices.IntervaloTentativas);

      ProxyHost := edtProxyHost.Text;
      ProxyPort := edtProxyPorta.Text;
      ProxyUser := edtProxyUser.Text;
      ProxyPass := edtProxySenha.Text;
    end;

    cbxSalvarArqs.Checked       := Ini.ReadBool(   'Arquivos','Salvar'     ,false);
    cbxPastaMensal1.Checked      := true;
    cbxAdicionaLiteral.Checked  := Ini.ReadBool(   'Arquivos','AddLiteral' ,false);
    cbxEmissaoPathNFe1.Checked   := true;
    cbxSalvaPathEvento.Checked  := Ini.ReadBool(   'Arquivos','SalvarPathEvento',true);
    cbxSepararPorCNPJ1.Checked   := true;
    cbxSepararPorModelo1.Checked := true;
    edtPathNFe.Text             := Ini.ReadString( 'Arquivos','PathNFe'    ,'') ;
    edtPathCan.Text             := Ini.ReadString( 'Arquivos','PathCan'    ,'') ;
    edtPathInu.Text             := Ini.ReadString( 'Arquivos','PathInu'    ,'') ;
    edtPathDPEC.Text            := Ini.ReadString( 'Arquivos','PathDPEC'   ,'') ;
    edtPathCCe.Text             := Ini.ReadString( 'Arquivos','PathCCe'   ,'') ;
    edtPathEvento.Text          := Ini.ReadString( 'Arquivos','PathEvento','') ;

     with ACBrNFe1.Configuracoes.Arquivos do
     begin
       Salvar             := true;
       SepararPorMes      := cbxPastaMensal1.Checked;
       AdicionarLiteral   := cbxAdicionaLiteral.Checked;
       EmissaoPathNFe     := cbxEmissaoPathNFe1.Checked;
       SalvarEvento       := cbxSalvaPathEvento.Checked;
       SepararPorCNPJ     := cbxSepararPorCNPJ1.Checked;
       SepararPorModelo   := cbxSepararPorModelo1.Checked;
       PathSalvar         := edtPathLogs.Text;
       PathSchemas        := edtPathSchemas.Text+'\NFE';
       PathNFe            := edtPathNFe.Text;
       PathInu            := edtPathInu.Text;
       PathEvento         := edtPathEvento.Text;
     end;
  finally
     Ini.Free ;
     alteradocfgnfe:=false;
  end;
end;


procedure TFrmParametrosNFE.PathClick(Sender: TObject);
var
  Dir: string;
begin
  if Length(TEdit(Sender).Text) <= 0 then
     Dir := ExtractFileDir(application.ExeName)
  else
     Dir := TEdit(Sender).Text;

  if SelectDirectory(Dir, [sdAllowCreate, sdPerformCreate, sdPrompt],SELDIRHELP) then
    TEdit(Sender).Text := Dir;
end;

procedure TFrmParametrosNFE.rgTipoAmbClick(
  Sender: TObject);
begin
  alteradocfgnfe:=true;

end;

procedure TFrmParametrosNFE.sbPathNFeClick(Sender: TObject);
begin
  PathClick(edtPathNFe);
end;

procedure TFrmParametrosNFE.sbPathCanClick(Sender: TObject);
begin
  PathClick(edtPathCan);
end;

procedure TFrmParametrosNFE.sbPathCCeClick(Sender: TObject);
begin
  PathClick(edtPathCCe);
end;

procedure TFrmParametrosNFE.sbPathInuClick(Sender: TObject);
begin
  PathClick(edtPathInu);
end;

procedure TFrmParametrosNFE.sbPathDPECClick(Sender: TObject);
begin
  PathClick(edtPathDPEC);
end;

procedure TFrmParametrosNFE.sbPathEventoClick(Sender: TObject);
begin
  PathClick(edtPathEvento);
end;

procedure TFrmParametrosNFE.spPathSchemasClick(Sender: TObject);
begin
  PathClick(edtPathSchemas);
end;

procedure TFrmParametrosNFE.Timer1Timer(
  Sender: TObject);
begin
  imgsalvo.Visible:=alteradocfgnfe = false;
  imganaosalvo.visible:=inverteboolean(imgsalvo.Visible);
end;

procedure TFrmParametrosNFE.Button1Click(Sender: TObject);
begin
  ShowMessage( FormatDateBr(ACBrNFe1.SSL.CertDataVenc) );
end;

procedure TFrmParametrosNFE.Button2Click(Sender: TObject);
begin
  ShowMessage( ACBrNFe1.SSL.CertNumeroSerie );
end;

procedure TFrmParametrosNFE.Button3Click(Sender: TObject);
begin
  ShowMessage( ACBrNFe1.SSL.CertSubjectName + sLineBreak + sLineBreak +
               'Razão Social: '+ ACBrNFe1.SSL.CertRazaoSocial);
end;

procedure TFrmParametrosNFE.Button4Click(Sender: TObject);
begin
  ShowMessage( ACBrNFe1.SSL.CertCNPJ );
end;

procedure TFrmParametrosNFE.sbtnGetCertClick(Sender: TObject);
var
  I: Integer;
  ASerie: String;
  AddRow: Boolean;
begin
  frmSelecionarCertificado := TfrmSelecionarCertificado.Create(Self);
  try
    ACBrNFe1.SSL.LerCertificadosStore;
    AddRow := False;

    with frmSelecionarCertificado.StringGrid1 do
    begin
      ColWidths[0] := 220;
      ColWidths[1] := 250;
      ColWidths[2] := 120;
      ColWidths[3] := 80;
      ColWidths[4] := 150;
      Cells[ 0, 0 ] := 'Num.Série';
      Cells[ 1, 0 ] := 'Razão Social';
      Cells[ 2, 0 ] := 'CNPJ';
      Cells[ 3, 0 ] := 'Validade';
      Cells[ 4, 0 ] := 'Certificadora';
    end;

    For I := 0 to ACBrNFe1.SSL.ListaCertificados.Count-1 do
    begin
      with ACBrNFe1.SSL.ListaCertificados[I] do
      begin
        ASerie := NumeroSerie;
        if (CNPJ <> '') then
        begin
          with frmSelecionarCertificado.StringGrid1 do
          begin
            if Addrow then
              RowCount := RowCount + 1;

            Cells[ 0, RowCount-1] := NumeroSerie;
            Cells[ 1, RowCount-1] := RazaoSocial;
            Cells[ 2, RowCount-1] := CNPJ;
            Cells[ 3, RowCount-1] := FormatDateBr(DataVenc);
            Cells[ 4, RowCount-1] := Certificadora;
            AddRow := True;
          end;
        end;
      end;
    end;

    frmSelecionarCertificado.ShowModal;

    if frmSelecionarCertificado.ModalResult = mrOK then
      edtNumSerie.Text := frmSelecionarCertificado.StringGrid1.Cells[ 0,
                            frmSelecionarCertificado.StringGrid1.Row];

  finally
     frmSelecionarCertificado.Free;
  end;
  //edtNumSerie.Text := ACBrNFe.SSL.SelecionarCertificado;
end;

procedure TFrmParametrosNFE.BitBtn4Click(Sender: TObject);
begin
  cbSSLLib.ItemIndex:=5; //custom
  cbCryptLib.ItemIndex:=1; //openssl
  cbHttpLib.ItemIndex:=3; //openssl
  cbXmlSignLib.ItemIndex:=2; //msxml

//  ACBrNFe.Configuracoes.Geral.SSLLib := TSSLLib(cbSSLLib.ItemIndex);
//  AtualizaSSLLibsCombo;
end;

function tfrmparametrosnfe.consultaieMT(const cnpj: string): string;
begin
  ACBrNFe1.WebServices.ConsultaCadastro.UF  := 'MT';
  ACBrNFe1.WebServices.ConsultaCadastro.CNPJ := cnpj;
  ACBrNFe1.WebServices.ConsultaCadastro.Executar;
  result:=ACBrNFe1.WebServices.ConsultaCadastro.retconscad.InfCad.items[0].ie;

end;


procedure TFrmParametrosNFE.BtnConsultaCadastroClick(Sender: TObject);
var
 osql: tstringlist;
begin
  osql:=tstringlist.create();
  ACBrNFe1.WebServices.ConsultaCadastro.UF  := EditConsultaUF.text;

  if Length(EditConsultaCPFCNPJ.text) > 11 then
     ACBrNFe1.WebServices.ConsultaCadastro.CNPJ := EditConsultaCPFCNPJ.text
  else
     ACBrNFe1.WebServices.ConsultaCadastro.CPF := EditConsultaCPFCNPJ.text;
  ACBrNFe1.WebServices.ConsultaCadastro.Executar;

  MemoResp.Lines.Text := ACBrNFe1.WebServices.ConsultaCadastro.RetWS;


  memoRespWS.Lines.Text := ACBrNFe1.WebServices.ConsultaCadastro.RetornoWS;
  LoadXML(MemoResp, WBResposta);


  osql.Clear;
  osql.Add('');
  osql.Add('Consulta Cadastro');
  osql.Add('versao: ' +ACBrNFe1.WebServices.ConsultaCadastro.versao);
  osql.Add('verAplic: ' +ACBrNFe1.WebServices.ConsultaCadastro.verAplic);
  osql.Add('cStat: '    +IntToStr(ACBrNFe1.WebServices.ConsultaCadastro.cStat));
  osql.Add('xMotivo: '  +ACBrNFe1.WebServices.ConsultaCadastro.xMotivo);
  osql.Add('DhCons: ' +DateTimeToStr(ACBrNFe1.WebServices.ConsultaCadastro.DhCons));
  osql.Add('ie: ' +ACBrNFe1.WebServices.ConsultaCadastro.retconscad.InfCad.items[0].ie);
  showmessage(osql.text);
  freeandnil(osql);
end;

procedure TFrmParametrosNFE.btnSalvarConfigClick(Sender: TObject);
begin
  GravarConfiguracao;
  LerConfiguracao;
  alteradocfgnfe:=false;
end;

procedure TFrmParametrosNFE.IniciarConfiguracao(acbrnfe : TACBrNFe);
  var
      T : TSSLLib;
      I : TpcnTipoEmissao ;
      J : TpcnModeloDF;
      K : TpcnVersaoDF;
      U: TSSLCryptLib;
      V: TSSLHttpLib;
      X: TSSLXmlSignLib;
      Y: TSSLType;
begin
  ACBrNFe:= acbrnfe;
  cbSSLLib.Items.Clear ;
  For T := Low(TSSLLib) to High(TSSLLib) do
    cbSSLLib.Items.Add( GetEnumName(TypeInfo(TSSLLib), integer(T) ) ) ;
  cbSSLLib.ItemIndex := 0 ;

  cbCryptLib.Items.Clear ;
  For U := Low(TSSLCryptLib) to High(TSSLCryptLib) do
    cbCryptLib.Items.Add( GetEnumName(TypeInfo(TSSLCryptLib), integer(U) ) ) ;
  cbCryptLib.ItemIndex := 0 ;

  cbHttpLib.Items.Clear ;
  For V := Low(TSSLHttpLib) to High(TSSLHttpLib) do
    cbHttpLib.Items.Add( GetEnumName(TypeInfo(TSSLHttpLib), integer(V) ) ) ;
  cbHttpLib.ItemIndex := 0 ;

  cbXmlSignLib.Items.Clear ;
  For X := Low(TSSLXmlSignLib) to High(TSSLXmlSignLib) do
    cbXmlSignLib.Items.Add( GetEnumName(TypeInfo(TSSLXmlSignLib), integer(X) ) ) ;
  cbXmlSignLib.ItemIndex := 0 ;

  cbSSLType.Items.Clear ;
  For Y := Low(TSSLType) to High(TSSLType) do
    cbSSLType.Items.Add( GetEnumName(TypeInfo(TSSLType), integer(Y) ) ) ;
  cbSSLType.ItemIndex := 0 ;

  cbFormaEmissao.Items.Clear ;
  For I := Low(TpcnTipoEmissao) to High(TpcnTipoEmissao) do
     cbFormaEmissao.Items.Add( GetEnumName(TypeInfo(TpcnTipoEmissao), integer(I) ) ) ;
  cbFormaEmissao.Items[0] := 'teNormal' ;
  cbFormaEmissao.ItemIndex := 0 ;


  cbVersaoDF.Items.Clear ;
  For K := Low(TpcnVersaoDF) to High(TpcnVersaoDF) do
     cbVersaoDF.Items.Add( GetEnumName(TypeInfo(TpcnVersaoDF), integer(K) ) ) ;
  cbVersaoDF.Items[0] := 've200' ;
  cbVersaoDF.ItemIndex := 0 ;

  LerConfiguracao;
end;

procedure TFrmParametrosNFE.sbtnPathSalvarClick(Sender: TObject);
begin
 PathClick(edtPathLogs);
end;

procedure TFrmParametrosNFE.seTimeOutClick(
  Sender: TObject);
begin
  alteradocfgnfe:=true;

end;

procedure TFrmParametrosNFE.cbCryptLibChange(Sender: TObject);
begin
  alteradocfgnfe:=true;
  try
    if cbCryptLib.ItemIndex <> -1 then
      ACBrNFe1.Configuracoes.Geral.SSLCryptLib := TSSLCryptLib(cbCryptLib.ItemIndex);
  finally
    AtualizaSSLLibsCombo;
  end;
end;

procedure TFrmParametrosNFE.cbFormaEmissaoChange(
  Sender: TObject);
begin
  alteradocfgnfe:=true;

end;

procedure TFrmParametrosNFE.cbHttpLibChange(Sender: TObject);
begin
  alteradocfgnfe:=true;
  try
    if cbHttpLib.ItemIndex <> -1 then
      ACBrNFe1.Configuracoes.Geral.SSLHttpLib := TSSLHttpLib(cbHttpLib.ItemIndex);
  finally
    AtualizaSSLLibsCombo;
  end;
end;

procedure TFrmParametrosNFE.cbXmlSignLibChange(Sender: TObject);
begin
  alteradocfgnfe:=true;
  try
    if cbXmlSignLib.ItemIndex <> -1 then
      ACBrNFe1.Configuracoes.Geral.SSLXmlSignLib := TSSLXmlSignLib(cbXmlSignLib.ItemIndex);
  finally
    AtualizaSSLLibsCombo;
  end;
end;

procedure TFrmParametrosNFE.cbxRetirarAcentosClick(
  Sender: TObject);
begin
  alteradocfgnfe:=true;

end;

procedure TFrmParametrosNFE.cbxSalvarArqsClick(
  Sender: TObject);
begin
  alteradocfgnfe:=true;

end;

procedure TFrmParametrosNFE.cbxSalvarSOAPClick(
  Sender: TObject);
begin
  alteradocfgnfe:=true;

end;

procedure TFrmParametrosNFE.cbxVisualizarClick(
  Sender: TObject);
begin
  alteradocfgnfe:=true;

end;

procedure TFrmParametrosNFE.ckSalvarClick(
  Sender: TObject);
begin
  alteradocfgnfe:=true;

end;

procedure TFrmParametrosNFE.DBCheckBox1Click(
  Sender: TObject);
begin
  alteradocfgnfe:=true;

end;

procedure TFrmParametrosNFE.edtAguardarChange(
  Sender: TObject);
begin
  alteradocfgnfe:=true;

end;

procedure TFrmParametrosNFE.EdtCaminhoDBChange(
  Sender: TObject);
begin
  alteradocfgnfe:=true;

end;

procedure TFrmParametrosNFE.edtFormatoAlertaChange(
  Sender: TObject);
begin
  alteradocfgnfe:=true;

end;

procedure TFrmParametrosNFE.edtIntervaloChange(
  Sender: TObject);
begin
  alteradocfgnfe:=true;

end;

procedure TFrmParametrosNFE.edtNumSerieChange(
  Sender: TObject);
begin
  alteradocfgnfe:=true;

end;

procedure TFrmParametrosNFE.edtPathLogsChange(
  Sender: TObject);
begin
  alteradocfgnfe:=true;

end;

procedure TFrmParametrosNFE.edtPathNFeChange(
  Sender: TObject);
begin
  alteradocfgnfe:=true;

end;

procedure TFrmParametrosNFE.edtPathSchemasChange(
  Sender: TObject);
begin
  alteradocfgnfe:=true;

end;

procedure TFrmParametrosNFE.edtProxyHostChange(
  Sender: TObject);
begin
  alteradocfgnfe:=true;

end;

procedure TFrmParametrosNFE.edtProxyPortaChange(
  Sender: TObject);
begin
  alteradocfgnfe:=true;

end;

procedure TFrmParametrosNFE.edtProxySenhaChange(
  Sender: TObject);
begin
  alteradocfgnfe:=true;

end;

procedure TFrmParametrosNFE.edtProxyUserChange(
  Sender: TObject);
begin
  alteradocfgnfe:=true;

end;

procedure TFrmParametrosNFE.edtTentativasChange(
  Sender: TObject);
begin
  alteradocfgnfe:=true;

end;

procedure TFrmParametrosNFE.cbSSLLibChange(Sender: TObject);
begin
  alteradocfgnfe:=true;
  try
    if cbSSLLib.ItemIndex <> -1 then
      ACBrNFe1.Configuracoes.Geral.SSLLib := TSSLLib(cbSSLLib.ItemIndex);
  finally
    AtualizaSSLLibsCombo;
  end;
end;

procedure TFrmParametrosNFE.cbSSLTypeChange(Sender: TObject);
begin
  alteradocfgnfe:=true;

  if cbSSLType.ItemIndex <> -1 then
    ACBrNFe1.SSL.SSLType := TSSLType(cbSSLType.ItemIndex);
end;

procedure TFrmParametrosNFE.cbUFChange(
  Sender: TObject);
begin
  alteradocfgnfe:=true;

end;

procedure TFrmParametrosNFE.cbVersaoDFChange(
  Sender: TObject);
begin
  alteradocfgnfe:=true;

end;

procedure TFrmParametrosNFE.cbxAjustarAut1Click(
  Sender: TObject);
begin
  alteradocfgnfe:=true;

end;

procedure TFrmParametrosNFE.cbxAtualizarXMLClick(
  Sender: TObject);
begin
  alteradocfgnfe:=true;

end;

procedure TFrmParametrosNFE.cbxExibirErroSchemaClick(
  Sender: TObject);
begin
  alteradocfgnfe:=true;

end;

procedure TFrmParametrosNFE.Button6Click(Sender: TObject);
begin
  GravarConfiguracao;
  LerConfiguracao;
  ACBrNFe1.Configuracoes.WebServices.Visualizar:= True;
  ACBrNFe1.WebServices.StatusServico.Executar;
end;

procedure TFrmParametrosNFE.FormCreate(Sender: TObject);
var
 T : TSSLLib;
 I : TpcnTipoEmissao ;
 J : TpcnModeloDF;
 K : TpcnVersaoDF;
 U: TSSLCryptLib;
 V: TSSLHttpLib;
 X: TSSLXmlSignLib;
 Y: TSSLType;
begin
  cbSSLLib.Items.Clear ;
  For T := Low(TSSLLib) to High(TSSLLib) do
    cbSSLLib.Items.Add( GetEnumName(TypeInfo(TSSLLib), integer(T) ) ) ;
  cbSSLLib.ItemIndex := 0 ;

  cbCryptLib.Items.Clear ;
  For U := Low(TSSLCryptLib) to High(TSSLCryptLib) do
    cbCryptLib.Items.Add( GetEnumName(TypeInfo(TSSLCryptLib), integer(U) ) ) ;
  cbCryptLib.ItemIndex := 0 ;

  cbHttpLib.Items.Clear ;
  For V := Low(TSSLHttpLib) to High(TSSLHttpLib) do
    cbHttpLib.Items.Add( GetEnumName(TypeInfo(TSSLHttpLib), integer(V) ) ) ;
  cbHttpLib.ItemIndex := 0 ;

  cbXmlSignLib.Items.Clear ;
  For X := Low(TSSLXmlSignLib) to High(TSSLXmlSignLib) do
    cbXmlSignLib.Items.Add( GetEnumName(TypeInfo(TSSLXmlSignLib), integer(X) ) ) ;
  cbXmlSignLib.ItemIndex := 0 ;

  cbSSLType.Items.Clear ;
  For Y := Low(TSSLType) to High(TSSLType) do
    cbSSLType.Items.Add( GetEnumName(TypeInfo(TSSLType), integer(Y) ) ) ;
  cbSSLType.ItemIndex := 0 ;

  cbFormaEmissao.Items.Clear ;
  For I := Low(TpcnTipoEmissao) to High(TpcnTipoEmissao) do
     cbFormaEmissao.Items.Add( GetEnumName(TypeInfo(TpcnTipoEmissao), integer(I) ) ) ;
  cbFormaEmissao.Items[0] := 'teNormal' ;
  cbFormaEmissao.ItemIndex := 0 ;


  cbVersaoDF.Items.Clear ;
  For K := Low(TpcnVersaoDF) to High(TpcnVersaoDF) do
     cbVersaoDF.Items.Add( GetEnumName(TypeInfo(TpcnVersaoDF), integer(K) ) ) ;
  cbVersaoDF.Items[0] := 've200' ;
  cbVersaoDF.ItemIndex := 0 ;

  LerConfiguracao;

  PageControl1.activepageindex:=0;
  PageControl4.activepageindex:=0;
  alteradocfgnfe:=false;
end;

procedure TFrmParametrosNFE.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_escape then
  begin
    close;
  end;
  if key = vk_f5 then
  btnSalvarConfig.Click;
end;

procedure TFrmParametrosNFE.FormShow(
  Sender: TObject);
begin
  alteradocfgnfe:=false;

end;

procedure TFrmParametrosNFE.gravafalso; //apenas seta o alterado como false
begin
  alteradocfgnfe:=false;
end;

function tfrmparametrosnfe.inverteboolean(const a: boolean): boolean;
begin
  if a = true then
  result:=false
  else
  result:=true;
end;


procedure tfrmparametrosnfe.LoadXML(MyMemo: TMemo; MyWebBrowser: TWebBrowser);
begin
  MyMemo.Lines.SaveToFile(ExtractFileDir(application.ExeName)+'\temp.xml');
  MyWebBrowser.Navigate(ExtractFileDir(application.ExeName)+'\temp.xml');

end;


end.
