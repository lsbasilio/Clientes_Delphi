object DataModuleClientes: TDataModuleClientes
  OldCreateOrder = False
  Height = 188
  Width = 519
  object FDConnectionClientes: TFDConnection
    Params.Strings = (
      'Database=cadastro_clientes'
      'User_Name=developer'
      'Password=KGZlb4590'
      'Server=127.0.0.1'
      'DriverID=MySQL')
    Connected = True
    Left = 80
    Top = 24
  end
  object ClienteTable: TFDQuery
    AfterInsert = ClienteTableAfterInsert
    Connection = FDConnectionClientes
    SQL.Strings = (
      'SELECT * FROM clientes')
    Left = 183
    Top = 24
    object ClienteTableId: TFDAutoIncField
      FieldName = 'Id'
      Origin = 'Id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object ClienteTableNome: TStringField
      FieldName = 'Nome'
      Origin = 'Nome'
      Required = True
      Size = 60
    end
    object ClienteTableTipo: TStringField
      FieldName = 'Tipo'
      Origin = 'Tipo'
      Required = True
      FixedChar = True
      Size = 1
    end
    object ClienteTableCpf_Cnpj: TStringField
      FieldName = 'Cpf_Cnpj'
      Origin = 'Cpf_Cnpj'
      Required = True
      Size = 30
    end
    object ClienteTableRg_Ie: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'Rg_Ie'
      Origin = 'Rg_Ie'
    end
    object ClienteTableData: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'Data'
      Origin = '`Data`'
    end
    object ClienteTableAtivo: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'Ativo'
      Origin = 'Ativo'
      FixedChar = True
      Size = 1
    end
  end
  object DataSourceCliente: TDataSource
    AutoEdit = False
    DataSet = ClienteTable
    Left = 183
    Top = 96
  end
  object DataSourceTelefone: TDataSource
    AutoEdit = False
    DataSet = TelefoneTable
    Left = 295
    Top = 96
  end
  object TelefoneTable: TFDQuery
    IndexFieldNames = 'ClienteId'
    MasterSource = DataSourceCliente
    MasterFields = 'Id'
    DetailFields = 'ClienteId'
    Connection = FDConnectionClientes
    SQL.Strings = (
      'SELECT * FROM telefones WHERE ClienteId = :Id')
    Left = 295
    Top = 24
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object TelefoneTableId: TFDAutoIncField
      FieldName = 'Id'
      ReadOnly = True
    end
    object TelefoneTableDdd: TIntegerField
      FieldName = 'Ddd'
      Required = True
    end
    object TelefoneTableNumero: TStringField
      FieldName = 'Numero'
      Origin = 'Numero'
      Required = True
      Size = 15
    end
    object TelefoneTableClienteId: TIntegerField
      FieldName = 'ClienteId'
    end
  end
  object EnderecoTable: TFDQuery
    IndexFieldNames = 'ClienteId'
    MasterSource = DataSourceCliente
    MasterFields = 'Id'
    DetailFields = 'ClienteId'
    Connection = FDConnectionClientes
    SQL.Strings = (
      'SELECT * FROM enderecos WHERE ClienteId = :Id')
    Left = 403
    Top = 24
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object EnderecoTableId: TFDAutoIncField
      FieldName = 'Id'
      Origin = 'Id'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object EnderecoTablelogradouro: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'logradouro'
      Origin = 'logradouro'
      Size = 60
    end
    object EnderecoTablenumero: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'numero'
      Origin = 'numero'
    end
    object EnderecoTablecep: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cep'
      Origin = 'cep'
      Size = 15
    end
    object EnderecoTablebairro: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'bairro'
      Origin = 'bairro'
      Size = 30
    end
    object EnderecoTablecidade: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cidade'
      Origin = 'cidade'
      Size = 30
    end
    object EnderecoTableestado: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'estado'
      Origin = 'estado'
      Size = 30
    end
    object EnderecoTablepais: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'pais'
      Origin = 'pais'
      Size = 30
    end
    object IntegerField2: TIntegerField
      FieldName = 'ClienteId'
    end
  end
  object DataSourceEndereco: TDataSource
    AutoEdit = False
    DataSet = EnderecoTable
    Left = 407
    Top = 96
  end
end
