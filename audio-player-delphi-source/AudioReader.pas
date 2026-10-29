unit AudioReader;

{------------------------------------------------------------------------------
  AudioReader

  Small conversion layer between the main player and cbAudioFileRead.

  cbAudioFileRead returns decoded PCM in the format negotiated by DirectShow.
  The player, however, wants one simple playback format: 44.1 kHz, 16-bit,
  stereo PCM.  This unit reads the source audio in safe chunks and converts
  channel count, bit depth and sample rate when required.

  Keeping this logic here makes MainUnit simpler: the form asks for samples in
  the desired output format and does not need to know whether the input file was
  WAV, MP3, mono, stereo, 8-bit or 16-bit.
------------------------------------------------------------------------------}

interface
uses
  Windows, cbAudioFileRead, ReSample, mmSystem;

type
  TAudioFile = class(TObject)
  private
    FAudioInstance: TcbAudioFileReader;
    FDesiredFormat: TWaveFormatEx;
    FFileFormat: TWaveFormatEx;
    function GetDuration: Int64;
    function EqualFormats(const Format1, Format2: TWaveFormatEx): Boolean;
    procedure ChangeChannels(InBuffer, OutBuffer: Pointer; InChannels, OutChannels, BitPerSamples, SampleCount: Cardinal);
    procedure ChangeBitRate(InBuffer, OutBuffer: Pointer; InBitRate, OutBitRate, Channels, SampleCount: Cardinal);
    procedure ChangeSampleRate(InBuffer, OutBuffer: Pointer; InSampleRate, OutSampleRate, BitRate, Channels, InSampleCount: Cardinal);
  public
    constructor Create;
    destructor Destroy; override;
    function OpenAudioFile(FileName: PChar): Boolean;
    procedure CloseAudioFile;
    function ReadAudioData(Buf: Pointer; nSamplesToRead: Cardinal): Cardinal;
    property Duration: Int64 read GetDuration;
    property DesiredFormat: TWaveFormatEx read FDesiredFormat write FDesiredFormat;
    property FileFormat: TWaveFormatEx read FFileFormat;
  end;
implementation

uses SysUtils;

{ TAudioFile }

procedure TAudioFile.ChangeBitRate(InBuffer, OutBuffer: Pointer; InBitRate, OutBitRate, Channels, SampleCount: Cardinal);
begin
  if InBitRate = OutBitRate then
    Move(InBuffer^, OutBuffer^, (Channels*InBitRate shr 3) * SampleCount)
  else
    case InBitRate of
      8  :  case OutBitRate of
              16 : ChangeBitRate8To16(InBuffer, OutBuffer, Channels*SampleCount);
              24 : ChangeBitRate8To24(InBuffer, OutBuffer, Channels*SampleCount);
            end;
      16 :  case OutBitRate of
              8  : ChangeBitRate16To8(InBuffer, OutBuffer, Channels*SampleCount);
              24 : ChangeBitRate16To24(InBuffer, OutBuffer, Channels*SampleCount);
            end;
      24 :  case OutBitRate of
              8  : ChangeBitRate24To8(InBuffer, OutBuffer, Channels*SampleCount);
              16 : ChangeBitRate24To16(InBuffer, OutBuffer, Channels*SampleCount);
            end;
    end;
end;

procedure TAudioFile.ChangeChannels(InBuffer, OutBuffer: Pointer; InChannels, OutChannels, BitPerSamples, SampleCount: Cardinal);
begin
  if InChannels = OutChannels then
    Move(InBuffer^, OutBuffer^, (BitPerSamples * InChannels shr 3) * SampleCount)
  else
    case BitPerSamples of
      8  : if InChannels = 1 then MonoToStereo8Bit(InBuffer, OutBuffer, SampleCount)
           else StereoToMono8Bit(InBuffer, OutBuffer, SampleCount);
      16 : if InChannels = 1 then MonoToStereo16Bit(InBuffer, OutBuffer, SampleCount)
           else StereoToMono16Bit(InBuffer, OutBuffer, SampleCount);
      24 : if InChannels = 1 then MonoToStereo24Bit(InBuffer, OutBuffer, SampleCount)
           else StereoToMono24Bit(InBuffer, OutBuffer, SampleCount);
    end;
end;

