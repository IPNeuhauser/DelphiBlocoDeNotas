program ProjectBlocoDeNotasAction;

uses
  Vcl.Forms,
  BlocoDeNotasAction in 'BlocoDeNotasAction.pas' {BlocoDeNotas};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TBlocoDeNotas, BlocoDeNotas);
  Application.Run;
end.
