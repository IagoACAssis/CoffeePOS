unit uRepositorioClienteMemoria;

interface

uses
  System.Generics.Collections,
  uCliente,
  uRepositorioCliente;

type
  TRepositorioClienteMemoria = class(TInterfacedObject, IRepositorioCliente)
  private
    FLista: TObjectList<TCliente>;
  public
    constructor Create;
    destructor Destroy; override;

    procedure Adicionar(ACliente: TCliente);
    function Listar: TObjectList<TCliente>;
    function BuscarPorId(const AId: string): TCliente;
  end;

implementation

constructor TRepositorioClienteMemoria.Create;
begin
  FLista := TObjectList<TCliente>.Create(True);
end;

destructor TRepositorioClienteMemoria.Destroy;
begin
  FLista.Free;
  inherited;
end;

procedure TRepositorioClienteMemoria.Adicionar(ACliente: TCliente);
begin
  FLista.Add(ACliente);
end;

function TRepositorioClienteMemoria.Listar: TObjectList<TCliente>;
begin
  Result := FLista;
end;

function TRepositorioClienteMemoria.BuscarPorId(const AId: string): TCliente;
var
  C: TCliente;
begin
  Result := nil;
  for C in FLista do
    if C.Id = AId then
      Exit(C);
end;

end.

