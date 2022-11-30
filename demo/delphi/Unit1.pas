{####################################################################################################################
                              EANPICTURES/DATALOAD  https://http://eanpictures.com.br//
####################################################################################################################
    Owner.....: Fernandes Eds
    Github....: https://github.com/ConectivaSoftware/EanPictures/
####################################################################################################################
  Obs:
     - Código aberto a comunidade Delphi e Lazarus, desde que mantenha os dados dos autores e mantendo
     sempre o nome do IDEALIZADOR Fernandes Eds ;
####################################################################################################################
                                  Evolução do Código
####################################################################################################################
  Autor........: Francisco Aurino
  Contribuidor.: ajustado demo original em delphi em 30 de novembro de 2022.
  Githut.......: https://github.com/fraurino/
####################################################################################################################
}



unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdHTTP, StdCtrls, WinInet, Buttons, Vcl.ComCtrls ,Winapi.ShellAPI, IdStack, IdStackConsts ,
  System.ImageList, Vcl.ImgList ;

type
  TfrmEanPictures_DataLoad = class(TForm)
    Label2: TLabel;
    PageControl1: TPageControl;
    return: TTabSheet;
    GroupBox1: TGroupBox;
    Memo1: TMemo;
    GroupBox2: TGroupBox;
    Image1: TImage;
    ComboBox1: TComboBox;
    edtvalue: TEdit;
    SpeedButton1: TSpeedButton;
    Button1: TButton;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    tscnpj: TTabSheet;
    tsean: TTabSheet;
    NCM: TLabeledEdit;
    imgproduct: TImage;
    Peso: TLabeledEdit;
    CEST: TLabeledEdit;
    Marca: TLabeledEdit;
    Produto: TLabeledEdit;
    CNPJ: TLabeledEdit;
    Razao: TLabeledEdit;
    Fantasia: TLabeledEdit;
    Endereco: TLabeledEdit;
    Bairro: TLabeledEdit;
    CEP: TLabeledEdit;
    Cidade: TLabeledEdit;
    Email: TLabeledEdit;
    Estado: TLabeledEdit;
    IE: TLabeledEdit;
    SpeedButton2: TSpeedButton;
    ImageList1: TImageList;
    loggtin: TMemo;
    logcnpj: TMemo;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
    function DownloadArquivo(const Origem, Destino: String): Boolean;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
  private
    { Private declarations }
    procedure ajustaconsulta;
    procedure consultacnpj (value : string );
    procedure consultagtin (value : string );
    function fotoexiste (value : string ) : Boolean;
  public
    { Public declarations }

    const pathservice     : String = 'dataload\';
    // consulta produto
    const pathcean    : String = 'http://www.dataload.com.br:9000';


    const pathgtin        : string = 'http://www.dataload.com.br:9000/api/gtin/';
    const pathgtindesc    : string = 'http://www.dataload.com.br:9000/api/desc/';
    const pathgtindesc2   : string = 'http://www.dataload.com.br:9000/api/descricao';

    // consulta CNPJ
    const pathcnpj        : string = 'http://www.dataload.com.br:8000/api/cnpj/';
    const pathcnpj2       : string = 'http://www.dataload.com.br:8000/api/cnpj2/';
  end;

var
  frmEanPictures_DataLoad: TfrmEanPictures_DataLoad;

implementation
uses jpeg, pngimage, dataloadcnpj, dataloadproduct, Pkg.Json.DTO;

{$R *.dfm}


{$REGION 'Consulta CNPJ'}
procedure TfrmEanPictures_DataLoad.consultacnpj(value: string);
var
Usuario: TDataLoadCNPJ;
wurl: string;
idhttp1 : TIdHTTP;

