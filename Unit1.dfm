object Form1: TForm1
  Left = 260
  Top = 193
  Width = 930
  Height = 522
  Caption = 'Form1'
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PaintBox1: TPaintBox
    Left = 0
    Top = 40
    Width = 913
    Height = 441
    Color = clWhite
    ParentColor = False
    OnClick = PaintBox1Click
    OnMouseMove = PaintBox1MouseMove
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 913
    Height = 41
    TabOrder = 0
    object Label1: TLabel
      Left = 432
      Top = 0
      Width = 72
      Height = 13
      Caption = #210#229#234#243#249#232#233' '#246#226#229#242
    end
    object PaintBox2: TPaintBox
      Left = 432
      Top = 16
      Width = 73
      Height = 17
      Color = clDefault
      ParentColor = False
    end
    object Button1: TButton
      Left = 8
      Top = 8
      Width = 97
      Height = 25
      Caption = #205#238#226#224#255' '#235#232#237#232#255
      TabOrder = 0
      OnClick = Button1Click
    end
    object LabeledEdit1: TLabeledEdit
      Left = 128
      Top = 16
      Width = 121
      Height = 21
      EditLabel.Width = 45
      EditLabel.Height = 13
      EditLabel.Caption = #210#238#235#249#232#237#224
      TabOrder = 1
      OnChange = LabeledEdit1Change
    end
    object Button2: TButton
      Left = 272
      Top = 8
      Width = 137
      Height = 25
      Caption = #200#231#236#229#237#232#242#252' '#246#226#229#242' '#235#232#237#232#232
      TabOrder = 2
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 528
      Top = 8
      Width = 75
      Height = 25
      Caption = #206#247#232#241#242#232#242#252
      TabOrder = 3
      OnClick = Button3Click
    end
    object Button4: TButton
      Left = 624
      Top = 8
      Width = 75
      Height = 25
      Caption = #209#238#245#240#224#237#232#242#252
      TabOrder = 4
      OnClick = Button4Click
    end
  end
  object ColorDialog1: TColorDialog
    Left = 864
    Top = 8
  end
  object SavePictureDialog1: TSavePictureDialog
    FileName = 'C:\Users\vladb\Desktop\NewPainting.bmp'
    Left = 776
    Top = 8
  end
end
