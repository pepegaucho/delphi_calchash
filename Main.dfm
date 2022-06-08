object frmMain: TfrmMain
  Left = 424
  Top = 217
  Caption = 'JCP HashFile MD5'
  ClientHeight = 278
  ClientWidth = 494
  Color = 16245202
  Ctl3D = False
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lblArchivo: TLabel
    Left = 3
    Top = 55
    Width = 53
    Height = 16
    Alignment = taRightJustify
    Caption = 'Archivo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblTitulo: TLabel
    Left = 4
    Top = 10
    Width = 305
    Height = 20
    Caption = 'Obtener C'#243'digo Hash MD5 de Archivo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBtnText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 13
    Top = 101
    Width = 43
    Height = 16
    Alignment = taRightJustify
    Caption = 'HASH'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label1: TLabel
    Left = 8
    Top = 252
    Width = 224
    Height = 16
    Caption = 'Jos'#233' C. Palumbo Software - Argentina'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object edArchivo: TEdit
    Left = 60
    Top = 51
    Width = 345
    Height = 22
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnChange = edArchivoChange
  end
  object edHash: TEdit
    Left = 60
    Top = 97
    Width = 345
    Height = 22
    Color = clRed
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
  end
  object btnExaminar: TButton
    Left = 411
    Top = 49
    Width = 72
    Height = 25
    Caption = 'Seleccionar...'
    TabOrder = 2
    OnClick = btnExaminarClick
  end
  object btnSalir: TButton
    Left = 418
    Top = 217
    Width = 70
    Height = 55
    Caption = 'Salir'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnClick = btnSalirClick
  end
  object btnObtener: TButton
    Left = 411
    Top = 96
    Width = 72
    Height = 25
    Caption = 'Obtener'
    TabOrder = 4
    OnClick = btnObtenerClick
  end
  object rgIdioma: TRadioGroup
    Left = 5
    Top = 205
    Width = 231
    Height = 44
    Caption = 'Idioma'
    Columns = 3
    ItemIndex = 0
    Items.Strings = (
      'Espa'#241'ol'
      'English'
      'Portugu'#234's')
    TabOrder = 5
    OnClick = rgIdiomaClick
  end
  object OpenDialog: TOpenDialog
    Left = 322
    Top = 143
  end
end
