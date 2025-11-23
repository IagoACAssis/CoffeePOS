unit uRepositorioVenda;

interface

uses
  uVenda;

type
  IRepositorioVenda = interface
    ['{BE50149A-8708-4F3B-B1D3-705D6C1BA3E3}']
    procedure Salvar(AVenda: TVenda);
    function BuscarPorId(const AId: string): TVenda;
  end;

implementation

end.

