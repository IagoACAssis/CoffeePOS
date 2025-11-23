unit uAdicionarItemUseCase;

interface

uses
  System.SysUtils,
  uVenda,
  uItemVenda,
  uProduto,
  uRepositorioVenda,
  uRepositorioProduto;

type
  TAdicionarItemRequest = record
    VendaId: string;
    ProdutoId: string;
    Quantidade: Integer;
  end;

  TAdicionarItemResponse = record
    Venda: TVenda;
  end;

  IAdicionarItemUseCase = interface
    ['{E0D1AA92-88B0-4EF3-A1A1-ED359C6F842F}']
    function Executar(const ARequest: TAdicionarItemRequest): TAdicionarItemResponse;
  end;

  TAdicionarItemUseCase = class(TInterfacedObject, IAdicionarItemUseCase)
  private
    FRepositorioVenda: IRepositorioVenda;
    FRepositorioProduto: IRepositorioProduto;
  public
    constructor Create(AVendaRepo: IRepositorioVenda; AProdutoRepo: IRepositorioProduto);

    function Executar(const ARequest: TAdicionarItemRequest): TAdicionarItemResponse;
  end;

implementation

{ TAdicionarItemUseCase }

constructor TAdicionarItemUseCase.Create(
  AVendaRepo: IRepositorioVenda;
  AProdutoRepo: IRepositorioProduto);
begin
  FRepositorioVenda := AVendaRepo;
  FRepositorioProduto := AProdutoRepo;
end;

function TAdicionarItemUseCase.Executar(
  const ARequest: TAdicionarItemRequest): TAdicionarItemResponse;
var
  Venda: TVenda;
  Produto: TProduto;
  Item: TItemVenda;
begin
  // Buscar venda
  Venda := FRepositorioVenda.BuscarPorId(ARequest.VendaId);
  if not Assigned(Venda) then
    raise Exception.Create('Venda não encontrada.');

  // Buscar produto
  Produto := FRepositorioProduto.BuscarPorId(ARequest.ProdutoId);
  if not Assigned(Produto) then
    raise Exception.Create('Produto não encontrado.');

  if ARequest.Quantidade <= 0 then
    raise Exception.Create('Quantidade inválida.');

  // Criar item
  Item := TItemVenda.Create(Produto, ARequest.Quantidade);

  // Adicionar à venda
  Venda.AdicionarItem(Item);

  // Montar resposta
  Result.Venda := Venda;
end;

end.

