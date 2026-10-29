unit cbAudioFileRead;

{------------------------------------------------------------------------------
  ALTEK Audio Reader

  Delphi 7 compatible DirectShow audio reader.

  The reader builds the normal DirectShow playback graph first, then inserts a
  Sample Grabber after the decoded PCM output. This avoids the old
  IAMMultiMediaStream path, which can expose some MP3 files as low-quality
  11025 Hz mono on newer Windows versions.

  The public class name is intentionally kept as TcbAudioFileReader so the
  existing project structure can use the reader with minimal changes.  The
  implementation is project-owned and does not use the older third-party reader.

  Supported input depends on the DirectShow filters/codecs installed on Windows.
  WAV/PCM is the safest format. Most standard MP3 files work, but unusual MP3
  encodings may still fail if the installed DirectShow filters cannot build a
  decoded PCM graph.
------------------------------------------------------------------------------}

interface

uses
  Windows, Classes, MMSystem, SysUtils, DirectShow9, ActiveX;

const
  MUNITS_PER_MSEC: Int64 = 10000;
  MIN_SEL_LENGTH: Int64 = 100000;
  MAX_SEL_LENGTH: Int64 = 1000000000000000;

  { Set this to True only when debugging DirectShow graph building.
    Keep False for normal/release use, because per-pin graph logging can slow
    old Delphi/XP virtual machines. }
  AUDIO_READER_DEBUG_LOG = False;

  DSUSER_HRESULT = HResult($08000000);
  DSUSER_INVALIDSIZE = DSUSER_HRESULT + 1;

type
  EAudioReadError = class(Exception)
  private
    FErrorCode: HRESULT;
  public
    constructor Create(const Msg: String; const ErrorCode: HRESULT); virtual;
    property ErrorCode: HRESULT read FErrorCode;
  end;

  { qedit.dll / Sample Grabber declarations.
    They are included here because many DirectShow9.pas versions do not expose
    them anymore. }
  ISampleGrabberCB = interface(IUnknown)
    ['{0579154A-2B53-4994-B0D0-E773148EFF85}']
    function SampleCB(SampleTime: Double; pSample: IMediaSample): HRESULT; stdcall;
    function BufferCB(SampleTime: Double; pBuffer: PByte; BufferLen: Longint): HRESULT; stdcall;
  end;

  ISampleGrabber = interface(IUnknown)
    ['{6B652FFF-11FE-4FCE-92AD-0266B5D7C78F}']
    function SetOneShot(OneShot: BOOL): HRESULT; stdcall;
    function SetMediaType(const pType: TAMMediaType): HRESULT; stdcall;
    function GetConnectedMediaType(var pType: TAMMediaType): HRESULT; stdcall;
    function SetBufferSamples(BufferThem: BOOL): HRESULT; stdcall;
    function GetCurrentBuffer(var pBufferSize: Longint; pBuffer: Pointer): HRESULT; stdcall;
    function GetCurrentSample(out ppSample: IMediaSample): HRESULT; stdcall;
    function SetCallback(pCallback: ISampleGrabberCB; WhichMethodToCallback: Longint): HRESULT; stdcall;
  end;

  PByteArray = ^TByteArray;
  TByteArray = array[0..MaxInt div 16] of Byte;

  TcbAudioFileReader = class(TObject)
  private
    FFormat: TWaveFormatEx;
    FRequestedFormat: TWaveFormatEx;
    FUseRequestedFormat: Boolean;
    FFileName: TFileName;
    FDuration: Int64;
    FSelStart: Int64;
    FSelLength: Int64;
    FLastReadingStartTime: Int64;
    FLastReadingEndTime: Int64;
    FPosition: Int64;
    FBytePosition: Cardinal;
    FDecodedData: Pointer;
    FDecodedSize: Cardinal;

    procedure SetPosition(Value: Int64);
    procedure SetSelLength(Value: Int64);
    procedure SetSelStart(Value: Int64);
    procedure ClearDecodedData;
    function BuildAndDecodeWithSampleGrabber(FileName: PChar): Boolean;
    procedure SetupRequestedPcmFormat(var MediaType: TAMMediaType; const Wfx: TWaveFormatEx);
    procedure SetupRelaxedPcmMediaType(var MediaType: TAMMediaType);
    procedure ReadConnectedFormat(const Grabber: ISampleGrabber);

  public
    IsValidFile: Boolean;
    function OpenFile(FileName: PChar): Boolean;
    procedure CloseFile;
    procedure SetRequestedFormat(const Value: TWaveFormatEx);
    function Read(var Buffer; Size: DWord): DWord;
    property Duration: Int64 read FDuration;
    property FileName: TFileName read FFileName;
    property Format: TWaveFormatEx read FFormat;
    property LastReadingEndTime: Int64 read FLastReadingEndTime;
    property LastReadingStartTime: Int64 read FLastReadingStartTime;
    property Position: Int64 read FPosition write SetPosition;
    property SelLength: Int64 read FSelLength write SetSelLength;
    property SelStart: Int64 read FSelStart write SetSelStart;
  end;

