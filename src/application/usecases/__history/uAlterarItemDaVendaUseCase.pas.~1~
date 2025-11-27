unit uAlterarItemDaVendaUseCase;

interface

uses
  uVenda, uItemVenda, uProduto, uRepositorioVenda, uRepositorioProduto;

type
  TAlterarItemDaVendaRequest = record
    VendaId: string;
    ProdutoId: string;
    NovaQuantidade: Integer;
  end;

  TAlterarItemDaVendaResponse = record
    Venda: TVenda;
  end;

  IAlterarItemDaVendaUseCase = interface
    ['{04E78226-1EA3-4D2A-9D09-5F81639D61C9}']
    function Executar(const AReq: TAlterarItemDaVendaRequest): TAlterarItemDaVendaResponse;
  end;

  TAlterarItemDaVendaUseCase = class(TInterfacedObject, IAlterarItemDaVendaUseCase)
  private
    FRepoVenda: IRepositorioVenda;
    FRepoProduto: IRepositorioProduto;
  public
    constructor Create(AVendaRepo: IRepositorioVenda; AProdutoRepo: IRepositorioProduto);

    function Executar(const AReq: TAlterarItemDaVendaRequest): TAlterarItemDaVendaResponse;
  end;

implementation

uses
  System.SysUtils;

{ TAlterarItemDaVendaUseCase }

constructor TAlterarItemDaVendaUseCase.Create(
  AVendaRepo: IRepositorioVenda;
  AProdutoRepo: IRepositorioProduto);
begin
  FRepoVenda := AVendaRepo;
  FRepoProduto := AProdutoRepo;
end;

function TAlterarItemDaVendaUseCase.Executar(
  const AReq: TAlterarItemDaVendaRequest): TAlterarItemDaVendaResponse;
var
  Venda: TVenda;
  Item: TItemVenda;
  Produto: TProduto;
begin
  Venda := FRepoVenda.BuscarPorId(AReq.VendaId);
  if not Assigned(Venda) then
    raise Exception.Create('Venda não encontrada.');

  Produto := FRepoProduto.BuscarPorId(AReq.ProdutoId);
  if not Assigned(Produto) then
    raise Exception.Create('Produto não encontrado.');

  if AReq.NovaQuantidade <= 0 then
    raise Exception.Create('Quantidade inválida.');

  // Procurar o item existente
  for Item in Venda.Itens do
    if Item.Produto.Id = Produto.Id then
    begin
      Item.Quantidade := AReq.NovaQuantidade;
      Result.Venda := Venda;
      Exit;
    end;

  raise Exception.Create('Item não encontrado na venda.');
end;

end.

