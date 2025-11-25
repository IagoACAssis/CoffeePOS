unit uVenda;

interface

uses
  System.SysUtils, System.Generics.Collections, uItemVenda;

type
  TVenda = class
  private
    FId: string;
    FClienteId: string;
    FData: TDateTime;
    FItens: TObjectList<TItemVenda>;
  public
    constructor Create(const AId: string);
    destructor Destroy; override;

    procedure AdicionarItem(AItem: TItemVenda);

    function Total: Currency;

    property Id: string read FId;
    property ClienteId: string read FClienteId write FClienteId;
    property Data: TDateTime read FData;
    property Itens: TObjectList<TItemVenda> read FItens;
  end;

implementation

constructor TVenda.Create(const AId: string);
begin
  FId := AId;
  FData := Now;
  FItens := TObjectList<TItemVenda>.Create;
end;

destructor TVenda.Destroy;
begin
  FItens.Free;
  inherited;
end;

procedure TVenda.AdicionarItem(AItem: TItemVenda);
begin
  FItens.Add(AItem);
end;

function TVenda.Total: Currency;
var
  Item: TItemVenda;
begin
  Result := 0;
  for Item in FItens do
    Result := Result + Item.ValorTotal;
end;

end.

