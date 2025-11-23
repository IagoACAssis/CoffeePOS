unit uProcessarPagamentoUseCase;

interface

uses
  System.SysUtils,
  uVenda,
  uPagamento,
  uRepositorioVenda,
  uPagamentoDinheiro,
  uPagamentoPix,
  uPagamentoCartao;

type
  TTipoPagamento = (tpDinheiro, tpPix, tpCartao);

  TProcessarPagamentoRequest = record
    VendaId: string;
    TipoPagamento: TTipoPagamento;
  end;

  TProcessarPagamentoResponse = record
    Sucesso: Boolean;
    Mensagem: string;
    ValorPago: Currency;
  end;

  IProcessarPagamentoUseCase = interface
    ['{6F62A339-8D07-4DDE-874E-9630FAD99DBF}']
    function Executar(const ARequest: TProcessarPagamentoRequest): TProcessarPagamentoResponse;
  end;

  TProcessarPagamentoUseCase = class(TInterfacedObject, IProcessarPagamentoUseCase)
  private
    FRepositorioVenda: IRepositorioVenda;

    function CriarEstrategia(const ATipo: TTipoPagamento): IPagamento;
  public
    constructor Create(ARepositorioVenda: IRepositorioVenda);
    function Executar(const ARequest: TProcessarPagamentoRequest): TProcessarPagamentoResponse;
  end;

implementation

{ TProcessarPagamentoUseCase }

constructor TProcessarPagamentoUseCase.Create(ARepositorioVenda: IRepositorioVenda);
begin
  FRepositorioVenda := ARepositorioVenda;
end;

function TProcessarPagamentoUseCase.CriarEstrategia(
  const ATipo: TTipoPagamento): IPagamento;
begin
  case ATipo of
    tpDinheiro: Result := TPagamentoDinheiro.Create;
    tpPix:      Result := TPagamentoPix.Create;
    tpCartao:   Result := TPagamentoCartao.Create;
  else
    raise Exception.Create('Tipo de pagamento inválido.');
  end;
end;

function TProcessarPagamentoUseCase.Executar(
  const ARequest: TProcessarPagamentoRequest): TProcessarPagamentoResponse;
var
  Venda: TVenda;
  Estrategia: IPagamento;
  Resultado: TResultadoPagamento;
  Total: Currency;
begin
  // Buscar venda
  Venda := FRepositorioVenda.BuscarPorId(ARequest.VendaId);

  if not Assigned(Venda) then
    raise Exception.Create('Venda não encontrada.');

  // Calcular total
  Total := Venda.Total;

  if Total <= 0 then
    raise Exception.Create('Não é possível pagar uma venda sem itens.');

  // Criar a estratégia correta (Strategy Pattern)
  Estrategia := CriarEstrategia(ARequest.TipoPagamento);

  // Efetuar pagamento
  Resultado := Estrategia.Pagar(Total);

  // Montar resposta
  Result.Sucesso := Resultado.Sucesso;
  Result.Mensagem := Resultado.Mensagem;
  Result.ValorPago := Total;
end;

end.

