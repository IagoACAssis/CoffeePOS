unit uCriarVendaUseCase;

interface

uses
  System.SysUtils,
  uVenda,
  uRepositorioVenda;

type
  TCriarVendaResponse = record
    Venda: TVenda;
  end;

  ICriarVendaUseCase = interface
    ['{8102A0A3-6FD0-4B91-B01C-C3E15D6A4151}']
    function Executar: TCriarVendaResponse;
  end;

  TCriarVendaUseCase = class(TInterfacedObject, ICriarVendaUseCase)
  private
    FRepositorio: IRepositorioVenda;
    function GerarId: string;
  public
    constructor Create(ARepositorio: IRepositorioVenda);

    function Executar: TCriarVendaResponse;
  end;

implementation

{ TCriarVendaUseCase }

constructor TCriarVendaUseCase.Create(ARepositorio: IRepositorioVenda);
begin
  FRepositorio := ARepositorio;
end;

function TCriarVendaUseCase.GerarId: string;
begin
  Result := TGUID.NewGuid.ToString;
end;

function TCriarVendaUseCase.Executar: TCriarVendaResponse;
var
  Venda: TVenda;
begin
  // Cria uma venda vazia com ID único
  Venda := TVenda.Create(GerarId);

  // Salva a venda no repositório
  FRepositorio.Salvar(Venda);

  // Retorna via response
  Result.Venda := Venda;
end;

end.

