unit uFormProdutoCadastro;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Edit,
  FMX.StdCtrls, FMX.Layouts, FMX.Controls.Presentation;

type
  TFormProdutoCadastro = class(TForm)
    ToolBar1: TToolBar;
    Layout1: TLayout;
    lblNome: TLabel;
    edtNome: TEdit;
    lblTitulo: TLabel;
    Layout2: TLayout;
    lblPreco: TLabel;
    edtPreco: TEdit;
    btnSalvar: TButton;
    procedure btnSalvarClick(Sender: TObject);
  private
    function ValidarCampos: Boolean;
  public
    { Public declarations }
  end;

var
  FormProdutoCadastro: TFormProdutoCadastro;

implementation

uses
  uDMApp;

{$R *.fmx}

{ TFormProdutoCadastro }

procedure TFormProdutoCadastro.btnSalvarClick(Sender: TObject);
var
  Nome: string;
  Preco: Currency;
begin
  if not ValidarCampos then
    Exit;

  Nome := edtNome.Text;
  Preco := StrToCurr(edtPreco.Text);

  DMApp.App.CadastrarProduto(Nome, Preco);

  ShowMessage('Produto cadastrado com sucesso!');
  Close;
end;

function TFormProdutoCadastro.ValidarCampos: Boolean;
begin
  Result := False;

  if edtNome.Text.Trim = '' then
  begin
    ShowMessage('Informe o nome do produto.');
    Exit;
  end;

  if edtPreco.Text.Trim = '' then
  begin
    ShowMessage('Informe o preço do produto.');
    Exit;
  end;

  try
    StrToCurr(edtPreco.Text);
  except
    ShowMessage('Preço inválido.');
    Exit;
  end;

  Result := True;
end;

end.