function DirectShowPresent: Boolean;

implementation

const
  CLSID_SampleGrabber: TGUID = '{C1F400A0-3F08-11D3-9F0B-006008039E37}';
  CLSID_NullRenderer:  TGUID = '{C1F400A4-3F08-11D3-9F0B-006008039E37}';

constructor EAudioReadError.Create(const Msg: String; const ErrorCode: HRESULT);
begin
  inherited Create(Msg);
  FErrorCode := ErrorCode;
end;

function DirectShowPresent: Boolean;
var
  Graph: IGraphBuilder;
begin
  Result := CoCreateInstance(CLSID_FilterGraph, nil, CLSCTX_INPROC_SERVER,
    IID_IGraphBuilder, Graph) = S_OK;
end;

function HResultSucceededLocal(Hr: HRESULT): Boolean;
begin
  Result := Hr >= 0;
end;

function SCheck(Value: HRESULT): HRESULT;
var
  S: String;
  SS2: array[0..300] of Char;
begin
  Result := Value;
  if not HResultSucceededLocal(Value) then
  begin
    case DWord(Value) of
      DSUSER_INVALIDSIZE: S := 'Invalid buffer size.';
      DWord(REGDB_E_CLASSNOTREG): S := 'A DirectShow class/filter is not registered.';
      DWord(E_INVALIDARG): S := 'One of the parameters is invalid.';
      DWord(E_POINTER): S := 'Invalid pointer.';
      DWord(E_NOINTERFACE): S := 'No interface.';
      else
      begin
        if AMGetErrorText(Value, @SS2, High(SS2)) = 0 then
          S := 'DirectShow error: $' + IntToHex(Value, 8)
        else
          S := StrPas(SS2);
      end;
    end;
    raise EAudioReadError.Create(S, Value);
  end;
end;

procedure FreeMediaTypeLocal(var Mt: TAMMediaType);
begin
  if Mt.cbFormat <> 0 then
  begin
    CoTaskMemFree(Mt.pbFormat);
    Mt.cbFormat := 0;
    Mt.pbFormat := nil;
  end;
  if Mt.pUnk <> nil then
  begin
    Mt.pUnk := nil;
  end;
end;


procedure DebugLogLineLocal(const S: String);
var
  F: TextFile;
  LogName: String;
begin
  if not AUDIO_READER_DEBUG_LOG then
    Exit;

  try
    LogName := ExtractFilePath(ParamStr(0)) + 'decode_graph_debug.txt';
    AssignFile(F, LogName);
    if FileExists(LogName) then
      Append(F)
    else
      Rewrite(F);
    Writeln(F, FormatDateTime('yyyy-mm-dd hh:nn:ss.zzz', Now) + '  ' + S);
    CloseFile(F);
  except
  end;
end;

function HResultToHexLocal(Hr: HRESULT): String;
begin
  Result := '$' + IntToHex(DWord(Hr), 8);
end;


function FormatToTextLocal(const Mt: TAMMediaType): String;
var
  Wfx: PWaveFormatEx;
begin
  Result := 'major=' + GUIDToString(Mt.majortype) +
            ' subtype=' + GUIDToString(Mt.subtype) +
            ' formattype=' + GUIDToString(Mt.formattype) +
            ' cbFormat=' + IntToStr(Mt.cbFormat);
  if IsEqualGUID(Mt.formattype, FORMAT_WaveFormatEx) and (Mt.pbFormat <> nil) then
  begin
    Wfx := PWaveFormatEx(Mt.pbFormat);
    Result := Result +
      '  WFX tag=' + IntToStr(Wfx.wFormatTag) +
      ' ch=' + IntToStr(Wfx.nChannels) +
      ' rate=' + IntToStr(Wfx.nSamplesPerSec) +
      ' bits=' + IntToStr(Wfx.wBitsPerSample) +
      ' align=' + IntToStr(Wfx.nBlockAlign) +
      ' avg=' + IntToStr(Wfx.nAvgBytesPerSec) +
      ' cbSize=' + IntToStr(Wfx.cbSize);
  end;
