unit FrmClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls,
  Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids;

type
  TFormClientes = class(TForm)
    PanelFiltro: TPanel;
    PanelCampos: TPanel;
    LabelCodigo: TLabel;
    DBEditId: TDBEdit;
    LabelNome: TLabel;
    DBEditNome: TDBEdit;
    LabelCpfCnpj: TLabel;
    DBRadioGroupTipoCliente: TDBRadioGroup;
    LabelRgIe: TLabel;
    DBEditRgIe: TDBEdit;
    LabelDataCadastro: TLabel;
    DBEditDataCadastro: TDBEdit;
    DBCheckBoxAtivo: TDBCheckBox;
    DBEditCpfCnpj: TDBEdit;
    PanelBotoes: TPanel;
    ButtonNovo: TButton;
    ButtonSalvar: TButton;
    ButtonAlterar: TButton;
    ButtonCancelar: TButton;
    ButtonExcluir: TButton;
    EditNomeCliente: TEdit;
    LabelNomeCliente: TLabel;
    CheckBoxAtivo: TCheckBox;
    ButtonFiltrar: TButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    ButtonNovoTelefone: TButton;
    DBEditCodigoTelefone: TDBEdit;
    DBEditDDD: TDBEdit;
    DBEditNumero: TDBEdit;
    ButtonSalvarTelefone: TButton;
    DBEditCodigoCliente: TDBEdit;
    ButtonAlterarTelefone: TButton;
    ButtonCancelarTelefone: TButton;
    ButtonExcluirTelefone: TButton;
    DBGridTelefones: TDBGrid;
    DBNavigator1: TDBNavigator;
    procedure ButtonNovoClick(Sender: TObject);
    procedure ButtonSalvarClick(Sender: TObject);
    procedure ButtonNovoTelefoneClick(Sender: TObject);
    procedure ButtonSalvarTelefoneClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ButtonAlterarClick(Sender: TObject);
    procedure ButtonExcluirClick(Sender: TObject);
    procedure ButtonCancelarClick(Sender: TObject);
    procedure DBRadioGroupTipoClienteChange(Sender: TObject);
    procedure DBEditCpfCnpjEnter(Sender: TObject);
    procedure DBEditCpfCnpjChange(Sender: TObject);
    procedure ButtonFiltrarClick(Sender: TObject);
    procedure ButtonAlterarTelefoneClick(Sender: TObject);
    procedure ButtonCancelarTelefoneClick(Sender: TObject);
    procedure ButtonExcluirTelefoneClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormClientes: TFormClientes;

implementation

{$R *.dfm}

uses DmClientes;

procedure TFormClientes.ButtonNovoTelefoneClick(Sender: TObject);
begin
  if (DmClientes.DataModuleClientes.ClienteTable.FieldByName('Id').AsInteger <= 0) then
      ShowMessage('Nenhum Cliente selecionado ou Cliente não salvo!')
  else
    if (DmClientes.DataModuleClientes.DataSourceTelefone.State in [dsInsert, dsEdit]) then
        ShowMessage('Telefone sendo cadastrado ou editado!')
    else
        DmClientes.DataModuleClientes.TelefoneTable.Append;
end;

procedure TFormClientes.ButtonSalvarTelefoneClick(Sender: TObject);
var
  Mensagem: String;
begin
  if not (DmClientes.DataModuleClientes.DataSourceTelefone.State in [dsInsert, dsEdit]) then
     ShowMessage('Telefone não está sendo cadastrado ou editado!')
  else
  begin
     if not (DmClientes.DataModuleClientes.Telefone_Valido(Mensagem)) then
        ShowMessage(Mensagem)
     else
        DmClientes.DataModuleClientes.TelefoneTable.Post;
  end;
end;

procedure TFormClientes.ButtonAlterarClick(Sender: TObject);
begin
  if (DmClientes.DataModuleClientes.DataSourceCliente.State in [dsInsert, dsEdit]) or
     (DmClientes.DataModuleClientes.ClienteTable.IsEmpty) then
    ShowMessage('Nenhum Cliente selecionado ou Cliente sendo cadastrado/editado!')
  else
    DmClientes.DataModuleClientes.ClienteTable.Edit;
end;

procedure TFormClientes.ButtonCancelarClick(Sender: TObject);
begin
  if (DmClientes.DataModuleClientes.DataSourceCliente.State in [dsInsert, dsEdit]) then
      DmClientes.DataModuleClientes.ClienteTable.Cancel
  else
      ShowMessage('Não foi possível cancelar, Cliente não está sendo cadastrado ou alterado!');
end;

