unit uSobre;

interface
uses
  System.Classes, Vcl.ActnList, Vcl.ComCtrls;

Type
  TSobre = class
  public
    procedure BarraStatus(Checked: TAction; Bar: TStatusBar);
  end;

implementation

{ TSobre }

procedure TSobre.BarraStatus(Checked: TAction; Bar: TStatusBar);
begin
  Bar.Visible := not Bar.Visible;
  Checked.Checked := not Checked.Checked;
end;

end.
