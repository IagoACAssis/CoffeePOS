unit uCadastrarClienteUseCase;

interface

uses
  System.SysUtils,
  uCliente,
  uRepositorioCliente;

type
  TCadastrarClienteRequest = record
    Nome: string;
    Telefone: string;
  end;

  TCadastrarClienteResponse = record
    Cliente: TCliente;
  end;

  ICadastrarClienteUseCase = interface
    ['{D37C29A5-EE61-4855-933C-59A6C53BF206}']
    function Executar(const AReq: TCadastrarClienteRequest): TCadastrarClienteResponse;
  end;

type
  TCadastrarClienteUseCase = class(TInterfacedObject, ICadastrarClienteUseCase)
  private
    FRepositorioCliente: IRepositorioCliente;
    function GerarId: string;
  public
    constructor Create(ARepo: IRepositorioCliente);
    function Executar(const AReq: TCadastrarClienteRequest): TCadastrarClienteResponse;
  end;

implementation

{ TCadastrarClienteUseCase }
constructor TCadastrarClienteUseCase.Create(ARepo: IRepositorioCliente);
begin
  FRepositorioCliente := ARepo;
end;

function TCadastrarClienteUseCase.GerarId: string;
begin
  Result := TGUID.NewGuid.ToString;
end;

function TCadastrarClienteUseCase.Executar(
  const AReq: TCadastrarClienteRequest): TCadastrarClienteResponse;
var
  C: TCliente;
begin
  C := TCliente.Create(GerarId, AReq.Nome, AReq.Telefone);
  FRepositorioCliente.Adicionar(C);

  Result.Cliente := C;
end;


end.

