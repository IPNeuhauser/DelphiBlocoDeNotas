unit uSobre;

interface
uses
  System.Classes, Vcl.ActnList, Vcl.ComCtrls, Vcl.StdCtrls, System.SysUtils, Vcl.Dialogs;

Type
  TSobre = class
  public
    procedure BarraStatus(AChecked: TAction; ABar: TStatusBar);
    constructor Create();
    procedure AtualizarBarra(AOwner: TMemo; ABar: TStatusBar);
  end;

implementation

{ TSobre }

procedure TSobre.AtualizarBarra(AOwner: TMemo; ABar: TStatusBar);
var
I, TotalCaracteres: Integer;
begin
  TotalCaracteres := 0;
  for I := 0 to (AOwner.Lines.Count - 1) do
  begin
    TotalCaracteres := TotalCaracteres + Length(AOwner.Lines[I]);
  end;

  ABar.SimpleText := 'teste';
end;

procedure TSobre.BarraStatus(AChecked: TAction; ABar: TStatusBar);
begin
  ABar.Visible := not ABar.Visible;
  AChecked.Checked := not AChecked.Checked;
end;

constructor TSobre.Create;
begin

end;

end.
