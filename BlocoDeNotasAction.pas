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
    procedure CampoEscreverChange(Sender: TObject);
  private
    { Private declarations }
    FArquivo : TArquivo;
    FEditar : TEditar;
    FSobre : TSobre;

  public
    { Public declarations }
  end;

var
  BlocoDeNotas: TBlocoDeNotas;

implementation

{$R *.dfm}

procedure TBlocoDeNotas.SalvarArquivoComoExecute(Sender: TObject);
begin
  if not assigned(FArquivo) then
  Begin
    FArquivo := TArquivo.create();
  End;
  FArquivo.SalvarArquivoComo(CampoEscrever);
  BlocoDeNotas.Caption := ('Bloco de Notas - '+ExtractFileName(FArquivo.NomeArquivo));
end;

procedure TBlocoDeNotas.SalvarArquivoExecute(Sender: TObject);
begin
  if not assigned(FArquivo) then
  Begin
    FArquivo := TArquivo.create();
  End;
  FArquivo.SalvarArquivo(CampoEscrever, FArquivo.NomeArquivo);
  BlocoDeNotas.Caption := ('Bloco de Notas - '+ExtractFileName(FArquivo.NomeArquivo));
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
begin
  if not assigned(FSobre) then
  Begin
    FSobre := TSobre.create;
  End;

  FSobre.BarraStatus(VerBarraDeStatus, BarraDeStatus);
end;

procedure TBlocoDeNotas.AbrirArquivoExecute(Sender: TObject);
begin
  if not assigned(FArquivo) then
  Begin
    FArquivo := TArquivo.create();
  End;
  FArquivo.AbrirArquivo(CampoEscrever);
  BlocoDeNotas.Caption := ('Bloco de Notas - '+ExtractFileName(FArquivo.NomeArquivo));
end;

procedure TBlocoDeNotas.CampoEscreverChange(Sender: TObject);
begin
  if not assigned(FSobre) then
  Begin
    FSobre := TSobre.create;
  End;

  FSobre.AtualizarBarra(CampoEscrever, BarraDeStatus);
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
  Recortar.Enabled := FEditar.isEnable(CampoEscrever);
  Colar.Enabled := FEditar.isEnable();
  SelecionarTudo.Enabled := True;
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
  BlocoDeNotas.Caption := ('Bloco de Notas');
end;

procedure TBlocoDeNotas.PopupMenuPopup(Sender: TObject);
begin
  popCopiar.Enabled := FEditar.isEnable(CampoEscrever);
  popColar.Enabled := FEditar.isEnable();
  popRecortar.Enabled := FEditar.isEnable(CampoEscrever);
end;

procedure TBlocoDeNotas.RecortarExecute(Sender: TObject);
begin
  FEditar.Cortar(CampoEscrever);
end;

end.
