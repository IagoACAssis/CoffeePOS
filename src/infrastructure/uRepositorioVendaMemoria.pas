unit uRepositorioVendaMemoria;

interface

uses
  System.Generics.Collections,
  uRepositorioVenda,
  uVenda;

type
  TRepositorioVendaMemoria = class(TInterfacedObject, IRepositorioVenda)
  private
    FLista: TObjectList<TVenda>;
  public
    constructor Create;
    destructor Destroy; override;

    procedure Salvar(AVenda: TVenda);
    function BuscarPorId(const AId: string): TVenda;
  end;

implementation

{ TRepositorioVendaMemoria }

constructor TRepositorioVendaMemoria.Create;
begin
  // OwnsObjects = True → o repositório controla o ciclo de vida das vendas
  FLista := TObjectList<TVenda>.Create(True);
end;

destructor TRepositorioVendaMemoria.Destroy;
begin
  FLista.Free;
  inherited;
end;

procedure TRepositorioVendaMemoria.Salvar(AVenda: TVenda);
begin
  // Poderíamos validar se já existe e substituir, mas no MVP não precisa
  FLista.Add(AVenda);
end;

function TRepositorioVendaMemoria.BuscarPorId(const AId: string): TVenda;
var
  Venda: TVenda;
begin
  Result := nil;

  for Venda in FLista do
    if Venda.Id = AId then
      Exit(Venda);
end;

end.

