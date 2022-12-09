program PrjClientes;

uses
  Vcl.Forms,
  FrmClientes in 'FrmClientes.pas' {FormClientes},
  DmClientes in 'DmClientes.pas' {DataModuleClientes: TDataModule},
  Classe_Cliente in 'Classe_Cliente.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDataModuleClientes, DataModuleClientes);
  Application.CreateForm(TFormClientes, FormClientes);
  Application.Run;
end.
