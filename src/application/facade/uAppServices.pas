unit uAppServices;

interface

uses
  System.SysUtils,
  System.Generics.Collections,
  uProduto,
  uVenda,
  uRepositorioProduto,
  uRepositorioVenda,
  uRepositorioProdutoMemoria,
  uRepositorioVendaMemoria,
  uCadastrarProdutoUseCase,
  uListarProdutosUseCase,
  uCriarVendaUseCase,
  uAdicionarItemUseCase,
  uProcessarPagamentoUseCase;

type
  TAppServices = class
  private
    FRepoProduto: IRepositorioProduto;
    FRepoVenda: IRepositorioVenda;
  public
    constructor Create;

    // PRODUTOS
    function CadastrarProduto(const Nome: string; Preco: Currency): TProduto;
    function ListarProdutos: TObjectList<TProduto>;

    // VENDAS
    function CriarVenda: TVenda;
    function AdicionarItem(const VendaId, ProdutoId: string; Quantidade: Integer): TVenda;

    // PAGAMENTO
    function ProcessarPagamento(const VendaId: string; Tipo: TTipoPagamento): TProcessarPagamentoResponse;
  end;

implementation

{ TAppServices }

constructor TAppServices.Create;
begin
  // Repositórios concretos (por enquanto, em memória)
  FRepoProduto := TRepositorioProdutoMemoria.Create;
  FRepoVenda := TRepositorioVendaMemoria.Create;
end;

function TAppServices.CadastrarProduto(const Nome: string; Preco: Currency): TProduto;
var
  UC: ICadastrarProdutoUseCase;
  Req: TCadastrarProdutoRequest;
  Res: TCadastrarProdutoResponse;
begin
  UC := TCadastrarProdutoUseCase.Create(FRepoProduto);

  Req.Nome := Nome;
  Req.Preco := Preco;

  Res := UC.Executar(Req);
  Result := Res.Produto;
end;

function TAppServices.ListarProdutos: TObjectList<TProduto>;
var
  UC: IListarProdutosUseCase;
  Res: TListarProdutosResponse;
begin
  UC := TListarProdutosUseCase.Create(FRepoProduto);
  Res := UC.Executar;
  Result := Res.Produtos;
end;

function TAppServices.CriarVenda: TVenda;
var
  UC: ICriarVendaUseCase;
  Res: TCriarVendaResponse;
begin
  UC := TCriarVendaUseCase.Create(FRepoVenda);
  Res := UC.Executar;
  Result := Res.Venda;
end;

function TAppServices.AdicionarItem(const VendaId, ProdutoId: string; Quantidade: Integer): TVenda;
var
  UC: IAdicionarItemUseCase;
  Req: TAdicionarItemRequest;
  Res: TAdicionarItemResponse;
begin
  UC := TAdicionarItemUseCase.Create(FRepoVenda, FRepoProduto);

  Req.VendaId := VendaId;
  Req.ProdutoId := ProdutoId;
  Req.Quantidade := Quantidade;

  Res := UC.Executar(Req);

  Result := Res.Venda;
end;

function TAppServices.ProcessarPagamento(const VendaId: string;
  Tipo: TTipoPagamento): TProcessarPagamentoResponse;
var
  UC: IProcessarPagamentoUseCase;
  Req: TProcessarPagamentoRequest;
begin
  UC := TProcessarPagamentoUseCase.Create(FRepoVenda);

  Req.VendaId := VendaId;
  Req.TipoPagamento := Tipo;

  Result := UC.Executar(Req);
end;

end.

