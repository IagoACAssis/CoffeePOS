unit uFormProdutos;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, uDMApp, FMX.ListView.Types,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.ListView, uProduto,
  System.Generics.Collections;

type
  TFormProdutos = class(TForm)
    ToolBar1: TToolBar;
    lblTitulo: TLabel;
    btnNovo: TButton;
    lvProdutos: TListView;
    procedure FormShow(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
  private
    procedure CarregarProdutos;
  public
    { Public declarations }
  end;

var
  FormProdutos: TFormProdutos;

implementation

uses
  uFormProdutoCadastro;

{$R *.fmx}

{ TFormProdutos }

procedure TFormProdutos.btnNovoClick(Sender: TObject);
begin
  // Abre a tela de cadastro
  with TFormProdutoCadastro.Create(Self) do
  begin
    ShowModal;
    Free;
  end;

  // Recarrega após cadastrar
  CarregarProdutos;
end;

procedure TFormProdutos.CarregarProdutos;
var
  Lista: TObjectList<TProduto>;
  P: TProduto;
  Item: TListViewItem;
begin
  lvProdutos.Items.Clear;

  Lista := DMApp.App.ListarProdutos;

  for P in Lista do
  begin
    Item := lvProdutos.Items.Add;
    Item.Text := P.Nome;
    Item.Detail := Format('R$ %.2f', [P.Preco]);
    Item.TagString := P.Id; // útil caso queira editar no futuro
  end;
end;

procedure TFormProdutos.FormShow(Sender: TObject);
begin
  CarregarProdutos;
end;

end.
