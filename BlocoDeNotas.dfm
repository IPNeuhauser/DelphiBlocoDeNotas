object Form1: TForm1
  Left = 0
  Top = 0
  Width = 751
  Height = 609
  Align = alClient
  AutoScroll = True
  AutoSize = True
  Caption = 'Form1'
  Color = clBtnHighlight
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = MainMenu1
  WindowState = wsMinimized
  TextHeight = 15
  object CampoPreencher: TMemo
    Left = 0
    Top = 0
    Width = 735
    Height = 545
    Align = alClient
    Color = clWhite
    TabOrder = 0
    ExplicitWidth = 733
    ExplicitHeight = 537
  end
  object MainMenu1: TMainMenu
    Left = 496
    Top = 272
    object Arquivo1: TMenuItem
      Caption = 'Arquivo'
      object SalvarArquivo2: TMenuItem
        Caption = 'Novo Arquivo'
        OnClick = SalvarArquivo2Click
      end
      object Arquivo2: TMenuItem
        Caption = 'Abrir Arquivo'
        OnClick = Arquivo2Click
      end
      object Salvar1: TMenuItem
        Caption = 'Salvar'
        OnClick = Salvar1Click
      end
      object SalvarArquivo1: TMenuItem
        Caption = 'Salvar Arquivo'
        OnClick = SalvarArquivo1Click
      end
      object Sair1: TMenuItem
        Caption = 'Sair'
        OnClick = Sair1Click
      end
    end
    object Ajuda1: TMenuItem
      Caption = 'Ajuda'
      object Ajuda2: TMenuItem
        Caption = 'Sobre'
        OnClick = Ajuda2Click
      end
    end
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = '*.txt'
    FileName = 'Sem Titulo.txt'
    Filter = 'txt|*.txt'
    Left = 568
    Top = 272
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = '*.txt'
    Filter = 'txt|*.txt'
    Left = 648
    Top = 272
  end
end
