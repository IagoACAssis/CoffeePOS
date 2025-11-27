unit uRemoverItemDaVendaUseCase;

interface

uses
  uVenda, uItemVenda, uRepositorioVenda;

type
  TRemoverItemDaVendaRequest = record
    VendaId: string;
    ProdutoId: string;
  end;

  TRemoverItemDaVendaResponse = record
    Venda: TVenda;
  end;

  IRemoverItemDaVendaUseCase = interface
    ['{6B86F5C8-CB6D-443A-BF85-20760D23D6D4}']
    function Executar(const AReq: TRemoverItemDaVendaRequest): TRemoverItemDaVendaResponse;
  end;

  TRemoverItemDaVendaUseCase = class(TInterfacedObject, IRemoverItemDaVendaUseCase)
  private
    FRepoVenda: IRepositorioVenda;
  public
    constructor Create(AVendaRepo: IRepositorioVenda);

    function Executar(const AReq: TRemoverItemDaVendaRequest): TRemoverItemDaVendaResponse;
  end;

implementation

uses
  System.SysUtils;

{ TRemoverItemDaVendaUseCase }

constructor TRemoverItemDaVendaUseCase.Create(AVendaRepo: IRepositorioVenda);
begin
  FRepoVenda := AVendaRepo;
end;

function TRemoverItemDaVendaUseCase.Executar(
  const AReq: TRemoverItemDaVendaRequest): TRemoverItemDaVendaResponse;
var
  Venda: TVenda;
  Item: TItemVenda;
  I: Integer;
begin
  Venda := FRepoVenda.BuscarPorId(AReq.VendaId);
  if not Assigned(Venda) then
    raise Exception.Create('Venda não encontrada.');

  for I := Venda.Itens.Count - 1 downto 0 do
  begin
    Item := Venda.Itens[I];

    if Item.Produto.Id = AReq.ProdutoId then
    begin
      Venda.Itens.Delete(I);
      Result.Venda := Venda;
      Exit;
    end;
  end;

  raise Exception.Create('Item não encontrado na venda.');
end;

end.

