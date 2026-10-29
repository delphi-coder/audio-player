unit MainUnit;

{------------------------------------------------------------------------------
  ALTEK Audio Player - main form and playback engine

  This unit keeps the original visual/audio-player structure, but removes the
  old installed visual components and plugin-based architecture.  The form still
  uses the original DFM layout; custom displays are now drawn with standard VCL
  controls (TImage and TPaintBox) so the project is easier to build.

  Main responsibilities:
    * DirectSound device and secondary buffer creation
    * Loading decoded PCM data from AudioReader
    * DirectSound playback control, position, volume, pan and frequency
    * DirectSound effects configuration
    * Waveform, spectrum analyzer and LED-style VU meter rendering

  The project targets Delphi 7 compatibility first while also compiling in
  modern RAD Studio versions.  DirectSound buffer locking is routed through
  DSoundCompat to avoid header signature differences between compiler versions.
------------------------------------------------------------------------------}

interface

uses
  MMSystem, Windows, Messages, SysUtils, Variants, Classes,
  Graphics, Controls, Forms, Dialogs, DirectSound, DSoundCompat, StdCtrls,
  ComCtrls, ExtCtrls, ActiveX, CheckLst, Buttons,
  Math, AudioReader, SimpleFFT, XPMan;

const
  DESIRED_SAMPLERATE = 44100;
  DESIRED_CHANNELS   = 2;

