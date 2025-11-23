unit uListarProdutosUseCase;

interface

uses
  System.Generics.Collections,
  uProduto,
  uRepositorioProduto;

type
  TListarProdutosResponse = record
    Produtos: TObjectList<TProduto>;
  end;

  IListarProdutosUseCase = interface
    ['{8F7CB726-3A5E-4AAC-BB48-7AAB6A935E52}']
    function Executar: TListarProdutosResponse;
  end;

  TListarProdutosUseCase = class(TInterfacedObject, IListarProdutosUseCase)
  private
    FRepositorio: IRepositorioProduto;
  public
    constructor Create(ARepositorio: IRepositorioProduto);

    function Executar: TListarProdutosResponse;
  end;

implementation

{ TListarProdutosUseCase }

constructor TListarProdutosUseCase.Create(ARepositorio: IRepositorioProduto);
begin
  FRepositorio := ARepositorio;
end;

function TListarProdutosUseCase.Executar: TListarProdutosResponse;
begin
  Result.Produtos := FRepositorio.Listar;
end;

end.