end;

procedure DebugLogPinMediaTypeLocal(const Title: String; const Pin: IPin);
var
  Mt: TAMMediaType;
  Hr: HRESULT;
begin
  FillChar(Mt, SizeOf(Mt), 0);
  if Pin = nil then
  begin
    DebugLogLineLocal(Title + ': nil pin');
    Exit;
  end;
  Hr := Pin.ConnectionMediaType(Mt);
  if Hr <> S_OK then
  begin
    DebugLogLineLocal(Title + ': ConnectionMediaType failed hr=' + HResultToHexLocal(Hr));
    Exit;
  end;
  try
    DebugLogLineLocal(Title + ': ' + FormatToTextLocal(Mt));
  finally
    FreeMediaTypeLocal(Mt);
  end;
end;

function PinDirLocal(const Pin: IPin; var Dir: TPinDirection): Boolean; forward;


type
  TSampleCollector = class(TInterfacedObject, ISampleGrabberCB)
  private
    FStream: TMemoryStream;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Prepare(ExpectedBytes: Longint);
    function SampleCB(SampleTime: Double; pSample: IMediaSample): HRESULT; stdcall;
    function BufferCB(SampleTime: Double; pBuffer: PByte; BufferLen: Longint): HRESULT; stdcall;
    property Stream: TMemoryStream read FStream;
  end;

constructor TSampleCollector.Create;
begin
  inherited Create;
  FStream := TMemoryStream.Create;
end;

destructor TSampleCollector.Destroy;
begin
  FStream.Free;
  inherited Destroy;
end;

procedure TSampleCollector.Prepare(ExpectedBytes: Longint);
begin
  { Pre-allocate the decoded PCM buffer.
    Without this, TMemoryStream grows repeatedly during BufferCB.
    On Delphi 7 / XP VM this can look like a hang for full MP3 files because
    a 5-6 minute MP3 becomes around 60 MB of PCM data. }
  if (FStream <> nil) and (ExpectedBytes > 0) then
  begin
    try
      FStream.SetSize(ExpectedBytes);
      FStream.Position := 0;
    except
      FStream.Clear;
    end;
  end;
end;

function TSampleCollector.SampleCB(SampleTime: Double; pSample: IMediaSample): HRESULT;
begin
  Result := S_OK;
end;

function TSampleCollector.BufferCB(SampleTime: Double; pBuffer: PByte; BufferLen: Longint): HRESULT;
begin
  Result := S_OK;
  if (FStream <> nil) and (pBuffer <> nil) and (BufferLen > 0) then
    FStream.WriteBuffer(pBuffer^, BufferLen);
end;

procedure DebugLogGraphConnectionsLocal(const Graph: IGraphBuilder; const Stage: String);
var
  EnumFilters: IEnumFilters;
  Filter: IBaseFilter;
  Fetched: Longint;
  EnumPins: IEnumPins;
  Pin: IPin;
  Dir: TPinDirection;
  Other: IPin;
  Mt: TAMMediaType;
  Hr: HRESULT;
  PinNo: Integer;
begin
  DebugLogLineLocal('--- Graph dump: ' + Stage + ' ---');
  if (Graph = nil) or (Graph.EnumFilters(EnumFilters) <> S_OK) then
  begin
    DebugLogLineLocal('Graph dump failed: cannot enum filters');
    Exit;
  end;
  PinNo := 0;
  while EnumFilters.Next(1, Filter, @Fetched) = S_OK do
  begin
    if (Filter <> nil) and (Filter.EnumPins(EnumPins) = S_OK) then
    begin
      while EnumPins.Next(1, Pin, @Fetched) = S_OK do
      begin
        Inc(PinNo);
        Other := nil;
        if PinDirLocal(Pin, Dir) then
        begin
          if Pin.ConnectedTo(Other) = S_OK then
          begin
            FillChar(Mt, SizeOf(Mt), 0);
            Hr := Pin.ConnectionMediaType(Mt);
            if Hr = S_OK then
            begin
              try
                if Dir = PINDIR_INPUT then
                  DebugLogLineLocal('pin ' + IntToStr(PinNo) + ' IN connected: ' + FormatToTextLocal(Mt))
                else
                  DebugLogLineLocal('pin ' + IntToStr(PinNo) + ' OUT connected: ' + FormatToTextLocal(Mt));
              finally
                FreeMediaTypeLocal(Mt);
              end;
            end
            else
              DebugLogLineLocal('pin ' + IntToStr(PinNo) + ' connected but no media type hr=' + HResultToHexLocal(Hr));
          end;
        end;
        Pin := nil;
      end;
    end;
    Filter := nil;
  end;
  DebugLogLineLocal('--- End graph dump ---');
