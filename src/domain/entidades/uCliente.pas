unit uCliente;

interface

uses
  System.SysUtils;

type
  TCliente = class
  private
    FId: string;
    FNome: string;
    FTelefone: string;
  public
    constructor Create(const AId, ANome, ATelefone: string);
    property Id: string read FId;
    property Nome: string read FNome write FNome;
    property Telefone: string read FTelefone write FTelefone;
  end;

implementation

constructor TCliente.Create(const AId, ANome, ATelefone: string);
begin
  FId := AId;
  FNome := ANome;
  FTelefone := ATelefone;
end;

end.