procedure TAudioFile.ChangeSampleRate(InBuffer, OutBuffer: Pointer; InSampleRate, OutSampleRate, BitRate, Channels, InSampleCount: Cardinal);
begin
  if InSampleRate = OutSampleRate then
    Move(InBuffer^, OutBuffer^, (BitRate * Channels shr 3) * InSampleCount)
  else
    case  BitRate of
      8  : ChangeRate8(InBuffer,OutBuffer,InSampleCount,InSampleRate,OutSampleRate,Boolean(Channels-1));
      16 : ChangeRate16(InBuffer,OutBuffer,InSampleCount,InSampleRate,OutSampleRate,Boolean(Channels-1));
      24 : ChangeRate24(InBuffer,OutBuffer,InSampleCount,InSampleRate,OutSampleRate,Boolean(Channels-1));
    end;
end;

procedure TAudioFile.CloseAudioFile;
begin
  if FAudioInstance <> nil then
    FAudioInstance.CloseFile;
end;

constructor TAudioFile.Create;
begin
  inherited;
  FAudioInstance := TcbAudioFileReader.Create;
  with FDesiredFormat do begin
    wFormatTag := WAVE_FORMAT_PCM;
    nChannels := 2;
    nSamplesPerSec := 44100;
    nAvgBytesPerSec := 176400;
    nBlockAlign := 4;
    wBitsPerSample := 16;
    cbSize := 0;
  end;
end;

destructor TAudioFile.Destroy;
begin
  FAudioInstance.Free;
  inherited;
end;

function TAudioFile.EqualFormats(const Format1, Format2: TWaveFormatEx): Boolean;
begin
  Result := CompareMem(@Format1.nChannels, @Format2.nChannels, SizeOf(TWaveFormatEx)-4);
end;

function TAudioFile.GetDuration: Int64;
begin
  Result := FAudioInstance.Duration;
end;

function TAudioFile.OpenAudioFile(FileName: PChar): Boolean;
begin
  { Ask the audio reader for the final PCM format used by the player. }
  FAudioInstance.SetRequestedFormat(FDesiredFormat);

  if FAudioInstance.OpenFile(FileName) then
  begin
    FFileFormat := FAudioInstance.Format;
    Result := True;
  end
  else
    Result := False;
end;

function TAudioFile.ReadAudioData(Buf: Pointer; nSamplesToRead: Cardinal): Cardinal;
const
  MAX_SOURCE_BYTES = 262144;  { keep DirectShow reads small; large one-shot MP3 reads are unreliable on some systems }
  MAX_DEST_SAMPLES = 32768;
type
  PByteArray = ^TByteArray;
  TByteArray = array[0..MaxInt div 16] of Byte;
var
  RequestedBytes: Cardinal;
  TotalBytes: Cardinal;
  BytesToRead: Cardinal;
  BytesRead: Cardinal;
  SourceSamplesReq: Cardinal;
  SourceSamplesGot: Cardinal;
  SourceBytesReq: Cardinal;
  DestChunkSamples: Cardinal;
  DestSamplesGot: Cardinal;
  DestSamplesToCopy: Cardinal;
  TotalDestSamples: Cardinal;
  Temp1: Pointer;
  Temp2: Pointer;
  Temp3: Pointer;
  Temp4: Pointer;
  Temp2Size: Cardinal;
  Temp3Size: Cardinal;
  Temp4Size: Cardinal;
  RemainingSamples: Cardinal;
