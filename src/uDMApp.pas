unit uDMApp;

interface

uses
  System.SysUtils,
  System.Classes,
  uAppServices;

type
  TDmApp = class(TDataModule)
  private
    FApp: TAppServices;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    property App: TAppServices read FApp;
  end;

var
  DmApp: TDmApp;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

{ TDmApp }

constructor TDmApp.Create(AOwner: TComponent);
begin
  inherited;
  FApp := TAppServices.Create;
end;

destructor TDmApp.Destroy;
begin
  FApp.Free;
  inherited;
end;

end.