end;

procedure TcbAudioFileReader.ClearDecodedData;
begin
  if FDecodedData <> nil then
    FreeMem(FDecodedData);
  FDecodedData := nil;
  FDecodedSize := 0;
  FBytePosition := 0;
end;

procedure TcbAudioFileReader.SetupRequestedPcmFormat(var MediaType: TAMMediaType; const Wfx: TWaveFormatEx);
var
  P: PWaveFormatEx;
begin
  FillChar(MediaType, SizeOf(MediaType), 0);
  MediaType.majortype := MEDIATYPE_Audio;
  MediaType.subtype := MEDIASUBTYPE_PCM;
  MediaType.formattype := FORMAT_WaveFormatEx;
  MediaType.bFixedSizeSamples := True;
  MediaType.bTemporalCompression := False;
  MediaType.lSampleSize := Wfx.nBlockAlign;
  MediaType.cbFormat := SizeOf(TWaveFormatEx);
  MediaType.pbFormat := CoTaskMemAlloc(MediaType.cbFormat);
  FillChar(MediaType.pbFormat^, MediaType.cbFormat, 0);
  P := PWaveFormatEx(MediaType.pbFormat);
  P^ := Wfx;
end;


procedure TcbAudioFileReader.SetupRelaxedPcmMediaType(var MediaType: TAMMediaType);
begin
  { Do not put a WAVEFORMATEX block here.
    Some Windows 10 MP3 decoder chains refuse an exact 44100/stereo request
    when the Sample Grabber is used as the downstream filter, even though the
    same file renders fine in GraphStudioNext.  A partial media type lets
    DirectShow negotiate the real decoded PCM format by itself. }
  FillChar(MediaType, SizeOf(MediaType), 0);
  MediaType.majortype := MEDIATYPE_Audio;
  MediaType.subtype := MEDIASUBTYPE_PCM;
  MediaType.formattype := GUID_NULL;
  MediaType.bFixedSizeSamples := False;
  MediaType.bTemporalCompression := False;
  MediaType.lSampleSize := 0;
  MediaType.cbFormat := 0;
  MediaType.pbFormat := nil;
end;

procedure TcbAudioFileReader.ReadConnectedFormat(const Grabber: ISampleGrabber);
var
  Mt: TAMMediaType;
  P: PWaveFormatEx;
begin
  FillChar(Mt, SizeOf(Mt), 0);
  if Grabber.GetConnectedMediaType(Mt) = S_OK then
  begin
    try
      if IsEqualGUID(Mt.formattype, FORMAT_WaveFormatEx) and (Mt.pbFormat <> nil) then
      begin
        P := PWaveFormatEx(Mt.pbFormat);
        FFormat := P^;
        FFormat.cbSize := 0;
      end;
    finally
      FreeMediaTypeLocal(Mt);
    end;
  end;
end;


function PinDirLocal(const Pin: IPin; var Dir: TPinDirection): Boolean;
begin
  Result := (Pin <> nil) and (Pin.QueryDirection(Dir) = S_OK);
end;

function GetFirstPinLocal(const Filter: IBaseFilter; Direction: TPinDirection): IPin;
var
  EnumPins: IEnumPins;
  Pin: IPin;
  Fetched: Longint;
  Dir: TPinDirection;
begin
  Result := nil;
  if Filter = nil then
    Exit;
  if Filter.EnumPins(EnumPins) <> S_OK then
    Exit;
  while EnumPins.Next(1, Pin, @Fetched) = S_OK do
  begin
    if PinDirLocal(Pin, Dir) and (Dir = Direction) then
    begin
      Result := Pin;
      Exit;
    end;
    Pin := nil;
  end;