procedure TFormClientes.ButtonCancelarTelefoneClick(Sender: TObject);
begin
  if (DmClientes.DataModuleClientes.DataSourceTelefone.State in [dsInsert, dsEdit]) then
      DmClientes.DataModuleClientes.TelefoneTable.Cancel
  else
      ShowMessage('Não foi possível cancelar, Telefone não está sendo cadastrado ou alterado!');
end;

procedure TFormClientes.ButtonAlterarTelefoneClick(Sender: TObject);
begin
    if (DmClientes.DataModuleClientes.DataSourceTelefone.State in [dsInsert, dsEdit]) or
     (DmClientes.DataModuleClientes.TelefoneTable.IsEmpty) then
        ShowMessage('Nenhum Telefone selecionado ou Telefone sendo cadastrado/editado!')
    else
        DmClientes.DataModuleClientes.TelefoneTable.Edit;
end;

procedure TFormClientes.ButtonExcluirClick(Sender: TObject);
begin
  if (DmClientes.DataModuleClientes.DataSourceCliente.State in [dsInsert, dsEdit]) or
     (DmClientes.DataModuleClientes.ClienteTable.IsEmpty) then
    ShowMessage('Nenhum Cliente selecionado ou Cliente sendo cadastrado/editado!')
  else
    DmClientes.DataModuleClientes.ClienteTable.Delete;
end;

procedure TFormClientes.ButtonExcluirTelefoneClick(Sender: TObject);
begin
  if (DmClientes.DataModuleClientes.DataSourceTelefone.State in [dsInsert, dsEdit]) or
     (DmClientes.DataModuleClientes.TelefoneTable.IsEmpty) then
    ShowMessage('Nenhum Telefone selecionado ou Telefone sendo cadastrado/editado!')
  else
    DmClientes.DataModuleClientes.TelefoneTable.Delete;
end;

procedure TFormClientes.ButtonFiltrarClick(Sender: TObject);
begin
  DmClientes.DataModuleClientes.FiltrarCliente(Trim(EditNomeCliente.Text), CheckBoxAtivo.Checked);
end;

procedure TFormClientes.ButtonNovoClick(Sender: TObject);
begin
  if (DmClientes.DataModuleClientes.DataSourceCliente.State in [dsInsert, dsEdit]) then
     ShowMessage('Cliente sendo cadastrado ou editado!')
  else
  begin
     DBEditNome.SetFocus;
     DmClientes.DataModuleClientes.ClienteTable.Append;
  end;
end;

procedure TFormClientes.ButtonSalvarClick(Sender: TObject);
var
  Mensagem: String;
begin
  if not (DmClientes.DataModuleClientes.DataSourceCliente.State in [dsInsert, dsEdit]) then
     ShowMessage('Cliente não está sendo cadastrado ou editado!')
  else
  begin
     if not (DmClientes.DataModuleClientes.Cliente_Valido(Mensagem)) then
          ShowMessage(Mensagem)
     else
          DmClientes.DataModuleClientes.ClienteTable.Post;
  end;
end;

procedure TFormClientes.DBEditCpfCnpjChange(Sender: TObject);
begin
  if (Trim(DmClientes.DataModuleClientes.ClienteTable.FieldByName('Cpf_Cnpj').AsString) <> '') then  
    DmClientes.DataModuleClientes.ClienteTable.FieldByName('Cpf_Cnpj').EditMask := DmClientes.DataModuleClientes.MascaraCpfCnpj;
end;

procedure TFormClientes.DBEditCpfCnpjEnter(Sender: TObject);
begin
  DmClientes.DataModuleClientes.ClienteTable.FieldByName('Cpf_Cnpj').EditMask := DmClientes.DataModuleClientes.MascaraCpfCnpj;
end;

procedure TFormClientes.DBRadioGroupTipoClienteChange(Sender: TObject);
begin
  if (DBRadioGroupTipoCliente.ItemIndex = 0) then
  begin
      LabelCpfCnpj.Caption := 'CPF';
      LabelRgIe.Caption := 'RG';
  end
  else
  begin
      LabelCpfCnpj.Caption := 'CNPJ';
      LabelRgIe.Caption := 'IE';
  end;

  if (DmClientes.DataModuleClientes.DataSourceCliente.State in [dsInsert, dsEdit]) then
    DmClientes.DataModuleClientes.ClienteTable.FieldByName('Cpf_Cnpj').AsString := '';
end;

procedure TFormClientes.FormCreate(Sender: TObject);
begin
  DmClientes.DataModuleClientes.ClienteTable.Open;
  DmClientes.DataModuleClientes.TelefoneTable.Open;
end;

end.
