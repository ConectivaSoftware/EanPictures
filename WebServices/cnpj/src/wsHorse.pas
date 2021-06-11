unit wsHorse;

interface

uses Horse, Horse.Jhonson, Horse.OctetStream, Horse.HandleException,
  System.SysUtils, inifiles;

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
    function DeleteChar(const Ch: Char; const S: string): string;
    function somentenumero(snum: string): string;
  end;

implementation

uses
  System.Classes, System.IOUtils, main.view, main.basedados, system.JSON, parametrosnfe;

{ TWsHorse }

function TWsHorse.Active: Boolean;
begin
 Result := FHorse.IsRunning;
end;

procedure TWsHorse.AddMethods;
var texto: string;
iesefaz: string;
begin
  with FHorse do
  begin
    iesefaz:='';
    Get('/api/cnpj/:id',
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
          sql.Add('select * from cnpj_dados_cadastrais_pj where cnpj = :cnpj');
          parambyname('cnpj').AsString:=somentenumero(Req.Params.Items['id']);
          open;
          if isempty = false then
          begin
            iesefaz:='';
            try
              if (fieldbyname('uf').asstring = 'MT') and (fieldbyname('ie').asstring = '') then
              begin
                iesefaz:=frmparametrosnfe.consultaieMT(removeacento(fieldbyname('cnpj').asstring));
                with basedados.zqueryexec do
                begin
                  close;
                  sql.Clear;
                  sql.Add('update cnpj_dados_cadastrais_pj set ie = :ie where cnpj = :cnpj');
                  parambyname('cnpj').AsString:=somentenumero(Req.Params.Items['id']);
                  parambyname('ie').AsString:=somentenumero(iesefaz);
                  execsql;
                end;
              end
              else
              begin
                if fieldbyname('ie').asstring <> '' then
                iesefaz:=fieldbyname('ie').asstring;
              end;
            finally
            end;


            wjson:=tjsonobject.Create;
            wjson.AddPair(tjsonpair.Create('cnpj',removeacento(fieldbyname('cnpj').asstring)));
            wjson.AddPair(tjsonpair.Create('razao_social',removeacento(fieldbyname('razao_social').asstring)));
            wjson.AddPair(tjsonpair.Create('nome_fantasia',removeacento(fieldbyname('nome_fantasia').asstring)));
            wjson.AddPair(tjsonpair.Create('situacao_cadastral',removeacento(fieldbyname('situacao_cadastral').asstring)));

            texto:=deletechar('\',BaseDados.zquery1.fieldbyname('data_situacao_cadastral').asstring);
            wjson.AddPair(tjsonpair.Create('data_situacao_cadastral',texto));



            wjson.AddPair(tjsonpair.Create('codigo_natureza_juridica',removeacento(fieldbyname('codigo_natureza_juridica').asstring)));

            texto:=deletechar('\',BaseDados.zquery1.fieldbyname('data_inicio_atividade').asstring);
            wjson.AddPair(tjsonpair.Create('data_inicio_atividade',texto));

            wjson.AddPair(tjsonpair.Create('cnae_fiscal',removeacento(fieldbyname('cnae_fiscal').asstring)));
            wjson.AddPair(tjsonpair.Create('descricao_tipo_logradouro',removeacento(fieldbyname('descricao_tipo_logradouro').asstring)));
            wjson.AddPair(tjsonpair.Create('logradouro',removeacento(fieldbyname('logradouro').asstring)));
            wjson.AddPair(tjsonpair.Create('numero',removeacento(fieldbyname('numero').asstring)));
            wjson.AddPair(tjsonpair.Create('complemento',removeacento(fieldbyname('complemento').asstring)));
            wjson.AddPair(tjsonpair.Create('bairro',removeacento(fieldbyname('bairro').asstring)));
            wjson.AddPair(tjsonpair.Create('cep',removeacento(fieldbyname('cep').asstring)));
            wjson.AddPair(tjsonpair.Create('uf',removeacento(fieldbyname('uf').asstring)));
            wjson.AddPair(tjsonpair.Create('codigo_municipio',removeacento(fieldbyname('codigo_municipio').asstring)));
            wjson.AddPair(tjsonpair.Create('municipio',removeacento(fieldbyname('municipio').asstring)));
            wjson.AddPair(tjsonpair.Create('ddd_telefone_1',removeacento(fieldbyname('ddd_telefone_1').asstring)));
            wjson.AddPair(tjsonpair.Create('ddd_telefone_2',removeacento(fieldbyname('ddd_telefone_2').asstring)));
            wjson.AddPair(tjsonpair.Create('ddd_fax',removeacento(fieldbyname('ddd_fax').asstring)));
            wjson.AddPair(tjsonpair.Create('correio_eletronico',removeacento(fieldbyname('correio_eletronico').asstring)));
            wjson.AddPair(tjsonpair.Create('ie',iesefaz));
            Res.Send<TJSONobject>(wjson).Status(200);;

            inc(descok);
            mainview.memodescok.lines.add(inttostr(descok)+'|'+datetostr(date)+'|'+timetostr(now)+'| Entregue descricao: '+Req.Params.Items['id']+ '|' +removeacento(fieldbyname('razao_social').asstring));
          end
          else
          begin
            inc(descerro);
            mainview.memodescerro.lines.add(inttostr(descerro)+'|'+datetostr(date)+'|'+timetostr(now)+'| Descricao nao encontrada para o cnpj: '+Req.Params.Items['id']);
            Res.Send('Informacoes nao encontradas para : '+Req.Params.Items['id']).Status(404);
          end;
        end;
      end
      else
      begin
        Res.Send('Necessario enviar o cnpj. Ex: www.dataload.com.br/api/cnpj/19600120000158').Status(404);
      end;
    end);
    //************

  Get('/api/cnpj2/:id',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    var stringlisttexto: tstringlist;

    begin
      if Req.Params.Items['id'] <> '' then
      begin
        stringlisttexto:=tstringlist.Create;
        stringlisttexto.Clear;
        stringlisttexto.Add('[general]');

        basedados.ZConnection1.Connected:=false;
        basedados.ZConnection1.Connected:=true;
        with BaseDados.zquery1 do
        begin
          close;
          sql.Clear;
          sql.Add('select * from cnpj_dados_cadastrais_pj where cnpj = :cnpj');
          parambyname('cnpj').AsString:=somentenumero(Req.Params.Items['id']);
          open;
          if isempty = false then
          begin
            iesefaz:='';
            try
              if (fieldbyname('uf').asstring = 'MT') and (fieldbyname('ie').asstring = '') then
              begin
                iesefaz:=frmparametrosnfe.consultaieMT(removeacento(fieldbyname('cnpj').asstring));
                with basedados.zqueryexec do
                begin
                  close;
                  sql.Clear;
                  sql.Add('update cnpj_dados_cadastrais_pj set ie = :ie where cnpj = :cnpj');
                  parambyname('cnpj').AsString:=somentenumero(Req.Params.Items['id']);
                  parambyname('ie').AsString:=somentenumero(iesefaz);
                  execsql;
                end;
              end
              else
              begin
                if fieldbyname('ie').asstring <> '' then
                iesefaz:=fieldbyname('ie').asstring;
              end;
            finally
            end;


            stringlisttexto.Add('cnpj='+removeacento(fieldbyname('cnpj').asstring));
            stringlisttexto.Add('razao_social='+removeacento(fieldbyname('razao_social').asstring));
            stringlisttexto.Add('nome_fantasia='+removeacento(fieldbyname('nome_fantasia').asstring));
            stringlisttexto.Add('situacao_cadastral='+removeacento(fieldbyname('situacao_cadastral').asstring));

            texto:=deletechar('\',BaseDados.zquery1.fieldbyname('data_situacao_cadastral').asstring);
            stringlisttexto.Add('data_situacao_cadastral='+texto);



            stringlisttexto.Add('codigo_natureza_juridica='+removeacento(fieldbyname('codigo_natureza_juridica').asstring));

            texto:=deletechar('\',BaseDados.zquery1.fieldbyname('data_inicio_atividade').asstring);
            stringlisttexto.Add('data_inicio_atividade='+texto);

            stringlisttexto.Add('cnae_fiscal='+removeacento(fieldbyname('cnae_fiscal').asstring));
            stringlisttexto.Add('descricao_tipo_logradouro='+removeacento(fieldbyname('descricao_tipo_logradouro').asstring));
            stringlisttexto.Add('logradouro='+removeacento(fieldbyname('logradouro').asstring));
            stringlisttexto.Add('numero='+removeacento(fieldbyname('numero').asstring));
            stringlisttexto.Add('complemento='+removeacento(fieldbyname('complemento').asstring));
            stringlisttexto.Add('bairro='+removeacento(fieldbyname('bairro').asstring));
            stringlisttexto.Add('cep='+removeacento(fieldbyname('cep').asstring));
            stringlisttexto.Add('uf='+removeacento(fieldbyname('uf').asstring));
            stringlisttexto.Add('codigo_municipio='+removeacento(fieldbyname('codigo_municipio').asstring));
            stringlisttexto.Add('municipio='+removeacento(fieldbyname('municipio').asstring));
            stringlisttexto.Add('ddd_telefone_1='+removeacento(fieldbyname('ddd_telefone_1').asstring));
            stringlisttexto.Add('ddd_telefone_2='+removeacento(fieldbyname('ddd_telefone_2').asstring));
            stringlisttexto.Add('ddd_fax='+removeacento(fieldbyname('ddd_fax').asstring));
            stringlisttexto.Add('correio_eletronico='+removeacento(fieldbyname('correio_eletronico').asstring));
            stringlisttexto.Add('ie='+removeacento(iesefaz));
            Res.Send(stringlisttexto.text).Status(200);;

            inc(descok);
            mainview.memodescok.lines.add(inttostr(descok)+'|'+datetostr(date)+'|'+timetostr(now)+'| Entregue descricao: '+Req.Params.Items['id']+ '|' +removeacento(fieldbyname('razao_social').asstring));
          end
          else
          begin
            inc(descerro);
            mainview.memodescerro.lines.add(inttostr(descerro)+'|'+datetostr(date)+'|'+timetostr(now)+'| Descricao nao encontrada para o cnpj: '+Req.Params.Items['id']);
            Res.Send('Informacoes nao encontradas para : '+Req.Params.Items['id']).Status(404);
          end;
        end;
      end
      else
      begin
        Res.Send('Necessario enviar o cnpj. Ex: www.dataload.com.br/api/cnpj/19600120000158').Status(404);
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


function twshorse.DeleteChar(const Ch: Char; const S: string): string;
var
  Posicao: integer;
begin
  Result := S;
  Posicao := Pos(Ch, Result);
  while Posicao > 0 do
  begin
    Delete(Result, Posicao, 1);
    Posicao := Pos(Ch, Result);
  end;
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
