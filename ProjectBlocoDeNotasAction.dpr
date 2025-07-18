program ProjectBlocoDeNotasAction;

uses
  Vcl.Forms,
  BlocoDeNotasAction in 'BlocoDeNotasAction.pas' {frmBlocoDeNotas};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmBlocoDeNotas, frmBlocoDeNotas);
  Application.Run;
end.
