unit uCadastrarProdutoUseCase;

interface

uses
  System.SysUtils,
  uProduto,
  uRepositorioProduto;

type
  TCadastrarProdutoRequest = record
    Nome: string;
    Preco: Currency;
  end;

  TCadastrarProdutoResponse = record
    Produto: TProduto;
  end;

  ICadastrarProdutoUseCase = interface
    ['{A0B77245-9879-4C2E-B0D3-80C5EA4A8759}']
    function Executar(const ARequest: TCadastrarProdutoRequest): TCadastrarProdutoResponse;
  end;

  TCadastrarProdutoUseCase = class(TInterfacedObject, ICadastrarProdutoUseCase)
  private
    FRepositorio: IRepositorioProduto;
    function GerarId: string;
  public
    constructor Create(ARepositorio: IRepositorioProduto);

    function Executar(const ARequest: TCadastrarProdutoRequest): TCadastrarProdutoResponse;
  end;

implementation

{ TCadastrarProdutoUseCase }

constructor TCadastrarProdutoUseCase.Create(ARepositorio: IRepositorioProduto);
begin
  FRepositorio := ARepositorio;
end;

function TCadastrarProdutoUseCase.GerarId: string;
begin
  Result := TGUID.NewGuid.ToString;
end;

function TCadastrarProdutoUseCase.Executar(
  const ARequest: TCadastrarProdutoRequest): TCadastrarProdutoResponse;
var
  Produto: TProduto;
begin
  // Criar entidade
  Produto := TProduto.Create(
    GerarId,
    ARequest.Nome,
    ARequest.Preco
  );

  // Persistir
  FRepositorio.Adicionar(Produto);

  // Montar resposta
  Result.Produto := Produto;
end;

end.

