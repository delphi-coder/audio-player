unit DSoundCompat;

{------------------------------------------------------------------------------
  DSoundCompat

  Compatibility helper for one DirectSound API difference.

  Some Delphi 7-era DirectSound headers declare IDirectSoundBuffer.Lock with
  `out Pointer` / `out DWORD` parameters.  Modern RAD Studio headers use the
  C-style `PPointer` / `PDWORD` parameters.  Calling the wrong signature can
  compile after manual edits but leave the DirectSound buffer silent because the
  returned buffer pointer is not assigned correctly.

  DSBufferLock exposes one stable, easy call to the rest of the program and
  internally performs the COM vtable call with pointer-to-pointer arguments.
  This avoids version-specific compiler conditionals in MainUnit.
------------------------------------------------------------------------------}

interface

uses
  Windows, ActiveX;

type
  { Minimal compatibility view of IDirectSoundBuffer.
    It is used only to call Lock through the real COM vtable with a stable
    PPointer/PDWORD signature. The method order below must match Microsoft's
    IDirectSoundBuffer layout up to Lock. }
  IDirectSoundBufferCompat = interface(IUnknown)
    ['{279AFA85-4981-11CE-A521-0020AF0BE560}']
    function GetCaps(pDSBufferCaps: Pointer): HResult; stdcall;
    function GetCurrentPosition(pdwCurrentPlayCursor, pdwCurrentWriteCursor: PDWORD): HResult; stdcall;
    function GetFormat(pwfxFormat: Pointer; dwSizeAllocated: DWORD; pdwSizeWritten: PDWORD): HResult; stdcall;
    function GetVolume(plVolume: PLongInt): HResult; stdcall;
    function GetPan(plPan: PLongInt): HResult; stdcall;
    function GetFrequency(pdwFrequency: PDWORD): HResult; stdcall;
    function GetStatus(pdwStatus: PDWORD): HResult; stdcall;
    function Initialize(pDirectSound: Pointer; pDSBufferDesc: Pointer): HResult; stdcall;
    function Lock(dwOffset, dwBytes: DWORD;
      ppvAudioPtr1: PPointer; pdwAudioBytes1: PDWORD;
      ppvAudioPtr2: PPointer; pdwAudioBytes2: PDWORD;
      dwFlags: DWORD): HResult; stdcall;
  end;

function DSBufferLock(const Buffer: IUnknown;
  dwOffset, dwBytes: DWORD;
  var ppvAudioPtr1: Pointer; var pdwAudioBytes1: DWORD;
  var ppvAudioPtr2: Pointer; var pdwAudioBytes2: DWORD;
  dwFlags: DWORD): HResult;

implementation

function DSBufferLock(const Buffer: IUnknown;
  dwOffset, dwBytes: DWORD;
  var ppvAudioPtr1: Pointer; var pdwAudioBytes1: DWORD;
  var ppvAudioPtr2: Pointer; var pdwAudioBytes2: DWORD;
  dwFlags: DWORD): HResult;
var
  CompatBuffer: IDirectSoundBufferCompat;
begin
  if Buffer = nil then
  begin
    Result := E_POINTER;
    Exit;
  end;

  Result := Buffer.QueryInterface(IDirectSoundBufferCompat, CompatBuffer);
  if Failed(Result) then
    Exit;

  Result := CompatBuffer.Lock(dwOffset, dwBytes,
    @ppvAudioPtr1, @pdwAudioBytes1,
    @ppvAudioPtr2, @pdwAudioBytes2,
    dwFlags);
end;

end.
