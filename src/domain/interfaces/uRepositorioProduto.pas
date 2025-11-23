unit uRepositorioProduto;

interface

uses
  System.Generics.Collections, uProduto;

type
  IRepositorioProduto = interface
    ['{59B7BC3E-F25B-4B51-96D0-D8BAD4518D86}']
    procedure Adicionar(AProduto: TProduto);
    function Listar: TObjectList<TProduto>;
    function BuscarPorId(const AId: string): TProduto;
  end;

implementation

end.