end;

function PinIsConnectedLocal(const Pin: IPin): Boolean;
var
  Other: IPin;
begin
  Result := (Pin <> nil) and (Pin.ConnectedTo(Other) = S_OK) and (Other <> nil);
end;

function PinMediaIsDecodedPcmAudioLocal(const Pin: IPin): Boolean;
var
  Mt: TAMMediaType;
  Wfx: PWaveFormatEx;
begin
  Result := False;
  FillChar(Mt, SizeOf(Mt), 0);

  if (Pin <> nil) and (Pin.ConnectionMediaType(Mt) = S_OK) then
  begin
    try
      if not IsEqualGUID(Mt.majortype, MEDIATYPE_Audio) then
        Exit;

      { Important:
        MP3 splitter/decoder input pins can also report MajorType=Audio, but
        their subtype is MPEG payload and wFormatTag is not PCM.  During refactoring this was an easy mistake to make: inserting the
        Sample Grabber before the decoder captures compressed MP3 packets, not PCM.  SampleGrabber must be inserted only on a decoded PCM link. }
      if not IsEqualGUID(Mt.formattype, FORMAT_WaveFormatEx) then
        Exit;
      if Mt.pbFormat = nil then
        Exit;

      Wfx := PWaveFormatEx(Mt.pbFormat);
      Result := (Wfx.wFormatTag = WAVE_FORMAT_PCM) and
                (Wfx.nChannels > 0) and
                (Wfx.nSamplesPerSec > 0) and
                (Wfx.wBitsPerSample > 0) and
                (Wfx.nBlockAlign > 0);
    finally
      FreeMediaTypeLocal(Mt);
    end;
  end;
end;

function FindDecodedPcmInputLocal(const Graph: IGraphBuilder): IPin;
var
  EnumFilters: IEnumFilters;
  Filter: IBaseFilter;
  Fetched: Longint;
  EnumPins: IEnumPins;
  Pin: IPin;
  Dir: TPinDirection;
  Other: IPin;
begin
  Result := nil;
  if Graph.EnumFilters(EnumFilters) <> S_OK then
    Exit;

  while EnumFilters.Next(1, Filter, @Fetched) = S_OK do
  begin
    if (Filter <> nil) and (Filter.EnumPins(EnumPins) = S_OK) then
    begin
      while EnumPins.Next(1, Pin, @Fetched) = S_OK do
      begin
        if PinDirLocal(Pin, Dir) and (Dir = PINDIR_INPUT) then
        begin
          Other := nil;
          if (Pin.ConnectedTo(Other) = S_OK) and (Other <> nil) and
             PinMediaIsDecodedPcmAudioLocal(Pin) then
          begin
            { This should be the input side of the decoded PCM connection,
              normally the audio renderer input.  We will disconnect this
              decoded PCM link and insert SampleGrabber there. }
            Result := Pin;
            Exit;
          end;
        end;
        Pin := nil;
      end;
    end;
    Filter := nil;
  end;
end;

function TcbAudioFileReader.BuildAndDecodeWithSampleGrabber(FileName: PChar): Boolean;
var
  Graph: IGraphBuilder;
  Control: IMediaControl;
  Seeking: IMediaSeeking;
  Event: IMediaEvent;
  MediaFilter: IMediaFilter;
  GrabberFilter: IBaseFilter;
  NullFilter: IBaseFilter;
  Grabber: ISampleGrabber;
  Mt: TAMMediaType;
  WFileName: WideString;
  Hr: HRESULT;
  EventCode: Longint;
  BufferLen: Longint;
  TimeoutMs: Longint;
  RendererIn: IPin;
  DecoderOut: IPin;
  GrabberIn: IPin;
  GrabberOut: IPin;
  NullIn: IPin;
  Collector: TSampleCollector;
  CollectorIntf: ISampleGrabberCB;
  ExpectedBytes64: Int64;
  ExpectedBytes: Longint;
