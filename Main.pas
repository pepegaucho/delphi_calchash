unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

const
   C_IDIOMA     : array[0..2] of string = ('Idioma', 'Language', 'Linguagem');
   C_ARCHIVO    : array[0..2] of string = ('Archivo', 'File', 'Arquivo');
   C_EXAMINAR   : array[0..2] of string = ('Seleccionar', 'Select', 'Selecionar');
   C_OBTENER    : array[0..2] of string = ('Obtener', 'Get', 'Obter');
   C_SALIR      : array[0..2] of string = ('Salir', 'Exit', 'Ir');
   C_TITULO     : array[0..2] of string = ('Obtener Código "Hash MD5" de un Archivo', 'Get the Code "MD5 hash" of a File' ,'Obter o código "hash MD5" de um arquivo');
   C_TITOPENDLG : array[0..2] of string = ('Abrir', 'Open', 'Aberto');
type
  TfrmMain = class(TForm)
    lblArchivo: TLabel;
    lblTitulo: TLabel;
    edArchivo: TEdit;
    edHash: TEdit;
    Label3: TLabel;
    btnExaminar: TButton;
    btnSalir: TButton;
    OpenDialog: TOpenDialog;
    btnObtener: TButton;
    rgIdioma: TRadioGroup;
    Label1: TLabel;
    procedure btnSalirClick(Sender: TObject);
    procedure btnExaminarClick(Sender: TObject);
    procedure btnObtenerClick(Sender: TObject);
    procedure edArchivoChange(Sender: TObject);
    procedure rgIdiomaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

uses Hashes;

procedure TfrmMain.btnSalirClick(Sender: TObject);
begin
   Application.Terminate;
end;

procedure TfrmMain.btnExaminarClick(Sender: TObject);
begin
   if OpenDialog.Execute then begin
      edArchivo.Text := OpenDialog.FileName;
   end;
end;

procedure TfrmMain.btnObtenerClick(Sender: TObject);
begin
   edArchivo.Text := Trim(edArchivo.Text);
   if (edArchivo.Text > '') and (FileExists(edArchivo.Text)) then
      edHash.Text := UpperCase(CalcHash(edArchivo.Text, haMD5));
end;

procedure TfrmMain.edArchivoChange(Sender: TObject);
begin
   if edHash.Text > '' then
      edHash.Text := '';
end;

procedure TfrmMain.rgIdiomaClick(Sender: TObject);
begin
   lblTitulo.Caption   := C_TITULO[rgIdioma.ItemIndex];
   lblArchivo.Caption  := C_ARCHIVO[rgIdioma.ItemIndex];
   btnExaminar.Caption := C_EXAMINAR[rgIdioma.ItemIndex];
   btnObtener.Caption  := C_OBTENER[rgIdioma.ItemIndex];
   btnSalir.Caption    := C_SALIR[rgIdioma.ItemIndex];
   rgIdioma.Caption    := C_IDIOMA[rgIdioma.ItemIndex];
   OpenDialog.Title    := C_TITOPENDLG[rgIdioma.ItemIndex];
end;

end.
