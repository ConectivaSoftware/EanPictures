unit DataLoadProduct;

interface

uses
  Pkg.Json.DTO, System.Generics.Collections, REST.Json.Types;

{$M+}

type
  TDataLoadProduct = class(TJsonDTO)
  private

    FCest_Codigo: string;
    FEmbalagem: string;
    FId_Categoria: string;
    FCategoria: string;
    FMarca: string;
    FNcm: string;
    FNome: string;
    FPeso: string;
    FQuantidadeEmbalagem: string;

  published
    property Categoria: string read FCategoria write FCategoria;
    property Cest_Codigo: string read FCest_Codigo write FCest_Codigo;
    property Embalagem: string read FEmbalagem write FEmbalagem;
    property Id_Categoria: string read FId_Categoria write FId_Categoria;
    property Marca: string read FMarca write FMarca;
    property Ncm: string read FNcm write FNcm;
    property Nome: string read FNome write FNome;
    property Peso: string read FPeso write FPeso;
    property QuantidadeEmbalagem: string read FQuantidadeEmbalagem write FQuantidadeEmbalagem;
  end;
  
implementation

end.