begin
  Result := False;
  ClearDecodedData;
  IsValidFile := False;

  DebugLogLineLocal('==============================');
  DebugLogLineLocal('BuildAndDecodeWithSampleGrabber start');
  DebugLogLineLocal('File=' + String(FileName));

  SCheck(CoCreateInstance(CLSID_FilterGraph, nil, CLSCTX_INPROC_SERVER,
    IID_IGraphBuilder, Graph));

  WFileName := FileName;

  { Build the same normal playback graph that GraphStudioNext builds first.
    This lets Windows choose the normal MP3 splitter/decoder path. }
  DebugLogLineLocal('Calling Graph.RenderFile');
  Hr := Graph.RenderFile(PWideChar(WFileName), nil);
  DebugLogLineLocal('Graph.RenderFile hr=' + HResultToHexLocal(Hr));
  if not HResultSucceededLocal(Hr) then
    SCheck(Hr);

  DebugLogGraphConnectionsLocal(Graph, 'after RenderFile');

  RendererIn := FindDecodedPcmInputLocal(Graph);
  if RendererIn = nil then
  begin
    DebugLogLineLocal('FindDecodedPcmInputLocal returned nil');
    raise EAudioReadError.Create('Could not find decoded PCM audio connection.', E_FAIL);
  end;

  DebugLogPinMediaTypeLocal('Selected renderer/input pin', RendererIn);
  Hr := RendererIn.ConnectedTo(DecoderOut);
  DebugLogLineLocal('RendererIn.ConnectedTo hr=' + HResultToHexLocal(Hr));
  if not HResultSucceededLocal(Hr) then
    SCheck(Hr);
  DebugLogPinMediaTypeLocal('Selected decoder/output pin', DecoderOut);

  SCheck(CoCreateInstance(CLSID_SampleGrabber, nil, CLSCTX_INPROC_SERVER,
    IID_IBaseFilter, GrabberFilter));
  SCheck(GrabberFilter.QueryInterface(ISampleGrabber, Grabber));

  SetupRelaxedPcmMediaType(Mt);
  Hr := Grabber.SetMediaType(Mt);
  DebugLogLineLocal('Grabber.SetMediaType relaxed PCM hr=' + HResultToHexLocal(Hr));
  if not HResultSucceededLocal(Hr) then
    SCheck(Hr);
  Hr := Grabber.SetOneShot(False);
  DebugLogLineLocal('Grabber.SetOneShot hr=' + HResultToHexLocal(Hr));
  if not HResultSucceededLocal(Hr) then
    SCheck(Hr);

  { Do not use GetCurrentBuffer as the main capture method.
    It is not a full-file accumulator.  We collect every decoded PCM buffer
    through BufferCB while the graph runs. }
  Hr := Grabber.SetBufferSamples(False);
  DebugLogLineLocal('Grabber.SetBufferSamples(False) hr=' + HResultToHexLocal(Hr));
  if not HResultSucceededLocal(Hr) then
    SCheck(Hr);

  Collector := TSampleCollector.Create;
  CollectorIntf := Collector as ISampleGrabberCB;
  Hr := Grabber.SetCallback(CollectorIntf, 1);
  DebugLogLineLocal('Grabber.SetCallback(BufferCB) hr=' + HResultToHexLocal(Hr));
  if not HResultSucceededLocal(Hr) then
    SCheck(Hr);

  SCheck(Graph.AddFilter(GrabberFilter, 'Sample Grabber'));
  SCheck(CoCreateInstance(CLSID_NullRenderer, nil, CLSCTX_INPROC_SERVER,
    IID_IBaseFilter, NullFilter));
  SCheck(Graph.AddFilter(NullFilter, 'Null Renderer'));

  GrabberIn := GetFirstPinLocal(GrabberFilter, PINDIR_INPUT);
  GrabberOut := GetFirstPinLocal(GrabberFilter, PINDIR_OUTPUT);
  NullIn := GetFirstPinLocal(NullFilter, PINDIR_INPUT);

  if (GrabberIn = nil) or (GrabberOut = nil) or (NullIn = nil) then
    raise EAudioReadError.Create('Could not find SampleGrabber/NullRenderer pins.', E_FAIL);

  { Replace: Decoder -> Audio Renderer
    With:    Decoder -> SampleGrabber -> Null Renderer }
  DebugLogLineLocal('Disconnect decoder output');
  Hr := Graph.Disconnect(DecoderOut);
  DebugLogLineLocal('Graph.Disconnect(DecoderOut) hr=' + HResultToHexLocal(Hr));
  if not HResultSucceededLocal(Hr) then
    SCheck(Hr);

  DebugLogLineLocal('Disconnect renderer input');
  Hr := Graph.Disconnect(RendererIn);
  DebugLogLineLocal('Graph.Disconnect(RendererIn) hr=' + HResultToHexLocal(Hr));
  if not HResultSucceededLocal(Hr) then
    SCheck(Hr);

  DebugLogLineLocal('Connect decoder output -> SampleGrabber input');
  Hr := Graph.Connect(DecoderOut, GrabberIn);
  DebugLogLineLocal('Graph.Connect(DecoderOut, GrabberIn) hr=' + HResultToHexLocal(Hr));
  if not HResultSucceededLocal(Hr) then
    SCheck(Hr);

  DebugLogLineLocal('Connect SampleGrabber output -> NullRenderer input');
  Hr := Graph.Connect(GrabberOut, NullIn);
  DebugLogLineLocal('Graph.Connect(GrabberOut, NullIn) hr=' + HResultToHexLocal(Hr));
  if not HResultSucceededLocal(Hr) then
    SCheck(Hr);

  DebugLogGraphConnectionsLocal(Graph, 'after inserting SampleGrabber');

  ReadConnectedFormat(Grabber);
  if FFormat.nBlockAlign = 0 then
    FFormat := FRequestedFormat;

  if Graph.QueryInterface(IID_IMediaSeeking, Seeking) = S_OK then
    Seeking.GetDuration(FDuration)
  else
    FDuration := 0;

  SCheck(Graph.QueryInterface(IID_IMediaControl, Control));
  SCheck(Graph.QueryInterface(IID_IMediaEvent, Event));

  { Important for file loading:
    Without this, DirectShow may keep the normal audio renderer clock that was
    created by RenderFile.  Then decoding can run in real time, so loading a
    5 minute MP3 looks like the program is frozen for 5 minutes.
    Removing the graph clock lets the SampleGrabber/NullRenderer chain decode
    as fast as the filters can deliver data. }
  Hr := Graph.QueryInterface(IID_IMediaFilter, MediaFilter);
  DebugLogLineLocal('Graph.QueryInterface(IMediaFilter) hr=' + HResultToHexLocal(Hr));
  if HResultSucceededLocal(Hr) and (MediaFilter <> nil) then
  begin
    Hr := MediaFilter.SetSyncSource(nil);
    DebugLogLineLocal('MediaFilter.SetSyncSource(nil) hr=' + HResultToHexLocal(Hr));
    if not HResultSucceededLocal(Hr) then
      SCheck(Hr);
  end;

  ExpectedBytes64 := 0;
  ExpectedBytes := 0;
  if (FDuration > 0) and (FFormat.nAvgBytesPerSec > 0) then
  begin
    ExpectedBytes64 := (FDuration * Int64(FFormat.nAvgBytesPerSec)) div 10000000;
    if (FFormat.nBlockAlign > 0) then
      ExpectedBytes64 := ExpectedBytes64 + FFormat.nBlockAlign * 4096;
    { keep it inside signed 32-bit range for Delphi 7 TMemoryStream }
    if (ExpectedBytes64 > 0) and (ExpectedBytes64 < $70000000) then
      ExpectedBytes := Longint(ExpectedBytes64);
  end;
  DebugLogLineLocal('Prealloc expected bytes=' + IntToStr(ExpectedBytes));
  Collector.Prepare(ExpectedBytes);

  DebugLogLineLocal('Control.Run');
  Hr := Control.Run;
  DebugLogLineLocal('Control.Run hr=' + HResultToHexLocal(Hr));
  if not HResultSucceededLocal(Hr) then
    SCheck(Hr);

  TimeoutMs := 60000;
  if FDuration > 0 then
  begin
    TimeoutMs := Longint((FDuration div 10000) + 30000);
    if TimeoutMs < 60000 then
      TimeoutMs := 60000;
  end;

  DebugLogLineLocal('WaitForCompletion timeout=' + IntToStr(TimeoutMs));
  Hr := Event.WaitForCompletion(TimeoutMs, EventCode);
  DebugLogLineLocal('WaitForCompletion hr=' + HResultToHexLocal(Hr) + ' event=' + IntToStr(EventCode));
  Control.Stop;

  BufferLen := Collector.Stream.Position;
  if (BufferLen > 0) and (BufferLen < Collector.Stream.Size) then
    Collector.Stream.Size := BufferLen;
  DebugLogLineLocal('Collector decoded bytes=' + IntToStr(BufferLen));

  { Break the SampleGrabber -> callback reference as soon as capture is done.
    This helps the temporary DirectShow graph disappear cleanly before the
    application creates/loads the next file. }
  try
    if Grabber <> nil then
      Grabber.SetCallback(nil, 0);
  except
  end;

  if BufferLen <= 0 then
    Exit;

  GetMem(FDecodedData, BufferLen);
  FillChar(FDecodedData^, BufferLen, 0);
  Collector.Stream.Position := 0;
  Collector.Stream.ReadBuffer(FDecodedData^, BufferLen);

  FDecodedSize := Cardinal(BufferLen);
  FBytePosition := 0;
  FPosition := 0;
  FLastReadingStartTime := 0;
  FLastReadingEndTime := 0;
  Result := True;
  IsValidFile := True;
