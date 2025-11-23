unit uRepositorioProdutoMemoria;

interface

uses
  System.Generics.Collections,
  uRepositorioProduto,
  uProduto;

type
  TRepositorioProdutoMemoria = class(TInterfacedObject, IRepositorioProduto)
  private
    FLista: TObjectList<TProduto>;
  public
    constructor Create;
    destructor Destroy; override;

    procedure Adicionar(AProduto: TProduto);
    function Listar: TObjectList<TProduto>;
    function BuscarPorId(const AId: string): TProduto;
  end;

implementation

{ TRepositorioProdutoMemoria }

constructor TRepositorioProdutoMemoria.Create;
begin
  // OwnsObjects = True → vai destruir os produtos automaticamente
  FLista := TObjectList<TProduto>.Create(True);
end;

destructor TRepositorioProdutoMemoria.Destroy;
begin
  FLista.Free;
  inherited;
end;

procedure TRepositorioProdutoMemoria.Adicionar(AProduto: TProduto);
begin
  FLista.Add(AProduto);
end;

function TRepositorioProdutoMemoria.Listar: TObjectList<TProduto>;
begin
  Result := FLista;
end;

function TRepositorioProdutoMemoria.BuscarPorId(const AId: string): TProduto;
var
  Prod: TProduto;
begin
  Result := nil;
  for Prod in FLista do
    if Prod.Id = AId then
      Exit(Prod);
end;

end.

