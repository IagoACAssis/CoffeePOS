unit uRepositorioCliente;

interface

uses
  System.Generics.Collections,
  uCliente;

type
  IRepositorioCliente = interface
    ['{0FB0C7F2-9C26-4AF5-9C5C-8E62A97FD004}']
    procedure Adicionar(ACliente: TCliente);
    function Listar: TObjectList<TCliente>;
    function BuscarPorId(const AId: string): TCliente;
  end;

implementation

end.

