unit uDefinirClienteDaVendaUseCase;

interface

uses
  uVenda,
  uCliente,
  uRepositorioVenda,
  uRepositorioCliente;

type
  TDefinirClienteDaVendaRequest = record
    VendaId: string;
    ClienteId: string;
  end;

  TDefinirClienteDaVendaResponse = record
    Venda: TVenda;
  end;

  IDefinirClienteDaVendaUseCase = interface
    ['{C06E30FA-808C-4C3E-AEA1-7C0D89952C42}']
    function Executar(const AReq: TDefinirClienteDaVendaRequest): TDefinirClienteDaVendaResponse;
  end;

  TDefinirClienteDaVendaUseCase = class(TInterfacedObject, IDefinirClienteDaVendaUseCase)
  private
    FRepoVenda: IRepositorioVenda;
    FRepoCliente: IRepositorioCliente;
  public
    constructor Create(AVendaRepo: IRepositorioVenda; AClienteRepo: IRepositorioCliente);

    function Executar(
      const AReq: TDefinirClienteDaVendaRequest
    ): TDefinirClienteDaVendaResponse;
  end;

implementation

uses
  System.SysUtils;

{ TDefinirClienteDaVendaUseCase }

constructor TDefinirClienteDaVendaUseCase.Create(
  AVendaRepo: IRepositorioVenda;
  AClienteRepo: IRepositorioCliente);
begin
  FRepoVenda := AVendaRepo;
  FRepoCliente := AClienteRepo;
end;

function TDefinirClienteDaVendaUseCase.Executar(
  const AReq: TDefinirClienteDaVendaRequest): TDefinirClienteDaVendaResponse;
var
  Venda: TVenda;
  Cliente: TCliente;
begin
  // Buscar venda
  Venda := FRepoVenda.BuscarPorId(AReq.VendaId);
  if not Assigned(Venda) then
    raise Exception.Create('Venda não encontrada.');

  // Buscar cliente
  Cliente := FRepoCliente.BuscarPorId(AReq.ClienteId);
  if not Assigned(Cliente) then
    raise Exception.Create('Cliente não encontrado.');

  // Associar cliente
  Venda.ClienteId := Cliente.Id;

  // Retornar
  Result.Venda := Venda;
end;

end.

