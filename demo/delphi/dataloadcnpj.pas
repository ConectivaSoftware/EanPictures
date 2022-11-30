unit DataLoadCNPJ;

interface

uses
  Pkg.Json.DTO, System.Generics.Collections, REST.Json.Types;

{$M+}

type
  TDataLoadCNPJ = class(TJsonDTO)
  private
    FBairro: string;
    FCep: string;
    FCnae_Fiscal: string;
    FCnpj: string;
    FCodigo_Municipio: string;
    FCodigo_Natureza_Juridica: string;
    FComplemento: string;
    FCorreio_Eletronico: string;
    FData_Inicio_Atividade: string;
    FData_Situacao_Cadastral: string;
    FDdd_Fax: string;
    FDdd_Telefone_1: string;
    FDdd_Telefone_2: string;
    FDescricao_Tipo_Logradouro: string;
    FIe: string;
    FLogradouro: string;
    FMunicipio: string;
    FNome_Fantasia: string;
    FNumero: string;
    FRazao_Social: string;
    FSituacao_Cadastral: string;
    FUf: string;
  published
    property Bairro: string read FBairro write FBairro;
    property Cep: string read FCep write FCep;
    property Cnae_Fiscal: string read FCnae_Fiscal write FCnae_Fiscal;
    property Cnpj: string read FCnpj write FCnpj;
    property Codigo_Municipio: string read FCodigo_Municipio write FCodigo_Municipio;
    property Codigo_Natureza_Juridica: string read FCodigo_Natureza_Juridica write FCodigo_Natureza_Juridica;
    property Complemento: string read FComplemento write FComplemento;
    property Correio_Eletronico: string read FCorreio_Eletronico write FCorreio_Eletronico;
    property Data_Inicio_Atividade: string read FData_Inicio_Atividade write FData_Inicio_Atividade;
    property Data_Situacao_Cadastral: string read FData_Situacao_Cadastral write FData_Situacao_Cadastral;
    property Ddd_Fax: string read FDdd_Fax write FDdd_Fax;
    property Ddd_Telefone_1: string read FDdd_Telefone_1 write FDdd_Telefone_1;
    property Ddd_Telefone_2: string read FDdd_Telefone_2 write FDdd_Telefone_2;
    property Descricao_Tipo_Logradouro: string read FDescricao_Tipo_Logradouro write FDescricao_Tipo_Logradouro;
    property Ie: string read FIe write FIe;
    property Logradouro: string read FLogradouro write FLogradouro;
    property Municipio: string read FMunicipio write FMunicipio;
    property Nome_Fantasia: string read FNome_Fantasia write FNome_Fantasia;
    property Numero: string read FNumero write FNumero;
    property Razao_Social: string read FRazao_Social write FRazao_Social;
    property Situacao_Cadastral: string read FSituacao_Cadastral write FSituacao_Cadastral;
    property Uf: string read FUf write FUf;
  end;
  
implementation

end.
