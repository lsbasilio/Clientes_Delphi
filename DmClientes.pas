unit DmClientes;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TDataModuleClientes = class(TDataModule)
    FDConnectionClientes: TFDConnection;
    ClienteTable: TFDQuery;
    DataSourceCliente: TDataSource;
    DataSourceTelefone: TDataSource;
    TelefoneTable: TFDQuery;
    TelefoneTableId: TFDAutoIncField;
    TelefoneTableDdd: TIntegerField;
    TelefoneTableClienteId: TIntegerField;
    ClienteTableId: TFDAutoIncField;
    ClienteTableNome: TStringField;
    ClienteTableTipo: TStringField;
    ClienteTableCpf_Cnpj: TStringField;
    ClienteTableRg_Ie: TStringField;
    ClienteTableData: TDateField;
    ClienteTableAtivo: TStringField;
    TelefoneTableNumero: TStringField;
    EnderecoTable: TFDQuery;
    IntegerField2: TIntegerField;
    EnderecoTableId: TFDAutoIncField;
    EnderecoTablelogradouro: TStringField;
    EnderecoTablenumero: TIntegerField;
    EnderecoTablecep: TStringField;
    EnderecoTablebairro: TStringField;
    EnderecoTablecidade: TStringField;
    EnderecoTableestado: TStringField;
    EnderecoTablepais: TStringField;
    DataSourceEndereco: TDataSource;
    procedure ClienteTableAfterInsert(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure FiltrarCliente(Nome: String; Ativo: Boolean);
    function Cliente_Valido(out Mensagem: String):  Boolean;
    function Telefone_Valido(out Mensagem: String):  Boolean;
    function SomenteNumeros(Cpf_Cnpj: String): String;
    function MascaraCpfCnpj: String;
    function MascaraTelefone: String;
    function ClienteEmEdicao: boolean;
    function TelefoneEmEdicao: boolean;
    function EnderecoEmEdicao: boolean;
  end;

var
  DataModuleClientes: TDataModuleClientes;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

uses FrmClientes, MaskUtils;

{ TDataModuleClientes }

function TDataModuleClientes.ClienteEmEdicao: boolean;
begin
  Result := DataSourceCliente.State in [dsInsert, dsEdit]
end;

function TDataModuleClientes.TelefoneEmEdicao: boolean;
begin
  Result := DataSourceTelefone.State in [dsInsert, dsEdit]
end;

function TDataModuleClientes.EnderecoEmEdicao: boolean;
begin
  Result := DataSourceEndereco.State in [dsInsert, dsEdit]
end;

procedure TDataModuleClientes.ClienteTableAfterInsert(DataSet: TDataSet);
begin
  ClienteTable.FieldByName('Tipo').AsString := 'F';
  ClienteTable.FieldByName('Ativo').AsString := 'A';
  ClienteTable.FieldByName('Data').AsDateTime := Date;
end;

function TDataModuleClientes.Cliente_Valido(out Mensagem: String): Boolean;
begin
  Result := True;

  if (Trim(ClienteTable.FieldByName('Nome').AsString) = '') then
  begin
     Mensagem := 'Nome não informado!';
     Result := False;
     Exit;
  end;

  if (Trim(ClienteTable.FieldByName('Tipo').AsString) = '') then
  begin
     Mensagem := 'Tipo não informado!';
     Result := False;
     Exit;
  end;

  if (Trim(ClienteTable.FieldByName('Cpf_Cnpj').AsString) = '') then
  begin
     Mensagem := 'CPF ou CNPJ não informado!';
     Result := False;
     Exit;
  end;

end;

procedure TDataModuleClientes.FiltrarCliente(Nome: String; Ativo: Boolean);
var
  Clausula: string;
begin
  Clausula := ' WHERE ';

  ClienteTable.Close;
  ClienteTable.SQL.Clear;
  ClienteTable.SQL.Add('SELECT Id, Nome, Tipo, Cpf_Cnpj, Rg_Ie, Data, Ativo FROM clientes');

  if (Nome <> '') then
  begin
    ClienteTable.SQL.Add(' WHERE Nome LIKE ' + QuotedStr('%' + Nome + '%'));
    Clausula := ' AND ';
  end;

  if (Ativo) then
     ClienteTable.SQL.Add(Clausula + 'Ativo = ' + QuotedStr('A'));
//  else
//     ClienteTable.SQL.Add(Clausula + 'Ativo <> ' + QuotedStr('A'));

  ClienteTable.Open;

end;

function TDataModuleClientes.MascaraCpfCnpj: String;
begin
  if (ClienteTable.FieldByName('Tipo').AsString = 'F') then
    Result := '000\.000\.000\-00;0;'
  else
    Result := '00\.000\.000\/0000\-00;0;';
end;

function TDataModuleClientes.MascaraTelefone: String;
begin
   Result := '0000\-0000;0;_';
//  case (Length(TelefoneTable.FieldByName('Numero').AsString)) of
//    0..8:   Result := '0000\-0000;0;_';
//    9:      Result := '00000\-0000;0;_'
//  end;

end;

function TDataModuleClientes.SomenteNumeros(Cpf_Cnpj: String): String;
var
  i: integer;
begin
  Result := '';
  for i := 1 to Length(Cpf_Cnpj) do
  begin
    if (Cpf_Cnpj[i] in ['0'..'9']) then
        Result := Result + Cpf_Cnpj[i];
  end;
end;

function TDataModuleClientes.Telefone_Valido(out Mensagem: String): Boolean;
begin
  Result := True;

  if (Trim(TelefoneTable.FieldByName('Ddd').AsString) = '') then
  begin
     Mensagem := 'DDD não informado!';
     Result := False;
     Exit;
  end;

  if (Trim(TelefoneTable.FieldByName('Numero').AsString) = '') then
  begin
     Mensagem := 'Número não informado!';
     Result := False;
     Exit;
  end;
end;

end.