begin
  Result := 0;

  if (Buf = nil) or (nSamplesToRead = 0) then
    Exit;

  { Always clear the destination first.  If the decoder returns fewer samples
    than expected, the tail of the DirectSound buffer will be clean silence
    instead of old/uninitialized data. }
  FillChar(Buf^, nSamplesToRead * FDesiredFormat.nBlockAlign, 0);

  if EqualFormats(FFileFormat, FDesiredFormat) then
  begin
    RequestedBytes := nSamplesToRead * FDesiredFormat.nBlockAlign;
    TotalBytes := 0;

    while TotalBytes < RequestedBytes do
    begin
      BytesToRead := RequestedBytes - TotalBytes;
      if BytesToRead > MAX_SOURCE_BYTES then
        BytesToRead := MAX_SOURCE_BYTES;

      { keep reads aligned to complete PCM frames }
      BytesToRead := BytesToRead - (BytesToRead mod FFileFormat.nBlockAlign);
      if BytesToRead = 0 then
        Break;

      BytesRead := FAudioInstance.Read(PByteArray(Buf)^[TotalBytes], BytesToRead);

      if BytesRead = 0 then
        Break;

      BytesRead := BytesRead - (BytesRead mod FFileFormat.nBlockAlign);
      Inc(TotalBytes, BytesRead);
    end;

    Result := TotalBytes div FDesiredFormat.nBlockAlign;
    Exit;
  end;

  { Format conversion path.  The old code asked DirectShow to decode the whole
    file in one huge read.  On Windows 10 this can return only the beginning of
    some MP3 files.  Reading and converting in chunks is slower than a perfect
    streaming pipeline, but it is much safer and still simple enough for this
    educational project. }
  TotalDestSamples := 0;

  while TotalDestSamples < nSamplesToRead do
  begin
    RemainingSamples := nSamplesToRead - TotalDestSamples;
    DestChunkSamples := RemainingSamples;
    if DestChunkSamples > MAX_DEST_SAMPLES then
      DestChunkSamples := MAX_DEST_SAMPLES;

    if FDesiredFormat.nSamplesPerSec = 0 then
      Break;

    SourceSamplesReq := Cardinal((Int64(DestChunkSamples) * FFileFormat.nSamplesPerSec +
      FDesiredFormat.nSamplesPerSec - 1) div FDesiredFormat.nSamplesPerSec) + 16;

    SourceBytesReq := SourceSamplesReq * FFileFormat.nBlockAlign;
    if SourceBytesReq > MAX_SOURCE_BYTES then
    begin
      SourceBytesReq := MAX_SOURCE_BYTES - (MAX_SOURCE_BYTES mod FFileFormat.nBlockAlign);
      SourceSamplesReq := SourceBytesReq div FFileFormat.nBlockAlign;
    end;

    if SourceBytesReq = 0 then
      Break;

    Temp1 := nil;
    Temp2 := nil;
    Temp3 := nil;
    Temp4 := nil;
    try
      GetMem(Temp1, SourceBytesReq + 16);
      FillChar(Temp1^, SourceBytesReq + 16, 0);

      BytesRead := FAudioInstance.Read(Temp1^, SourceBytesReq);
      BytesRead := BytesRead - (BytesRead mod FFileFormat.nBlockAlign);
      if BytesRead = 0 then
        Break;

      SourceSamplesGot := BytesRead div FFileFormat.nBlockAlign;

      Temp2Size := ((FFileFormat.wBitsPerSample * FDesiredFormat.nChannels) shr 3) * SourceSamplesGot + 16;
      GetMem(Temp2, Temp2Size);
      FillChar(Temp2^, Temp2Size, 0);
      ChangeChannels(Temp1, Temp2, FFileFormat.nChannels, FDesiredFormat.nChannels,
        FFileFormat.wBitsPerSample, SourceSamplesGot);

      Temp3Size := FDesiredFormat.nBlockAlign * SourceSamplesGot + 16;
      GetMem(Temp3, Temp3Size);
      FillChar(Temp3^, Temp3Size, 0);
      ChangeBitRate(Temp2, Temp3, FFileFormat.wBitsPerSample, FDesiredFormat.wBitsPerSample,
        FDesiredFormat.nChannels, SourceSamplesGot);

      DestSamplesGot := Cardinal((Int64(SourceSamplesGot) * FDesiredFormat.nSamplesPerSec) div
        FFileFormat.nSamplesPerSec);
      if DestSamplesGot = 0 then
        Continue;

      Temp4Size := FDesiredFormat.nBlockAlign * (DestSamplesGot + 4) + 16;
      GetMem(Temp4, Temp4Size);
      FillChar(Temp4^, Temp4Size, 0);
      ChangeSampleRate(Temp3, Temp4, FFileFormat.nSamplesPerSec,
        FDesiredFormat.nSamplesPerSec, FDesiredFormat.wBitsPerSample,
        FDesiredFormat.nChannels, SourceSamplesGot);

      DestSamplesToCopy := DestSamplesGot;
      if DestSamplesToCopy > RemainingSamples then
        DestSamplesToCopy := RemainingSamples;

      Move(Temp4^, PByteArray(Buf)^[TotalDestSamples * FDesiredFormat.nBlockAlign],
        DestSamplesToCopy * FDesiredFormat.nBlockAlign);

      Inc(TotalDestSamples, DestSamplesToCopy);
    finally
      if Temp4 <> nil then FreeMem(Temp4);
      if Temp3 <> nil then FreeMem(Temp3);
      if Temp2 <> nil then FreeMem(Temp2);
      if Temp1 <> nil then FreeMem(Temp1);
    end;
  end;

  Result := TotalDestSamples;
end;

end.
