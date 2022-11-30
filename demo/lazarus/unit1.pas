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
  Contribuidor.: ajustado demo original em delphi para lazarus 2.0.12 em 30 de novembro de 2022.
  Githut.......: https://github.com/fraurino/
####################################################################################################################
}


unit Unit1;

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Buttons,
  ComCtrls, ExtCtrls, IdHTTP, IdSSLOpenSSL,IdStack, IdStackConsts , DB,
  Grids, math, MaskUtils, StrUtils, fpjson, jsonparser, jsonConf, WinInet, ShellAPI, typinfo;

type

  { TfrmEanpictures }

  TfrmEanpictures = class(TForm)
    Bairro: TLabeledEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Button1: TButton;
    CEP: TLabeledEdit;
    CEST: TLabeledEdit;
    Cidade: TLabeledEdit;
    CNPJ: TLabeledEdit;
    ComboBox1: TComboBox;
    edtvalue: TEdit;
    Email: TLabeledEdit;
    Endereco: TLabeledEdit;
    Estado: TLabeledEdit;
    Fantasia: TLabeledEdit;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    IE: TLabeledEdit;
    Image1: TImage;
    ImageList1: TImageList;
    imgproduct: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    logcnpj: TMemo;
    loggtin: TMemo;
    Marca: TLabeledEdit;
    Memo1: TMemo;
    NCM: TLabeledEdit;
    PageControl1: TPageControl;
    Peso: TLabeledEdit;
    Produto: TLabeledEdit;
    Razao: TLabeledEdit;
    return: TTabSheet;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    tscnpj: TTabSheet;
    tsean: TTabSheet;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox1Click(Sender: TObject);
    procedure Label3Click(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private

    procedure ajustaconsulta;
    procedure consultacnpj (value : string );
    procedure consultagtin (value : string );
    function fotoexiste (value : string ) : Boolean;
    function DownloadArquivo(const Origem, Destino: String): Boolean;
  public

      const pathservice     : String = 'dataload\';
      // consulta produto
      const pathcean        : String = 'http://www.dataload.com.br:9000';
      const pathgtin        : string = 'http://www.dataload.com.br:9000/api/gtin/';
      const pathgtindesc    : string = 'http://www.dataload.com.br:9000/api/desc/';
      const pathgtindesc2   : string = 'http://www.dataload.com.br:9000/api/descricao';
      const patheanexiste   : string = 'http://www.eanpictures.com.br:9000/api/fotoexiste/';

      // consulta CNPJ
      const pathcnpj        : string = 'http://www.dataload.com.br:8000/api/cnpj/';
      const pathcnpj2       : string = 'http://www.dataload.com.br:8000/api/cnpj2/';

  end;

var
  frmEanpictures: TfrmEanpictures;

implementation

{$R *.lfm}

{ TfrmEanpictures }


procedure TfrmEanpictures.SpeedButton2Click(Sender: TObject);
begin
    case ComboBox1.ItemIndex  of
     0: consultacnpj (edtvalue.text) ;
     1: consultagtin( edtvalue.text) ;
    end;
end;

procedure TfrmEanpictures.ComboBox1Change(Sender: TObject);
begin
  ajustaconsulta;
end;

procedure TfrmEanpictures.Button1Click(Sender: TObject);
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

procedure TfrmEanpictures.BitBtn1Click(Sender: TObject);
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

procedure TfrmEanpictures.BitBtn2Click(Sender: TObject);
var wurl: string;
idhttp1 : TIdHTTP;
begin
  wurl:=pathcnpj + edtvalue.text;
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

procedure TfrmEanpictures.ComboBox1Click(Sender: TObject);
begin
  ajustaconsulta;
end;

procedure TfrmEanpictures.Label3Click(Sender: TObject);
begin
ShellExecute(Handle, 'open', 'https://github.com/fraurino/', '', '', 1);
end;

procedure TfrmEanpictures.PageControl1Change(Sender: TObject);
begin
  case PageControl1.ActivePageIndex  of
    0 : edtvalue.text := '33000167000101';  //cnpj
    1 : edtvalue.text := '7894900011715';   //product
  end;
  ComboBox1.ItemIndex := pagecontrol1.ActivePageIndex;
  update;
end;

procedure TfrmEanpictures.SpeedButton1Click(Sender: TObject);
begin
 ShellExecute(Handle, 'open', 'http://www.eanpictures.com.br', '', '', 1);
 ShellExecute(Handle, 'open', 'http://www.dataload.com.br', '', '', 1);
end;

procedure TfrmEanpictures.ajustaconsulta;
begin
      case ComboBox1.ItemIndex  of
      0 : edtvalue.text := '33000167000101';  //cnpj
      1 : edtvalue.text := '7894900011715';   //product
    end;
    PageControl1.ActivePageIndex := ComboBox1.ItemIndex ;
    update;
end;

procedure TfrmEanpictures.consultacnpj(value: string);
var
  wurl          : string;
  idhttp1       : TIdHTTP;
  IDSSLHandler  : TIdSSLIOHandlerSocketOpenSSL;
  Response      : TStringStream;
  json          : TJSONData;

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
      idhttp1 := TIdHTTP.Create(self);
      IDSSLHandler      := TIdSSLIOHandlerSocketOpenSSL.Create;
      idhttp1.IOHandler := IDSSLHandler;
      Response := TStringStream.Create('');
      wurl:=  pathcnpj + value;
      idhttp1.Get(wurl, Response);
      {$ENDREGION}

      try
      {$REGION 'return base'}

        Json:=GetJSON(UTF8ToString(Response.DataString));

        CNPJ.Text       := json.FindPath('cnpj').Value;
        Razao.Text      := json.FindPath('razao_social').Value;
        Fantasia.Text   := json.FindPath('nome_fantasia').Value;
        Endereco.Text   := json.FindPath('logradouro').Value;
        Bairro.Text     := json.FindPath('bairro').Value;
        Cidade.Text     := json.FindPath('municipio').Value;
        estado.Text     := json.FindPath('uf').Value;
        CEP.Text        := json.FindPath('cep').Value;
        email.Text      := json.FindPath('correio_eletronico').Value;

        //add demais campos ao critério do usuário.

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
        idhttp1.free;
        Response.free;
        logcnpj.Lines.Add(FormatDateTime('dd.mm.yyyy hh:mm:nn:zzz',now) + ' | '+'consulta realizada' );
      {$ENDREGION}
    end;
end;


procedure TfrmEanpictures.consultagtin(value: string);
var
  idhttp1       : TIdHTTP;
  IDSSLHandler  : TIdSSLIOHandlerSocketOpenSSL;
  Response      : TStringStream;
  json          : TJSONData;
  destinopng, destinojpg: string;
  wurl          : string ;
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
        wurl              :=  pathgtindesc +value;
        idhttp1           := TIdHTTP.Create(self);
        IDSSLHandler      := TIdSSLIOHandlerSocketOpenSSL.Create;
        idhttp1.IOHandler := IDSSLHandler;
        Response          := TStringStream.Create('');
        loggtin.Lines.Add( FormatDateTime('dd.mm.yyyy hh:mm:nn:zzz',now) + ' | '+ 'preparando conexao');
      {$ENDREGION}
      try
        {$REGION 'database in edits'}
          wurl:=  pathgtindesc +value;
          idhttp1.Get(wurl, Response);

          Json:=GetJSON(UTF8ToString(Response.DataString));

          produto.text        := json.FindPath('Nome').Value;
          ncm.Text            := json.FindPath('Ncm').Value;
          CEST.Text           := json.FindPath('Cest_Codigo').Value;
          peso.Text           := json.FindPath('Peso').Value;
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
        idhttp1.free;
        Response.free;
        loggtin.Lines.Add(FormatDateTime('dd.mm.yyyy hh:mm:nn:zzz',now) + ' | '+ 'consulta finalizada');
      {$ENDREGION}
    end;
end;


function TfrmEanpictures.fotoexiste(value: string): Boolean;
var
idhttp1       : TIdHTTP;
IDSSLHandler  : TIdSSLIOHandlerSocketOpenSSL;
Response      : TStringStream;
wurl : string ;
ok : string ;
begin
  if value = EmptyStr then exit;
  //http://www.eanpictures.com.br:9000/api/fotoexiste/7894900011715
  wurl:=  patheanexiste + value;
  idhttp1 := TIdHTTP.Create(self);
  try
    idhttp1           := TIdHTTP.Create(self);
    IDSSLHandler      := TIdSSLIOHandlerSocketOpenSSL.Create;
    idhttp1.IOHandler := IDSSLHandler;
    Response          := TStringStream.Create('');
     ok := idhttp1.get(wurl) ;
    if ok = 'Sim' then
    Result := True else
    Result := false;
  finally
   idhttp1.free;
   Response.free;
  end;
end;

function TfrmEanpictures.DownloadArquivo(const Origem, Destino: String): Boolean;
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






end.

