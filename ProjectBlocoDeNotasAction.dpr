program ProjectBlocoDeNotasAction;

uses
  Vcl.Forms,
  BlocoDeNotasAction in 'BlocoDeNotasAction.pas' {BlocoDeNotas},
  uArquivo in 'uArquivo.pas',
  uEditor in 'uEditor.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TBlocoDeNotas, BlocoDeNotas);
  Application.Run;
end.
