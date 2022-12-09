unit Classe_Cliente;

interface

uses
  FireDAC.Comp.Client;

  {
    Id int NOT NULL AUTO_INCREMENT,
    Tipo char NOT NULL,
    Cpf_Cnpj varchar(20) NOT NULL,
    Rg_Ie varchar(20),
    Data date,
    Ativo char,
  }

type
  TCliente = Class
    private
      FConexao: TFdConnection;
      FIdCliente: integer;
      FNome: string;
      FTipo: char;
      FCpf_Cnpj: string;
      FRg_Ie: string;
      FData: TDate;
      FATivo: char;
    public
      property Conexao: TFdConnection read FConexao write FConexao;
      property Nome: string read FNome write FNome;
      property IdCliente: integer read  FIdCliente write FIdCliente;
      property Tipo: char read FTipo write FTipo;
      property Cpf_Cnpj: string read FCpf_Cnpj write FCpf_Cnpj;
      property Rg_Ie: string read FRg_Ie write FRg_Ie;
      property Data: TDate read FData write FData;
      property Ativo: char read FAtivo write FAtivo;

      constructor Create( Conexao: TFdConnection);
      destructor Destroy; Override;

      function  Consulta(Nome: string): TFDQuery;
      procedure Deleta(Id_Cliente: integer);

  End;

var
  QueryConsulta: TFDQuery;

implementation

{ TCliente }

function TCliente.Consulta(Nome: string): TFDQuery;
begin

  try

    FConexao.Connected := False;
    FConexao.Connected := True;

    QueryConsulta.Close;
    QueryConsulta.SQL.Clear;
    QueryConsulta.SQL.Add('SELECT Id, Tipo, Cpf_Cnpj, Rg_Ie, Data, Ativo FROM Clientes');
    QueryConsulta.SQL.Add('WHERE Nome LIKE :PNome');
    QueryConsulta.ParamByName('PNome').AsString := '%' + Nome + '%';
    QueryConsulta.Open;

  finally
    Result := QueryConsulta;
  end;

end;

constructor TCliente.Create(Conexao: TFdConnection);
begin
  FConexao := Conexao;

  QueryConsulta := TFDQuery.Create(nil);
  QueryConsulta.Connection := FConexao;

end;

procedure TCliente.Deleta(Id_Cliente: integer);
begin

  //if (MessageBox.) then
  FConexao.Connected := False;
  FConexao.Connected := True;

  FConexao.ExecSQL('DELETE FROM clientes WHERE Id = :Id', [Id_Cliente]);

end;

destructor TCliente.Destroy;
begin
  QueryConsulta.Free;
  inherited;
end;

end.
