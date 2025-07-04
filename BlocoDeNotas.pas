unit BlocoDeNotas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Menus;

type
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    Arquivo1: TMenuItem;
    Arquivo2: TMenuItem;
    SalvarArquivo1: TMenuItem;
    SalvarArquivo2: TMenuItem;
    Sair1: TMenuItem;
    Ajuda1: TMenuItem;
    Ajuda2: TMenuItem;
    SaveDialog1: TSaveDialog;
    OpenDialog1: TOpenDialog;
    Salvar1: TMenuItem;
    CampoPreencher: TMemo;
    procedure Ajuda2Click(Sender: TObject);
    procedure SalvarArquivo2Click(Sender: TObject);
    procedure SalvarArquivo1Click(Sender: TObject);
    procedure Arquivo2Click(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure Salvar1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Ajuda2Click(Sender: TObject);
begin

  ShowMessage('Desenvolvido por Igor Neuhause');

end;

procedure TForm1.Arquivo2Click(Sender: TObject);
begin

  if OpenDialog1.Execute then
  begin
    CampoPreencher.lines.LoadFromFile(OpenDialog1.FileName);
  end;

end;

procedure TForm1.Sair1Click(Sender: TObject);
begin

  Application.Terminate;

end;

procedure TForm1.Salvar1Click(Sender: TObject);
begin

{Condição para garantir que o usuário salve e renomeie o arquivo uma primeira vez}

  if SaveDialog1.filename = 'Sem Titulo.txt' then
    begin
      if SaveDialog1.execute then
        CampoPreencher.lines.SaveToFile(SaveDialog1.FileName);
    end
  else
    CampoPreencher.Lines.SaveToFile(SaveDialog1.FileName);


end;

procedure TForm1.SalvarArquivo1Click(Sender: TObject);
begin

{ Removi o "Begin" e "End" para verificar como funciona o if com só uma linha de código }

  if SaveDialog1.Execute then CampoPreencher.lines.SaveToFile(SaveDialog1.FileName);

end;

procedure TForm1.SalvarArquivo2Click(Sender: TObject);
begin

  CampoPreencher.Lines.Clear;

end;

end.
