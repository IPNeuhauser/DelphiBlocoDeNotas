unit BlocoDeNotasAction;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdActns, Vcl.ActnList,
  System.Actions, Vcl.Menus, Vcl.ComCtrls, Vcl.Clipbrd, Vcl.StdCtrls, uArquivo, uEditar, uSobre;

type
  TfrmBlocoDeNotas = class(TForm)
    menuPrincipal: TMainMenu;
    actListMenu: TActionList;
    actFecharArquivo: TFileExit;
    actNovoArquivo: TAction;
    actSalvarArquivo: TAction;
    actVerBarraDeStatus: TAction;
    moArquivo: TMenuItem;
    moSubNovoArquivo: TMenuItem;
    moSubAbrirArquivo: TMenuItem;
    moSubSalvar: TMenuItem;
    moSubSalvarArquivoComo: TMenuItem;
    moSubFecharArquivo: TMenuItem;
    moEditar: TMenuItem;
    moSubCopiar: TMenuItem;
    moSubColar: TMenuItem;
    moSubRecortar: TMenuItem;
    moSubDesfazer: TMenuItem;
    moSubDeletar: TMenuItem;
    moExibir: TMenuItem;
    moSubBarraDeStatus: TMenuItem;
    mmCampoEscrever: TMemo;
    StatusBar: TStatusBar;
    popMenu: TPopupMenu;
    popCopiar: TMenuItem;
    popColar: TMenuItem;
    popRecortar: TMenuItem;
    actAbrirArquivo: TAction;
    actSalvarArquivoComo: TAction;
    actCopiar: TAction;
    actColar: TAction;
    actRecortar: TAction;
    actDesfazer: TAction;
    actDeletar: TAction;
    actSelecionarTudo: TAction;
    moSubSelecionarTudo: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    moSubSobre: TMenuItem;
    procedure actCopiarExecute(Sender: TObject);
    procedure actRecortarExecute(Sender: TObject);
    procedure actSelecionarTudoExecute(Sender: TObject);
    procedure actFecharArquivoHint(var HintStr: string; var CanShow: Boolean);
    procedure actNovoArquivoExecute(Sender: TObject);
    procedure actDesfazerExecute(Sender: TObject);
    procedure actVerBarraDeStatusExecute(Sender: TObject);
    procedure actColarExecute(Sender: TObject);
    procedure PopupMenuPopup(Sender: TObject);
    procedure moEditarClick(Sender: TObject);
    procedure moSubDeletarClick(Sender: TObject);
    procedure moSubSobreClick(Sender: TObject);
    procedure actSalvarArquivoComoExecute(Sender: TObject);
    procedure actSalvarArquivoExecute(Sender: TObject);
    procedure actAbrirArquivoExecute(Sender: TObject);
    procedure mmCampoEscreverChange(Sender: TObject);
  private
    { Private declarations }
    FArquivo : TArquivo;
    FEditar : TEditar;
    FSobre : TSobre;

  public
    { Public declarations }
  end;

var
  frmBlocoDeNotas: TfrmBlocoDeNotas;

implementation

{$R *.dfm}

procedure TfrmBlocoDeNotas.actSalvarArquivoComoExecute(Sender: TObject);
begin
  if not assigned(FArquivo) then
  Begin
    FArquivo := TArquivo.create();
  End;
  FArquivo.SalvarArquivoComo(mmCampoEscrever);
  frmBlocoDeNotas.Caption := ('Bloco de Notas - '+ExtractFileName(FArquivo.NomeArquivo));
end;

procedure TfrmBlocoDeNotas.actSalvarArquivoExecute(Sender: TObject);
begin
  if not assigned(FArquivo) then
  Begin
    FArquivo := TArquivo.create();
  End;
  FArquivo.SalvarArquivo(mmCampoEscrever, FArquivo.NomeArquivo);
  frmBlocoDeNotas.Caption := ('Bloco de Notas - '+ExtractFileName(FArquivo.NomeArquivo));
end;

procedure TfrmBlocoDeNotas.actSelecionarTudoExecute(Sender: TObject);
begin
  FEditar.SelecionarTudo(mmCampoEscrever);
end;

procedure TfrmBlocoDeNotas.moSubSobreClick(Sender: TObject);
begin
  ShowMessage('Desenvolvido por Igor Neuhauser');
end;

procedure TfrmBlocoDeNotas.actVerBarraDeStatusExecute(Sender: TObject);
begin
  if not assigned(FSobre) then
  Begin
    FSobre := TSobre.create;
  End;

  FSobre.BarraStatus(actVerBarraDeStatus, StatusBar);
end;

procedure TfrmBlocoDeNotas.actAbrirArquivoExecute(Sender: TObject);
begin
  if not assigned(FArquivo) then
  Begin
    FArquivo := TArquivo.create();
  End;
  FArquivo.AbrirArquivo(mmCampoEscrever);
  frmBlocoDeNotas.Caption := ('Bloco de Notas - '+ExtractFileName(FArquivo.NomeArquivo));
end;

procedure TfrmBlocoDeNotas.mmCampoEscreverChange(Sender: TObject);
begin
  if not assigned(FSobre) then
  Begin
    FSobre := TSobre.create;
  End;

  FSobre.AtualizarBarra(mmCampoEscrever, StatusBar);
end;

procedure TfrmBlocoDeNotas.actColarExecute(Sender: TObject);
begin
  FEditar.Colar(mmCampoEscrever);
end;

procedure TfrmBlocoDeNotas.actCopiarExecute(Sender: TObject);
begin
  FEditar.Copiar(mmCampoEscrever);
end;

procedure TfrmBlocoDeNotas.moSubDeletarClick(Sender: TObject);
begin
  FEditar.Deletar(mmCampoEscrever);
end;

procedure TfrmBlocoDeNotas.actDesfazerExecute(Sender: TObject);
begin
  FEditar.Desfazer(mmCampoEscrever);
end;

procedure TfrmBlocoDeNotas.moEditarClick(Sender: TObject);
begin
  actCopiar.Enabled := FEditar.isEnable(mmCampoEscrever);
  actRecortar.Enabled := FEditar.isEnable(mmCampoEscrever);
  actColar.Enabled := FEditar.isEnable();
  actSelecionarTudo.Enabled := True;
  actDesfazer.Enabled := mmCampoEscrever.CanUndo;
  actDeletar.Enabled := True;
end;

procedure TfrmBlocoDeNotas.actFecharArquivoHint(var HintStr: string;
var CanShow: Boolean);
begin
  FArquivo.Free;
  Application.Terminate;
end;

procedure TfrmBlocoDeNotas.actNovoArquivoExecute(Sender: TObject);
begin
  FArquivo.NovoArquivo(mmCampoEscrever);
  frmBlocoDeNotas.Caption := ('Bloco de Notas');
end;

procedure TfrmBlocoDeNotas.PopupMenuPopup(Sender: TObject);
begin
  popCopiar.Enabled := FEditar.isEnable(mmCampoEscrever);
  popColar.Enabled := FEditar.isEnable();
  popRecortar.Enabled := FEditar.isEnable(mmCampoEscrever);
end;

procedure TfrmBlocoDeNotas.actRecortarExecute(Sender: TObject);
begin
  FEditar.Cortar(mmCampoEscrever);
end;

end.
