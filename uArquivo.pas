unit uArquivo;

interface
uses
  Vcl.Dialogs, Vcl.StdCtrls, System.Classes, System.SysUtils;

type
 TArquivo = class
 private
  FNomeArquivo : string;
  function GetNomeArquivo: string;
  procedure SetNomeArquivo(const AValue: string);
 public
  constructor Create();
  destructor Free();
  procedure SalvarArquivoComo(AOwner : TMemo);
  procedure SalvarArquivo(AOwner: TMemo; ATitle: string);
  procedure AbrirArquivo(AOwner: TMemo);
  procedure NovoArquivo(AOwner : TMemo);
 published
  property NomeArquivo: string read GetNomeArquivo write SetNomeArquivo;
 end;

 var
 FArquivo: TArquivo;

implementation

{ TArquivo }

procedure TArquivo.SalvarArquivo(AOwner: TMemo; ATitle: string);
begin
  if ATitle = 'Sem Título' then
  begin
    SalvarArquivoComo(AOwner);
  end Else
  begin
    AOwner.Lines.SaveToFile(ATitle);
  end;
end;

procedure TArquivo.SalvarArquivoComo(AOwner: TMemo);
var
 LSaveDialog : TSaveDialog;
begin
  LSaveDialog := TSaveDialog.create(AOwner);
  try
    LSaveDialog.Title := 'Salvar Arquivo';
    LSaveDialog.Filter := 'Arquivo de Texto (*.txt)|*.txt|Todos os Arquivos (*.*)|*.*';;
    LSaveDialog.DefaultExt := 'txt';

    if LSaveDialog.Execute then
    Begin
      SetNomeArquivo(LSaveDialog.FileName);
      Aowner.Lines.SaveToFile(LSaveDialog.FileName);
    End;
  finally
    LSaveDialog.Free;
  end;
end;

procedure TArquivo.SetNomeArquivo(const AValue: string);
begin
  FNomeArquivo := AValue;
end;

{ TArquivo }

procedure TArquivo.AbrirArquivo(AOwner: TMemo);
var
  LOpenDialog: TOpenDialog;
begin
  LOpenDialog := TOpenDialog.create(AOwner);
  Try
    LOpenDialog.Title := 'Abrir Arquivo';
    LOpenDialog.Filter := 'Arquivo de Texto (*.txt)|*.txt|Todos os Arquivos (*.*)|*.*';;
    LOpenDialog.DefaultExt := 'txt';

    if  LOpenDialog.Execute then
    Begin
      SetNomeArquivo(LOpenDialog.FileName);
      AOwner.lines.LoadFromFile(LOpenDialog.FileName);
    End;

  Finally
    LOpenDialog.free;
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