end;

function TcbAudioFileReader.OpenFile(FileName: PChar): Boolean;
begin
  FFileName := FileName;
  FSelStart := 0;
  FSelLength := 0;
  FPosition := 0;
  FLastReadingStartTime := 0;
  FLastReadingEndTime := 0;
  Result := BuildAndDecodeWithSampleGrabber(FileName);
end;

procedure TcbAudioFileReader.CloseFile;
begin
  ClearDecodedData;
end;

procedure TcbAudioFileReader.SetRequestedFormat(const Value: TWaveFormatEx);
begin
  FRequestedFormat := Value;
  FUseRequestedFormat := True;
end;

function TcbAudioFileReader.Read(var Buffer; Size: DWord): DWord;
var
  Available: Cardinal;
  ReadSize: Cardinal;
  StartByte: Cardinal;
  EndByte: Cardinal;
begin
  Result := 0;
  if Size = 0 then
    SCheck(DSUSER_INVALIDSIZE);
  if FDecodedData = nil then
    Exit;

  if FBytePosition >= FDecodedSize then
    Exit;

  Available := FDecodedSize - FBytePosition;
  ReadSize := Size;
  if ReadSize > Available then
    ReadSize := Available;

  { keep full PCM frames only }
  if FFormat.nBlockAlign > 0 then
    ReadSize := ReadSize - (ReadSize mod FFormat.nBlockAlign);
  if ReadSize = 0 then
    Exit;

  StartByte := FBytePosition;
  Move(PByteArray(FDecodedData)^[FBytePosition], Buffer, ReadSize);
  Inc(FBytePosition, ReadSize);
  EndByte := FBytePosition;

  if FFormat.nAvgBytesPerSec > 0 then
  begin
    FLastReadingStartTime := Int64(StartByte) * 10000000 div FFormat.nAvgBytesPerSec;
    FLastReadingEndTime := Int64(EndByte) * 10000000 div FFormat.nAvgBytesPerSec;
    FPosition := FLastReadingEndTime;
  end
  else
  begin
    FLastReadingStartTime := FPosition;
    Inc(FPosition, ReadSize);
    FLastReadingEndTime := FPosition;
  end;

  Result := ReadSize;
