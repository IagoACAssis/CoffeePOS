unit uProduto;

interface

uses
  System.SysUtils;

type
  TProduto = class
  private
    FId: string;
    FNome: string;
    FPreco: Currency;
  public
    constructor Create(const AId, ANome: string; APreco: Currency);

    property Id: string read FId;
    property Nome: string read FNome;
    property Preco: Currency read FPreco write FPreco;
  end;

implementation

constructor TProduto.Create(const AId, ANome: string; APreco: Currency);
begin
  FId := AId;
  FNome := ANome;
  FPreco := APreco;
end;

end.

