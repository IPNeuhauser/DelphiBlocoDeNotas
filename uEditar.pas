unit uEditar;

interface
uses
  System.Classes, Vcl.Clipbrd, Vcl.StdCtrls, Vcl.Menus;

type
  TEditar = class
  public
    Procedure SelecionarTudo(AOwner: TMemo);
    procedure Colar(AOwner: TMemo);
    procedure Cortar(AOwner: TMemo);
    procedure Copiar(AOwner: TMemo);
    procedure Desfazer(AOwner: TMemo);
    procedure Deletar(AOwner: TMemo);
    function isEnable(): Boolean; overload;
    function isEnable(AOwner: TMemo): Boolean; overload;

end;

implementation

{ TEditor }


{ TEditor }

procedure TEditar.Colar(AOwner: TMemo);
begin
  AOwner.PasteFromClipboard;
end;

procedure TEditar.Copiar(AOwner: TMemo);
begin
  AOwner.CopyToClipboard;
end;

procedure TEditar.Cortar(AOwner: TMemo);
begin
  AOwner.CutToClipboard;
end;

procedure TEditar.Deletar(AOwner: TMemo);
begin
  AOwner.SetSelText('');
end;

procedure TEditar.Desfazer(AOwner: TMemo);
begin
  AOwner.Undo;
end;

function TEditar.isEnable(AOwner: TMemo): Boolean;
begin

  if AOwner.SelLength <> 0 then
  begin
    Result := True;
    exit;
  end;

  Result := False;

end;

function TEditar.isEnable(): boolean;
begin
  if clipboard.asText <> ''  then
  begin
    Result := True;
    exit;
  end;

  Result := False;
end;

procedure TEditar.SelecionarTudo(AOwner: TMemo);
begin
  AOwner.SelectAll;
end;


end.
