program CoffeePOS;

uses
  System.StartUpCopy,
  FMX.Forms,
  uProduto in 'domain\entidades\uProduto.pas',
  uItemVenda in 'domain\entidades\uItemVenda.pas',
  uVenda in 'domain\entidades\uVenda.pas',
  uPagamento in 'domain\interfaces\uPagamento.pas',
  uRepositorioProduto in 'domain\interfaces\uRepositorioProduto.pas',
  uRepositorioVenda in 'domain\interfaces\uRepositorioVenda.pas',
  uRepositorioProdutoMemoria in 'infrastructure\uRepositorioProdutoMemoria.pas',
  uRepositorioVendaMemoria in 'infrastructure\uRepositorioVendaMemoria.pas',
  uPagamentoDinheiro in 'infrastructure\pagamentos\uPagamentoDinheiro.pas',
  uPagamentoPix in 'infrastructure\pagamentos\uPagamentoPix.pas',
  uPagamentoCartao in 'infrastructure\pagamentos\uPagamentoCartao.pas',
  uCadastrarProdutoUseCase in 'application\usecases\uCadastrarProdutoUseCase.pas',
  uListarProdutosUseCase in 'application\usecases\uListarProdutosUseCase.pas',
  uCriarVendaUseCase in 'application\usecases\uCriarVendaUseCase.pas',
  uAdicionarItemUseCase in 'application\usecases\uAdicionarItemUseCase.pas',
  uProcessarPagamentoUseCase in 'application\usecases\uProcessarPagamentoUseCase.pas',
  uAppServices in 'application\facade\uAppServices.pas',
  uDMApp in 'uDMApp.pas' {DmApp: TDataModule},
  MainForm in 'ui\MainForm.pas' {FormMain},
  uFormProdutoCadastro in 'ui\uFormProdutoCadastro.pas' {FormProdutoCadastro},
  uFormProdutos in 'ui\uFormProdutos.pas' {FormProdutos},
  uFormVenda in 'ui\uFormVenda.pas' {FormVenda},
  uCliente in 'domain\entidades\uCliente.pas',
  uRepositorioCliente in 'domain\interfaces\uRepositorioCliente.pas',
  uRepositorioClienteMemoria in 'infrastructure\uRepositorioClienteMemoria.pas',
  uCadastrarClienteUseCase in 'application\usecases\uCadastrarClienteUseCase.pas',
  uListarClientesUseCase in 'application\usecases\uListarClientesUseCase.pas',
  uDefinirClienteDaVendaUseCase in 'application\usecases\uDefinirClienteDaVendaUseCase.pas',
  uAlterarItemDaVendaUseCase in 'application\usecases\uAlterarItemDaVendaUseCase.pas',
  uRemoverItemDaVendaUseCase in 'application\usecases\uRemoverItemDaVendaUseCase.pas',
  uFormClientes in 'ui\uFormClientes.pas' {FormClientes},
  uFormClienteCadastro in 'ui\uFormClienteCadastro.pas' {FormClienteCadastro};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TDmApp, DmApp);
  Application.CreateForm(TFormMain, FormMain);
  Application.CreateForm(TFormProdutoCadastro, FormProdutoCadastro);
  Application.CreateForm(TFormProdutos, FormProdutos);
  Application.CreateForm(TFormVenda, FormVenda);
  Application.CreateForm(TFormClientes, FormClientes);
  Application.CreateForm(TFormClienteCadastro, FormClienteCadastro);
  Application.Run;
end.
