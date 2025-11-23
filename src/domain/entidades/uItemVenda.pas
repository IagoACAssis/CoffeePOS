unit uItemVenda;

interface

uses
  System.SysUtils, uProduto;

type
  TItemVenda = class
  private
    FProduto: TProduto;
    FQuantidade: Integer;
  public
    constructor Create(AProduto: TProduto; AQuantidade: Integer);

    function ValorTotal: Currency;

    property Produto: TProduto read FProduto;
    property Quantidade: Integer read FQuantidade write FQuantidade;
  end;

implementation

constructor TItemVenda.Create(AProduto: TProduto; AQuantidade: Integer);
begin
  FProduto := AProduto;
  FQuantidade := AQuantidade;
end;

function TItemVenda.ValorTotal: Currency;
begin
  Result := Produto.Preco * Quantidade;
end;

end.

