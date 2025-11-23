unit uPagamentoDinheiro;

interface

uses
  System.SysUtils,
  uPagamento;

type
  TPagamentoDinheiro = class(TInterfacedObject, IPagamento)
  public
    function Pagar(Valor: Currency): TResultadoPagamento;
  end;

implementation

function TPagamentoDinheiro.Pagar(Valor: Currency): TResultadoPagamento;
begin
  Result.Sucesso := True;
  Result.Mensagem := Format('Pagamento de R$ %.2f recebido em dinheiro.', [Valor]);
end;

end.