begin
    try
      {$REGION 'clear edits'}
        logcnpj.clear;
        CNPJ.clear;
        Razao.clear;
        Fantasia.clear;
        Endereco.clear;
        Bairro.clear;
        Cidade.clear;
        estado.clear;
        CEP.clear;
        email.clear;
         if value = EmptyStr then Exit;
      {$ENDREGION}
      {$REGION 'request webservice'}
      logcnpj.Lines.Add(FormatDateTime('dd.mm.yyyy hh:mm:nn:zzz',now) + ' | '+ 'requisitando webservice');
      wurl:=  pathcnpj + value;
      idhttp1 := TIdHTTP.Create(self);
      idhttp1.Request.Clear;
      idhttp1.Request.CustomHeaders.Clear;
      idhttp1.Request.ContentType := 'application/json';
      idhttp1.Request.Accept := 'application/json';

      Usuario := TDataLoadCNPJ.Create;
      {$ENDREGION}

      try
      {$REGION 'return base'}
        Usuario.AsJson  :=  idhttp1.get(wurl) ;
        CNPJ.Text       := usuario.Cnpj;
        Razao.Text      := usuario.Razao_Social;
        Fantasia.Text   := usuario.Nome_Fantasia;
        Endereco.Text   := usuario.Logradouro;

        Bairro.Text     := Usuario.Bairro;
        Cidade.Text     := usuario.Municipio;
        estado.Text     := usuario.Uf;
        CEP.Text        := usuario.Cep;
        email.Text      := Usuario.Correio_Eletronico;
        logcnpj.Lines.Add(FormatDateTime('dd.mm.yyyy hh:mm:nn:zzz',now) + ' | '+'carregando dados');
      {$ENDREGION}
      except
        {$REGION 'error results'}
        on E: EIdSocketError do
            begin
              case e.LastError of
                Id_WSAETIMEDOUT: logcnpj.Lines.Add(FormatDateTime('dd.mm.yyyy hh:mm:nn:zzz',now) + ' | '+'A conexão expirou');
                Id_WSAEACCES:    logcnpj.Lines.Add(FormatDateTime('dd.mm.yyyy hh:mm:nn:zzz',now) + ' | '+ 'não há acesso');
              else
                                 logcnpj.Lines.Add(FormatDateTime('dd.mm.yyyy hh:mm:nn:zzz',now) + ' | '+ e.message);
              end;
            end;
          on E: Exception do logcnpj.Lines.Add(FormatDateTime('dd.mm.yyyy hh:mm:nn:zzz',now) + ' | '+ E.ClassName + ': ' + E.Message);
        {$ENDREGION}
      end;
    finally
      {$REGION 'finalizacao'}
        Usuario.Free;
        idhttp1.free;
        logcnpj.Lines.Add(FormatDateTime('dd.mm.yyyy hh:mm:nn:zzz',now) + ' | '+'consulta realizada' );
      {$ENDREGION}
    end;
end;

{$ENDREGION}

{$REGION 'Consulta Gtin'}
procedure TfrmEanPictures_DataLoad.consultagtin(value: string);
var
  item: TDataLoadProduct;
  wurl: string;
  destinopng, destinojpg: string;
  idhttp1 : TIdHTTP;
begin
    try
      {$REGION 'clean edit'}
      loggtin.clear;
      imgproduct.Picture := nil;
      produto.Clear;
      ncm.Clear;
      CEST.Clear;
      peso.Clear;
      if value = EmptyStr then exit;
      loggtin.Lines.Add(FormatDateTime('dd.mm.yyyy hh:mm:nn:zzz',now) + ' | '+  'edits vazios');
      {$ENDREGION}
      {$REGION 'request service'}
        wurl:=  pathgtindesc +value;
        idhttp1 := TIdHTTP.Create(self);
        idhttp1.Request.Clear;
        idhttp1.Request.CustomHeaders.Clear;
        idhttp1.Request.ContentType := 'application/json';
        idhttp1.Request.Accept := 'application/json';
        item := TDataLoadProduct.Create;
        loggtin.Lines.Add( FormatDateTime('dd.mm.yyyy hh:mm:nn:zzz',now) + ' | '+ 'preparando conexao');
      {$ENDREGION}
      try
        {$REGION 'database in edits'}
          item.AsJson         := idhttp1.get(wurl) ;
          produto.text        := item.Nome;
          ncm.Text            := item.Ncm;
          CEST.Text           := item.Cest_Codigo;
          peso.Text           := item.Peso;
          loggtin.Lines.Add( FormatDateTime('dd.mm.yyyy hh:mm:nn:zzz',now) + ' | '+ 'dados encontrados com sucesso');
        {$ENDREGION}
        {$REGION 'download image'}
          wurl:= pathgtin +value;
          ForceDirectories(ExtractFilePath(Application.ExeName) + pathservice);

          destinopng  :=  ExtractFilePath(Application.ExeName) + pathservice  + value+'.png';
          destinojpg  :=  ExtractFilePath(Application.ExeName) + pathservice  + value+'.jpg';
          DeleteFile(destinopng);
          DeleteFile(destinojpg);

          loggtin.Lines.Add(FormatDateTime('dd.mm.yyyy hh:mm:nn:zzz',now) + ' | '+ 'verificando se há foto no produto');
          if fotoexiste(value) then
          begin
            loggtin.Lines.Add(FormatDateTime('dd.mm.yyyy hh:mm:nn:zzz',now) + ' | '+ 'fazendo download da imagem');
            if DownloadArquivo(wurl,destinopng) then
            begin
              loggtin.Lines.Add(FormatDateTime('dd.mm.yyyy hh:mm:nn:zzz',now) + ' | '+ 'foto do produto baixado com sucesso');
              try
                imgproduct.picture.loadfromfile(destinopng);
              except
                renamefile(destinopng,destinojpg);
                imgproduct.picture.loadfromfile(destinojpg);
              end;
            end ;
          end
          else
          begin
           loggtin.Lines.Add(FormatDateTime('dd.mm.yyyy hh:mm:nn:zzz',now) + ' | '+ 'gtin não possui foto no service');
          end;
         {$ENDREGION}
      except
        {$REGION 'error results'}
        on E: EIdSocketError do
            begin
              case e.LastError of
                Id_WSAETIMEDOUT: loggtin.Lines.Add(FormatDateTime('dd.mm.yyyy hh:mm:nn:zzz',now) + ' | '+'A conexão expirou');
                Id_WSAEACCES:    loggtin.Lines.Add(FormatDateTime('dd.mm.yyyy hh:mm:nn:zzz',now) + ' | '+ 'não há acesso');
              else
                                 loggtin.Lines.Add(FormatDateTime('dd.mm.yyyy hh:mm:nn:zzz',now) + ' | '+ e.message);
              end;
            end;
          on E: Exception do loggtin.Lines.Add(FormatDateTime('dd.mm.yyyy hh:mm:nn:zzz',now) + ' | '+ E.ClassName + ': ' + E.Message);
        {$ENDREGION}
      end;
    finally
       {$REGION 'finalizacao'}
        item.Free;
        idhttp1.free;
        loggtin.Lines.Add(FormatDateTime('dd.mm.yyyy hh:mm:nn:zzz',now) + ' | '+ 'consulta finalizada');
      {$ENDREGION}
    end;
