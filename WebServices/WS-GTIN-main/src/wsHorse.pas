unit wsHorse;

interface

uses Horse, Horse.Jhonson, Horse.OctetStream, Horse.HandleException,
  System.SysUtils;

type
  TWsHorse = class
  private
    FHorse: THorse;
    FPath: String;
    procedure AddMethods;
  public
    constructor Create;
    function Port(Value: Integer): TWsHorse;
    function Path(Value: String): TWsHorse;
    function Active: Boolean;
    procedure Power;
    function removeacento(const ptext: string):string;
    function somentenumero(snum: string): string;

  end;

implementation

uses
  System.Classes, System.IOUtils, main.view, main.basedados, system.JSON;

{ TWsHorse }

function TWsHorse.Active: Boolean;
begin
 Result := FHorse.IsRunning;
end;

procedure TWsHorse.AddMethods;
begin
  with FHorse do
  begin
    Get('/api/gtin/:id',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    var
      LFile: String;
      LFileSend: TFileReturn;
      LStream: TFileStream;
      LDisposition: String;
    begin
      LFile := FPath + somentenumero(Req.Params.Items['id']) + '.png';
      if FileExists(LFile) then
      begin
        LStream   := TFileStream.Create(LFile, fmOpenRead);
        LFileSend := TFileReturn.Create( TPath.GetFileName(LFile), LStream, False);
        Res.Send<TFileReturn>(LFileSend).Status(200);
        inc(fotook);
        mainview.memofotook.lines.add(Req.RawWebRequest.RemoteAddr+' | '+inttostr(fotook)+'|'+datetostr(date)+'|'+timetostr(now)+'| Entregue arquivo: '+lfile);
      end
      else
      begin
        inc(fotoerro);
        mainview.memofotoerro.lines.add(Req.RawWebRequest.RemoteAddr+' | '+inttostr(fotoerro)+'|'+datetostr(date)+'|'+timetostr(now)+'| Arquivo nao encontrado: '+lfile);
        Res.Send('').Status(404);
      end;

    end);


    Get('/api/descricao/:id',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    begin

      if Req.Params.Items['id'] <> '' then
      begin
        basedados.ZConnection1.Connected:=false;
        basedados.ZConnection1.Connected:=true;

        with BaseDados.zquery1 do
        begin
          close;
          sql.Clear;
          sql.Add('select nome, ncm, cest_codigo, embalagem, quantidade_embalagem, marca, categoria from cad_produtos where ean = :ean');
          parambyname('ean').AsString:=Req.Params.Items['id'];
          open;
          if isempty = false then
          begin
            Res.Send(fieldbyname('nome').asstring).Status(200);
            inc(descok);
            mainview.memodescok.lines.add(Req.RawWebRequest.RemoteAddr+' | '+inttostr(descok)+'|'+datetostr(date)+'|'+timetostr(now)+'| Entregue descricao: '+Req.Params.Items['id']+ '|' +fieldbyname('nome').asstring);
          end
          else
          begin
            Res.Send('Descricao nao encontrada para o ean: '+Req.Params.Items['id']).Status(404);
            inc(descerro);
            mainview.memodescerro.lines.add(Req.RawWebRequest.RemoteAddr+' | '+inttostr(descerro)+'|'+datetostr(date)+'|'+timetostr(now)+'| Descricao nao encontrada para o ean: '+Req.Params.Items['id']);
          end;
        end;
      end
      else
      begin
        Res.Send('Necessario enviar o codigo da mercadoria. Ex: www.eanpictures.com.br/api/descricao/789789789789').Status(404);
      end;

    end);


    Get('/api/desc/:id',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    var wjson: tjsonobject;

    begin
      if Req.Params.Items['id'] <> '' then
      begin
        basedados.ZConnection1.Connected:=false;
        basedados.ZConnection1.Connected:=true;
        with BaseDados.zquery1 do
        begin
          close;
          sql.Clear;
//          sql.Add('select nome, ncm, cest_codigo, embalagem, quantidade_embalagem, marca, categoria from cad_produtos where ean = :ean');

          sql.Add('SELECT base_produtos.cad_produtos.ean, base_produtos.cad_produtos.nome, base_produtos.cad_produtos.peso,');
          sql.Add('base_produtos.cad_produtos.ncm, base_produtos.cad_produtos.cest_codigo, base_produtos.cad_produtos.embalagem, base_produtos.cad_produtos.quantidade_embalagem,');
          sql.Add('base_produtos.cad_produtos.marca, base_produtos.cad_produtos.categoria, base_produtos.cad_produtos.id_categoria');
          sql.Add(' FROM base_produtos.cad_produtos');
          sql.Add('where ean = :ean');

{          sql.Add('SELECT base_produtos.cad_produtos.ean, base_produtos.cad_produtos.nome, base_produtos.cad_produtos.peso,');
          sql.Add('base_produtos.cad_produtos.ncm, base_produtos.cad_produtos.cest_codigo, base_produtos.cad_produtos.embalagem, base_produtos.cad_produtos.quantidade_embalagem,');
          sql.Add('base_produtos.cad_produtos.marca, base_produtos.cad_produtos.categoria, base_produtos.categorias.id');
          sql.Add(' FROM base_produtos.cad_produtos inner join base_produtos.categorias on base_produtos.cad_produtos.categoria = base_produtos.categorias.nome');
          sql.Add('where ean = :ean');}

          parambyname('ean').AsString:=Req.Params.Items['id'];
          open;
          if isempty = false then
          begin
            wjson:=tjsonobject.Create;
            wjson.AddPair(tjsonpair.Create('Nome',removeacento(fieldbyname('nome').asstring)));
            wjson.AddPair(tjsonpair.Create('Ncm',removeacento(fieldbyname('ncm').asstring)));
            wjson.AddPair(tjsonpair.Create('Cest_Codigo',removeacento(fieldbyname('cest_codigo').asstring)));
            wjson.AddPair(tjsonpair.Create('Embalagem',removeacento(fieldbyname('embalagem').asstring)));
            wjson.AddPair(tjsonpair.Create('QuantidadeEmbalagem',removeacento(fieldbyname('quantidade_embalagem').asstring)));
            wjson.AddPair(tjsonpair.Create('Marca',removeacento(fieldbyname('marca').asstring)));
            wjson.AddPair(tjsonpair.Create('Categoria',removeacento(fieldbyname('categoria').asstring)));
            wjson.AddPair(tjsonpair.Create('Peso',removeacento(fieldbyname('peso').asstring)));
            wjson.AddPair(tjsonpair.Create('id_categoria',removeacento(fieldbyname('id_categoria').asstring)));
            Res.Send<TJSONobject>(wjson).Status(200);;

            inc(descok);
            mainview.memodescok.lines.add(Req.RawWebRequest.RemoteAddr+' | '+inttostr(descok)+'|'+datetostr(date)+'|'+timetostr(now)+'| Entregue json: '+Req.Params.Items['id']+ '|' +fieldbyname('nome').asstring);
          end
          else
          begin
            inc(descerro);
            mainview.memodescerro.lines.add(inttostr(descerro)+'|'+datetostr(date)+'|'+timetostr(now)+'| Descricao nao encontrada para o ean: '+Req.Params.Items['id']);
            Res.Send(Req.RawWebRequest.RemoteAddr+' | '+'Descricao nao encontrada para o ean: '+Req.Params.Items['id']).Status(404);
          end;
        end;
      end
      else
      begin
        Res.Send('Necessario enviar o codigo da mercadoria. Ex: www.eanpictures.com.br/api/descricao/789789789789').Status(404);
      end;
    end);
    //************


  end;
end;

constructor TWsHorse.Create;
begin
  FHorse := THorse.Create;
  with FHorse do
  begin
    Use(Jhonson);
    Use(OctetStream);
    Use(HandleException);
  end;
  AddMethods;
end;

function TWsHorse.Port(Value: Integer): TWsHorse;
begin
  Result := Self;
  FHorse.Port := Value;
end;

function TWsHorse.Path(Value: String): TWsHorse;
begin
  Result := Self;
  FPath := Value;
end;

procedure TWsHorse.Power;
begin
  if FHorse.IsRunning
  then FHorse.StopListen
  else FHorse.Listen;
end;


function twshorse.removeacento(const ptext: string):string;
type
  usaascii20127 = type ansistring(20127);
begin
    result:=string(usaascii20127(ptext));
end;

function twshorse.somentenumero(snum: string): string;
var s1, s2: string;
  i: integer;
begin
  s1 := snum;
  s2 := '';
  for i := 1 to length(s1) do
    if s1[i] in ['0' .. '9'] then
    s2:=s2 + s1[i];
  result:=s2;
end;

















end.
