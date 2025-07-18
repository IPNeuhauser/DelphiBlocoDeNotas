object frmBlocoDeNotas: TfrmBlocoDeNotas
  Left = 0
  Top = 0
  Align = alClient
  Caption = 'Bloco de Notas'
  ClientHeight = 484
  ClientWidth = 737
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = menuPrincipal
  TextHeight = 15
  object mmCampoEscrever: TMemo
    Left = 0
    Top = 0
    Width = 737
    Height = 459
    Cursor = crIBeam
    Align = alClient
    PopupMenu = popMenu
    TabOrder = 0
    OnChange = mmCampoEscreverChange
    ExplicitWidth = 735
    ExplicitHeight = 452
  end
  object StatusBar: TStatusBar
    AlignWithMargins = True
    Left = 10
    Top = 462
    Width = 724
    Height = 19
    Margins.Left = 10
    BiDiMode = bdLeftToRight
    Color = clScrollBar
    Panels = <>
    ParentBiDiMode = False
    SimplePanel = True
    SimpleText = #9#9
    ExplicitLeft = 5
    ExplicitTop = 466
  end
  object menuPrincipal: TMainMenu
    Left = 424
    Top = 112
    object moArquivo: TMenuItem
      Caption = 'Arquivo'
      object moSubNovoArquivo: TMenuItem
        Action = actNovoArquivo
      end
      object moSubAbrirArquivo: TMenuItem
        Action = actAbrirArquivo
      end
      object moSubSalvar: TMenuItem
        Action = actSalvarArquivo
      end
      object moSubSalvarArquivoComo: TMenuItem
        Action = actSalvarArquivoComo
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object moSubFecharArquivo: TMenuItem
        Action = actFecharArquivo
      end
    end
    object moEditar: TMenuItem
      Caption = 'Editar'
      OnClick = moEditarClick
      object moSubDesfazer: TMenuItem
        Action = actDesfazer
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object moSubCopiar: TMenuItem
        Action = actCopiar
      end
      object moSubColar: TMenuItem
        Action = actColar
      end
      object moSubRecortar: TMenuItem
        Action = actRecortar
      end
      object moSubDeletar: TMenuItem
        Action = actDeletar
        OnClick = moSubDeletarClick
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object moSubSelecionarTudo: TMenuItem
        Action = actSelecionarTudo
      end
    end
    object moExibir: TMenuItem
      Caption = 'Exibir'
      object moSubBarraDeStatus: TMenuItem
        Action = actVerBarraDeStatus
      end
      object moSubSobre: TMenuItem
        Caption = 'Sobre'
        OnClick = moSubSobreClick
      end
    end
  end
  object actListMenu: TActionList
    Left = 504
    Top = 112
    object actNovoArquivo: TAction
      Category = 'Arquivo'
      Caption = '&Novo Arquivo'
      ShortCut = 16462
      OnExecute = actNovoArquivoExecute
    end
    object actSalvarArquivo: TAction
      Category = 'Arquivo'
      Caption = '&Salvar'
      ShortCut = 16467
      OnExecute = actSalvarArquivoExecute
    end
    object actFecharArquivo: TFileExit
      Category = 'Arquivo'
      Caption = 'Fechar Arquivo'
      Hint = 'Exit|Quits the application'
      ImageIndex = 43
      ShortCut = 16471
      OnHint = actFecharArquivoHint
    end
    object actVerBarraDeStatus: TAction
      Category = 'Exibir'
      Caption = 'Barra de Status'
      Checked = True
      OnExecute = actVerBarraDeStatusExecute
    end
    object actAbrirArquivo: TAction
      Category = 'Arquivo'
      Caption = 'Abrir Arquiv&o'
      ShortCut = 16463
      OnExecute = actAbrirArquivoExecute
    end
    object actSalvarArquivoComo: TAction
      Category = 'Arquivo'
      Caption = 'Salvar Como...'
      ShortCut = 24659
      OnExecute = actSalvarArquivoComoExecute
    end
    object actCopiar: TAction
      Category = 'Editar'
      Caption = '&Copiar'
      ShortCut = 16451
      OnExecute = actCopiarExecute
    end
    object actColar: TAction
      Category = 'Editar'
      Caption = 'Colar'
      ShortCut = 16470
      OnExecute = actColarExecute
    end
    object actRecortar: TAction
      Category = 'Editar'
      Caption = 'Recortar'
      ShortCut = 16472
      OnExecute = actRecortarExecute
    end
    object actDesfazer: TAction
      Category = 'Editar'
      Caption = 'Desfa&zer'
      ShortCut = 16474
      OnExecute = actDesfazerExecute
    end
    object actDeletar: TAction
      Category = 'Editar'
      Caption = '&Deletar'
      ShortCut = 46
    end
    object actSelecionarTudo: TAction
      Category = 'Editar'
      Caption = 'Selecionar Tudo'
      ShortCut = 16449
      OnExecute = actSelecionarTudoExecute
    end
  end
  object popMenu: TPopupMenu
    OnPopup = PopupMenuPopup
    Left = 344
    Top = 112
    object popCopiar: TMenuItem
      Action = actCopiar
    end
    object popColar: TMenuItem
      Action = actColar
    end
    object popRecortar: TMenuItem
      Action = actRecortar
    end
  end
end