end;

{$ENDREGION}

{$REGION 'Download File'}
function TfrmEanPictures_DataLoad.DownloadArquivo(const Origem, Destino: String): Boolean;
const BufferSize = 1024;
var
  hSession, hURL: HInternet;
  Buffer: array[1..BufferSize] of Byte;
  BufferLen: DWORD;
  f: File;
  sAppName: string;
begin
 Result   := False;
 sAppName := ExtractFileName(Application.ExeName);
 hSession := InternetOpen(PChar(sAppName),
                INTERNET_OPEN_TYPE_PRECONFIG,
               nil, nil, 0);
 try
  hURL := InternetOpenURL(hSession,
            PChar(Origem),
            nil,0,0,0);
  try
   AssignFile(f, Destino);
   Rewrite(f,1);
   repeat
    InternetReadFile(hURL, @Buffer,
                     SizeOf(Buffer), BufferLen);
    BlockWrite(f, Buffer, BufferLen)
   until BufferLen = 0;
   CloseFile(f);
   Result:=True;
  finally
   InternetCloseHandle(hURL)
  end
 finally
  InternetCloseHandle(hSession)
 end
end;

{$ENDREGION}

{$REGION 'Foto Existe'}
function TfrmEanPictures_DataLoad.fotoexiste(value: string): Boolean;
var
idhttp1 : TIdHTTP;
wurl : string ;
ok : string ;
begin
  if value = EmptyStr then exit;
  //http://www.eanpictures.com.br:9000/api/fotoexiste/7894900011715
  wurl:=  'http://www.eanpictures.com.br:9000/api/fotoexiste/' + value;
  idhttp1 := TIdHTTP.Create(self);
  try
    idhttp1.Request.Clear;
    idhttp1.Request.CustomHeaders.Clear;
    idhttp1.Request.ContentType := 'application/json';
    idhttp1.Request.Accept := 'application/json' ;
     ok := idhttp1.get(wurl) ;
    if ok = 'Sim' then
    Result := True else
    Result := false;
  finally
   idhttp1.free;
  end;
end;

{$ENDREGION}

{$REGION 'Outros'}
procedure TfrmEanPictures_DataLoad.PageControl1Change(Sender: TObject);
begin
    case PageControl1.ActivePageIndex  of
      0 : edtvalue.text := '33000167000101';  //cnpj
      1 : edtvalue.text := '7894900011715';   //product
    end;
    ComboBox1.ItemIndex := pagecontrol1.ActivePageIndex;
    update;
end;

procedure TfrmEanPictures_DataLoad.SpeedButton1Click(Sender: TObject);
begin
  ShellExecute(Handle, 'open', 'http://www.eanpictures.com.br', '', '', 1);
  ShellExecute(Handle, 'open', 'http://www.dataload.com.br', '', '', 1);
end;

procedure TfrmEanPictures_DataLoad.SpeedButton2Click(Sender: TObject);
begin
  case ComboBox1.ItemIndex  of
   0: consultacnpj (edtvalue.text) ;
   1: consultagtin( edtvalue.text) ;
  end;
end;

