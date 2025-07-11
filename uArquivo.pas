unit uArquivo;

interface
uses
  Vcl.Dialogs, Vcl.StdCtrls, System.Classes, System.SysUtils;

type
 TArquivo = class
 private
  FNomeArquivo : string;
  function GetNomeArquivo: string;
  procedure SetNomeArquivo(const Value: string);
 public
  constructor Create();
  destructor Free();
  procedure SalvarArquivoComo(AOwner : TMemo);
  procedure SalvarArquivo(AOwner: TMemo; Title: string);
  function AbrirArquivo(AOwner: TMemo): TMemo;
  procedure NovoArquivo(AOwner : TMemo);
 published
  property NomeArquivo: string read GetNomeArquivo write SetNomeArquivo;
 end;

 var
 FArquivo: TArquivo;

implementation

{ TArquivo }

procedure TArquivo.SalvarArquivo(AOwner: TMemo; Title: string);
begin
  if Title = 'Sem Título' then
  begin
    SalvarArquivoComo(AOwner);
  end Else
  begin
    AOwner.Lines.SaveToFile(Title);
  end;
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
      SetNomeArquivo(SaveDialog.FileName);
      Aowner.Lines.SaveToFile(SaveDialog.FileName);
    End;
  finally
    SaveDialog.Free;
  end;
end;

procedure TArquivo.SetNomeArquivo(const Value: string);
begin
  FNomeArquivo := Value;
end;

{ TArquivo }

function TArquivo.AbrirArquivo(AOwner: TMemo): TMemo;
var
  OpenDialog: TOpenDialog;
begin
  OpenDialog := TOpenDialog.create(AOwner);
  Try
    OpenDialog.Title := 'Abrir Arquivo';
    OpenDialog.Filter := 'Arquivo de Texto (*.txt)|*.txt|Todos os Arquivos (*.*)|*.*';;
    OpenDialog.DefaultExt := 'txt';

    if  OpenDialog.Execute then
    Begin
      SetNomeArquivo(OpenDialog.FileName);
      AOwner.lines.LoadFromFile(OpenDialog.FileName);
    End;

  Finally
    OpenDialog.free;
  End;
end;

constructor TArquivo.Create;
begin
  FNomeArquivo := 'Sem Título';
end;

destructor TArquivo.Free;
begin
  FNomeArquivo := '';
end;

function TArquivo.GetNomeArquivo: string;
begin
  Result := FNomeArquivo;
end;

procedure TArquivo.NovoArquivo(AOwner: TMemo);
begin
  AOwner.Lines.Clear;
end;

end.
