unit uPagamentoCartao;

interface

uses
  System.SysUtils,
  uPagamento;

type
  TPagamentoCartao = class(TInterfacedObject, IPagamento)
  public
    function Pagar(Valor: Currency): TResultadoPagamento;
  end;

implementation

function TPagamentoCartao.Pagar(Valor: Currency): TResultadoPagamento;
begin
  // No futuro aqui seria chamada a Stone/Fiserv/Elgin/InfinitePay etc.
  Result.Sucesso := True;
  Result.Mensagem := Format(
    'Pagamento no cartão aprovado no valor de R$ %.2f (simulado).',
    [Valor]
  );
end;

end.