procedure TfrmEanPictures_DataLoad.ajustaconsulta;
begin
    case ComboBox1.ItemIndex  of
      0 : edtvalue.text := '33000167000101';  //cnpj
      1 : edtvalue.text := '7894900011715';   //product
    end;
    PageControl1.ActivePageIndex := ComboBox1.ItemIndex ;
    update;
end;

procedure TfrmEanPictures_DataLoad.BitBtn1Click(Sender: TObject);
var wurl: string;
idhttp1 : TIdHTTP;
begin
  //wurl:=pathgtin+edtvalue.text;
  wurl:=pathcean + '/api/desc/'+edtvalue.text;
  idhttp1 := TIdHTTP.Create(self);
  with idhttp1 do
  begin
    Request.Clear;
    Request.CustomHeaders.Clear;
    Request.ContentType := 'application/json';
    Request.Accept := 'application/json';
    Memo1.lines.add('');
    Memo1.lines.add('Tentando buscar dados em: '+wurl);
    Memo1.lines.add(Get(wurl));
  end;

  Memo1.lines.add('');
  Memo1.lines.add('');
  Memo1.lines.add('');
  Memo1.lines.add('');
  Memo1.lines.add('');

  //wurl:=pathgtindesc2 +edtvalue.text;
  wurl:=pathcean + '/api/descricao/'+edtvalue.text;
  with idhttp1 do
  begin
    Request.Clear;
    Request.CustomHeaders.Clear;
    Request.ContentType := 'application/json';
    Request.Accept := 'application/json';
    Memo1.lines.add('');
    Memo1.lines.add('Tentando buscar dados em: '+wurl);
    Memo1.lines.add(Get(wurl));
  end;

  idhttp1.Free;

end;

procedure TfrmEanPictures_DataLoad.BitBtn2Click(Sender: TObject);
var wurl: string;
idhttp1 : TIdHTTP;
begin
  wurl:=pathcnpj  + edtvalue.text;
  idhttp1 := TIdHTTP.Create(self);
  with idhttp1 do
  begin
    Request.Clear;
    Request.CustomHeaders.Clear;
    Request.ContentType := 'application/json';
    Request.Accept := 'application/json';
    Memo1.lines.add('');
    Memo1.lines.add('Tentando buscar dados em: '+wurl);
    Memo1.lines.add(Get(wurl));
  end;

  Memo1.lines.add('');
  Memo1.lines.add('');
  Memo1.lines.add('');
  Memo1.lines.add('');
  Memo1.lines.add('');
  wurl:=pathcnpj2 +edtvalue.text;

  with idhttp1 do
  begin
    Request.Clear;
    Request.CustomHeaders.Clear;
    Request.ContentType := 'application/json';
    Request.Accept := 'application/json';
    Memo1.lines.add('');
    Memo1.lines.add('Tentando buscar dados em: '+wurl);

    Memo1.lines.add(Get(wurl));
  end;

  idhttp1.Free;
end;

procedure TfrmEanPictures_DataLoad.Button1Click(Sender: TObject);
var wurl: string;
destinopng: string;
destinojpg: string;
begin
  wurl:= pathgtin+edtvalue.text;

  memo1.lines.add('solicitando '+wURL); //<==== somente para visualizacao do url na tela

  ForceDirectories(ExtractFilePath(Application.ExeName) + pathservice);

  destinopng  :=  ExtractFilePath(Application.ExeName) + pathservice  + edtvalue.TEXT+'.png';
  destinojpg  :=  ExtractFilePath(Application.ExeName) + pathservice  +  edtvalue.TEXT+'.jpg';
  DeleteFile(destinopng);
  DeleteFile(destinojpg);

  memo1.lines.add('Tentarei gravar em '+destinopng);

  if fotoexiste(edtvalue.TEXT) then
  begin
    if DownloadArquivo(wurl,destinopng) then
    begin
      try
      Memo1.Lines.Add('Tentando rodar o arquivo como png...');
      image1.picture.loadfromfile(destinopng);
      Memo1.Lines.Add('Sucesso ao rodar o arquivo como png.');
      except
        Memo1.Lines.Add('Falha ao tentar rodar o arquivo como png, Tentando rodar o arquivo como JPG...');
        renamefile(destinopng,destinojpg);
        image1.picture.loadfromfile(destinojpg);
        Memo1.Lines.Add('Sucesso ao rodar o arquivo como jpg.');
      end;
    end
  end
  else showmessage('não há foto');

end;

procedure TfrmEanPictures_DataLoad.ComboBox1Change(Sender: TObject);
begin
   ajustaconsulta;
end;

procedure TfrmEanPictures_DataLoad.ComboBox1Click(Sender: TObject);
begin
  ajustaconsulta;
end;

{$ENDREGION}

end.