end;

procedure TcbAudioFileReader.SetPosition(Value: Int64);
var
  NewBytePos: Int64;
begin
  if Value < 0 then
    Value := 0;
  if (FDuration > 0) and (Value > FDuration) then
    Value := FDuration;

  FPosition := Value;
  if FFormat.nAvgBytesPerSec > 0 then
  begin
    NewBytePos := Value * FFormat.nAvgBytesPerSec div 10000000;
    if FFormat.nBlockAlign > 0 then
      NewBytePos := NewBytePos - (NewBytePos mod FFormat.nBlockAlign);
    if NewBytePos < 0 then
      NewBytePos := 0;
    if NewBytePos > FDecodedSize then
      NewBytePos := FDecodedSize;
    FBytePosition := Cardinal(NewBytePos);
  end;
end;

procedure TcbAudioFileReader.SetSelStart(Value: Int64);
begin
  if Value < 0 then
    Value := 0;
  FSelStart := Value;
  if FPosition < FSelStart then
    SetPosition(FSelStart);
end;

procedure TcbAudioFileReader.SetSelLength(Value: Int64);
begin
  if (Value <> 0) and (Value < MIN_SEL_LENGTH) then
    Value := MIN_SEL_LENGTH;
  if Value > MAX_SEL_LENGTH then
    Value := MAX_SEL_LENGTH;
  FSelLength := Value;
end;

initialization

finalization

end.
