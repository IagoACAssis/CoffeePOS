unit uPagamentoPix;

interface

uses
  System.SysUtils,
  uPagamento;

type
  TPagamentoPix = class(TInterfacedObject, IPagamento)
  public
    function Pagar(Valor: Currency): TResultadoPagamento;
  end;

implementation

function TPagamentoPix.Pagar(Valor: Currency): TResultadoPagamento;
begin
  // Simulando uma comunicação externa...
  Result.Sucesso := True;
  Result.Mensagem := Format(
    'Pagamento Pix de R$ %.2f confirmado (simulado).',
    [Valor]
  );
end;

end.

