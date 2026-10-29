object MainForm: TMainForm
  Left = 223
  Top = 128
  BorderStyle = bsSingle
  Caption = 'Audio Player'
  ClientHeight = 638
  ClientWidth = 770
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  TextHeight = 13
  object TLabel
    Left = 106
    Top = 27
    Width = 33
    Height = 13
    Caption = '-10000'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object TLabel
    Left = 270
    Top = 27
    Width = 30
    Height = 13
    Caption = '10000'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object TLabel
    Left = 29
    Top = 27
    Width = 19
    Height = 13
    Caption = 'Pan'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object NormFreq: TLabel
    Left = 121
    Top = 53
    Width = 18
    Height = 13
    Caption = '100'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Transparent = True
    OnClick = NormFreqClick
  end
  object NormFreq1: TLabel
    Left = 270
    Top = 53
    Width = 36
    Height = 13
    Caption = '200000'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Transparent = True
    OnClick = NormFreqClick
  end
  object TLabel
    Left = 5
    Top = 53
    Width = 43
    Height = 13
    Caption = 'Freq (Hz)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object TLabel
    Left = 208
    Top = 73
    Width = 15
    Height = 13
    Caption = 'Vol'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object SpeedButton1: TSpeedButton
    Left = 5
    Top = 243
    Width = 28
    Height = 25
    Flat = True
    Glyph.Data = {
      1E060000424D1E06000000000000360000002800000017000000150000000100
      180000000000E8050000C30E0000C30E00000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
      0000FFFFFFFFFFFFFFFFFFBEF0F9BEF0F9BEF0F9BEF0F9FFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFF000000FFFFFFFFFFFF08CFFF08CFFF08CFFF08CFFF08CFFF08
      CFFF08CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF08CFFF01ADE008CF
      FF08CFFF08CFFF08CFFF08CFFF08CFFF08CFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
      08CFFF09A4D905CBF706D8FF01D4FF00D4FF00D3FF01D2FF00CFFF08CFFF08CF
      FF08CFFF08CFFF08CFFF08CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
      0000FFFFFFFFFFFF0DABE51FAEDF23C1E93DE2FF2BD9FF1CD5FF0CD3FF02D2FF
      01D4FF05D6FF05D6FF02D2FF00CEFE08CFFF08CFFF08CFFF08CFFFFFFFFFFFFF
      FFFFFFFFFFFFFF000000FFFFFFFFFFFF16B4ED33BDEA2FB6E070ECFF62E6FF56
      E1FF46DFFF2DD9FF0FD3FF00D0FF03D2FF07D4FF06D5FF06D5FF04D7FF01CEFF
      08CFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF1FBCF049CFF428AF
      DC7BE7FB7FEDFF74E8FF6DE7FF64E6FF50E1FF2CDAFF07D2FF00D0FF05D0FF07
      D3FF06D4FF08CFFF02B8EC3AA1C4FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
      27C2F261E1FA2CB3DF78DBF1A1F7FF8EEFFF86ECFF81EBFF7CEAFF70E8FF54E2
      FF29DAFF05D2FF00D1FF03D3FF04CAFB1ACAF805A9DCFFFFFFFFFFFFFFFFFF00
      0000FFFFFFFFFFFF2EC6F375EEFF2EB9E361C8E5C2FFFFAEF7FFA4F5FF9CF2FF
      94F1FF8EEFFF88EEFF79EBFF58E4FF2EDDFF0DD4FB06C4F427D0FC07B4E445A8
      C9FFFFFFFFFFFF000000FFFFFFFFFFFF35CCF683F7FF3EC6EA37B0DABEF0F9D3
      FFFFC7FEFFC2FDFFB9FAFFAFF8FFA1F4FF9CF2FF99F3FF8FF3FF41B296469348
      5BCAD135D6FD0AA2D4FFFFFFFFFFFF000000FFFFFFFFFFFF40D3F78BFCFF69E5
      F820B0DD3FB4DC82D4EA94DEF0A5E6F4B1EEF8C4FAFCC6FEFFB8FAFFB6FAFF67
      BDA72CA13E37B644248A4B79DADF35BAE360B2D2FFFFFF000000FFFFFFFFFFFF
      4ADAFB8DFDFF84F7FF70EAF93EC7E82DBAE126B4DD28B1DB37B5DD50BBDFCCF6
      FBDCFFFE81CBB606842E4EE27766FF9C33BB50389C6B85DCE979EBFFFFFFFF00
      0000FFFFFFFFFFFF57E3FF93FFFF87F8FF8BFBFF8CFCFF87F9FF83F6FF7AF1FC
      6CE9F723B2DC4BB3D9C4E7D016903339CA5F57F28E59F18C62FE982EB24277C1
      8A79EBFF79EBFF000000FFFFFFFFFFFF64ECFF98FFFF8DFCFF8CFBFF8CFBFF8C
      FBFF8CFBFF8CFCFF93FFFF82F5FC2BB3D441914C027F162DBC564AE07B55EE8A
      4CDC7636C5620C781279EBFF79EBFF000000FFFFFFFFFFFF74F5FF9DFFFF93FF
      FF93FFFF93FEFF90FEFF92FFFF9BFFFF9AFFFF9DFFFF92FAF74DB99056BA983F
      AA6D2FBF5255F48E1AA131428F5C53A18748A9B379EBFF000000FFFFFFFFFFFF
      60E7FEABFFFF99FFFF99FFFF96FFFF9BFFFF9BFFFE75EDFC6AE7F874ECF884F4
      FB9AFFFF9FFDFE5CCCA223B04149EA8223A33979EBFF79EBFFFFFFFFFFFFFF00
      0000FFFFFFFFFFFF52D3EFA1FFFFABFFFFA8FFFFABFFFFA9FFFF51D9F533A9D2
      5FBFDE51C0E341BDE335BDE62CAABA16872C36D0671CB7454B8C51FFFFFFFFFF
      FFFFFFFFFFFFFF000000FFFFFFFFFFFF52D3EF52D3EF52D3EF5BD8F072E5F555
      DBF623A3D1B6FAFFB6FAFFB6FAFFB6FAFFB6FAFF0D7C3A17A23320BA4C3A8744
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFF87F9
      FF87F9FF87F9FF87F9FFB6FAFF79EBFF226D1B35772D23791C288B26199F2413
      9A2A3C8442FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF79EBFF2881
      292B862D42944579EBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
      0000}
    OnClick = OpenFileClick
  end
  object TLabel
    Left = 60
    Top = 117
    Width = 44
    Height = 13
    Caption = 'Channels'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object TLabel
    Left = 58
    Top = 142
    Width = 46
    Height = 13
    Caption = 'Data Size'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object TLabel
    Left = 30
    Top = 166
    Width = 74
    Height = 13
    Caption = 'Bits Per Sample'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object TLabel
    Left = 5
    Top = 191
    Width = 99
    Height = 13
    Caption = 'Samples Per Second'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object ADigitalViewMeter1: TPaintBox
    Left = 237
    Top = 81
    Width = 25
    Height = 216
  end
  object ADigitalViewMeter2: TPaintBox
    Left = 277
    Top = 81
    Width = 25
    Height = 216
  end
  object Label1: TLabel
    Left = 5
    Top = 2
    Width = 123
    Height = 13
    Caption = 'Audio Player - ALTEK'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 5
    Top = 320
    Width = 33
    Height = 13
    Caption = 'Scale'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object TLabel
    Left = 10
    Top = 86
    Width = 54
    Height = 13
    Caption = 'Out Device'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object TLabel
    Left = 63
    Top = 216
    Width = 40
    Height = 13
    Caption = 'Duration'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object Image1: TImage
    Left = 7
    Top = 538
    Width = 759
    Height = 97
  end
  object Image2: TImage
    Left = 7
    Top = 440
    Width = 759
    Height = 97
  end
  object MYSpectrumAnalyser1: TPaintBox
    Left = 7
    Top = 340
    Width = 378
    Height = 97
    Color = clBlack
    ParentColor = False
  end
  object MYSpectrumAnalyser2: TPaintBox
    Left = 387
    Top = 340
    Width = 378
    Height = 97
    Color = clBlack
    ParentColor = False
  end
  object PlayFile: TButton
    Left = 13
    Top = 272
    Width = 41
    Height = 25
    Caption = 'Play'
    TabOrder = 12
    OnClick = PlayFileClick
  end
  object StopFile: TButton
    Left = 61
    Top = 272
    Width = 41
    Height = 25
    Caption = 'Stop'
    TabOrder = 13
    OnClick = StopFileClick
  end
  object Pause: TButton
    Left = 109
    Top = 272
    Width = 41
    Height = 25
    Caption = 'Pause'
    TabOrder = 16
    OnClick = PauseClick
  end
  object ExportButton: TButton
    Left = 157
    Top = 272
    Width = 41
    Height = 25
    Caption = 'Export'
    TabOrder = 18
    OnClick = ExportButtonClick
  end
  object Vol: TTrackBar
    Left = 202
    Top = 88
    Width = 28
    Height = 144
    Max = 0
    Min = -10000
    Orientation = trVertical
    Frequency = 500
    Position = -10000
    TabOrder = 0
    ThumbLength = 10
    TickMarks = tmBoth
    OnChange = VolChange
  end
  object EffectsEnable: TCheckListBox
    Left = 311
    Top = 8
    Width = 451
    Height = 38
    BevelEdges = []
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    BiDiMode = bdLeftToRight
    Color = clBtnFace
    Columns = 4
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    HeaderBackgroundColor = clBtnFace
    IntegralHeight = True
    ItemHeight = 17
    Items.Strings = (
      'Chorus'
      'Compressor'
      'Distortion'
      'Echo'
      'Flanger'
      'Gargle'
      'ParamEq'
      'Reverb')
    ParentBiDiMode = False
    ParentFont = False
    TabOrder = 1
    OnClickCheck = EffectsEnableClickCheck
  end
  object PageControl: TPageControl
    Left = 310
    Top = 56
    Width = 457
    Height = 281
    ActivePage = ChorusPage
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNone
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MultiLine = True
    ParentFont = False
    TabOrder = 2
    object ChorusPage: TTabSheet
      Caption = 'Chorus'
      ImageIndex = 1
      object TLabel
        Left = 192
        Top = 40
        Width = 15
        Height = 13
        Caption = '0.0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object TLabel
        Left = 409
        Top = 40
        Width = 27
        Height = 13
        Caption = '100.0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object TLabel
        Left = 46
        Top = 40
        Width = 77
        Height = 13
        Caption = 'Wet/Dry Mix (%)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object TLabel
        Left = 192
        Top = 72
        Width = 15
        Height = 13
        Caption = '0.0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object TLabel
        Left = 409
        Top = 72
        Width = 27
        Height = 13
        Caption = '100.0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object TLabel
        Left = 77
        Top = 72
        Width = 46
        Height = 13
        Caption = 'Depth (%)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object TLabel
        Left = 183
        Top = 104
        Width = 24
        Height = 13
        Caption = '-99.0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object TLabel
        Left = 409
        Top = 104
        Width = 21
        Height = 13
        Caption = '99.0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object TLabel
        Left = 58
        Top = 104
        Width = 65
        Height = 13
        Caption = 'Feedback (%)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object TLabel
        Left = 192
        Top = 136
        Width = 15
        Height = 13
        Caption = '0.0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object TLabel
        Left = 409
        Top = 136
        Width = 21
        Height = 13
        Caption = '10.0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object TLabel
        Left = 49
        Top = 136
        Width = 72
        Height = 13
        Caption = 'Frequency (Hz)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object TLabel
        Left = 192
        Top = 168
        Width = 15
        Height = 13
        Caption = '0.0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object TLabel
        Left = 409
        Top = 168
        Width = 21
        Height = 13
        Caption = '20.0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object TLabel
        Left = 72
        Top = 168
        Width = 49
        Height = 13
        Caption = 'Delay (ms)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object ChorusWetDryMix: TTrackBar
        Left = 208
        Top = 32
        Width = 201
        Height = 30
        Max = 1000
        Frequency = 50
        Position = 500
        TabOrder = 0
        ThumbLength = 10
        TickMarks = tmBoth
        OnChange = ChorusWetDryMixChange
      end
      object ChorusWetDryMixValue: TStaticText
        Left = 127
        Top = 38
        Width = 41
        Height = 17
        Alignment = taCenter
        AutoSize = False
        BevelKind = bkFlat
        Caption = '50.0'
        Color = clWhite
        ParentColor = False
        TabOrder = 1
      end
      object ChorusDepth: TTrackBar
        Left = 208
        Top = 64
        Width = 201
        Height = 31
        Max = 1000
        Frequency = 50
        Position = 100
        TabOrder = 2
        ThumbLength = 10
        TickMarks = tmBoth
        OnChange = ChorusDepthChange
      end
      object ChorusDepthValue: TStaticText
        Left = 127
        Top = 70
        Width = 41
        Height = 17
        Alignment = taCenter
        AutoSize = False
        BevelKind = bkFlat
        Caption = '10.0'
        Color = clWhite
        ParentColor = False
        TabOrder = 3
      end
      object ChorusFeedback: TTrackBar
        Left = 208
        Top = 96
        Width = 201
        Height = 31
        Max = 990
        Min = -990
        Frequency = 99
        Position = 250
        TabOrder = 4
        ThumbLength = 10
        TickMarks = tmBoth
        OnChange = ChorusFeedbackChange
      end
      object ChorusFeedbackValue: TStaticText
        Left = 127
        Top = 102
        Width = 41
        Height = 17
        Alignment = taCenter
        AutoSize = False
        BevelKind = bkFlat
        Caption = '25.0'
        Color = clWhite
        ParentColor = False
        TabOrder = 5
      end
      object ChorusFrequency: TTrackBar
        Left = 208
        Top = 128
        Width = 201
        Height = 30
        Max = 100
        Frequency = 5
        Position = 11
        TabOrder = 6
        ThumbLength = 10
        TickMarks = tmBoth
        OnChange = ChorusFrequencyChange
      end
      object ChorusFrequencyValue: TStaticText
        Left = 127
        Top = 134
        Width = 41
        Height = 17
        Alignment = taCenter
        AutoSize = False
        BevelKind = bkFlat
        Caption = '1.1'
        Color = clWhite
        ParentColor = False
        TabOrder = 7
      end
      object TStaticText
        Left = 175
        Top = 14
        Width = 41
        Height = 17
        Alignment = taCenter
        AutoSize = False
        BevelKind = bkFlat
        Caption = 'Min'
        Color = clWhite
        ParentColor = False
        TabOrder = 8
      end
      object TStaticText
        Left = 399
        Top = 14
        Width = 41
        Height = 17
        Alignment = taCenter
        AutoSize = False
        BevelKind = bkFlat
        Caption = 'Max'
        Color = clWhite
        ParentColor = False
        TabOrder = 9
      end
      object ChorusDelay: TTrackBar
        Left = 208
        Top = 160
        Width = 201
        Height = 32
        Max = 200
        Frequency = 10
        Position = 160
        TabOrder = 10
        ThumbLength = 10
        TickMarks = tmBoth
        OnChange = ChorusDelayChange
      end
      object ChorusDelayValue: TStaticText
        Left = 127
        Top = 166
        Width = 41
        Height = 17
        Alignment = taCenter
        AutoSize = False
        BevelKind = bkFlat
        Caption = '16.0'
        Color = clWhite
        ParentColor = False
        TabOrder = 11
      end
      object ChorusWaveForm: TRadioGroup
        Left = 24
        Top = 200
        Width = 145
        Height = 41
        Caption = ' Wave Form '
        Color = clBtnFace
        Columns = 2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ItemIndex = 1
        Items.Strings = (
          'Triangle'
          'Sine')
        ParentColor = False
        ParentFont = False
        TabOrder = 12
        OnClick = ChorusWaveFormClick
      end
      object ChorusPhase: TRadioGroup
        Left = 184
        Top = 200
        Width = 249
        Height = 41
        Caption = ' Phase (Degrees) '
        Color = clBtnFace
        Columns = 5
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ItemIndex = 2
        Items.Strings = (
          '-180'
          '-90'
          '0'
          '90'
          '180')
        ParentColor = False
        ParentFont = False
        TabOrder = 13
        OnClick = ChorusPhaseClick
      end
    end
    object CompressorPage: TTabSheet
      Caption = 'Compressor'
      ImageIndex = 2
      object TLabel
        Left = 183
        Top = 40
        Width = 24
        Height = 13
        Caption = '-60.0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object TLabel
        Left = 409
        Top = 40
        Width = 21
        Height = 13
        Caption = '60.0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object TLabel
        Left = 77
        Top = 40
        Width = 44
        Height = 13
        Caption = 'Gain (dB)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object TLabel
        Left = 192
        Top = 72
        Width = 15
        Height = 13
        Caption = '0.0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object TLabel
        Left = 409
        Top = 72
        Width = 27
        Height = 13
        Caption = '500.0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object TLabel
        Left = 68
        Top = 72
        Width = 53
        Height = 13
        Caption = 'Attack (ms)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object TLabel
        Left = 186
        Top = 104
        Width = 21
        Height = 13
        Caption = '50.0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object TLabel
        Left = 409
        Top = 104
        Width = 33
        Height = 13
        Caption = '3000.0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object TLabel
        Left = 60
        Top = 104
        Width = 61
        Height = 13
        Caption = 'Release (ms)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object TLabel
        Left = 183
        Top = 136
        Width = 24
        Height = 13
        Caption = '-60.0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object TLabel
        Left = 409
        Top = 136
        Width = 15
        Height = 13
        Caption = '0.0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object TLabel
        Left = 58
        Top = 136
        Width = 63
        Height = 13
        Caption = 'Treshold (dB)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object TLabel
        Left = 192
        Top = 168
        Width = 15
        Height = 13
        Caption = '1.0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object TLabel
        Left = 409
        Top = 168
        Width = 27
        Height = 13
        Caption = '100.0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object TLabel
        Left = 73
        Top = 168
        Width = 48
        Height = 13
        Caption = 'Ratio (x:1)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object TLabel
        Left = 186
        Top = 200
        Width = 21
        Height = 13
        Caption = '0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object TLabel
        Left = 409
        Top = 200
        Width = 21
        Height = 13
        Caption = '4.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object TLabel
        Left = 58
        Top = 200
        Width = 63
        Height = 13
        Caption = 'Predelay (ms)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object CompressorGain: TTrackBar
        Left = 208
        Top = 32
        Width = 201
        Height = 30
        Max = 600
        Min = -600
        Frequency = 60
        Position = 60
        TabOrder = 0
        ThumbLength = 10
        TickMarks = tmBoth
        OnChange = CompressorGainChange
      end
      object CompressorGainValue: TStaticText
        Left = 127
        Top = 38
        Width = 41
        Height = 17
        Alignment = taCenter
        AutoSize = False
        BevelKind = bkFlat
        Caption = '0.0'
        Color = clWhite
        ParentColor = False
        TabOrder = 1
      end
      object CompressorAttack: TTrackBar
        Left = 208
        Top = 64
        Width = 201
        Height = 31
        Max = 5000
        Frequency = 250
        Position = 100
        TabOrder = 2
        ThumbLength = 10
        TickMarks = tmBoth
        OnChange = CompressorAttackChange
      end
      object CompressorAttackValue: TStaticText
        Left = 127
        Top = 70
        Width = 41
        Height = 17
        Alignment = taCenter
        AutoSize = False
        BevelKind = bkFlat
        Caption = '10.0'
        Color = clWhite
        ParentColor = False
        TabOrder = 3
      end
      object CompressorRelease: TTrackBar
        Left = 208
        Top = 96
        Width = 201
        Height = 30
        Max = 30000
        Min = 500
        Frequency = 1475
        Position = 2000
        TabOrder = 4
        ThumbLength = 10
        TickMarks = tmBoth
        OnChange = CompressorReleaseChange
      end
      object CompressorReleaseValue: TStaticText
        Left = 127
        Top = 102
        Width = 41
        Height = 17
        Alignment = taCenter
        AutoSize = False
        BevelKind = bkFlat
        Caption = '200.0'
        Color = clWhite
        ParentColor = False
        TabOrder = 5
      end
      object CompressorTreshold: TTrackBar
        Left = 208
        Top = 128
        Width = 201
        Height = 31
        Max = 0
        Min = -600
        Frequency = 30
        Position = -200
        TabOrder = 6
        ThumbLength = 10
        TickMarks = tmBoth
        OnChange = CompressorTresholdChange
      end
      object CompressorTresholdValue: TStaticText
        Left = 127
        Top = 134
        Width = 41
        Height = 17
        Alignment = taCenter
        AutoSize = False
        BevelKind = bkFlat
        Caption = '-20.0'
        Color = clWhite
        ParentColor = False
        TabOrder = 7
      end
      object TStaticText
        Left = 175
        Top = 14
        Width = 41
        Height = 17
        Alignment = taCenter
        AutoSize = False
        BevelKind = bkFlat
        Caption = 'Min'
        Color = clWhite
        ParentColor = False
        TabOrder = 8
      end
      object TStaticText
        Left = 399
        Top = 14
        Width = 41
        Height = 17
        Alignment = taCenter
        AutoSize = False
        BevelKind = bkFlat
        Caption = 'Max'
        Color = clWhite
        ParentColor = False
        TabOrder = 9
      end
      object CompressorRatio: TTrackBar
        Left = 208
        Top = 160
        Width = 201
        Height = 31
        Max = 1000
        Min = 10
        Frequency = 50
        Position = 30
        TabOrder = 10
        ThumbLength = 10
        TickMarks = tmBoth
        OnChange = CompressorRatioChange
      end
      object CompressorRatioValue: TStaticText
        Left = 127
        Top = 166
        Width = 41
        Height = 17
        Alignment = taCenter
        AutoSize = False
        BevelKind = bkFlat
        Caption = '3.0'
        Color = clWhite
        ParentColor = False
        TabOrder = 11
      end
      object CompressorPredelay: TTrackBar
        Left = 208
        Top = 192
        Width = 201
        Height = 32
        Max = 400
        Frequency = 20
        Position = 400
        TabOrder = 12
        ThumbLength = 10
        TickMarks = tmBoth
        OnChange = CompressorPredelayChange
      end
      object CompressorPredelayValue: TStaticText
        Left = 127
        Top = 198
        Width = 41
        Height = 17
        Alignment = taCenter
        AutoSize = False
        BevelKind = bkFlat
        Caption = '4.00'
        Color = clWhite
        ParentColor = False
        TabOrder = 13
      end
    end
    object DistortionPage: TTabSheet
      Caption = 'Distortion'
      ImageIndex = 7
      object TLabel
        Left = 183
        Top = 40
        Width = 24
        Height = 13
        Caption = '-60.0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object TLabel
        Left = 409
        Top = 40
        Width = 15
        Height = 13
        Caption = '0.0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object TLabel
        Left = 192
        Top = 72
        Width = 15
        Height = 13
        Caption = '0.0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object TLabel
        Left = 409
        Top = 72
        Width = 27
        Height = 13
        Caption = '100.0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object TLabel
        Left = 81
        Top = 72
        Width = 42
        Height = 13
        Caption = 'Edge (%)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object TLabel
        Left = 189
        Top = 104
        Width = 18
        Height = 13
        Caption = '100'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object TLabel
        Left = 409
        Top = 104
        Width = 24
        Height = 13
        Caption = '8000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object TLabel
        Left = 5
        Top = 104
        Width = 116
        Height = 13
        Caption = 'PostEQ Center Freq (Hz)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object TLabel
        Left = 189
        Top = 136
        Width = 18
        Height = 13
        Caption = '100'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object TLabel
        Left = 409
        Top = 136
        Width = 24
        Height = 13
        Caption = '8000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object TLabel
        Left = 10
        Top = 136
        Width = 111
        Height = 13
        Caption = 'PostEQ Bandwidth (Hz)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object TLabel
        Left = 189
        Top = 168
        Width = 18
        Height = 13
        Caption = '100'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object TLabel
        Left = 409
        Top = 168
        Width = 24
        Height = 13
        Caption = '8000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object TLabel
        Left = 14
        Top = 168
        Width = 107
        Height = 13
        Caption = 'Prelowpass Cutoff (Hz)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object TLabel
        Left = 77
        Top = 40
        Width = 44
        Height = 13
        Caption = 'Gain (dB)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object DistortionGain: TTrackBar
        Left = 208
        Top = 32
        Width = 201
        Height = 31
        Max = 0
        Min = -600
        Frequency = 30
        Position = -180
        TabOrder = 0
        ThumbLength = 10
        TickMarks = tmBoth
        OnChange = DistortionGainChange
      end
      object DistortionGainValue: TStaticText
        Left = 127
        Top = 38
        Width = 41
        Height = 17
        Alignment = taCenter
        AutoSize = False
        BevelKind = bkFlat
        Caption = '-18.0'
        Color = clWhite
        ParentColor = False
        TabOrder = 1
      end
      object DistortionEdge: TTrackBar
        Left = 208
        Top = 64
        Width = 201
        Height = 32
        Max = 1000
        Frequency = 50
        Position = 150
        TabOrder = 2
        ThumbLength = 10
        TickMarks = tmBoth
        OnChange = DistortionEdgeChange
      end
      object DistortionEdgeValue: TStaticText
        Left = 127
        Top = 70
        Width = 41
        Height = 17
        Alignment = taCenter
        AutoSize = False
        BevelKind = bkFlat
        Caption = '15.0'
        Color = clWhite
        ParentColor = False
        TabOrder = 3
      end
      object DistortionPostEQCenterFreq: TTrackBar
        Left = 208
        Top = 96
        Width = 201
        Height = 32
        Max = 8000
        Min = 100
        Frequency = 395
        Position = 2400
        TabOrder = 4
        ThumbLength = 10
        TickMarks = tmBoth
        OnChange = DistortionPostEQCenterFreqChange
      end
      object DistortionPostEQCenterFreqValue: TStaticText
        Left = 127
        Top = 102
        Width = 41
        Height = 17
        Alignment = taCenter
        AutoSize = False
        BevelKind = bkFlat
        Caption = '2400'
        Color = clWhite
        ParentColor = False
        TabOrder = 5
      end
      object DistortionPostEQBandwidth: TTrackBar
        Left = 208
        Top = 128
        Width = 201
        Height = 32
        Max = 8000
        Min = 100
        Frequency = 395
        Position = 2400
        TabOrder = 6
        ThumbLength = 10
        TickMarks = tmBoth
        OnChange = DistortionPostEQBandwidthChange
      end
      object DistortionPostEQBandwidthValue: TStaticText
        Left = 127
        Top = 134
        Width = 41
        Height = 17
        Alignment = taCenter
        AutoSize = False
        BevelKind = bkFlat
        Caption = '2400'
        Color = clWhite
        ParentColor = False
        TabOrder = 7
      end
      object TStaticText
        Left = 175
        Top = 14
        Width = 41
        Height = 17
        Alignment = taCenter
        AutoSize = False
        BevelKind = bkFlat
        Caption = 'Min'
        Color = clWhite
        ParentColor = False
        TabOrder = 8
      end
      object TStaticText
        Left = 399
        Top = 14
        Width = 41
        Height = 17
        Alignment = taCenter
        AutoSize = False
        BevelKind = bkFlat
        Caption = 'Max'
        Color = clWhite
        ParentColor = False
        TabOrder = 9
      end
      object DistortionPrelowpassCutoff: TTrackBar
        Left = 208
        Top = 160
        Width = 201
        Height = 32
        Max = 8000
        Min = 100
        Frequency = 395
        Position = 7350
        TabOrder = 10
        ThumbLength = 10
        TickMarks = tmBoth
        OnChange = DistortionPrelowpassCutoffChange
      end
      object DistortionPrelowpassCutoffValue: TStaticText
        Left = 127
        Top = 166
        Width = 41
        Height = 17
        Alignment = taCenter
        AutoSize = False
        BevelKind = bkFlat
        Caption = '7350'
        Color = clWhite
        ParentColor = False
        TabOrder = 11
      end
    end
    object EchoPage: TTabSheet
      Caption = 'Echo'
      object TLabel
        Left = 192
        Top = 40
        Width = 15
        Height = 13
        Caption = '0.0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object TLabel
        Left = 409
        Top = 40
        Width = 27
        Height = 13
        Caption = '100.0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object TLabel
        Left = 46
        Top = 40
        Width = 77
        Height = 13
        Caption = 'Wet/Dry Mix (%)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object TLabel
        Left = 192
        Top = 72
        Width = 15
        Height = 13
        Caption = '0.0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object TLabel
        Left = 409
        Top = 72
        Width = 27
        Height = 13
        Caption = '100.0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object TLabel
        Left = 58
        Top = 72
        Width = 65
        Height = 13
        Caption = 'Feedback (%)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object TLabel
        Left = 192
        Top = 104
        Width = 15
        Height = 13
        Caption = '1.0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object TLabel
        Left = 409
        Top = 104
        Width = 33
        Height = 13
        Caption = '2000.0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object TLabel
        Left = 51
        Top = 104
        Width = 70
        Height = 13
        Caption = 'Left Delay (ms)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object TLabel
        Left = 192
        Top = 136
        Width = 15
        Height = 13
        Caption = '1.0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object TLabel
        Left = 409
        Top = 136
        Width = 33
        Height = 13
        Caption = '2000.0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object TLabel
        Left = 44
        Top = 136
        Width = 77
        Height = 13
        Caption = 'Right Delay (ms)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object EchoWetDryMix: TTrackBar
        Left = 208
        Top = 32
        Width = 201
        Height = 32
        Max = 1000
        Frequency = 50
        Position = 500
        TabOrder = 0
        ThumbLength = 10
        TickMarks = tmBoth
        OnChange = EchoWetDryMixChange
      end
      object EchoWetDryMixValue: TStaticText
        Left = 127
        Top = 38
        Width = 41
        Height = 17
        Alignment = taCenter
        AutoSize = False
        BevelKind = bkFlat
        Caption = '50.0'
        Color = clWhite
        ParentColor = False
        TabOrder = 1
      end
      object EchoFeedback: TTrackBar
        Left = 208
        Top = 64
        Width = 201
        Height = 31
        Max = 1000
        Frequency = 50
        Position = 500
        TabOrder = 2
        ThumbLength = 10
        TickMarks = tmBoth
        OnChange = EchoFeedbackChange
      end
      object EchoFeedbackValue: TStaticText
        Left = 127
        Top = 70
        Width = 41
        Height = 17
        Alignment = taCenter
        AutoSize = False
        BevelKind = bkFlat
        Caption = '50.0'
        Color = clWhite
        ParentColor = False
        TabOrder = 3
      end
      object EchoLeftDelay: TTrackBar
        Left = 208
        Top = 96
        Width = 201
        Height = 31
        Max = 20000
        Min = 10
        Frequency = 1000
        Position = 5000
        TabOrder = 4
        ThumbLength = 10
        TickMarks = tmBoth
        OnChange = EchoLeftDelayChange
      end
      object EchoLeftDelayValue: TStaticText
        Left = 127
        Top = 102
        Width = 41
        Height = 17
        Alignment = taCenter
        AutoSize = False
        BevelKind = bkFlat
        Caption = '500.0'
        Color = clWhite
        ParentColor = False
        TabOrder = 5
      end
      object EchoRightDelay: TTrackBar
        Left = 208
        Top = 128
        Width = 201
        Height = 32
        Max = 20000
        Min = 10
        Frequency = 1000
        Position = 5000
        TabOrder = 6
        ThumbLength = 10
        TickMarks = tmBoth
        OnChange = EchoRightDelayChange
      end
      object EchoRightDelayValue: TStaticText
        Left = 127
        Top = 134
        Width = 41
        Height = 17
        Alignment = taCenter
        AutoSize = False
        BevelKind = bkFlat
        Caption = '500.0'
        Color = clWhite
        ParentColor = False
        TabOrder = 7
      end
      object TStaticText
        Left = 175
        Top = 14
        Width = 41
        Height = 17
        Alignment = taCenter
        AutoSize = False
        BevelKind = bkFlat
        Caption = 'Min'
        Color = clWhite
        ParentColor = False
        TabOrder = 8
      end
      object TStaticText
        Left = 399
        Top = 14
        Width = 41
        Height = 17
        Alignment = taCenter
        AutoSize = False
        BevelKind = bkFlat
        Caption = 'Max'
        Color = clWhite
        ParentColor = False
        TabOrder = 9
      end
      object EchoSwapDelay: TCheckBox
        Left = 56
        Top = 168
        Width = 97
        Height = 17
        Alignment = taLeftJustify
        Caption = 'Swap Delays'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        TabOrder = 10
        OnClick = EchoSwapDelayClick
      end
    end
    object FlangerPage: TTabSheet
      Caption = 'Flanger'
      ImageIndex = 3
      object TLabel
        Left = 192
        Top = 40
        Width = 15
        Height = 13
        Caption = '0.0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object TLabel
        Left = 409
        Top = 40
        Width = 27
        Height = 13
        Caption = '100.0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object TLabel
        Left = 46
        Top = 40
        Width = 77
        Height = 13
        Caption = 'Wet/Dry Mix (%)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object TLabel
        Left = 192
        Top = 72
        Width = 15
        Height = 13
        Caption = '0.0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object TLabel
        Left = 409
        Top = 72
        Width = 27
        Height = 13
        Caption = '100.0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object TLabel
        Left = 77
        Top = 72
        Width = 46
        Height = 13
        Caption = 'Depth (%)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object TLabel
        Left = 183
        Top = 104
        Width = 24
        Height = 13
        Caption = '-99.0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object TLabel
        Left = 409
        Top = 104
        Width = 21
        Height = 13
        Caption = '99.0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object TLabel
        Left = 58
        Top = 104
        Width = 65
        Height = 13
        Caption = 'Feedback (%)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object TLabel
        Left = 186
        Top = 136
        Width = 21
        Height = 13
        Caption = '0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object TLabel
        Left = 409
        Top = 136
        Width = 27
        Height = 13
        Caption = '10.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object TLabel
        Left = 49
        Top = 136
        Width = 72
        Height = 13
        Caption = 'Frequency (Hz)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object TLabel
        Left = 186
        Top = 168
        Width = 21
        Height = 13
        Caption = '0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object TLabel
        Left = 409
        Top = 168
        Width = 21
        Height = 13
        Caption = '4.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object TLabel
        Left = 72
        Top = 168
        Width = 49
        Height = 13
        Caption = 'Delay (ms)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object FlangerWetDryMix: TTrackBar
        Left = 208
        Top = 32
        Width = 201
        Height = 32
        Max = 1000
        Frequency = 50
        Position = 500
        TabOrder = 0
        ThumbLength = 10
        TickMarks = tmBoth
        OnChange = FlangerWetDryMixChange
      end
      object FlangerWetDryMixValue: TStaticText
        Left = 127
        Top = 38
        Width = 41
        Height = 17
        Alignment = taCenter
        AutoSize = False
        BevelKind = bkFlat
        Caption = '50.0'
        Color = clWhite
        ParentColor = False
        TabOrder = 1
      end
      object FlangerDepth: TTrackBar
        Left = 208
        Top = 64
        Width = 201
        Height = 32
        Max = 1000
        Frequency = 50
        TabOrder = 2
        ThumbLength = 10
        TickMarks = tmBoth
        OnChange = FlangerDepthChange
      end
      object FlangerDepthValue: TStaticText
        Left = 127
        Top = 70
        Width = 41
        Height = 17
        Alignment = taCenter
        AutoSize = False
        BevelKind = bkFlat
        Caption = '100.0'
        Color = clWhite
        ParentColor = False
        TabOrder = 3
      end
      object FlangerFeedback: TTrackBar
        Left = 208
        Top = 96
        Width = 201
        Height = 32
        Max = 990
        Min = -990
        Frequency = 99
        Position = -500
        TabOrder = 4
        ThumbLength = 10
        TickMarks = tmBoth
        OnChange = FlangerFeedbackChange
      end
      object FlangerFeedbackValue: TStaticText
        Left = 127
        Top = 102
        Width = 41
        Height = 17
        Alignment = taCenter
        AutoSize = False
        BevelKind = bkFlat
        Caption = '-50.0'
        Color = clWhite
        ParentColor = False
        TabOrder = 5
      end
      object FlangerFrequency: TTrackBar
        Left = 208
        Top = 128
        Width = 201
        Height = 31
        Max = 1000
        Frequency = 50
        Position = 25
        TabOrder = 6
        ThumbLength = 10
        TickMarks = tmBoth
        OnChange = FlangerFrequencyChange
      end
      object FlangerFrequencyValue: TStaticText
        Left = 127
        Top = 134
        Width = 41
        Height = 17
        Alignment = taCenter
        AutoSize = False
        BevelKind = bkFlat
        Caption = '0.25'
        Color = clWhite
        ParentColor = False
        TabOrder = 7
      end
      object TStaticText
        Left = 175
        Top = 14
        Width = 41
        Height = 17
        Alignment = taCenter
        AutoSize = False
        BevelKind = bkFlat
        Caption = 'Min'
        Color = clWhite
        ParentColor = False
        TabOrder = 8
      end
      object TStaticText
        Left = 399
        Top = 14
        Width = 41
        Height = 17
        Alignment = taCenter
        AutoSize = False
        BevelKind = bkFlat
        Caption = 'Max'
        Color = clWhite
        ParentColor = False
        TabOrder = 9
      end
      object FlangerDelay: TTrackBar
        Left = 208
        Top = 160
        Width = 201
        Height = 31
        Max = 400
        Frequency = 20
        Position = 200
        TabOrder = 10
        ThumbLength = 10
        TickMarks = tmBoth
        OnChange = FlangerDelayChange
      end
      object FlangerDelayValue: TStaticText
        Left = 127
        Top = 166
        Width = 41
        Height = 17
        Alignment = taCenter
        AutoSize = False
        BevelKind = bkFlat
        Caption = '2.00'
        Color = clWhite
        ParentColor = False
        TabOrder = 11
      end
      object FlangerWaveForm: TRadioGroup
        Left = 24
        Top = 200
        Width = 145
        Height = 41
        Caption = ' Wave Form '
        Color = clBtnFace
        Columns = 2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ItemIndex = 0
        Items.Strings = (
          'Triangle'
          'Sine')
        ParentColor = False
        ParentFont = False
        TabOrder = 12
        OnClick = FlangerWaveFormClick
      end
      object FlangerPhase: TRadioGroup
        Left = 184
        Top = 200
        Width = 249
        Height = 41
        Caption = ' Phase (Degrees) '
        Color = clBtnFace
        Columns = 5
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ItemIndex = 2
        Items.Strings = (
          '-180'
          '-90'
          '0'
          '90'
          '180')
        ParentColor = False
        ParentFont = False
        TabOrder = 13
        OnClick = FlangerPhaseClick
      end
    end
    object GarglePage: TTabSheet
      Caption = 'Gargle'
      ImageIndex = 4
      object TLabel
        Left = 183
        Top = 40
        Width = 15
        Height = 13
        Caption = '0.0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object TLabel
        Left = 409
        Top = 40
        Width = 33
        Height = 13
        Caption = '1000.0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object TLabel
        Left = 73
        Top = 40
        Width = 45
        Height = 13
        Caption = 'Rate (Hz)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object GargleRate: TTrackBar
        Left = 208
        Top = 32
        Width = 201
        Height = 29
        Max = 1000
        Frequency = 50
        Position = 20
        TabOrder = 0
        ThumbLength = 10
        TickMarks = tmBoth
        OnChange = GargleRateChange
      end
      object GargleRateValue: TStaticText
        Left = 127
        Top = 38
        Width = 41
        Height = 17
        Alignment = taCenter
        AutoSize = False
        BevelKind = bkFlat
        Caption = '18.0'
        Color = clWhite
        ParentColor = False
        TabOrder = 1
      end
      object TStaticText
        Left = 175
        Top = 14
        Width = 41
        Height = 17
        Alignment = taCenter
        AutoSize = False
        BevelKind = bkFlat
        Caption = 'Min'
        Color = clWhite
        ParentColor = False
        TabOrder = 2
      end
      object TStaticText
        Left = 399
        Top = 14
        Width = 41
        Height = 17
        Alignment = taCenter
        AutoSize = False
        BevelKind = bkFlat
        Caption = 'Max'
        Color = clWhite
        ParentColor = False
        TabOrder = 3
      end
      object GargleWaveForm: TRadioGroup
        Left = 24
        Top = 200
        Width = 145
        Height = 41
        Caption = ' Wave Form '
        Color = clBtnFace
        Columns = 2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ItemIndex = 0
        Items.Strings = (
          'Triangle'
          'Square')
        ParentColor = False
        ParentFont = False
        TabOrder = 4
        OnClick = GargleWaveFormClick
      end
    end
    object ParamEqPage: TTabSheet
      Caption = 'ParamEq'
      ImageIndex = 6
      object TLabel
        Left = 359
        Top = 130
        Width = 18
        Height = 13
        Caption = '13k'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object TLabel
        Left = 105
        Top = 130
        Width = 12
        Height = 13
        Caption = '80'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object TLabel
        Left = 134
        Top = 130
        Width = 18
        Height = 13
        Caption = '125'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object TLabel
        Left = 166
        Top = 130
        Width = 18
        Height = 13
        Caption = '250'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object TLabel
        Left = 198
        Top = 130
        Width = 18
        Height = 13
        Caption = '500'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object TLabel
        Left = 234
        Top = 130
        Width = 12
        Height = 13
        Caption = '1k'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object TLabel
        Left = 266
        Top = 130
        Width = 12
        Height = 13
        Caption = '2k'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object TLabel
        Left = 298
        Top = 130
        Width = 12
        Height = 13
        Caption = '4k'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object TLabel
        Left = 330
        Top = 130
        Width = 12
        Height = 13
        Caption = '8k'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object TLabel
        Left = 391
        Top = 130
        Width = 18
        Height = 13
        Caption = '16k'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object Max_dB: TLabel
        Left = 68
        Top = 25
        Width = 28
        Height = 13
        Caption = '15 dB'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
        OnDblClick = Max_dBDblClick
      end
      object Zero_dB: TLabel
        Left = 74
        Top = 73
        Width = 22
        Height = 13
        Caption = '0 dB'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
        OnDblClick = Zero_dBDblClick
      end
      object Min_dB: TLabel
        Left = 65
        Top = 118
        Width = 31
        Height = 13
        Caption = '-15 dB'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
        OnDblClick = Min_dBDblClick
      end
      object EQFreq13k: TTrackBar
        Tag = 8
        Left = 352
        Top = 24
        Width = 32
        Height = 107
        Max = 150
        Min = -150
        Orientation = trVertical
        Frequency = 15
        TabOrder = 8
        ThumbLength = 10
        TickMarks = tmBoth
        OnChange = EQTrackBarChanged
      end
      object EQFreq80: TTrackBar
        Left = 96
        Top = 24
        Width = 32
        Height = 107
        Max = 150
        Min = -150
        Orientation = trVertical
        Frequency = 15
        TabOrder = 0
        ThumbLength = 10
        TickMarks = tmBoth
        OnChange = EQTrackBarChanged
      end
      object EQFreq125: TTrackBar
        Tag = 1
        Left = 128
        Top = 24
        Width = 32
        Height = 107
        Max = 150
        Min = -150
        Orientation = trVertical
        Frequency = 15
        TabOrder = 1
        ThumbLength = 10
        TickMarks = tmBoth
        OnChange = EQTrackBarChanged
      end
      object EQFreq250: TTrackBar
        Tag = 2
        Left = 160
        Top = 24
        Width = 32
        Height = 107
        Max = 150
        Min = -150
        Orientation = trVertical
        Frequency = 15
        TabOrder = 2
        ThumbLength = 10
        TickMarks = tmBoth
        OnChange = EQTrackBarChanged
      end
      object EQFreq500: TTrackBar
        Tag = 3
        Left = 192
        Top = 24
        Width = 32
        Height = 107
        Max = 150
        Min = -150
        Orientation = trVertical
        Frequency = 15
        TabOrder = 3
        ThumbLength = 10
        TickMarks = tmBoth
        OnChange = EQTrackBarChanged
      end
      object EQFreq1k: TTrackBar
        Tag = 4
        Left = 224
        Top = 24
        Width = 32
        Height = 107
        Max = 150
        Min = -150
        Orientation = trVertical
        Frequency = 15
        TabOrder = 4
        ThumbLength = 10
        TickMarks = tmBoth
        OnChange = EQTrackBarChanged
      end
      object EQFreq2k: TTrackBar
        Tag = 5
        Left = 256
        Top = 24
        Width = 32
        Height = 107
        Max = 150
        Min = -150
        Orientation = trVertical
        Frequency = 15
        TabOrder = 5
        ThumbLength = 10
        TickMarks = tmBoth
        OnChange = EQTrackBarChanged
      end
      object EQFreq4k: TTrackBar
        Tag = 6
        Left = 288
        Top = 24
        Width = 32
        Height = 107
        Max = 150
        Min = -150
        Orientation = trVertical
        Frequency = 15
        TabOrder = 6
        ThumbLength = 10
        TickMarks = tmBoth
        OnChange = EQTrackBarChanged
      end
      object EQFreq8k: TTrackBar
        Tag = 7
        Left = 320
        Top = 24
        Width = 32
        Height = 107
        Max = 150
        Min = -150
        Orientation = trVertical
        Frequency = 15
        TabOrder = 7
        ThumbLength = 10
        TickMarks = tmBoth
        OnChange = EQTrackBarChanged
      end
      object EQFreq16k: TTrackBar
        Tag = 9
        Left = 384
        Top = 24
        Width = 32
        Height = 107
        Max = 150
        Min = -150
        Orientation = trVertical
        Frequency = 15
        TabOrder = 9
        ThumbLength = 10
        TickMarks = tmBoth
        OnChange = EQTrackBarChanged
      end
    end
    object ReverbPage: TTabSheet
      Caption = 'Reverb'
      ImageIndex = 5
      object TLabel
        Left = 183
        Top = 40
        Width = 24
        Height = 13
        Caption = '-96.0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object TLabel
        Left = 409
        Top = 40
        Width = 15
        Height = 13
        Caption = '0.0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object TLabel
        Left = 65
        Top = 40
        Width = 56
        Height = 13
        Caption = 'In Gain (dB)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object TLabel
        Left = 183
        Top = 72
        Width = 24
        Height = 13
        Caption = '-96.0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object TLabel
        Left = 409
        Top = 72
        Width = 15
        Height = 13
        Caption = '0.0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object TLabel
        Left = 45
        Top = 72
        Width = 76
        Height = 13
        Caption = 'Reverb Mix (dB)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object TLabel
        Left = 192
        Top = 104
        Width = 15
        Height = 13
        Caption = '0.0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object TLabel
        Left = 409
        Top = 104
        Width = 33
        Height = 13
        Caption = '3000.0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object TLabel
        Left = 38
        Top = 104
        Width = 83
        Height = 13
        Caption = 'Reverb Time (ms)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object TLabel
        Left = 186
        Top = 136
        Width = 21
        Height = 13
        Caption = '0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object TLabel
        Left = 409
        Top = 136
        Width = 21
        Height = 13
        Caption = '1.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object TLabel
        Left = 6
        Top = 136
        Width = 115
        Height = 13
        Caption = 'High Freq RT Ratio (x:1)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object ReverbInGain: TTrackBar
        Left = 208
        Top = 32
        Width = 201
        Height = 31
        Max = 0
        Min = -960
        Frequency = 48
        TabOrder = 0
        ThumbLength = 10
        TickMarks = tmBoth
        OnChange = ReverbInGainChange
      end
      object ReverbInGainValue: TStaticText
        Left = 127
        Top = 38
        Width = 41
        Height = 17
        Alignment = taCenter
        AutoSize = False
        BevelKind = bkFlat
        Caption = '0.0'
        Color = clWhite
        ParentColor = False
        TabOrder = 1
      end
      object ReverbMix: TTrackBar
        Left = 208
        Top = 64
        Width = 201
        Height = 32
        Max = 0
        Min = -960
        Frequency = 48
        TabOrder = 2
        ThumbLength = 10
        TickMarks = tmBoth
        OnChange = ReverbMixChange
      end
      object ReverbMixValue: TStaticText
        Left = 127
        Top = 70
        Width = 41
        Height = 17
        Alignment = taCenter
        AutoSize = False
        BevelKind = bkFlat
        Caption = '0.0'
        Color = clWhite
        ParentColor = False
        TabOrder = 3
      end
      object ReverbTime: TTrackBar
        Left = 208
        Top = 96
        Width = 201
        Height = 31
        Max = 30000
        Frequency = 1500
        Position = 10000
        TabOrder = 4
        ThumbLength = 10
        TickMarks = tmBoth
        OnChange = ReverbTimeChange
      end
      object ReverbTimeValue: TStaticText
        Left = 127
        Top = 102
        Width = 41
        Height = 17
        Alignment = taCenter
        AutoSize = False
        BevelKind = bkFlat
        Caption = '1000.0'
        Color = clWhite
        ParentColor = False
        TabOrder = 5
      end
      object ReverbHighFreqRTRatio: TTrackBar
        Left = 208
        Top = 128
        Width = 201
        Height = 32
        Max = 100
        Frequency = 5
        TabOrder = 6
        ThumbLength = 10
        TickMarks = tmBoth
        OnChange = ReverbHighFreqRTRatioChange
      end
      object ReverbHighFreqRTRatioValue: TStaticText
        Left = 127
        Top = 134
        Width = 41
        Height = 17
        Alignment = taCenter
        AutoSize = False
        BevelKind = bkFlat
        Caption = '0.00'
        Color = clWhite
        ParentColor = False
        TabOrder = 7
      end
      object TStaticText
        Left = 175
        Top = 14
        Width = 41
        Height = 17
        Alignment = taCenter
        AutoSize = False
        BevelKind = bkFlat
        Caption = 'Min'
        Color = clWhite
        ParentColor = False
        TabOrder = 8
      end
      object TStaticText
        Left = 399
        Top = 14
        Width = 41
        Height = 17
        Alignment = taCenter
        AutoSize = False
        BevelKind = bkFlat
        Caption = 'Max'
        Color = clWhite
        ParentColor = False
        TabOrder = 9
      end
    end
  end
  object Pan: TTrackBar
    Left = 141
    Top = 19
    Width = 129
    Height = 29
    Max = 10000
    Min = -10000
    Frequency = 2000
    TabOrder = 3
    ThumbLength = 10
    TickMarks = tmBoth
    OnChange = PanChange
  end
  object PanValue: TStaticText
    Left = 52
    Top = 25
    Width = 50
    Height = 17
    Alignment = taCenter
    AutoSize = False
    BevelKind = bkFlat
    Caption = '0'
    Color = clBlack
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    TabOrder = 4
  end
  object Freq: TTrackBar
    Left = 141
    Top = 45
    Width = 129
    Height = 29
    Max = 200000
    Min = 100
    Frequency = 20000
    Position = 100
    TabOrder = 5
    ThumbLength = 10
    TickMarks = tmBoth
    OnChange = FreqChange
  end
  object FreqValue: TStaticText
    Left = 52
    Top = 51
    Width = 50
    Height = 17
    Alignment = taCenter
    AutoSize = False
    BevelKind = bkFlat
    Caption = '0'
    Color = clBlack
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    TabOrder = 6
  end
  object FileEdit: TEdit
    Left = 37
    Top = 245
    Width = 193
    Height = 21
    ReadOnly = True
    TabOrder = 7
  end
  object DataSize: TStaticText
    Left = 108
    Top = 140
    Width = 82
    Height = 17
    Alignment = taCenter
    AutoSize = False
    BevelKind = bkFlat
    Caption = '0'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    TabOrder = 8
  end
  object BitsPerSample: TStaticText
    Left = 108
    Top = 164
    Width = 82
    Height = 17
    Alignment = taCenter
    AutoSize = False
    BevelKind = bkFlat
    Caption = '0'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    TabOrder = 9
  end
  object SamplesPerSecond: TStaticText
    Left = 108
    Top = 189
    Width = 82
    Height = 17
    Alignment = taCenter
    AutoSize = False
    BevelKind = bkFlat
    Caption = '0'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    TabOrder = 10
  end
  object Position: TTrackBar
    Left = 5
    Top = 298
    Width = 297
    Height = 20
    Max = 100
    TabOrder = 11
    ThumbLength = 10
    OnChange = PositionChange
  end
  object TrackBar1: TTrackBar
    Left = 37
    Top = 319
    Width = 273
    Height = 17
    Max = 2500
    Min = 1
    Frequency = 50
    Position = 420
    TabOrder = 14
    ThumbLength = 10
    OnChange = TrackBar1Change
  end
  object DeviceCombo: TComboBox
    Left = 72
    Top = 83
    Width = 129
    Height = 21
    Style = csDropDownList
    TabOrder = 15
    OnChange = DeviceComboChange
  end
  object Channels: TStaticText
    Left = 108
    Top = 115
    Width = 82
    Height = 17
    Alignment = taCenter
    AutoSize = False
    BevelKind = bkFlat
    Caption = '0'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    TabOrder = 17
  end
  object DurationText: TStaticText
    Left = 108
    Top = 214
    Width = 82
    Height = 17
    Alignment = taCenter
    AutoSize = False
    BevelKind = bkFlat
    Caption = '0'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    TabOrder = 19
  end
  object OpenDialog: TOpenDialog
    DefaultExt = '1'
    Filter = 
      'MPEG (*.mp3  *.mp2)|*.mp3;*.mp2|PCM Wave (*.wav)|*.wav|All Files' +
      ' (*.*)|*.*'
    Options = [ofReadOnly, ofEnableSizing]
    Left = 5
    Top = 101
  end
  object Timer: TTimer
    Enabled = False
    Interval = 1
    OnTimer = TimerTimer
    Left = 5
    Top = 188
  end
  object SaveDialog: TSaveDialog
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Left = 45
    Top = 101
  end
  object XPManifest1: TXPManifest
    Left = 5
    Top = 159
  end
end