type
  TDSEnumCallbackACompat = function(lpGuid: PGUID; lpcstrDescription,
    lpcstrModule: PAnsiChar; lpContext: Pointer): BOOL; stdcall;

  TMainForm = class(TForm)
    OpenDialog: TOpenDialog;
    Vol: TTrackBar;
    Timer: TTimer;
    EffectsEnable: TCheckListBox;
    PageControl: TPageControl;
    ChorusPage: TTabSheet;
    ChorusWetDryMix: TTrackBar;
    ChorusWetDryMixValue: TStaticText;
    ChorusDepth: TTrackBar;
    ChorusDepthValue: TStaticText;
    ChorusFeedback: TTrackBar;
    ChorusFeedbackValue: TStaticText;
    ChorusFrequency: TTrackBar;
    ChorusFrequencyValue: TStaticText;
    ChorusDelay: TTrackBar;
    ChorusDelayValue: TStaticText;
    ChorusWaveForm: TRadioGroup;
    ChorusPhase: TRadioGroup;
    CompressorPage: TTabSheet;
    CompressorGain: TTrackBar;
    CompressorGainValue: TStaticText;
    CompressorAttack: TTrackBar;
    CompressorAttackValue: TStaticText;
    CompressorRelease: TTrackBar;
    CompressorReleaseValue: TStaticText;
    CompressorTreshold: TTrackBar;
    CompressorTresholdValue: TStaticText;
    CompressorRatio: TTrackBar;
    CompressorRatioValue: TStaticText;
    CompressorPredelay: TTrackBar;
    CompressorPredelayValue: TStaticText;
    DistortionPage: TTabSheet;
    DistortionGain: TTrackBar;
    DistortionGainValue: TStaticText;
    DistortionEdge: TTrackBar;
    DistortionEdgeValue: TStaticText;
    DistortionPostEQCenterFreq: TTrackBar;
    DistortionPostEQCenterFreqValue: TStaticText;
    DistortionPostEQBandwidth: TTrackBar;
    DistortionPostEQBandwidthValue: TStaticText;
    DistortionPrelowpassCutoff: TTrackBar;
    DistortionPrelowpassCutoffValue: TStaticText;
    EchoPage: TTabSheet;
    EchoWetDryMix: TTrackBar;
    EchoWetDryMixValue: TStaticText;
    EchoFeedback: TTrackBar;
    EchoFeedbackValue: TStaticText;
    EchoLeftDelay: TTrackBar;
    EchoLeftDelayValue: TStaticText;
    EchoRightDelay: TTrackBar;
    EchoRightDelayValue: TStaticText;
    FlangerPage: TTabSheet;
    FlangerWetDryMix: TTrackBar;
    FlangerWetDryMixValue: TStaticText;
    FlangerDepth: TTrackBar;
    FlangerDepthValue: TStaticText;
    FlangerFeedback: TTrackBar;
    FlangerFeedbackValue: TStaticText;
    FlangerFrequency: TTrackBar;
    FlangerFrequencyValue: TStaticText;
    FlangerDelay: TTrackBar;
    FlangerDelayValue: TStaticText;
    FlangerWaveForm: TRadioGroup;
    FlangerPhase: TRadioGroup;
    GarglePage: TTabSheet;
    GargleRate: TTrackBar;
    GargleRateValue: TStaticText;
    GargleWaveForm: TRadioGroup;
    ParamEqPage: TTabSheet;
    Max_dB: TLabel;
    Zero_dB: TLabel;
    Min_dB: TLabel;
    EQFreq13k: TTrackBar;
    EQFreq80: TTrackBar;
    EQFreq125: TTrackBar;
    EQFreq250: TTrackBar;
    EQFreq500: TTrackBar;
    EQFreq1k: TTrackBar;
    EQFreq2k: TTrackBar;
    EQFreq4k: TTrackBar;
    EQFreq8k: TTrackBar;
    EQFreq16k: TTrackBar;
    ReverbPage: TTabSheet;
    ReverbInGain: TTrackBar;
    ReverbInGainValue: TStaticText;
    ReverbMix: TTrackBar;
    ReverbMixValue: TStaticText;
    ReverbTime: TTrackBar;
    ReverbTimeValue: TStaticText;
    ReverbHighFreqRTRatio: TTrackBar;
    ReverbHighFreqRTRatioValue: TStaticText;
    Pan: TTrackBar;
    PanValue: TStaticText;
    Freq: TTrackBar;
    FreqValue: TStaticText;
    FileEdit: TEdit;
    SpeedButton1: TSpeedButton;
    EchoSwapDelay: TCheckBox;
    DataSize: TStaticText;
    BitsPerSample: TStaticText;
    SamplesPerSecond: TStaticText;
    ADigitalViewMeter1: TPaintBox;
    ADigitalViewMeter2: TPaintBox;
    Image1: TImage;
    Image2: TImage;
    Position: TTrackBar;
    PlayFile: TButton;
    StopFile: TButton;
    Pause: TButton;
    NormFreq: TLabel;
    NormFreq1: TLabel;
    ExportButton: TButton;
    SaveDialog: TSaveDialog;
    TrackBar1: TTrackBar;
    Label1: TLabel;
    Label2: TLabel;
    MYSpectrumAnalyser1: TPaintBox;
    MYSpectrumAnalyser2: TPaintBox;
    DeviceCombo: TComboBox;
    XPManifest1: TXPManifest;
    Channels: TStaticText;
    DurationText: TStaticText;
    procedure FormCreate(Sender: TObject);
    procedure PlayFileClick(Sender: TObject);
    procedure StopFileClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure PanChange(Sender: TObject);
    procedure FreqChange(Sender: TObject);
    procedure VolChange(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Center1Change(Sender: TObject);
    procedure Center2Change(Sender: TObject);
    procedure OpenFileClick(Sender: TObject);
    procedure EffectsEnableClickCheck(Sender: TObject);
    procedure GargleRateChange(Sender: TObject);
    procedure GargleWaveFormClick(Sender: TObject);
    procedure CompressorGainChange(Sender: TObject);
    procedure CompressorAttackChange(Sender: TObject);
    procedure CompressorReleaseChange(Sender: TObject);
    procedure CompressorTresholdChange(Sender: TObject);
    procedure CompressorRatioChange(Sender: TObject);
    procedure CompressorPredelayChange(Sender: TObject);
    procedure EchoWetDryMixChange(Sender: TObject);
    procedure EchoFeedbackChange(Sender: TObject);
    procedure EchoLeftDelayChange(Sender: TObject);
    procedure EchoRightDelayChange(Sender: TObject);
    procedure EchoSwapDelayClick(Sender: TObject);
    procedure FlangerWetDryMixChange(Sender: TObject);
    procedure FlangerDepthChange(Sender: TObject);
    procedure FlangerFeedbackChange(Sender: TObject);
    procedure FlangerFrequencyChange(Sender: TObject);
    procedure FlangerDelayChange(Sender: TObject);
    procedure FlangerWaveFormClick(Sender: TObject);
    procedure FlangerPhaseClick(Sender: TObject);
    procedure ChorusDelayChange(Sender: TObject);
    procedure ChorusDepthChange(Sender: TObject);
    procedure ChorusFeedbackChange(Sender: TObject);
    procedure ChorusFrequencyChange(Sender: TObject);
    procedure ChorusPhaseClick(Sender: TObject);
    procedure ChorusWaveFormClick(Sender: TObject);
    procedure ChorusWetDryMixChange(Sender: TObject);
    procedure EQTrackBarChanged(Sender: TObject);
    procedure Max_dBDblClick(Sender: TObject);
    procedure Zero_dBDblClick(Sender: TObject);
    procedure Min_dBDblClick(Sender: TObject);
    procedure ReverbInGainChange(Sender: TObject);
    procedure ReverbMixChange(Sender: TObject);
    procedure ReverbTimeChange(Sender: TObject);
    procedure ReverbHighFreqRTRatioChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure PositionChanged(Sender: TObject);
    procedure ChorusLabelClick(Sender: TObject);
    procedure CompresorLableClick(Sender: TObject);
    procedure DistortionLabelClick(Sender: TObject);
    procedure EchoLabelClick(Sender: TObject);
    procedure FlangerLabelClick(Sender: TObject);
    procedure GargleLabelClick(Sender: TObject);
    procedure ParamEqLabelClick(Sender: TObject);
    procedure ReverbLabelClick(Sender: TObject);
    procedure PauseClick(Sender: TObject);
    procedure NormFreqClick(Sender: TObject);
    procedure ExportButtonClick(Sender: TObject);
    procedure DistortionPrelowpassCutoffChange(Sender: TObject);
    procedure DistortionPostEQBandwidthChange(Sender: TObject);
    procedure DistortionPostEQCenterFreqChange(Sender: TObject);
    procedure DistortionEdgeChange(Sender: TObject);
    procedure DistortionGainChange(Sender: TObject);
    procedure TrackBar1Change(Sender: TObject);
    procedure PositionChange(Sender: TObject);
    procedure DeviceComboChange(Sender: TObject);
  private
    { Form state, DirectSound handles and visual rendering helpers. }
    CurrentPosition: Cardinal;
    OldCurrentPosition: Cardinal;
    DSEnumPointer: TDSEnumCallbackACompat;
    procedure ReopenFile;
    procedure DistortionChanged;
    procedure FreeSoundBuffers;
    procedure CreateEffect;
    procedure GargleChanged;
    procedure ClearEffects;
    procedure DrawWave;
    procedure DrawFFT;
    procedure DrawVUMeter(Meter: TPaintBox; Value: Integer);
    procedure DrawSpectrumBox(Box: TPaintBox; const Values: array of Integer);
    procedure MeterPaint(Sender: TObject);
    procedure SpectrumPaint(Sender: TObject);
    procedure AddEffect(GUID: TGUID; Count: Integer);
    procedure CompressorChanged;
    procedure EchoChanged;
    procedure FlangerChanged;
    procedure ChorusChanged;
    procedure LoadEqDefaults;
    procedure EQParamChanged;
    procedure ReverbParamChanged;
    Procedure AllLabelsLower;
    procedure CalcMinMax(Buf, EndBuf: Pointer; BlockAlign, Len: Cardinal; LR:Boolean; var Min, Max: SmallInt);
  public
    { Audio format, decoded PCM buffer and live visual state. }
    MyFormat : tWAVEFORMATEX;
    Spectrum1: array [0..512]  of Integer;
    Spectrum2: array [0..512]  of Integer;
    Paused: Boolean;
    WaveColor: TColor;
    BufSize1, BufSize2: Cardinal;
    Buf1, Buf2: Pointer;
    FileFrequency: Cardinal;
    MeterInterval : Integer;
    LastLMeterValue: Integer;
    LastRMeterValue: Integer;
    Tst : Boolean;
//    OutputFile : TFileStream;
    LastPlayPos : Cardinal;
    Scale: Cardinal;
  end;

function AltekDirectSoundEnumerateA(lpDSEnumCallback: TDSEnumCallbackACompat;
  lpContext: Pointer): HResult; stdcall; external 'dsound.dll' name 'DirectSoundEnumerateA';

function DSEnumerate(lpGuid: PGUID; lpcstrDescription, lpcstrModule: PAnsiChar;
lpContext: Pointer): BOOL; stdcall;

var
  MainForm: TMainForm;

implementation

//uses Unit1;

{$R *.dfm}

type
  TEffectParams = record
    DSFXChorus: TDSFXChorus;
    DSFXCompressor: TDSFXCompressor;
    DSFXDistortion: TDSFXDistortion;
    DSFXEcho: TDSFXEcho;
    DSFXFlanger: TDSFXFlanger;
    DSFXGargle: TDSFXGargle;
    DSFXParamEq: array[0..9] of TDSFXParamEq;
    DSFXReverb: TDSFXWavesReverb;
  end;

  TEffectInterfaces = record
    Chorus: IDirectSoundFXChorus8;
    Compressor: IDirectSoundFXCompressor8;
    Distortion: IDirectSoundFXDistortion8;
    Echo: IDirectSoundFXEcho8;
    Flanger: IDirectSoundFXFlanger8;
    Gargle: IDirectSoundFXGargle8;
    ParamEq: array[0..9] of IDirectSoundFXParamEq8;
    Reverb: IDirectSoundFXWavesReverb8;
  end;

  TEffects = record
    Parameters: TEffectParams;
    Interfaces: TEffectInterfaces;
  end;

var
  DS: IDirectSound8;
  TempBuf: IDirectSoundBuffer;
  PrimaryBuf: IDirectSoundBuffer8;
  SecondaryBuf: array[0..7] of IDirectSoundBuffer8;
  Effects: array[0..7] of TEffects;
  WaveFormat: TWaveFormatEx;
  DDRes: Integer;
  DSBD: TDSBufferDesc;
  DSFXRes: array of Integer;
  DSFXDesc: array of TDSEffectDesc;
  FreqArray: array[0..9] of Integer      = (80, 125, 250, 500, 1000, 2000, 4000, 8000, 13000, 16000);
  BandwidthArray: array[0..9] of Integer = ( 1,   1,   1,   1,    1,    2,    2,    3,     3,     3);

procedure TMainForm.FormCreate(Sender: TObject);
begin
  Scale := 10;

  { The original project used installed visual components for the VU meters
    and spectrum analyzers. In this refactored version they are plain
    TPaintBox controls, so we attach paint handlers here. This makes the
    empty/idle controls paint themselves as black panels immediately, even
    before an audio file is loaded. }
  ADigitalViewMeter1.OnPaint := MeterPaint;
  ADigitalViewMeter2.OnPaint := MeterPaint;
  MYSpectrumAnalyser1.OnPaint := SpectrumPaint;
  MYSpectrumAnalyser2.OnPaint := SpectrumPaint;
  CoInitialize(nil);
  DSEnumPointer := DSEnumerate;
  AltekDirectSoundEnumerateA(DSEnumPointer, nil);
  DeviceCombo.ItemIndex := 0;
  DirectSoundCreate8(nil, DS, nil);
  DS.SetCooperativeLevel(Handle, DSSCL_PRIORITY);
  FillChar(DSBD, SizeOf(DSBD), 0);
  with DSBD do begin
    dwSize := SizeOf(DSBD);
    dwFlags := DSBCAPS_PRIMARYBUFFER;
  end;
  DDRes := DS.CreateSoundBuffer(DSBD, TempBuf, nil);
//  TempBuf.QueryInterface(IDirectSoundBuffer8, PrimaryBuf);
  FreeSoundBuffers;
  Set8087CW(Get8087CW or 1);
end;

procedure TMainForm.PlayFileClick(Sender: TObject);
begin
  if SecondaryBuf[0]<>nil Then
  Begin
    DDRes := SecondaryBuf[0].SetCurrentPosition(0);
    DDRes := SecondaryBuf[0].SetFrequency(Freq.Position);
    DDRes := SecondaryBuf[0].SetPan(0);
    DDRes := SecondaryBuf[0].Stop;
    DDRes := SecondaryBuf[0].Play(0, 0, 0);
    //DSERR_OUTOFMEMORY
    Paused := False;
    Timer.Enabled := True;
    Tst := True;
  End;
end;

procedure TMainForm.StopFileClick(Sender: TObject);
var
  i: Integer;
begin
  Timer.Enabled := False;
  for i := 0 to 7 do
    if SecondaryBuf[i] <> nil then
      SecondaryBuf[i].Stop;
end;

procedure TMainForm.FormDestroy(Sender: TObject);
begin
  Set8087CW(Get8087CW xor 1);
  StopFileClick(nil);
  FreeSoundBuffers;
  DS := nil;
  CoUninitialize;
end;

procedure TMainForm.PanChange(Sender: TObject);
begin
  if SecondaryBuf[0] <> nil then
    DDRes := SecondaryBuf[0].SetPan(Pan.Position);
  PanValue.Caption := IntToStr(Pan.Position);
end;

procedure TMainForm.FreqChange(Sender: TObject);
begin
  if SecondaryBuf[0] <> nil then
    DDRes := SecondaryBuf[0].SetFrequency(Freq.Position);
  FreqValue.Caption := IntToStr(Freq.Position);
end;

procedure TMainForm.VolChange(Sender: TObject);
begin
  if SecondaryBuf[0] <> nil Then
    DDRes := SecondaryBuf[0].SetVolume(Vol.Min-Vol.Position);
end;

procedure TMainForm.TimerTimer(Sender: TObject);
var
  x: Integer;
  Status : Cardinal;
  OnChangeEvent: procedure (Sender: TObject) of Object;
begin
  SecondaryBuf[0].GetStatus(Status);
  if Status And DSBSTATUS_PLAYING <> 0 Then
  Begin
    SecondaryBuf[0].GetCurrentPosition(@CurrentPosition, nil);
    DrawWave;
    DrawFFT;
  End
  else
  begin
    //Image3.Bitmap.Clear;
    //Image4.Bitmap.Clear;
  end;
  SecondaryBuf[0].GetCurrentPosition(@x, nil);
  OnChangeEvent := Position.OnChange;
  Position.OnChange := nil;
  Position.Position := x;
  Position.OnChange := OnChangeEvent;
end;

procedure TMainForm.Button3Click(Sender: TObject);
var
  Res: array[0..1] of Integer;
  DSFXDesc: array[0..1] of TDSEffectDesc;
begin
  SecondaryBuf[0].Stop;
  FillChar(DSFXDesc, SizeOf(DSFXDesc), 0);
  FillChar(Res, Sizeof(Res), 0);
  with DSFXDesc[0] do begin
    dwSize := SizeOf(DSFXDesc[0]);
    dwFlags := 0;
    guidDSFXClass := GUID_DSFX_STANDARD_PARAMEQ;
  end;
  DSFXDesc[1] := DSFXDesc[0];
  SecondaryBuf[0].SetFX(2, @DSFXDesc, @Res);
//  ParamEq.GetAllParameters(DSFXParamEq);
//  ParamEq.SetAllParameters(DSFXParamEq);
//  Echo.GetAllParameters(DSFXEcho);
//  Echo.SetAllParameters(DSFXEcho);
//  Caption := IntToStr(Result);
  SecondaryBuf[0].Play(0, 0, 0);
end;

procedure TMainForm.Center1Change(Sender: TObject);
begin
//  ParamEq.SetAllParameters(DSFXParamEq);
//  SecondaryBuf[0].GetCurrentPosition(@Pos, 0);
//  SecondaryBuf[0].SetCurrentPosition(Pos);
end;

procedure TMainForm.Center2Change(Sender: TObject);
begin
//  ParamEq2.SetAllParameters(DSFXParamEq);
end;

procedure TMainForm.OpenFileClick(Sender: TObject);
var
  AudioReader : TAudioFile;
  NumberOfSamples: Int64;
  ReadSamples1: Cardinal;
  TmpEvent: TNotifyEvent;
  Duration: Int64;
begin
  if Sender<>Self then
    if not OpenDialog.Execute then Exit;

  { When loading a second file, release the previous DirectSound secondary
    buffer before DirectShow builds its temporary decode graph.
    Otherwise Windows can keep the old DirectSound path alive and the next
    RenderFile/SampleGrabber insertion may fail with messages such as:
    "Pins cannot connect due to not supporting the same transport." }
  StopFileClick(nil);
  FreeSoundBuffers;

  Application.ProcessMessages;
  Sleep(100);
  FileEdit.Text := OpenDialog.FileName;
  AudioReader := TAudioFile.Create;
  MyFormat.nChannels := DESIRED_CHANNELS;
  MyFormat.nSamplesPerSec := DESIRED_SAMPLERATE;
  MyFormat.nAvgBytesPerSec := DESIRED_SAMPLERATE*4;
  MyFormat.wBitsPerSample := 16;
  MyFormat.cbSize := 0;
  MyFormat.nBlockAlign := 4;
  MyFormat.wFormatTag := WAVE_FORMAT_PCM;
{
  MyFormat.nChannels := 2;
  MyFormat.nSamplesPerSec := 44100;
  MyFormat.nAvgBytesPerSec := 44100*4;
  MyFormat.wBitsPerSample := 16;
  MyFormat.cbSize := 0;
  MyFormat.nBlockAlign := 4;
  MyFormat.wFormatTag := WAVE_FORMAT_PCM;
}


  //  AudioReader.DesiredFormat.SetDesiredFormat(MyFormat);
//  AudioReader.OpenAudioFile(PChar(OpenDialog.FileName));
//  MyFormat := AudioReader.FileFormat;
  AudioReader.DesiredFormat := MyFormat;
  try
    if not AudioReader.OpenAudioFile(PChar(OpenDialog.FileName)) then
    begin
      ShowMessage('This audio file could not be decoded by the installed DirectShow filters.' + #13#10 +
        'Try another MP3 file, or convert this file to WAV/standard MP3.');
      AudioReader.Free;
      Exit;
    end;
  except
    on E: Exception do
    begin
      ShowMessage('This audio file could not be decoded by the installed DirectShow filters.' + #13#10 +
        'Try another MP3 file, or convert this file to WAV/standard MP3.' + #13#10#13#10 +
        'Technical detail: ' + E.Message);
      AudioReader.Free;
      Exit;
    end;
  end;
  FillChar(DSBD, SizeOf(DSBD), 0);
  with DSBD do begin
    dwSize := SizeOf(DSBD);
    dwFlags := DSBCAPS_CTRLVOLUME + DSBCAPS_CTRLFX + DSBCAPS_CTRLPAN + DSBCAPS_CTRLFREQUENCY + DSBCAPS_GLOBALFOCUS;
    WaveFormat:= AudioReader.FileFormat;
//    MyFormat := WaveFormat;
    lpwfxFormat := @MyFormat;
    { Use the requested PCM output format for DirectSound buffer size.
      Do not depend on the source/decoder format here; MP3 DirectShow filters
      can report different intermediate formats on different Windows versions. }
    dwBufferBytes := Round((AudioReader.Duration / 10000000) * MyFormat.nAvgBytesPerSec);
    NumberOfSamples := dwBufferBytes div MyFormat.nBlockAlign;//((MyFormat.wBitsPerSample shr 3) shl (MyFormat.nChannels-1));
    Freq.Position := MyFormat.nSamplesPerSec;
    Pan.Position := 0;
    Channels.Caption := IntToStr(MyFormat.nChannels);
    DataSize.Caption := IntToStr(dwBufferBytes);
    BitsPerSample.Caption := IntToStr(MyFormat.wBitsPerSample);
    SamplesPerSecond.Caption := IntToStr(MyFormat.nSamplesPerSec);
  end;

  Duration := (AudioReader.Duration div 10000000);
  DurationText.Caption := Format('%.2d',[(Duration div 3600)])+':'+Format('%.2d',[((Duration mod 3600) div 60)])+':'+Format('%.2d',[((Duration mod 3600) mod 60)]);

  DDRes := DS.CreateSoundBuffer(DSBD, TempBuf, nil);
  TempBuf.QueryInterface(IDirectSoundBuffer8, SecondaryBuf[0]);
  DDRes := DSBufferLock(SecondaryBuf[0], 0, DSBD.dwBufferBytes, Buf1, BufSize1,
                       Buf2, BufSize2, DSBLOCK_ENTIREBUFFER);
  if NumberOfSamples > High(Cardinal) then
    ReadSamples1 := AudioReader.ReadAudioData(Buf1, High(Cardinal))
  else
    ReadSamples1 := AudioReader.ReadAudioData(Buf1, Cardinal(NumberOfSamples));
  if BufSize2 <> 0 then
    AudioReader.ReadAudioData(Buf2, BufSize2 div MyFormat.nBlockAlign);
  AudioReader.CloseAudioFile;
  AudioReader.Free;
  FileFrequency := DSBD.lpwfxFormat.nSamplesPerSec;
  DDRes := SecondaryBuf[0].Unlock(Buf1, BufSize1, Buf2, BufSize2);
  TmpEvent := Position.OnChange;
  Position.OnChange := nil;
  Position.Max := DSBD.dwBufferBytes;
  Position.OnChange := TmpEvent;
  EffectsEnableClickCheck(nil);
end;

procedure TMainForm.FreeSoundBuffers;
var
  i: Integer;
begin
  ClearEffects;
  TempBuf := nil;
  for i := 0 to 7 do
    SecondaryBuf[i] := nil;
end;

procedure TMainForm.CreateEffect;
var
  i, n: Integer;
  Status: Cardinal;
  Res: HRESULT;
begin
  n := Length(DSFXDesc);
  SetLength(DSFXRes, n);
  SecondaryBuf[0].GetStatus(Status);
  SecondaryBuf[0].Stop;
  if n > 0 then begin
    FillChar(DSFXRes[0], Sizeof(DSFXRes[0]), 0);
    for i := 1 to n-1 do
      DSFXRes[i] := DSFXRes[i-1];
  end;
  if n <> 0 then
    Res := SecondaryBuf[0].SetFX(n, @DSFXDesc[0], @DSFXRes[0])
  else
    Res := SecondaryBuf[0].SetFX(n, nil, nil);

  if Res<>DS_OK then
  begin
    ShowMessage(IntToHex(Res,16));
  end;

  if Status and DSBSTATUS_PLAYING <> 0 then
    SecondaryBuf[0].Play(0, 0, 0);
end;

procedure TMainForm.EffectsEnableClickCheck(Sender: TObject);
var
  i, j : Integer;
begin
  if SecondaryBuf[0] = nil then Exit;
  ClearEffects;
  for i := 0 to 7 do begin
    if EffectsEnable.Checked[i] then
      case i of
        0 : AddEffect(GUID_DSFX_STANDARD_CHORUS, 1);
        1 : AddEffect(GUID_DSFX_STANDARD_COMPRESSOR, 1);
        2 : AddEffect(GUID_DSFX_STANDARD_DISTORTION, 1);
        3 : AddEffect(GUID_DSFX_STANDARD_ECHO, 1);
        4 : AddEffect(GUID_DSFX_STANDARD_FLANGER, 1);
        5 : AddEffect(GUID_DSFX_STANDARD_GARGLE, 1);
        6 : AddEffect(GUID_DSFX_STANDARD_PARAMEQ, 10);
        7 : AddEffect(GUID_DSFX_WAVES_REVERB, 1);
      end;
  end;
  CreateEffect;
//  Index := 0;
  for i := 0 to 7 do
    if EffectsEnable.Checked[i] then
      case i of
        0 : begin
              SecondaryBuf[0].GetObjectInPath(GUID_DSFX_STANDARD_CHORUS, 0, IDirectSoundFXChorus8, Effects[0].Interfaces.Chorus);
              ChorusChanged;
//              Inc(Index);
            end;
        1 : begin
              SecondaryBuf[0].GetObjectInPath(GUID_DSFX_STANDARD_COMPRESSOR, 0, IDirectSoundFXCompressor8, Effects[0].Interfaces.Compressor);
              CompressorChanged;
//              Inc(Index);
            end;
        2 : begin
              SecondaryBuf[0].GetObjectInPath(GUID_DSFX_STANDARD_DISTORTION, 0, IDirectSoundFXDistortion8, Effects[0].Interfaces.Distortion);
//              Inc(Index);
            end;
        3 : begin
              SecondaryBuf[0].GetObjectInPath(GUID_DSFX_STANDARD_ECHO, 0, IDirectSoundFXEcho8, Effects[0].Interfaces.Echo);
              EchoChanged;
//              Inc(Index);
            end;
        4 : begin
              SecondaryBuf[0].GetObjectInPath(GUID_DSFX_STANDARD_FLANGER, 0, IDirectSoundFXFlanger8, Effects[0].Interfaces.Flanger);
              FlangerChanged;
//              Inc(Index);
            end;
        5 : begin
              SecondaryBuf[0].GetObjectInPath(GUID_DSFX_STANDARD_GARGLE, 0, IDirectSoundFXGargle8, Effects[0].Interfaces.Gargle);
              GargleChanged;
//              Inc(Index);
            end;
        6 : begin
              for j := 0 to 9 do
              SecondaryBuf[0].GetObjectInPath(GUID_DSFX_STANDARD_PARAMEQ, j, IDirectSoundFXParamEq8, Effects[0].Interfaces.ParamEq[j]);
//              Inc(Index, 10);
              EQParamChanged;
            end;
        7 : begin
              SecondaryBuf[0].GetObjectInPath(GUID_DSFX_WAVES_REVERB, 0, IDirectSoundFXWavesReverb8, Effects[0].Interfaces.Reverb);//IID_IDirectSoundFXI3DL2Reverb8
//              Inc(Index);
              ReverbParamChanged;
            end;
      end;
end;

procedure TMainForm.GargleRateChange(Sender: TObject);
begin
  GargleRateValue.Caption := IntToStr(GargleRate.Position)+'.0';
  GargleChanged;
end;

procedure TMainForm.GargleChanged;
begin
  with Effects[0] do
    if Interfaces.Gargle <> nil then begin
      with Parameters.DSFXGargle do begin
        dwRateHz := GargleRate.Position;
        dwWaveShape := GargleWaveForm.ItemIndex;
      end;
      Interfaces.Gargle.SetAllParameters(Parameters.DSFXGargle);
    end;
end;

procedure TMainForm.GargleWaveFormClick(Sender: TObject);
begin
  GargleChanged;
end;

procedure TMainForm.AddEffect(GUID: TGUID; Count: Integer);
var
  i, n: Integer;
begin
  if Count <= 0 then Exit;
  n := Length(DSFXDesc);
  SetLength(DSFXDesc, n+Count);
  FillChar(DSFXDesc[n], SizeOf(DSFXDesc[n]), 0);
  with DSFXDesc[n] do begin
    dwSize := SizeOf(DSFXDesc[n]);
    dwFlags := 0;
    guidDSFXClass := GUID;
  end;
  for i := n+1 to n+Count-1 do
    DSFXDesc[i] := DSFXDesc[i-1];
end;

procedure TMainForm.ClearEffects;
var
  i, j: Integer;
begin
  for i := 0 to 7 do
    with Effects[i].Interfaces do begin
      Chorus := nil;
      Compressor := nil;
      Distortion := nil;
      Echo := nil;
      Flanger := nil;
      Gargle := nil;
      for j := 0 to 9 do
        ParamEq[j] := nil;
      Reverb := nil;
    end;
  SetLength(DSFXRes, 0);
  SetLength(DSFXDesc, 0);
  LoadEqDefaults;
end;

procedure TMainForm.CompressorGainChange(Sender: TObject);
begin
  CompressorGainValue.Caption := FloatToStr(CompressorGain.Position/10);
  CompressorChanged;
end;

procedure TMainForm.CompressorAttackChange(Sender: TObject);
begin
  CompressorAttackValue.Caption := FloatToStr(CompressorAttack.Position/10);
  CompressorChanged;
end;

procedure TMainForm.CompressorReleaseChange(Sender: TObject);
begin
  CompressorReleaseValue.Caption := FloatToStr(CompressorRelease.Position/10);
  CompressorChanged;
end;

procedure TMainForm.CompressorTresholdChange(Sender: TObject);
begin
  CompressorTresholdValue.Caption := FloatToStr(CompressorTreshold.Position/10);
  CompressorChanged;
end;

procedure TMainForm.CompressorRatioChange(Sender: TObject);
begin
  CompressorRatioValue.Caption := FloatToStr(CompressorRatio.Position/10);
  CompressorChanged;
end;

procedure TMainForm.CompressorPredelayChange(Sender: TObject);
begin
  CompressorPredelayValue.Caption := FloatToStr(CompressorPredelay.Position/100);
  CompressorChanged;
end;

procedure TMainForm.CompressorChanged;
begin
  with Effects[0] do
    if Interfaces.Compressor <> nil then begin
      with Parameters.DSFXCompressor do begin
        fGain := CompressorGain.Position / 10;
        fAttack := CompressorAttack.Position /10;
        fRelease := CompressorRelease.Position /10;
        fThreshold := CompressorTreshold.Position /10;
        fRatio := CompressorRatio.Position /10;
        fPredelay := CompressorPredelay.Position;
      end;
      Interfaces.Compressor.SetAllParameters(Parameters.DSFXCompressor);
    end;
end;

procedure TMainForm.EchoWetDryMixChange(Sender: TObject);
begin
  EchoWetDryMixValue.Caption := FloatToStr(EchoWetDryMix.Position/10);
  EchoChanged;
end;

procedure TMainForm.EchoFeedbackChange(Sender: TObject);
begin
  EchoFeedbackValue.Caption := FloatToStr(EchoFeedback.Position/10);
  EchoChanged;
end;

procedure TMainForm.EchoLeftDelayChange(Sender: TObject);
begin
  EchoLeftDelayValue.Caption := FloatToStr(EchoLeftDelay.Position/10);
  EchoChanged;
end;

procedure TMainForm.EchoRightDelayChange(Sender: TObject);
begin
  EchoRightDelayValue.Caption := FloatToStr(EchoRightDelay.Position/10);
  EchoChanged;
end;

procedure TMainForm.EchoSwapDelayClick(Sender: TObject);
begin
  EchoChanged;
end;

procedure TMainForm.EchoChanged;
begin
  with Effects[0] do
    if Interfaces.Echo <> nil then begin
      with Parameters.DSFXEcho do begin
        fWetDryMix := EchoWetDryMix.Position / 10;
        fFeedback := EchoFeedback.Position /10;
        fLeftDelay := EchoLeftDelay.Position /10;
        fRightDelay := EchoRightDelay.Position /10;
        lPanDelay := Integer(EchoSwapDelay.Checked);
      end;
      Interfaces.Echo.SetAllParameters(Parameters.DSFXEcho);
    end;
end;

procedure TMainForm.FlangerWetDryMixChange(Sender: TObject);
begin
  FlangerWetDryMixValue.Caption := FloatToStr(FlangerWetDryMix.Position/10);
  FlangerChanged;
end;

procedure TMainForm.FlangerDepthChange(Sender: TObject);
begin
  FlangerDepthValue.Caption := FloatToStr(FlangerDepth.Position/10);
  FlangerChanged;
end;

procedure TMainForm.FlangerFeedbackChange(Sender: TObject);
begin
  FlangerFeedbackValue.Caption := FloatToStr(FlangerFeedback.Position/10);
  FlangerChanged;
end;

procedure TMainForm.FlangerFrequencyChange(Sender: TObject);
begin
  FlangerFrequencyValue.Caption := FloatToStr(FlangerFrequency.Position/100);
  FlangerChanged;
end;

procedure TMainForm.FlangerDelayChange(Sender: TObject);
begin
  FlangerDelayValue.Caption := FloatToStr(FlangerDelay.Position/100);
  FlangerChanged;
end;

procedure TMainForm.FlangerWaveFormClick(Sender: TObject);
begin
  FlangerChanged;
end;

procedure TMainForm.FlangerPhaseClick(Sender: TObject);
begin
  FlangerChanged;
end;

procedure TMainForm.FlangerChanged;
begin
  with Effects[0] do
    if Interfaces.Flanger <> nil then begin
      with Parameters.DSFXFlanger do begin
        fWetDryMix := FlangerWetDryMix.Position / 10;
        fDepth := FlangerDepth.Position/10;
        fFeedback := FlangerFeedback.Position /10;
        fFrequency := FlangerFrequency.Position/100;
        lWaveform := FlangerWaveForm.ItemIndex;
        fDelay := FlangerDelay.Position/100;
        lPhase := FlangerPhase.ItemIndex;
      end;
      Interfaces.Flanger.SetAllParameters(Parameters.DSFXFlanger);
    end;
end;

procedure TMainForm.ChorusWetDryMixChange(Sender: TObject);
begin
  ChorusWetDryMixValue.Caption := FloatToStr(ChorusWetDryMix.Position/10);
  ChorusChanged;
end;

procedure TMainForm.ChorusDepthChange(Sender: TObject);
begin
  ChorusDepthValue.Caption := FloatToStr(ChorusDepth.Position/10);
  ChorusChanged;
end;

procedure TMainForm.ChorusFeedbackChange(Sender: TObject);
begin
  ChorusFeedbackValue.Caption := FloatToStr(ChorusFeedback.Position/10);
  ChorusChanged;
end;

procedure TMainForm.ChorusFrequencyChange(Sender: TObject);
begin
  ChorusFrequencyValue.Caption := FloatToStr(ChorusFrequency.Position/10);
  ChorusChanged;
end;

procedure TMainForm.ChorusDelayChange(Sender: TObject);
begin
  ChorusDelayValue.Caption := FloatToStr(ChorusDelay.Position/10);
  ChorusChanged;
end;

procedure TMainForm.ChorusWaveFormClick(Sender: TObject);
begin
  ChorusChanged;
end;

procedure TMainForm.ChorusPhaseClick(Sender: TObject);
begin
  ChorusChanged;
end;

procedure TMainForm.ChorusChanged;
begin
  with Effects[0] do
    if Interfaces.Chorus <> nil then begin
      with Parameters.DSFXChorus do begin
        fWetDryMix := ChorusWetDryMix.Position / 10;
        fDepth := ChorusDepth.Position/10;
        fFeedback := ChorusFeedback.Position /10;
        fFrequency := ChorusFrequency.Position/10;
        lWaveform := ChorusWaveForm.ItemIndex;
        fDelay := ChorusDelay.Position/10;
        lPhase := ChorusPhase.ItemIndex;
      end;
      Interfaces.Chorus.SetAllParameters(Parameters.DSFXChorus);
    end;
end;

procedure TMainForm.LoadEqDefaults;
var
  i, j: Integer;
begin
  for i := 0 to 7 do
    with Effects[i].Parameters do
      for j := 0 to 9 do
        with DSFXParamEq[j] do begin
          fCenter := FreqArray[j];
          fBandwidth := BandwidthArray[j];
        end;
end;

procedure TMainForm.EQTrackBarChanged(Sender: TObject);
begin
  with Sender as TTrackBar do
    if Effects[0].Interfaces.ParamEq[Tag] <> nil then begin
      Effects[0].Parameters.DSFXParamEq[Tag].fGain := -Position/10;
      Effects[0].Interfaces.ParamEq[Tag].SetAllParameters(Effects[0].Parameters.DSFXParamEq[Tag]);
    end;
end;

procedure TMainForm.EQParamChanged;
begin
  EQTrackBarChanged(EQFreq80);
  EQTrackBarChanged(EQFreq125);
  EQTrackBarChanged(EQFreq250);
  EQTrackBarChanged(EQFreq500);
  EQTrackBarChanged(EQFreq1k);
  EQTrackBarChanged(EQFreq2k);
  EQTrackBarChanged(EQFreq4k);
  EQTrackBarChanged(EQFreq8k);
  EQTrackBarChanged(EQFreq13k);
  EQTrackBarChanged(EQFreq16k);
end;

procedure TMainForm.Max_dBDblClick(Sender: TObject);
begin
  EQFreq80.Position := -150;
  EQFreq125.Position := -150;
  EQFreq250.Position := -150;
  EQFreq500.Position := -150;
  EQFreq1k.Position := -150;
  EQFreq2k.Position := -150;
  EQFreq4k.Position := -150;
  EQFreq8k.Position := -150;
  EQFreq13k.Position := -150;
  EQFreq16k.Position := -150;
end;

procedure TMainForm.Zero_dBDblClick(Sender: TObject);
begin
  EQFreq80.Position := 0;
  EQFreq125.Position := 0;
  EQFreq250.Position := 0;
  EQFreq500.Position := 0;
  EQFreq1k.Position := 0;
  EQFreq2k.Position := 0;
  EQFreq4k.Position := 0;
  EQFreq8k.Position := 0;
  EQFreq13k.Position := 0;
  EQFreq16k.Position := 0;
end;

procedure TMainForm.Min_dBDblClick(Sender: TObject);
begin
  EQFreq80.Position := 150;
  EQFreq125.Position := 150;
  EQFreq250.Position := 150;
  EQFreq500.Position := 150;
  EQFreq1k.Position := 150;
  EQFreq2k.Position := 150;
  EQFreq4k.Position := 150;
  EQFreq8k.Position := 150;
  EQFreq13k.Position := 150;
  EQFreq16k.Position := 150;
end;

procedure TMainForm.ReverbInGainChange(Sender: TObject);
begin
  ReverbInGainValue.Caption := FloatToStr(ReverbInGain.Position / 10);
  ReverbParamChanged;
end;

procedure TMainForm.ReverbMixChange(Sender: TObject);
begin
  ReverbMixValue.Caption := FloatToStr(ReverbMix.Position / 10);
  ReverbParamChanged;
end;

procedure TMainForm.ReverbTimeChange(Sender: TObject);
begin
  ReverbTimeValue.Caption := FloatToStr(ReverbTime.Position / 10);
  ReverbParamChanged;
end;

procedure TMainForm.ReverbHighFreqRTRatioChange(Sender: TObject);
begin
  ReverbHighFreqRTRatioValue.Caption := FloatToStr(ReverbHighFreqRTRatio.Position);
  ReverbParamChanged;
end;

procedure TMainForm.ReverbParamChanged;
Begin
  with Effects[0] do
    if Interfaces.Reverb <> nil then begin
      with Parameters.DSFXReverb do begin
        fInGain := ReverbInGain.Position /10;
        fReverbMix := ReverbMix.Position /10;
        fReverbTime := ReverbTime.Position /10;
        fHighFreqRTRatio := ReverbHighFreqRTRatio.Position;
      end;
      Interfaces.Reverb.SetAllParameters(Parameters.DSFXReverb);
    end;
End;

procedure TMainForm.DrawWave;
var
  Cont : Integer;
  MinVal, MaxVal: SmallInt;
  SampleNo : Integer;
  CurrentPosPx: Integer;
  LMeterValue, RMeterValue : Cardinal;
  LSample, RSample: Integer;
  LPeak, RPeak: Integer;
  LAvg, RAvg: Double;
  BufPointerSt, BufPointerEn : Pointer;
  BufPointer: Pointer;
  Bmp1, Bmp2: TBitmap;
  TotalFrames, CurrentFrame, WindowFrames, StartFrame, EndFrame: Cardinal;
  SafeScale: Cardinal;
  MeterStart, MeterEnd, MeterPos: Cardinal;

  procedure DrawVerticalLine(ABmp: TBitmap; X, Y1, Y2: Integer; AColor: TColor);
  begin
    if X < 0 then Exit;
    if X >= ABmp.Width then Exit;
    if Y1 < 0 then Y1 := 0;
    if Y2 >= ABmp.Height then Y2 := ABmp.Height - 1;
    if Y2 < Y1 then Exit;
    ABmp.Canvas.Pen.Color := AColor;
    ABmp.Canvas.MoveTo(X, Y1);
    ABmp.Canvas.LineTo(X, Y2);
  end;

begin
  { Always keep the waveform panels visually initialized. }
  if (Image1.Picture.Bitmap.Width <> Image1.Width) or
     (Image1.Picture.Bitmap.Height <> Image1.Height) then
  begin
    Image1.Picture.Bitmap.Width := Image1.Width;
    Image1.Picture.Bitmap.Height := Image1.Height;
  end;

  if (Image2.Picture.Bitmap.Width <> Image2.Width) or
     (Image2.Picture.Bitmap.Height <> Image2.Height) then
  begin
    Image2.Picture.Bitmap.Width := Image2.Width;
    Image2.Picture.Bitmap.Height := Image2.Height;
  end;

  Bmp1 := Image1.Picture.Bitmap;
  Bmp2 := Image2.Picture.Bitmap;
  Bmp1.Canvas.Brush.Color := clBlack;
  Bmp1.Canvas.FillRect(Rect(0, 0, Bmp1.Width, Bmp1.Height));
  Bmp2.Canvas.Brush.Color := clBlack;
  Bmp2.Canvas.FillRect(Rect(0, 0, Bmp2.Width, Bmp2.Height));

  if (Buf1 = nil) or (BufSize1 < 4) then
  begin
    Image1.Invalidate;
    Image2.Invalidate;
    DrawVUMeter(ADigitalViewMeter1, 0);
    DrawVUMeter(ADigitalViewMeter2, 0);
    Exit;
  end;

  SampleNo := 0;
  LMeterValue := 0;
  RMeterValue := 0;
  LPeak := 0;
  RPeak := 0;

  { The buffer is expected to be stereo 16-bit PCM: 4 bytes per frame.
    The previous code mixed pointer values with small relative offsets and
    could underflow near the end of the file when zoomed out. This section
    uses explicit frame indexes first, then converts them to pointers only
    after the range has been clamped. }
  TotalFrames := BufSize1 div 4;
  if TotalFrames = 0 then Exit;

  SafeScale := Scale;
  if SafeScale = 0 then SafeScale := 1;

  CurrentFrame := CurrentPosition div 4;
  if CurrentFrame >= TotalFrames then
    CurrentFrame := TotalFrames - 1;

  WindowFrames := SafeScale * Cardinal(Max(1, Image1.Width));
  if WindowFrames < 1 then WindowFrames := 1;

  if WindowFrames >= TotalFrames then
  begin
    StartFrame := 0;
    EndFrame := TotalFrames - 1;
  end
  else
  begin
    StartFrame := CurrentFrame;
    if StartFrame > (WindowFrames div 2) then
      Dec(StartFrame, WindowFrames div 2)
    else
      StartFrame := 0;

    EndFrame := StartFrame + WindowFrames;
    if EndFrame >= TotalFrames then
    begin
      EndFrame := TotalFrames - 1;
      if EndFrame > WindowFrames then
        StartFrame := EndFrame - WindowFrames
      else
        StartFrame := 0;
    end;
  end;

  { Stabilize zoomed waveform drawing.  When StartFrame moves by a
    non-multiple of Scale, each screen pixel groups a slightly different set
    of samples and the zoomed waveform looks like it is shaking.  Align the
    window to the same sample grid used by CalcMinMax. }
  if SafeScale > 1 then
  begin
    StartFrame := (StartFrame div SafeScale) * SafeScale;
    if StartFrame + WindowFrames >= TotalFrames then
    begin
      if TotalFrames > WindowFrames then
        StartFrame := ((TotalFrames - WindowFrames) div SafeScale) * SafeScale
      else
        StartFrame := 0;
    end;
    EndFrame := StartFrame + WindowFrames;
    if EndFrame >= TotalFrames then EndFrame := TotalFrames - 1;
  end;

  BufPointerSt := Pointer(Cardinal(Buf1) + StartFrame * 4);
  BufPointerEn := Pointer(Cardinal(Buf1) + (EndFrame * 4));
  BufPointer := BufPointerSt;

  for Cont := 0 to Image1.Width-1 do
  begin
    if Cardinal(BufPointer) > Cardinal(BufPointerEn) then Break;

    CalcMinMax(BufPointer, BufPointerEn, 4, SafeScale, True, MinVal, MaxVal);
    DrawVerticalLine(Bmp1, Cont, Trunc((MinVal / 32768) * 48) + 48,
      Trunc((MaxVal / 32768) * 48) + 49, WaveColor);

    CalcMinMax(BufPointer, BufPointerEn, 4, SafeScale, False, MinVal, MaxVal);
    DrawVerticalLine(Bmp2, Cont, Trunc((MinVal / 32768) * 48) + 48,
      Trunc((MaxVal / 32768) * 48) + 49, WaveColor);

    if Cardinal(BufPointer) + SafeScale * 4 > Cardinal(BufPointerEn) then
      Break;
    BufPointer := Pointer(Cardinal(BufPointer) + SafeScale * 4);
  end;

  { VU calculation around the current play position. The range is clamped
    to the actual PCM buffer, which avoids the access violation that could
    happen at the very end of the file. }
  MeterStart := 0;
  if CurrentPosition > 1538 then MeterStart := CurrentPosition - 1538;
  MeterEnd := CurrentPosition + 1538;
  if MeterEnd > BufSize1 - 4 then MeterEnd := BufSize1 - 4;

  MeterPos := MeterStart;
  while MeterPos <= MeterEnd do
  begin
    LSample := Abs(PSmallInt(Cardinal(Buf1) + MeterPos)^);
    RSample := Abs(PSmallInt(Cardinal(Buf1) + MeterPos + 2)^);

    Inc(LMeterValue, Cardinal(LSample));
    Inc(RMeterValue, Cardinal(RSample));

    if LSample > LPeak then LPeak := LSample;
    if RSample > RPeak then RPeak := RSample;

    Inc(SampleNo);
    if MeterPos + 4 > MeterEnd then Break;
    Inc(MeterPos, 4);
  end;

  if SampleNo > 0 then
  begin
    { The VU meter is intentionally visual, not calibrated test equipment.
      A logarithmic peak response with a small average contribution keeps the
      display responsive without keeping the red zone permanently lit. }
    LAvg := LMeterValue / SampleNo;
    RAvg := RMeterValue / SampleNo;

    { Keep the red zone as a peak/beat indicator, but allow loud transients to
      touch it briefly. }
    LMeterValue := Round((Ln(1 + LPeak) / Ln(32768)) * 42) +
                   Round(Sqrt(LAvg / 32767) * 6);
    RMeterValue := Round((Ln(1 + RPeak) / Ln(32768)) * 42) +
                   Round(Sqrt(RAvg / 32767) * 6);

    if (LPeak > 0) and (LMeterValue < 3) then LMeterValue := 3;
    if (RPeak > 0) and (RMeterValue < 3) then RMeterValue := 3;

    if LMeterValue > 50 then LMeterValue := 50;
    if RMeterValue > 50 then RMeterValue := 50;
  end;

  LastLMeterValue := LMeterValue;
  LastRMeterValue := RMeterValue;
  DrawVUMeter(ADigitalViewMeter1, LastLMeterValue);
  DrawVUMeter(ADigitalViewMeter2, LastRMeterValue);

  LastPlayPos := CurrentPosition;
  OldCurrentPosition := CurrentPosition;
  CurrentPosPx := Integer((CurrentFrame - StartFrame) div SafeScale);
  DrawVerticalLine(Bmp1, CurrentPosPx, 1, Image1.Height-1, clTeal);
  DrawVerticalLine(Bmp2, CurrentPosPx, 1, Image2.Height-1, clTeal);
  Image1.Invalidate;
  Image2.Invalidate;
end;

procedure TMainForm.FormShow(Sender: TObject);
begin
  Image1.Picture.Bitmap.Width := Image1.Width;
  Image1.Picture.Bitmap.Height := Image1.Height;
  Image1.Picture.Bitmap.Canvas.Brush.Color := clBlack;
  Image1.Picture.Bitmap.Canvas.FillRect(Rect(0, 0, Image1.Width, Image1.Height));

  Image2.Picture.Bitmap.Width := Image2.Width;
  Image2.Picture.Bitmap.Height := Image2.Height;
  Image2.Picture.Bitmap.Canvas.Brush.Color := clBlack;
  Image2.Picture.Bitmap.Canvas.FillRect(Rect(0, 0, Image2.Width, Image2.Height));

  MeterInterval := 2;
  LastPlayPos := 0;
  CurrentPosition := 0;
  LastLMeterValue := 0;
  LastRMeterValue := 0;
  WaveColor := RGB(100, 100, 200);
  FillChar(Spectrum1, SizeOf(Spectrum1), 0);
  FillChar(Spectrum2, SizeOf(Spectrum2), 0);
  DrawVUMeter(ADigitalViewMeter1, 0);
  DrawVUMeter(ADigitalViewMeter2, 0);
  DrawSpectrumBox(MYSpectrumAnalyser1, Spectrum1);
  DrawSpectrumBox(MYSpectrumAnalyser2, Spectrum2);
  TrackBar1Change(Self);
end;

procedure TMainForm.DrawFFT;
var
  TempArray: array [0..512] of Integer;
  Magnitudes: array [0..512] of Double;
  i, BinIndex: Integer;
  NormalizedX, MagnitudeValue, VisualBoost: Double;
  BufPtr1, BufPtr2: PSmallInt;

  procedure SmoothAndDraw(var Spectrum: array of Integer; Box: TPaintBox);
  var
    j: Integer;
  begin
    for j := 0 to 512 do
    begin
      { Fast attack, slower release. This gives the spectrum a more lively
        display without making it too jumpy. }
      if Spectrum[j] < TempArray[j] then
        Inc(Spectrum[j], Max(2, (TempArray[j] - Spectrum[j]) div 2))
      else if Spectrum[j] > 0 then
        Dec(Spectrum[j], 2);

      if Spectrum[j] < 0 then Spectrum[j] := 0;
      if Spectrum[j] > 115 then Spectrum[j] := 115;
    end;
    DrawSpectrumBox(Box, Spectrum);
  end;

  procedure BuildVisualSpectrum(const Magnitudes: array of Double);
  var
    i: Integer;
  begin
    FillChar(TempArray, SizeOf(TempArray), 0);

    for i := 0 to 512 do
    begin
      { Use a curved bin mapping.  Music energy is usually concentrated in the
        low/mid frequencies, so this spreads useful movement across the display. }
      NormalizedX := i / 512;

      { Ignore the nearly-empty high-frequency tail and map the useful bins
        across the full analyzer width for a more active visual display. }
      BinIndex := Round(Sqr(NormalizedX) * 425);
      if BinIndex < 1 then BinIndex := 1;
      if BinIndex > 425 then BinIndex := 425;

      MagnitudeValue := Magnitudes[BinIndex];

      { This analyzer is intentionally visual/animated, not calibrated test
        equipment.  Log compression and a small high-frequency boost make the
        display pleasant while still following the music. }
      MagnitudeValue := Ln(1 + MagnitudeValue * 12);
      VisualBoost := 1.10 + (i / 512) * 1.70;
      TempArray[i] := Round(MagnitudeValue * VisualBoost * 10);

      if TempArray[i] > 115 then TempArray[i] := 115;
      if TempArray[i] < 0 then TempArray[i] := 0;
    end;
  end;

begin
  if (Buf1 = nil) or (BufSize1 = 0) then
  begin
    DrawSpectrumBox(MYSpectrumAnalyser1, Spectrum1);
    DrawSpectrumBox(MYSpectrumAnalyser2, Spectrum2);
    Exit;
  end;

  if CurrentPosition + 4100 > BufSize1 then
  begin
    { Near the end of the file there may not be enough samples for a full
      1024-sample FFT window. Keep the analyzer valid and let the bars fall
      naturally instead of reading beyond the PCM buffer. }
    FillChar(TempArray, SizeOf(TempArray), 0);
    SmoothAndDraw(Spectrum1, MYSpectrumAnalyser1);
    SmoothAndDraw(Spectrum2, MYSpectrumAnalyser2);
    Exit;
  end;

  BufPtr1 := Pointer(Cardinal(Buf1) + CurrentPosition);
  BufPtr2 := BufPtr1;
  Inc(BufPtr2);

  CalculateFFT1024(BufPtr1, 2, Magnitudes);
  BuildVisualSpectrum(Magnitudes);
  SmoothAndDraw(Spectrum1, MYSpectrumAnalyser1);

  CalculateFFT1024(BufPtr2, 2, Magnitudes);
  BuildVisualSpectrum(Magnitudes);
  SmoothAndDraw(Spectrum2, MYSpectrumAnalyser2);
end;

procedure TMainForm.DrawVUMeter(Meter: TPaintBox; Value: Integer);
var
  i, Gap, TopY, BottomY: Integer;
  R: TRect;
  C, OffC, OffBorder: TColor;
  Bmp: TBitmap;
  Segments, InnerLeft, InnerRight, InnerTop, InnerBottom, InnerHeight: Integer;
  LitSegments: Integer;
begin
  if Meter = nil then Exit;
  if (Meter.Width <= 0) or (Meter.Height <= 0) then Exit;
  if Value < 0 then Value := 0;
  if Value > 50 then Value := 50;

  Bmp := TBitmap.Create;
  try
    Bmp.Width := Meter.Width;
    Bmp.Height := Meter.Height;
    Bmp.Canvas.Brush.Color := clBlack;
    Bmp.Canvas.FillRect(Rect(0, 0, Bmp.Width, Bmp.Height));
    Bmp.Canvas.Pen.Color := RGB(12, 18, 20);
    Bmp.Canvas.Rectangle(0, 0, Bmp.Width, Bmp.Height);

    { Use proportional segment positions instead of a fixed integer height, so
      the LED stack uses the full meter height on old and new VCL versions. }
    Segments := 36;
    Gap := 1;
    InnerLeft := 1;
    InnerRight := Bmp.Width - 1;
    InnerTop := 1;
    InnerBottom := Bmp.Height - 1;
    if InnerRight <= InnerLeft then Exit;
    if InnerBottom <= InnerTop then Exit;
    InnerHeight := InnerBottom - InnerTop;

    { Red starts near the top, but is not artificially blocked.  Loud beats can
      briefly reach/touch the red area, while normal level stays below it. }
    if Value <= 38 then
      LitSegments := Round((Value / 38) * 28)
    else
      LitSegments := 28 + Round(((Value - 38) / 12) * (Segments - 28));
    if LitSegments < 0 then LitSegments := 0;
    if LitSegments > Segments then LitSegments := Segments;

    for i := 0 to Segments - 1 do
    begin
      BottomY := InnerBottom - ((i * InnerHeight) div Segments);
      TopY := InnerBottom - (((i + 1) * InnerHeight) div Segments) + Gap;
      if TopY < InnerTop then TopY := InnerTop;
      if BottomY <= TopY then BottomY := TopY + 1;

      if i < 22 then
      begin
        C := RGB(0, 235, 90);
        OffC := RGB(0, 78, 38);
        OffBorder := RGB(0, 120, 55);
      end
      else if i < 30 then
      begin
        C := RGB(0, 245, 245);
        OffC := RGB(0, 72, 78);
        OffBorder := RGB(0, 118, 125);
      end
      else
      begin
        C := RGB(255, 60, 35);
        OffC := RGB(90, 22, 15);
        OffBorder := RGB(140, 34, 24);
      end;

      R := Rect(InnerLeft, TopY, InnerRight, BottomY);

      { Inactive LEDs keep their zone color so the meter does not look dead. }
      Bmp.Canvas.Brush.Color := OffC;
      Bmp.Canvas.Pen.Color := OffBorder;
      Bmp.Canvas.Rectangle(R.Left, R.Top, R.Right, R.Bottom);

      if i < LitSegments then
      begin
        InflateRect(R, -1, -1);
        Bmp.Canvas.Brush.Color := C;
        Bmp.Canvas.Pen.Color := C;
        Bmp.Canvas.Rectangle(R.Left, R.Top, R.Right, R.Bottom);
      end;
    end;

    Meter.Canvas.Draw(0, 0, Bmp);
  finally
    Bmp.Free;
  end;
end;

procedure TMainForm.DrawSpectrumBox(Box: TPaintBox; const Values: array of Integer);
var
  x, idx, v, h, ActiveTop, BottomY: Integer;
  StepX, BarW: Integer;
  R: TRect;
  Bmp: TBitmap;
  MaxVisualHeight: Integer;
  CyanTop, RedTop: Integer;

  procedure FillClippedRect(const AR: TRect; AColor: TColor);
  var
    CR: TRect;
  begin
    CR := AR;
    if CR.Left < 1 then CR.Left := 1;
    if CR.Top < 1 then CR.Top := 1;
    if CR.Right > Bmp.Width - 2 then CR.Right := Bmp.Width - 2;
    if CR.Bottom > Bmp.Height - 2 then CR.Bottom := Bmp.Height - 2;
    if (CR.Right <= CR.Left) or (CR.Bottom <= CR.Top) then Exit;
    Bmp.Canvas.Brush.Color := AColor;
    Bmp.Canvas.Pen.Color := AColor;
    Bmp.Canvas.Rectangle(CR.Left, CR.Top, CR.Right, CR.Bottom);
  end;
begin
  if Box = nil then Exit;
  if (Box.Width <= 0) or (Box.Height <= 0) then Exit;

  Bmp := TBitmap.Create;
  try
    Bmp.Width := Box.Width;
    Bmp.Height := Box.Height;

    Bmp.Canvas.Brush.Color := clBlack;
    Bmp.Canvas.FillRect(Rect(0, 0, Bmp.Width, Bmp.Height));
    Bmp.Canvas.Pen.Color := RGB(10, 10, 10);
    Bmp.Canvas.Rectangle(0, 0, Bmp.Width, Bmp.Height);

    BottomY := Bmp.Height - 3;
    { Allow occasional full-height peaks for a more dynamic visual effect. }
    MaxVisualHeight := Bmp.Height - 7;
    if MaxVisualHeight < 1 then MaxVisualHeight := 1;

    StepX := 4;
    BarW := 2;
    if Bmp.Width < 220 then
    begin
      StepX := 3;
      BarW := 2;
    end;

    x := 2;
    { The glow rectangles are wider than the visible bar.  Stop the last bar
      early enough that the glow does not turn into a solid edge artifact. }
    while x < Bmp.Width  do
    begin
      idx := x * High(Values) div Max(1, Bmp.Width - 1);
      v := Values[idx];
      if v < 0 then v := 0;
      if v > 115 then v := 115;

      h := Round((v / 115) * MaxVisualHeight);
      if h > 0 then
      begin
        ActiveTop := BottomY - h;
        if ActiveTop < 2 then ActiveTop := 2;

        { Wider dark glow around the active column.  This is rectangle-based,
          not pixel-based, so it stays reasonably fast on Delphi 7 / XP. }
        R := Rect(x - 4, ActiveTop + 5, x + BarW + 5, BottomY);
        FillClippedRect(R, RGB(0, 14, 18));

        R := Rect(x - 3, ActiveTop + 3, x + BarW + 4, BottomY);
        FillClippedRect(R, RGB(0, 35, 45));

        R := Rect(x - 1, ActiveTop + 1, x + BarW + 2, BottomY);
        FillClippedRect(R, RGB(0, 75, 85));

        { Blue base. }
        R := Rect(x, ActiveTop, x + BarW, BottomY);
        FillClippedRect(R, RGB(0, 120, 255));

        { Cyan halo/body in the upper active area. }
        CyanTop := ActiveTop;
        if h > (MaxVisualHeight div 5) then
        begin
          R := Rect(x - 1, CyanTop, x + BarW + 2, BottomY - (MaxVisualHeight div 5));
          FillClippedRect(R, RGB(0, 230, 230));
        end;

        { Red glow/cap only near strong peaks. }
        if h > ((MaxVisualHeight * 72) div 100) then
        begin
          RedTop := ActiveTop;
          R := Rect(x - 2, RedTop, x + BarW + 3, RedTop + 6);
          FillClippedRect(R, RGB(95, 15, 12));

          R := Rect(x, RedTop, x + BarW, RedTop + 4);
          FillClippedRect(R, RGB(255, 58, 35));
        end;
      end;

      Inc(x, StepX);
    end;

    { Clear the far right edge after drawing to avoid a solid-looking glow strip. }
//    Bmp.Canvas.Brush.Color := clBlack;
//    Bmp.Canvas.Pen.Color := clBlack;
//    Bmp.Canvas.Rectangle(Max(1, Bmp.Width - 8), 1, Bmp.Width - 1, Bmp.Height - 1);
//    Bmp.Canvas.Pen.Color := RGB(10, 10, 10);
//    Bmp.Canvas.MoveTo(Bmp.Width - 1, 0);
//    Bmp.Canvas.LineTo(Bmp.Width - 1, Bmp.Height - 1);

    Box.Canvas.Draw(0, 0, Bmp);
  finally
    Bmp.Free;
  end;
end;

procedure TMainForm.MeterPaint(Sender: TObject);
begin
  if Sender = ADigitalViewMeter1 then
    DrawVUMeter(ADigitalViewMeter1, LastLMeterValue)
  else if Sender = ADigitalViewMeter2 then
    DrawVUMeter(ADigitalViewMeter2, LastRMeterValue)
  else
    DrawVUMeter(Sender as TPaintBox, 0);
end;

procedure TMainForm.SpectrumPaint(Sender: TObject);
begin
  if Sender = MYSpectrumAnalyser1 then
    DrawSpectrumBox(MYSpectrumAnalyser1, Spectrum1)
  else if Sender = MYSpectrumAnalyser2 then
    DrawSpectrumBox(MYSpectrumAnalyser2, Spectrum2)
  else
    DrawSpectrumBox(Sender as TPaintBox, Spectrum1);
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//  OutputFile.Free;
end;

procedure TMainForm.PositionChanged(Sender: TObject);
begin
  if SecondaryBuf[0]<>nil then
    SecondaryBuf[0].SetCurrentPosition(Position.Position);
end;

procedure TMainForm.AllLabelsLower;
begin
{
  ChorusLabel.BevelInner := bvLowered;
  ChorusLabel.BevelOuter := bvLowered;
  CompresorLable.BevelInner := bvLowered;
  CompresorLable.BevelOuter := bvLowered;
  DistortionLabel.BevelInner := bvLowered;
  DistortionLabel.BevelOuter := bvLowered;
  EchoLabel.BevelInner := bvLowered;
  EchoLabel.BevelOuter := bvLowered;
  FlangerLabel.BevelInner := bvLowered;
  FlangerLabel.BevelOuter := bvLowered;
  GargleLabel.BevelInner := bvLowered;
  GargleLabel.BevelOuter := bvLowered;
  ParamEqLabel.BevelInner := bvLowered;
  ParamEqLabel.BevelOuter := bvLowered;
  ReverbLabel.BevelInner := bvLowered;
  ReverbLabel.BevelOuter := bvLowered;
  }
end;

procedure TMainForm.ChorusLabelClick(Sender: TObject);
begin
  AllLabelsLower;
//  ChorusLabel.BevelInner := bvRaised;
//  ChorusLabel.BevelOuter := bvRaised;
  PageControl.ActivePageIndex := 0;
end;

procedure TMainForm.CompresorLableClick(Sender: TObject);
begin
  AllLabelsLower;
//  CompresorLable.BevelInner := bvRaised;
//  CompresorLable.BevelOuter := bvRaised;
  PageControl.ActivePageIndex := 1;
end;

procedure TMainForm.DistortionLabelClick(Sender: TObject);
begin
  AllLabelsLower;
//  DistortionLabel.BevelInner := bvRaised;
//  DistortionLabel.BevelOuter := bvRaised;
  PageControl.ActivePageIndex := 2;
end;

procedure TMainForm.EchoLabelClick(Sender: TObject);
begin
  AllLabelsLower;
//  EchoLabel.BevelInner := bvRaised;
//  EchoLabel.BevelOuter := bvRaised;
  PageControl.ActivePageIndex := 3;
end;

procedure TMainForm.FlangerLabelClick(Sender: TObject);
begin
  AllLabelsLower;
//  FlangerLabel.BevelInner := bvRaised;
//  FlangerLabel.BevelOuter := bvRaised;
  PageControl.ActivePageIndex := 4;
end;

procedure TMainForm.GargleLabelClick(Sender: TObject);
begin
  AllLabelsLower;
//  GargleLabel.BevelInner := bvRaised;
//  GargleLabel.BevelOuter := bvRaised;
  PageControl.ActivePageIndex := 5;
end;

procedure TMainForm.ParamEqLabelClick(Sender: TObject);
begin
  AllLabelsLower;
//  ParamEqLabel.BevelInner := bvRaised;
//  ParamEqLabel.BevelOuter := bvRaised;
  PageControl.ActivePageIndex := 6;
end;

procedure TMainForm.ReverbLabelClick(Sender: TObject);
begin
  AllLabelsLower;
//  ReverbLabel.BevelInner := bvRaised;
//  ReverbLabel.BevelOuter := bvRaised;
  PageControl.ActivePageIndex := 7;
end;

procedure TMainForm.PauseClick(Sender: TObject);
var i: Integer;
begin
  if not Paused then
  begin
    for i := 0 to 7 do
      if SecondaryBuf[i] <> nil then
      begin
        SecondaryBuf[i].Stop;
        Timer.Enabled := False;
        Paused := True;
      end;
  end
  else
  begin
    for i := 0 to 7 do
      if SecondaryBuf[i] <> nil then
      begin
        SecondaryBuf[i].Play(0,0,0);
        Timer.Enabled := True;
        Paused := False;
      end;
  end;
end;

procedure TMainForm.NormFreqClick(Sender: TObject);
begin
  if SecondaryBuf[0] <> nil then
  begin
    SecondaryBuf[0].SetFrequency(FileFrequency);
    Freq.Position := FileFrequency;
  end;
end;

procedure TMainForm.ExportButtonClick(Sender: TObject);
var
  F: TFileStream;
  DataSizeValue, RiffSize: Cardinal;
  W: Word;

  procedure WriteText(const S: AnsiString);
  begin
    F.WriteBuffer(Pointer(S)^, Length(S));
  end;

begin
  if (Buf1 = nil) or (BufSize1 = 0) then Exit;

  SaveDialog.Filter := 'Wave files (*.wav)|*.wav';
  SaveDialog.DefaultExt := 'wav';
  if not SaveDialog.Execute then Exit;

  DataSizeValue := BufSize1;
  RiffSize := 36 + DataSizeValue;
  F := TFileStream.Create(SaveDialog.FileName, fmCreate);
  try
    WriteText('RIFF');
    F.WriteBuffer(RiffSize, SizeOf(RiffSize));
    WriteText('WAVE');
    WriteText('fmt ');
    DataSizeValue := 16;
    F.WriteBuffer(DataSizeValue, SizeOf(DataSizeValue));
    W := WAVE_FORMAT_PCM;
    F.WriteBuffer(W, SizeOf(W));
    F.WriteBuffer(MyFormat.nChannels, SizeOf(MyFormat.nChannels));
    F.WriteBuffer(MyFormat.nSamplesPerSec, SizeOf(MyFormat.nSamplesPerSec));
    F.WriteBuffer(MyFormat.nAvgBytesPerSec, SizeOf(MyFormat.nAvgBytesPerSec));
    F.WriteBuffer(MyFormat.nBlockAlign, SizeOf(MyFormat.nBlockAlign));
    F.WriteBuffer(MyFormat.wBitsPerSample, SizeOf(MyFormat.wBitsPerSample));
    WriteText('data');
    DataSizeValue := BufSize1;
    F.WriteBuffer(DataSizeValue, SizeOf(DataSizeValue));
    F.WriteBuffer(Buf1^, BufSize1);
  finally
    F.Free;
  end;
end;

procedure TMainForm.DistortionChanged;
begin
  with Effects[0] do
    if Interfaces.Distortion <> nil then begin
      with Parameters.DSFXDistortion do begin
        fGain := DistortionGain.Position/10;
        fEdge := DistortionEdge.Position/10;
        fPostEQCenterFrequency := DistortionPostEQCenterFreq.Position;
        fPostEQBandwidth := DistortionPostEQBandwidth.Position;
        fPreLowpassCutoff := DistortionPrelowpassCutoff.Position;
      end;
      Interfaces.Distortion.SetAllParameters(Parameters.DSFXDistortion);
    end;
end;

procedure TMainForm.DistortionGainChange(Sender: TObject);
begin
  DistortionGainValue.Caption := FloatToStr(DistortionGain.Position/10);
  DistortionChanged;
end;

procedure TMainForm.DistortionEdgeChange(Sender: TObject);
begin
  DistortionEdgeValue.Caption := FloatToStr(DistortionEdge.Position/10);
  DistortionChanged;
end;

procedure TMainForm.DistortionPostEQCenterFreqChange(Sender: TObject);
begin
  DistortionPostEQCenterFreqValue.Caption := IntToStr(DistortionPostEQCenterFreq.Position);
  DistortionChanged;
end;

procedure TMainForm.DistortionPostEQBandwidthChange(Sender: TObject);
begin
  DistortionPostEQBandwidthValue.Caption := IntToStr(DistortionPostEQBandwidth.Position);
  DistortionChanged;
end;

procedure TMainForm.DistortionPrelowpassCutoffChange(Sender: TObject);
begin
  DistortionPrelowpassCutoffValue.Caption := IntToStr(DistortionPrelowpassCutoff.Position);
  DistortionChanged;
end;

procedure TMainForm.TrackBar1Change(Sender: TObject);
begin
  Scale := TrackBar1.Position;
end;

procedure TMainForm.CalcMinMax(Buf, EndBuf: Pointer; BlockAlign, Len: Cardinal; LR: Boolean; var Min, Max: SmallInt);
var
  P, LastP: Cardinal;
  Sample: SmallInt;
  Count: Cardinal;
begin
  Min := 0;
  Max := 0;

  if (Buf = nil) or (EndBuf = nil) or (Len = 0) then Exit;
  if BlockAlign = 0 then Exit;

  P := Cardinal(Buf);
  LastP := Cardinal(EndBuf);

  { Right channel starts two bytes after the left channel in stereo 16-bit PCM. }
  if LR then Inc(P, BlockAlign div 2);

  if P > LastP then Exit;

  Sample := PSmallInt(P)^;
  Min := Sample;
  Max := Sample;

  Count := 0;
  while (Count < Len) and (P <= LastP) do
  begin
    Sample := PSmallInt(P)^;
    if Sample < Min then Min := Sample;
    if Sample > Max then Max := Sample;

    if P + BlockAlign > LastP then Break;
    Inc(P, BlockAlign);
    Inc(Count);
  end;
end;

procedure TMainForm.PositionChange(Sender: TObject);
begin
  if SecondaryBuf[0]<>nil then
  begin
    SecondaryBuf[0].SetCurrentPosition(Position.Position);
    DrawWave;
    DrawFFT;
  end;
end;

procedure TMainForm.DeviceComboChange(Sender: TObject);
var
  Device: PGUID;
  Status: Cardinal;
  CurPos: Int64;
begin
  if SecondaryBuf[0]<>nil then
  begin
    SecondaryBuf[0].GetStatus(Status);
    SecondaryBuf[0].GetCurrentPosition(@CurPos,nil);
  end;
  StopFileClick(nil);
  FreeSoundBuffers;
  DS := nil;
  Device := PGUID(DeviceCombo.Items.Objects[DeviceCombo.ItemIndex]);
  DirectSoundCreate8(Device, DS, nil);
  DS.SetCooperativeLevel(Handle, DSSCL_NORMAL);
//  FillChar(DSBD, SizeOf(DSBD), 0);
//  with DSBD do begin
//    dwSize := SizeOf(DSBD);
//    dwFlags := DSBCAPS_PRIMARYBUFFER;
//  end;
//  DDRes := DS.CreateSoundBuffer(DSBD, TempBuf, nil);
//  TempBuf.QueryInterface(IDirectSoundBuffer8, PrimaryBuf);
  FreeSoundBuffers;
  Set8087CW(Get8087CW or 1);
  if FileEdit.Text <> '' then
    ReopenFile;
  if Status and DSBSTATUS_PLAYING <> 0 Then
  begin
    SecondaryBuf[0].SetCurrentPosition(CurPos);
    SecondaryBuf[0].Play(0,0,0);
    Timer.Enabled := True;
  end;
end;

function DSEnumerate(lpGuid: PGUID; lpcstrDescription,
  lpcstrModule: PAnsiChar; lpContext: Pointer): BOOL;
begin
  MainForm.DeviceCombo.AddItem(lpcstrDescription,Pointer(lpGuid));
  Result := True;
end;

procedure TMainForm.ReopenFile;
begin
  OpenFileClick(Self);
end;

end.
