unit uPagamento;

interface

uses
  System.SysUtils;

type
  TResultadoPagamento = record
    Sucesso: Boolean;
    Mensagem: string;
  end;

  IPagamento = interface
    ['{981907B7-3DB2-45E7-8E31-0F3CD65B9477}']
    function Pagar(Valor: Currency): TResultadoPagamento;
  end;

implementation

end.

