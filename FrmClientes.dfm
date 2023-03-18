object FormClientes: TFormClientes
  Left = 0
  Top = 0
  Caption = 'Cadastro de Clientes'
  ClientHeight = 581
  ClientWidth = 818
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PanelCampos: TPanel
    Left = 0
    Top = 65
    Width = 818
    Height = 516
    Align = alClient
    Color = clBtnHighlight
    ParentBackground = False
    TabOrder = 1
    object LabelCodigo: TLabel
      Left = 45
      Top = 91
      Width = 94
      Height = 13
      Caption = 'C'#243'digo do Cliente'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LabelNome: TLabel
      Left = 197
      Top = 91
      Width = 32
      Height = 13
      Caption = 'Nome'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LabelCpfCnpj: TLabel
      Left = 637
      Top = 91
      Width = 20
      Height = 13
      Caption = 'CPF'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LabelRgIe: TLabel
      Left = 45
      Top = 145
      Width = 15
      Height = 13
      Caption = 'RG'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LabelDataCadastro: TLabel
      Left = 197
      Top = 145
      Width = 89
      Height = 13
      Caption = 'Data de Cadastro'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBEditId: TDBEdit
      Left = 45
      Top = 108
      Width = 121
      Height = 21
      Color = clInfoBk
      DataField = 'Id'
      DataSource = DataModuleClientes.DataSourceCliente
      ReadOnly = True
      TabOrder = 0
    end
    object DBEditNome: TDBEdit
      Left = 197
      Top = 108
      Width = 180
      Height = 21
      DataField = 'Nome'
      DataSource = DataModuleClientes.DataSourceCliente
      TabOrder = 1
    end
    object DBRadioGroupTipoCliente: TDBRadioGroup
      Left = 397
      Top = 89
      Width = 215
      Height = 51
      Caption = 'Tipo do Cliente'
      Columns = 2
      DataField = 'Tipo'
      DataSource = DataModuleClientes.DataSourceCliente
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      Items.Strings = (
        'Pessoa F'#237'sica'
        'Pessoa Jur'#237'dica')
      ParentFont = False
      TabOrder = 2
      Values.Strings = (
        'F'
        'J')
      OnChange = DBRadioGroupTipoClienteChange
    end
    object DBEditRgIe: TDBEdit
      Left = 45
      Top = 164
      Width = 121
      Height = 21
      DataField = 'Rg_Ie'
      DataSource = DataModuleClientes.DataSourceCliente
      TabOrder = 4
    end
    object DBEditDataCadastro: TDBEdit
      Left = 197
      Top = 164
      Width = 121
      Height = 21
      DataField = 'Data'
      DataSource = DataModuleClientes.DataSourceCliente
      TabOrder = 6
    end
    object DBCheckBoxAtivo: TDBCheckBox
      Left = 397
      Top = 166
      Width = 59
      Height = 17
      Caption = '  Ativo'
      DataField = 'Ativo'
      DataSource = DataModuleClientes.DataSourceCliente
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      ValueChecked = 'A'
      ValueUnchecked = ''
    end
    object DBEditCpfCnpj: TDBEdit
      Left = 637
      Top = 108
      Width = 121
      Height = 21
      DataField = 'Cpf_Cnpj'
      DataSource = DataModuleClientes.DataSourceCliente
      TabOrder = 3
      OnChange = DBEditCpfCnpjChange
      OnEnter = DBEditCpfCnpjEnter
    end
    object PanelBotoes: TPanel
      Left = 1
      Top = 1
      Width = 816
      Height = 73
      Align = alTop
      TabOrder = 7
      object ButtonNovo: TButton
        Left = 70
        Top = 13
        Width = 102
        Height = 49
        Caption = 'Novo'
        TabOrder = 0
        OnClick = ButtonNovoClick
      end
      object ButtonSalvar: TButton
        Left = 190
        Top = 13
        Width = 102
        Height = 49
        Caption = 'Salvar'
        TabOrder = 1
        OnClick = ButtonSalvarClick
      end
      object ButtonAlterar: TButton
        Left = 310
        Top = 13
        Width = 102
        Height = 49
        Caption = 'Alterar'
        TabOrder = 2
        OnClick = ButtonAlterarClick
      end
      object ButtonCancelar: TButton
        Left = 430
        Top = 13
        Width = 102
        Height = 49
        Caption = 'Cancelar'
        TabOrder = 3
        OnClick = ButtonCancelarClick
      end
      object ButtonExcluir: TButton
        Left = 553
        Top = 13
        Width = 102
        Height = 49
        Caption = 'Excluir'
        TabOrder = 4
        OnClick = ButtonExcluirClick
      end
    end
    object PageControlDadosCliente: TPageControl
      Left = 1
      Top = 216
      Width = 816
      Height = 299
      ActivePage = TabSheetEndereco
      Align = alBottom
      TabOrder = 8
      object TabSheetTelefone: TTabSheet
        Caption = 'Telefones'
        object Label4: TLabel
          Left = 34
          Top = 72
          Width = 102
          Height = 13
          Caption = 'C'#243'digo do Telefone'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label5: TLabel
          Left = 326
          Top = 72
          Width = 24
          Height = 13
          Caption = 'DDD'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label6: TLabel
          Left = 461
          Top = 72
          Width = 43
          Height = 13
          Caption = 'N'#250'mero'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label7: TLabel
          Left = 179
          Top = 72
          Width = 94
          Height = 13
          Caption = 'C'#243'digo do Cliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object ButtonNovoTelefone: TButton
          Left = 34
          Top = 17
          Width = 102
          Height = 36
          Caption = 'Novo'
          TabOrder = 0
          OnClick = ButtonNovoTelefoneClick
        end
        object DBEditCodigoTelefone: TDBEdit
          Left = 33
          Top = 91
          Width = 121
          Height = 21
          Color = clInfoBk
          DataField = 'Id'
          DataSource = DataModuleClientes.DataSourceTelefone
          ReadOnly = True
          TabOrder = 1
        end
        object DBEditDDD: TDBEdit
          Left = 325
          Top = 91
          Width = 121
          Height = 21
          DataField = 'Ddd'
          DataSource = DataModuleClientes.DataSourceTelefone
          TabOrder = 2
        end
        object DBEditNumero: TDBEdit
          Left = 460
          Top = 91
          Width = 121
          Height = 21
          DataField = 'Numero'
          DataSource = DataModuleClientes.DataSourceTelefone
          TabOrder = 3
          OnChange = DBEditNumeroChange
          OnEnter = DBEditNumeroEnter
          OnKeyUp = DBEditNumeroKeyUp
        end
        object ButtonSalvarTelefone: TButton
          Left = 154
          Top = 17
          Width = 102
          Height = 36
          Caption = 'Salvar'
          TabOrder = 4
          OnClick = ButtonSalvarTelefoneClick
        end
        object DBEditCodigoCliente: TDBEdit
          Left = 179
          Top = 91
          Width = 121
          Height = 21
          Color = clInfoBk
          DataField = 'ClienteId'
          DataSource = DataModuleClientes.DataSourceTelefone
          ReadOnly = True
          TabOrder = 5
        end
        object ButtonAlterarTelefone: TButton
          Left = 274
          Top = 17
          Width = 102
          Height = 36
          Caption = 'Alterar'
          TabOrder = 6
          OnClick = ButtonAlterarTelefoneClick
        end
        object ButtonCancelarTelefone: TButton
          Left = 394
          Top = 17
          Width = 102
          Height = 36
          Caption = 'Cancelar'
          TabOrder = 7
          OnClick = ButtonCancelarTelefoneClick
        end
        object ButtonExcluirTelefone: TButton
          Left = 517
          Top = 17
          Width = 102
          Height = 36
          Caption = 'Excluir'
          TabOrder = 8
          OnClick = ButtonExcluirTelefoneClick
        end
        object DBGridTelefones: TDBGrid
          Left = 0
          Top = 156
          Width = 808
          Height = 115
          Align = alBottom
          DataSource = DataModuleClientes.DataSourceTelefone
          ReadOnly = True
          TabOrder = 9
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Segoe UI'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'ClienteId'
              Title.Caption = 'Cliente'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Segoe UI'
              Title.Font.Style = [fsBold]
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Ddd'
              Title.Caption = 'DDD'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Segoe UI'
              Title.Font.Style = [fsBold]
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Numero'
              Title.Caption = 'N'#250'mero'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Segoe UI'
              Title.Font.Style = [fsBold]
              Width = 169
              Visible = True
            end>
        end
      end
      object TabSheetEndereco: TTabSheet
        Caption = 'Endere'#231'os'
        ImageIndex = 1
        object Label1: TLabel
          Left = 42
          Top = 80
          Width = 106
          Height = 13
          Caption = 'C'#243'digo do Endere'#231'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label2: TLabel
          Left = 187
          Top = 80
          Width = 94
          Height = 13
          Caption = 'C'#243'digo do Cliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label3: TLabel
          Left = 334
          Top = 80
          Width = 62
          Height = 13
          Caption = 'Logradouro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label8: TLabel
          Left = 469
          Top = 80
          Width = 43
          Height = 13
          Caption = 'N'#250'mero'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label9: TLabel
          Left = 550
          Top = 80
          Width = 20
          Height = 13
          Caption = 'CEP'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label10: TLabel
          Left = 638
          Top = 80
          Width = 31
          Height = 13
          Caption = 'Bairro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label11: TLabel
          Left = 43
          Top = 131
          Width = 36
          Height = 13
          Caption = 'CIdade'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label12: TLabel
          Left = 187
          Top = 131
          Width = 35
          Height = 13
          Caption = 'Estado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label13: TLabel
          Left = 331
          Top = 131
          Width = 21
          Height = 13
          Caption = 'Pa'#237's'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object ButtonNovoEndereco: TButton
          Left = 42
          Top = 25
          Width = 102
          Height = 36
          Caption = 'Novo'
          TabOrder = 0
          OnClick = ButtonNovoEnderecoClick
        end
        object ButtonSalvarEndereco: TButton
          Left = 162
          Top = 25
          Width = 102
          Height = 36
          Caption = 'Salvar'
          TabOrder = 1
          OnClick = ButtonSalvarEnderecoClick
        end
        object ButtonAlterarEndereco: TButton
          Left = 282
          Top = 25
          Width = 102
          Height = 36
          Caption = 'Alterar'
          TabOrder = 2
          OnClick = ButtonAlterarEnderecoClick
        end
        object ButtonCancelarEndereco: TButton
          Left = 402
          Top = 25
          Width = 102
          Height = 36
          Caption = 'Cancelar'
          TabOrder = 3
          OnClick = ButtonCancelarEnderecoClick
        end
        object ButtonExcluirEndereco: TButton
          Left = 525
          Top = 25
          Width = 102
          Height = 36
          Caption = 'Excluir'
          TabOrder = 4
          OnClick = ButtonExcluirEnderecoClick
        end
        object DBEditCodigoEndereco: TDBEdit
          Left = 41
          Top = 99
          Width = 121
          Height = 21
          Color = clInfoBk
          DataField = 'Id'
          DataSource = DataModuleClientes.DataSourceEndereco
          ReadOnly = True
          TabOrder = 5
        end
        object DBEditCodigoEnderecoCliente: TDBEdit
          Left = 187
          Top = 99
          Width = 121
          Height = 21
          Color = clInfoBk
          DataField = 'ClienteId'
          DataSource = DataModuleClientes.DataSourceEndereco
          ReadOnly = True
          TabOrder = 6
        end
        object DBEditLogradouro: TDBEdit
          Left = 333
          Top = 99
          Width = 121
          Height = 21
          DataField = 'logradouro'
          DataSource = DataModuleClientes.DataSourceEndereco
          TabOrder = 7
        end
        object DBEditEnderecoNumero: TDBEdit
          Left = 468
          Top = 99
          Width = 60
          Height = 21
          DataField = 'Numero'
          DataSource = DataModuleClientes.DataSourceEndereco
          TabOrder = 8
        end
        object DBEditCep: TDBEdit
          Left = 549
          Top = 99
          Width = 68
          Height = 21
          DataField = 'cep'
          DataSource = DataModuleClientes.DataSourceEndereco
          TabOrder = 9
          OnKeyUp = DBEditNumeroKeyUp
        end
        object DBEditBairro: TDBEdit
          Left = 637
          Top = 99
          Width = 116
          Height = 21
          DataField = 'bairro'
          DataSource = DataModuleClientes.DataSourceEndereco
          TabOrder = 10
        end
        object DBEditCidade: TDBEdit
          Left = 42
          Top = 150
          Width = 116
          Height = 21
          DataField = 'cidade'
          DataSource = DataModuleClientes.DataSourceEndereco
          TabOrder = 11
          OnKeyUp = DBEditNumeroKeyUp
        end
        object DBEditEstado: TDBEdit
          Left = 186
          Top = 150
          Width = 122
          Height = 21
          DataField = 'estado'
          DataSource = DataModuleClientes.DataSourceEndereco
          TabOrder = 12
        end
        object DBEditPais: TDBEdit
          Left = 331
          Top = 150
          Width = 124
          Height = 21
          DataField = 'pais'
          DataSource = DataModuleClientes.DataSourceEndereco
          TabOrder = 13
          OnKeyUp = DBEditNumeroKeyUp
        end
        object DBGridEnderecos: TDBGrid
          Left = 0
          Top = 180
          Width = 808
          Height = 91
          Align = alBottom
          DataSource = DataModuleClientes.DataSourceEndereco
          ReadOnly = True
          TabOrder = 14
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Segoe UI'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'ClienteId'
              Title.Caption = 'Cliente'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Segoe UI'
              Title.Font.Style = [fsBold]
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'logradouro'
              Title.Caption = 'Logradouro'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Segoe UI'
              Title.Font.Style = [fsBold]
              Width = 222
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'numero'
              Title.Caption = 'N'#250'mero'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Segoe UI'
              Title.Font.Style = [fsBold]
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'cep'
              Title.Caption = 'CEP'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Segoe UI'
              Title.Font.Style = [fsBold]
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'bairro'
              Title.Caption = 'Bairro'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Segoe UI'
              Title.Font.Style = [fsBold]
              Width = 169
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'cidade'
              Title.Caption = 'Cidade'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Segoe UI'
              Title.Font.Style = [fsBold]
              Width = 147
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'estado'
              Title.Caption = 'Estado'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Segoe UI'
              Title.Font.Style = [fsBold]
              Width = 120
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'pais'
              Title.Caption = 'Pa'#237's'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Segoe UI'
              Title.Font.Style = [fsBold]
              Width = 129
              Visible = True
            end>
        end
      end
    end
  end
  object PanelFiltro: TPanel
    Left = 0
    Top = 0
    Width = 818
    Height = 65
    Align = alTop
    BevelInner = bvLowered
    Color = clBtnHighlight
    ParentBackground = False
    TabOrder = 0
    object LabelNomeCliente: TLabel
      Left = 34
      Top = 27
      Width = 88
      Height = 13
      Caption = 'Nome do Cliente'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object EditNomeCliente: TEdit
      Left = 139
      Top = 24
      Width = 217
      Height = 21
      TabOrder = 0
    end
    object CheckBoxAtivo: TCheckBox
      Left = 399
      Top = 26
      Width = 69
      Height = 17
      Caption = '   Ativo'
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      State = cbChecked
      TabOrder = 1
    end
    object ButtonFiltrar: TButton
      Left = 485
      Top = 16
      Width = 66
      Height = 36
      Caption = 'Filtrar'
      TabOrder = 2
      OnClick = ButtonFiltrarClick
    end
    object DBNavigator1: TDBNavigator
      Left = 576
      Top = 13
      Width = 224
      Height = 39
      DataSource = DataModuleClientes.DataSourceCliente
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      TabOrder = 3
    end
  end
end
