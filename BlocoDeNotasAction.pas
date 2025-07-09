unit BlocoDeNotasAction;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdActns, Vcl.ActnList,
  System.Actions, Vcl.Menus, Vcl.ComCtrls, Vcl.Clipbrd, Vcl.StdCtrls, uArquivo, uEditar, uSobre;

type
  TBlocoDeNotas = class(TForm)
    MainMenu1: TMainMenu;
    ActionList1: TActionList;
    FecharArquivo: TFileExit;
    NovoArquivo: TAction;
    SalvarArquivo: TAction;
    VerBarraDeStatus: TAction;
    Arquivo1: TMenuItem;
    Arquivo2: TMenuItem;
    AbrirArquivo1: TMenuItem;
    AbrirArquivo2: TMenuItem;
    SalvarArquivoComo1: TMenuItem;
    SalvarArquivoComo2: TMenuItem;
    Editar: TMenuItem;
    mCopiar: TMenuItem;
    mColar: TMenuItem;
    mRecortar: TMenuItem;
    mDesfazer: TMenuItem;
    mDeletar: TMenuItem;
    Exibir1: TMenuItem;
    Exibir2: TMenuItem;
    CampoEscrever: TMemo;
    BarraDeStatus: TStatusBar;
    PopupMenu1: TPopupMenu;
    popCopiar: TMenuItem;
    popColar: TMenuItem;
    popRecortar: TMenuItem;
    AbrirArquivo: TAction;
    SalvarArquivoComo: TAction;
    Copiar: TAction;
    Colar: TAction;
    Recortar: TAction;
    Desfazer: TAction;
    Deletar: TAction;
    SelecionarTudo: TAction;
    mSelecionarTudo: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    Sobre1: TMenuItem;
    procedure CopiarExecute(Sender: TObject);
    procedure RecortarExecute(Sender: TObject);
    procedure SelecionarTudoExecute(Sender: TObject);
    procedure FecharArquivoHint(var HintStr: string; var CanShow: Boolean);
    procedure NovoArquivoExecute(Sender: TObject);
    procedure DesfazerExecute(Sender: TObject);
    procedure VerBarraDeStatusExecute(Sender: TObject);
    procedure ColarExecute(Sender: TObject);
    procedure PopupMenuPopup(Sender: TObject);
    procedure EditarClick(Sender: TObject);
    procedure mDeletarClick(Sender: TObject);
    procedure Sobre1Click(Sender: TObject);
    procedure SalvarArquivoComoExecute(Sender: TObject);
    procedure SalvarArquivoExecute(Sender: TObject);
    procedure AbrirArquivoExecute(Sender: TObject);
  private
    { Private declarations }
    FArquivo : TArquivo;
    FEditar : TEditar;

  public
    { Public declarations }
  end;

var
  BlocoDeNotas: TBlocoDeNotas;

implementation

{$R *.dfm}

procedure TBlocoDeNotas.SalvarArquivoComoExecute(Sender: TObject);
begin
  FArquivo.SalvarArquivoComo(CampoEscrever);
end;

procedure TBlocoDeNotas.SalvarArquivoExecute(Sender: TObject);
begin
  FArquivo.SalvarArquivo(CampoEscrever, FArquivo.NomeArquivo);
end;

procedure TBlocoDeNotas.SelecionarTudoExecute(Sender: TObject);
begin
  FEditar.SelecionarTudo(CampoEscrever);
end;

procedure TBlocoDeNotas.Sobre1Click(Sender: TObject);
begin
  ShowMessage('Desenvolvido por Igor Neuhauser');
end;

procedure TBlocoDeNotas.VerBarraDeStatusExecute(Sender: TObject);
var
FSobre : TSobre;
begin
  FSobre.BarraStatus(VerBarraDeStatus, BarraDeStatus);
end;

procedure TBlocoDeNotas.AbrirArquivoExecute(Sender: TObject);
begin
  FArquivo.AbrirArquivo(CampoEscrever);
end;

procedure TBlocoDeNotas.ColarExecute(Sender: TObject);
begin
  FEditar.Colar(CampoEscrever);
end;

procedure TBlocoDeNotas.CopiarExecute(Sender: TObject);
begin
  FEditar.Copiar(CampoEscrever);
end;

procedure TBlocoDeNotas.mDeletarClick(Sender: TObject);
begin
  FEditar.Deletar(CampoEscrever);
end;

procedure TBlocoDeNotas.DesfazerExecute(Sender: TObject);
begin
  FEditar.Desfazer(CampoEscrever);
end;

procedure TBlocoDeNotas.EditarClick(Sender: TObject);
begin
  Copiar.Enabled := FEditar.isEnable(CampoEscrever);
  Recortar.Enabled := CampoEscrever.SelLength <> 0;
  Colar.Enabled := FEditar.isEnable();
  SelecionarTudo.Enabled := CampoEscrever.SelLength <> Length(CampoEscrever.Lines.Text);
  Desfazer.Enabled := CampoEscrever.CanUndo;
  Deletar.Enabled := True;
end;

procedure TBlocoDeNotas.FecharArquivoHint(var HintStr: string;
  var CanShow: Boolean);
begin
  FArquivo.Free;
  Application.Terminate;
end;

procedure TBlocoDeNotas.NovoArquivoExecute(Sender: TObject);
begin
  FArquivo.NovoArquivo(CampoEscrever);
end;

procedure TBlocoDeNotas.PopupMenuPopup(Sender: TObject);
begin
  popCopiar.Enabled := CampoEscrever.SelLength <> 0;
  popColar.Enabled := Clipboard.AsText <> '';
  popRecortar.Enabled := CampoEscrever.SelLength <> 0;
end;

procedure TBlocoDeNotas.RecortarExecute(Sender: TObject);
begin
  FEditar.Cortar(CampoEscrever);
end;

end.
