unit uArquivo;

interface
uses
  Vcl.Dialogs, Vcl.StdCtrls, System.Classes;

type
 TArquivo = class
 private
  FNomeArquivo : string;
  function GetName: string;
  procedure SetName(const Value: string);
 public
  procedure SalvarArquivoComo(AOwner : TMemo);
  procedure SalvarArquivo(AOwner: TMemo; Title: string);
  function AbrirArquivo(AOwner: TMemo): TMemo;
  procedure NovoArquivo(AOwner : TMemo);

 published
  property NomeArquivo : string read GetName write SetName;
 end;

implementation

{ TArquivo }

procedure TArquivo.SalvarArquivo(AOwner: TMemo; Title: string);
begin
   if Title <> '' then
  Begin
   SalvarArquivoComo(AOwner);
  End Else
  Begin
    AOwner.Lines.SaveToFile(Title);
  End;
end;

procedure TArquivo.SalvarArquivoComo(AOwner: TMemo);
var
 SaveDialog : TSaveDialog;
begin
  SaveDialog := TSaveDialog.create(AOwner);
  try
    SaveDialog.Title := 'Salvar Arquivo';
    SaveDialog.Filter := 'Arquivo de Texto (*.txt)|*.txt|Todos os Arquivos (*.*)|*.*';;
    SaveDialog.DefaultExt := 'txt';

    if SaveDialog.Execute then
    Begin
      SetName(SaveDialog.FileName);
      Aowner.Lines.SaveToFile(NomeArquivo);
    End;
  finally
    SaveDialog.Free;
  end;
end;

procedure TArquivo.SetName(const Value: string);
begin
  FNomeArquivo := Value;
end;

{ TArquivo }

function TArquivo.AbrirArquivo(AOwner: TMemo): TMemo;
var
  OpenDialog : TOpenDialog;
begin
  OpenDialog.create(AOwner);
  Try
    OpenDialog.Title := 'Abrir Arquivo';
    OpenDialog.Filter := 'Arquivo de Texto (*.txt)|*.txt|Todos os Arquivos (*.*)|*.*';;
    OpenDialog.DefaultExt := 'txt';

    if  OpenDialog.Execute then
    Begin
      SetName(OpenDialog.FileName);
      AOwner.lines.LoadFromFile(OpenDialog.FileName);
    End;

  Finally
    Result := AOwner;
    OpenDialog.free;
  End;

end;

function TArquivo.GetName: string;
begin
  NomeArquivo := FNomeArquivo;
end;

procedure TArquivo.NovoArquivo(AOwner: TMemo);
begin
  SetName('');
  AOwner.Lines.Clear;
end;

end.
