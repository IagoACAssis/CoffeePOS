unit MainForm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls;

type
  TFormMain = class(TForm)
    btnProdutos: TButton;
    btnNovaVenda: TButton;
    procedure btnProdutosClick(Sender: TObject);
    procedure btnNovaVendaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMain: TFormMain;

implementation

uses
  uFormProdutos, uFormVenda;

{$R *.fmx}

procedure TFormMain.btnNovaVendaClick(Sender: TObject);
begin
  FormVenda.Show;
end;

procedure TFormMain.btnProdutosClick(Sender: TObject);
begin
  FormProdutos.Show;
end;

end.
