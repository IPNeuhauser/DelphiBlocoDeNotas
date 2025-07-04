unit BlocoDeNotasAction;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdActns, Vcl.ActnList,
  System.Actions, Vcl.Menus, Vcl.ComCtrls, Vcl.Clipbrd, Vcl.StdCtrls;

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
    SaveDialog: TSaveDialog;
    OpenDialog: TOpenDialog;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    Sobre1: TMenuItem;
    procedure CampoEscreverChange(Sender: TObject);
    procedure CopiarExecute(Sender: TObject);
    procedure RecortarExecute(Sender: TObject);
    procedure SelecionarTudoExecute(Sender: TObject);
    procedure FecharArquivoHint(var HintStr: string; var CanShow: Boolean);
    procedure NovoArquivoExecute(Sender: TObject);
    procedure SalvarArquivoExecute(Sender: TObject);
    procedure SalvarArquivoComoExecute(Sender: TObject);
    procedure AbrirArquivoExecute(Sender: TObject);
    procedure DesfazerExecute(Sender: TObject);
    procedure VerBarraDeStatusExecute(Sender: TObject);
    procedure ColarExecute(Sender: TObject);
    procedure PopupMenuPopup(Sender: TObject);
    procedure EditarClick(Sender: TObject);
    procedure mDeletarClick(Sender: TObject);
    procedure Sobre1Click(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  BlocoDeNotas: TBlocoDeNotas;
  NomeDoArquivo: String;

implementation

{$R *.dfm}


procedure TBlocoDeNotas.SalvarArquivoComoExecute(Sender: TObject);
begin
  if SaveDialog.Execute then
  Begin
    NomeDoArquivo := SaveDialog.FileName;
    CampoEscrever.lines.SaveToFile(NomeDoArquivo);
    BlocoDeNotas.Caption := ExtractFileName(NomeDoArquivo) + ' - Bloco de Notas';

  End;
end;

procedure TBlocoDeNotas.SalvarArquivoExecute(Sender: TObject);
begin
  if NomeDoArquivo = '' then
  Begin
   SalvarArquivoComo.Execute
  End Else
  Begin
    CampoEscrever.Lines.SaveToFile(NomeDoArquivo);
  End;

end;

procedure TBlocoDeNotas.SelecionarTudoExecute(Sender: TObject);
begin
  CampoEscrever.SelectAll;
end;

procedure TBlocoDeNotas.Sobre1Click(Sender: TObject);
begin
  ShowMessage('Desenvolvido por Igor Neuhauser');
end;

procedure TBlocoDeNotas.VerBarraDeStatusExecute(Sender: TObject);
begin
  BarraDeStatus.Visible := not BarraDeStatus.Visible;
  VerBarraDeStatus.Checked := not VerBarraDeStatus.Checked;
end;

procedure TBlocoDeNotas.AbrirArquivoExecute(Sender: TObject);
begin
  if OpenDialog.Execute then
  begin
    NomeDoArquivo := OpenDialog.FileName;
    CampoEscrever.lines.LoadFromFile(NomeDoArquivo);
    BlocoDeNotas.Caption := ExtractFileName(NomeDoArquivo) + ' - Bloco de Notas';
  end;
end;

procedure TBlocoDeNotas.CampoEscreverChange(Sender: TObject);
begin

  BarraDeStatus.SimpleText := IntToStr(CampoEscrever.Lines.Count) + ' lines';

end;

procedure TBlocoDeNotas.ColarExecute(Sender: TObject);
begin
  CampoEscrever.PasteFromClipboard;
end;

procedure TBlocoDeNotas.CopiarExecute(Sender: TObject);
begin
  CampoEscrever.CopyToClipboard;
end;

procedure TBlocoDeNotas.mDeletarClick(Sender: TObject);
begin
  CampoEscrever.SetSelText('');
end;

procedure TBlocoDeNotas.DesfazerExecute(Sender: TObject);
begin
  CampoEscrever.Undo;
end;

procedure TBlocoDeNotas.EditarClick(Sender: TObject);
begin
  Copiar.Enabled := CampoEscrever.SelLength <> 0;
  Recortar.Enabled := CampoEscrever.SelLength <> 0;
  Colar.Enabled := Clipboard.AsText <> '';
  SelecionarTudo.Enabled := CampoEscrever.SelLength <> Length(CampoEscrever.Lines.Text);
  Desfazer.Enabled := CampoEscrever.CanUndo;
  Deletar.Enabled := True;

end;

procedure TBlocoDeNotas.FecharArquivoHint(var HintStr: string;
  var CanShow: Boolean);
begin
  Application.Terminate;
end;

procedure TBlocoDeNotas.NovoArquivoExecute(Sender: TObject);
begin
  NomeDoArquivo := '';
  CampoEscrever.lines.Clear;
end;

procedure TBlocoDeNotas.PopupMenuPopup(Sender: TObject);
begin
  popCopiar.Enabled := CampoEscrever.SelLength <> 0;
  popColar.Enabled := Clipboard.AsText <> '';
  popRecortar.Enabled := CampoEscrever.SelLength <> 0;
end;

procedure TBlocoDeNotas.RecortarExecute(Sender: TObject);
begin
  CampoEscrever.CutToClipboard;
end;

end.
