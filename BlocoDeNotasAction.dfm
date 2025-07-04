object BlocoDeNotas: TBlocoDeNotas
  Left = 0
  Top = 0
  Align = alClient
  Caption = 'Bloco de Notas'
  ClientHeight = 546
  ClientWidth = 865
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = MainMenu1
  TextHeight = 15
  object CampoEscrever: TMemo
    Left = 0
    Top = 0
    Width = 865
    Height = 527
    Cursor = crIBeam
    Align = alClient
    PopupMenu = PopupMenu1
    TabOrder = 0
    OnChange = CampoEscreverChange
    ExplicitTop = -6
    ExplicitWidth = 624
    ExplicitHeight = 422
  end
  object BarraDeStatus: TStatusBar
    Left = 0
    Top = 527
    Width = 865
    Height = 19
    BiDiMode = bdLeftToRight
    Color = clScrollBar
    Panels = <>
    ParentBiDiMode = False
    SimplePanel = True
    SimpleText = #9#9
    ExplicitTop = 422
    ExplicitWidth = 624
  end
  object MainMenu1: TMainMenu
    Left = 424
    Top = 112
    object Arquivo1: TMenuItem
      Caption = 'Arquivo'
      object Arquivo2: TMenuItem
        Action = NovoArquivo
      end
      object AbrirArquivo1: TMenuItem
        Action = AbrirArquivo
      end
      object AbrirArquivo2: TMenuItem
        Action = SalvarArquivo
      end
      object SalvarArquivoComo1: TMenuItem
        Action = SalvarArquivoComo
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object SalvarArquivoComo2: TMenuItem
        Action = FecharArquivo
      end
    end
    object Editar: TMenuItem
      Caption = 'Editar'
      OnClick = EditarClick
      object mDesfazer: TMenuItem
        Action = Desfazer
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object mCopiar: TMenuItem
        Action = Copiar
      end
      object mColar: TMenuItem
        Action = Colar
      end
      object mRecortar: TMenuItem
        Action = Recortar
      end
      object mDeletar: TMenuItem
        Action = Deletar
        OnClick = mDeletarClick
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object mSelecionarTudo: TMenuItem
        Action = SelecionarTudo
      end
    end
    object Exibir1: TMenuItem
      Caption = 'Exibir'
      object Exibir2: TMenuItem
        Action = VerBarraDeStatus
      end
      object Sobre1: TMenuItem
        Caption = 'Sobre'
        OnClick = Sobre1Click
      end
    end
  end
  object ActionList1: TActionList
    Left = 504
    Top = 112
    object NovoArquivo: TAction
      Category = 'Arquivo'
      Caption = '&Novo Arquivo'
      ShortCut = 16462
      OnExecute = NovoArquivoExecute
    end
    object SalvarArquivo: TAction
      Category = 'Arquivo'
      Caption = '&Salvar'
      ShortCut = 16467
      OnExecute = SalvarArquivoExecute
    end
    object FecharArquivo: TFileExit
      Category = 'Arquivo'
      Caption = 'Fechar Arquivo'
      Hint = 'Exit|Quits the application'
      ImageIndex = 43
      ShortCut = 16471
      OnHint = FecharArquivoHint
    end
    object VerBarraDeStatus: TAction
      Category = 'Exibir'
      Caption = 'Barra de Status'
      Checked = True
      OnExecute = VerBarraDeStatusExecute
    end
    object AbrirArquivo: TAction
      Category = 'Arquivo'
      Caption = 'Abrir Arquiv&o'
      ShortCut = 16463
      OnExecute = AbrirArquivoExecute
    end
    object SalvarArquivoComo: TAction
      Category = 'Arquivo'
      Caption = 'Salvar Como...'
      ShortCut = 24659
      OnExecute = SalvarArquivoComoExecute
    end
    object Copiar: TAction
      Category = 'Editar'
      Caption = '&Copiar'
      ShortCut = 16451
      OnExecute = CopiarExecute
    end
    object Colar: TAction
      Category = 'Editar'
      Caption = 'Colar'
      ShortCut = 16470
      OnExecute = ColarExecute
    end
    object Recortar: TAction
      Category = 'Editar'
      Caption = 'Recortar'
      ShortCut = 16472
      OnExecute = RecortarExecute
    end
    object Desfazer: TAction
      Category = 'Editar'
      Caption = 'Desfa&zer'
      ShortCut = 16474
      OnExecute = DesfazerExecute
    end
    object Deletar: TAction
      Category = 'Editar'
      Caption = '&Deletar'
      ShortCut = 46
    end
    object SelecionarTudo: TAction
      Category = 'Editar'
      Caption = 'Selecionar Tudo'
      ShortCut = 16449
      OnExecute = SelecionarTudoExecute
    end
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenuPopup
    Left = 344
    Top = 112
    object popCopiar: TMenuItem
      Action = Copiar
    end
    object popColar: TMenuItem
      Action = Colar
    end
    object popRecortar: TMenuItem
      Action = Recortar
    end
  end
  object SaveDialog: TSaveDialog
    DefaultExt = 'txt'
    Filter = 'Text files (*.txt)|*.txt|All files (*.*)|*.*'
    Left = 344
    Top = 192
  end
  object OpenDialog: TOpenDialog
    DefaultExt = 'txt'
    Filter = 'Text file (*.txt)|*.txt|All files (*.*)|*.*'
    Left = 416
    Top = 192
  end
end
