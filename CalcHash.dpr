program CalcHash;

uses
  Forms,
  Main in 'Main.pas' {frmMain},
  Hashes in 'Hashes.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Calcular Hash de Archivo';
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
