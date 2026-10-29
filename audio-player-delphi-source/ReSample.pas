unit ReSample;

{------------------------------------------------------------------------------
  ReSample

  Basic PCM conversion helpers used by AudioReader.

  The original project only needed simple offline conversion into the player's
  preferred format.  The 16-bit rate conversion now uses linear interpolation
  so low-rate decoder output sounds smoother when it must be converted to
  44.1 kHz.  The goal is clarity and Delphi 7 compatibility rather than a
  professional studio-grade resampling algorithm.
------------------------------------------------------------------------------}

interface

procedure MonoToStereo8Bit(InBuffer, OutBuffer: Pointer; SampleCount: Cardinal);
procedure StereoToMono8Bit(InBuffer, OutBuffer: Pointer; SampleCount: Cardinal);
procedure MonoToStereo16Bit(InBuffer, OutBuffer: Pointer; SampleCount: Cardinal);
procedure StereoToMono16Bit(InBuffer, OutBuffer: Pointer; SampleCount: Cardinal);
procedure MonoToStereo24Bit(InBuffer, OutBuffer: Pointer; SampleCount: Cardinal);
procedure StereoToMono24Bit(InBuffer, OutBuffer: Pointer; SampleCount: Cardinal);
procedure ChangeBitRate8To16(InBuffer, OutBuffer: Pointer; SampleCount: Cardinal);
procedure ChangeBitRate8To24(InBuffer, OutBuffer: Pointer; SampleCount: Cardinal);
procedure ChangeBitRate16To8(InBuffer, OutBuffer: Pointer; SampleCount: Cardinal);
procedure ChangeBitRate16To24(InBuffer, OutBuffer: Pointer; SampleCount: Cardinal);
procedure ChangeBitRate24To8(InBuffer, OutBuffer: Pointer; SampleCount: Cardinal);
procedure ChangeBitRate24To16(InBuffer, OutBuffer: Pointer; SampleCount: Cardinal);
procedure ChangeRate8(InBuffer, OutBuffer: Pointer; InSampleCount, InSampleRate, OutSampleRate: Cardinal; Stereo: Boolean);
procedure ChangeRate16(InBuffer, OutBuffer: Pointer; InSampleCount, InSampleRate, OutSampleRate: Cardinal; Stereo: Boolean);
procedure ChangeRate24(InBuffer, OutBuffer: Pointer; InSampleCount, InSampleRate, OutSampleRate: Cardinal; Stereo: Boolean);

implementation

type
  PByteArray = ^TByteArray;
  TByteArray = array[0..MaxInt div 16] of Byte;
  PSmallIntArray = ^TSmallIntArray;
  TSmallIntArray = array[0..MaxInt div 16] of SmallInt;

procedure MonoToStereo8Bit(InBuffer, OutBuffer: Pointer; SampleCount: Cardinal);
var i: Cardinal; S: Byte;
begin
  for i := 0 to SampleCount-1 do begin
    S := PByteArray(InBuffer)^[i];
    PByteArray(OutBuffer)^[i*2] := S;
    PByteArray(OutBuffer)^[i*2+1] := S;
  end;
end;

procedure StereoToMono8Bit(InBuffer, OutBuffer: Pointer; SampleCount: Cardinal);
var i: Cardinal; L,R: Integer;
begin
  for i := 0 to SampleCount-1 do begin
    L := PByteArray(InBuffer)^[i*2]; R := PByteArray(InBuffer)^[i*2+1];
    PByteArray(OutBuffer)^[i] := Byte((L+R) div 2);
  end;
end;

procedure MonoToStereo16Bit(InBuffer, OutBuffer: Pointer; SampleCount: Cardinal);
var i: Cardinal; S: SmallInt;
begin
  for i := 0 to SampleCount-1 do begin
    S := PSmallIntArray(InBuffer)^[i];
    PSmallIntArray(OutBuffer)^[i*2] := S;
    PSmallIntArray(OutBuffer)^[i*2+1] := S;
  end;
end;

procedure StereoToMono16Bit(InBuffer, OutBuffer: Pointer; SampleCount: Cardinal);
var i: Cardinal; L,R: Integer;
begin
  for i := 0 to SampleCount-1 do begin
    L := PSmallIntArray(InBuffer)^[i*2]; R := PSmallIntArray(InBuffer)^[i*2+1];
    PSmallIntArray(OutBuffer)^[i] := SmallInt((L+R) div 2);
  end;
end;

procedure MonoToStereo24Bit(InBuffer, OutBuffer: Pointer; SampleCount: Cardinal);
var i: Cardinal; Src,Dst: PByteArray;
begin
  Src := InBuffer; Dst := OutBuffer;
  for i := 0 to SampleCount-1 do begin
    Dst^[i*6] := Src^[i*3]; Dst^[i*6+1] := Src^[i*3+1]; Dst^[i*6+2] := Src^[i*3+2];
    Dst^[i*6+3] := Src^[i*3]; Dst^[i*6+4] := Src^[i*3+1]; Dst^[i*6+5] := Src^[i*3+2];
  end;
end;

procedure StereoToMono24Bit(InBuffer, OutBuffer: Pointer; SampleCount: Cardinal);
begin
  { Keep the left channel for the simple educational build. }
  Move(InBuffer^, OutBuffer^, SampleCount*3);
end;

procedure ChangeBitRate8To16(InBuffer, OutBuffer: Pointer; SampleCount: Cardinal);
var i: Cardinal;
begin
  for i := 0 to SampleCount-1 do PSmallIntArray(OutBuffer)^[i] := (Integer(PByteArray(InBuffer)^[i])-128) shl 8;
end;

procedure ChangeBitRate8To24(InBuffer, OutBuffer: Pointer; SampleCount: Cardinal);
var i: Cardinal; V: Integer; D: PByteArray;
begin
  D := OutBuffer;
  for i := 0 to SampleCount-1 do begin
    V := (Integer(PByteArray(InBuffer)^[i])-128) shl 16;
    D^[i*3] := V and $FF; D^[i*3+1] := (V shr 8) and $FF; D^[i*3+2] := (V shr 16) and $FF;
  end;
end;

procedure ChangeBitRate16To8(InBuffer, OutBuffer: Pointer; SampleCount: Cardinal);
var i: Cardinal; V: Integer;
begin
  for i := 0 to SampleCount-1 do begin
    V := (Integer(PSmallIntArray(InBuffer)^[i]) shr 8) + 128;
    if V < 0 then V := 0 else if V > 255 then V := 255;
    PByteArray(OutBuffer)^[i] := Byte(V);
  end;
end;

procedure ChangeBitRate16To24(InBuffer, OutBuffer: Pointer; SampleCount: Cardinal);
var i: Cardinal; V: Integer; D: PByteArray;
begin
  D := OutBuffer;
  for i := 0 to SampleCount-1 do begin
    V := Integer(PSmallIntArray(InBuffer)^[i]) shl 8;
    D^[i*3] := V and $FF; D^[i*3+1] := (V shr 8) and $FF; D^[i*3+2] := (V shr 16) and $FF;
  end;
end;

procedure ChangeBitRate24To8(InBuffer, OutBuffer: Pointer; SampleCount: Cardinal);
var i: Cardinal; D: PByteArray;
begin
  D := InBuffer;
  for i := 0 to SampleCount-1 do PByteArray(OutBuffer)^[i] := D^[i*3+2] + 128;
end;

procedure ChangeBitRate24To16(InBuffer, OutBuffer: Pointer; SampleCount: Cardinal);
var i: Cardinal; D: PByteArray; V: Integer;
begin
  D := InBuffer;
  for i := 0 to SampleCount-1 do begin
    V := (D^[i*3+1]) or (D^[i*3+2] shl 8);
    PSmallIntArray(OutBuffer)^[i] := SmallInt(V);
  end;
end;

procedure ChangeRate8(InBuffer, OutBuffer: Pointer; InSampleCount, InSampleRate, OutSampleRate: Cardinal; Stereo: Boolean);
var OutCount, FrameSize, i, SrcIndex: Cardinal;
begin
  if InSampleRate = 0 then Exit;
  FrameSize := 1; if Stereo then FrameSize := 2;
  OutCount := InSampleCount * OutSampleRate div InSampleRate;
  for i := 0 to OutCount-1 do begin
    SrcIndex := i * InSampleRate div OutSampleRate;
    Move(PByteArray(InBuffer)^[SrcIndex*FrameSize], PByteArray(OutBuffer)^[i*FrameSize], FrameSize);
  end;
end;

procedure ChangeRate16(InBuffer, OutBuffer: Pointer; InSampleCount, InSampleRate, OutSampleRate: Cardinal; Stereo: Boolean);
const
  FP_SHIFT = 16;
  FP_ONE   = 1 shl FP_SHIFT;
var
  OutCount: Cardinal;
  ChannelCount: Cardinal;
  i, ch: Cardinal;
  SrcPos: Int64;
  SrcIndex: Cardinal;
  NextIndex: Cardinal;
  Frac: Integer;
  S1, S2, V: Integer;
  Src, Dst: PSmallIntArray;
begin
  if (InSampleRate = 0) or (OutSampleRate = 0) or (InSampleCount = 0) then
    Exit;

  {
    The older version used nearest-neighbour resampling:
      SrcIndex := i * InSampleRate div OutSampleRate

    That is fast, but when Windows/DirectShow gives us a lower sample-rate MP3
    stream, upsampling with nearest-neighbour sounds rough/low quality.
    This linear interpolation path is still simple and Delphi 7 friendly.
  }
  ChannelCount := 1;
  if Stereo then
    ChannelCount := 2;

  OutCount := Cardinal((Int64(InSampleCount) * OutSampleRate) div InSampleRate);
  Src := InBuffer;
  Dst := OutBuffer;

  for i := 0 to OutCount - 1 do
  begin
    SrcPos := (Int64(i) * InSampleRate * FP_ONE) div OutSampleRate;
    SrcIndex := Cardinal(SrcPos shr FP_SHIFT);
    Frac := Integer(SrcPos and (FP_ONE - 1));

    if SrcIndex >= InSampleCount then
      SrcIndex := InSampleCount - 1;

    NextIndex := SrcIndex + 1;
    if NextIndex >= InSampleCount then
      NextIndex := SrcIndex;

    for ch := 0 to ChannelCount - 1 do
    begin
      S1 := Src^[SrcIndex * ChannelCount + ch];
      S2 := Src^[NextIndex * ChannelCount + ch];
      V := (S1 * (FP_ONE - Frac) + S2 * Frac) div FP_ONE;
      Dst^[i * ChannelCount + ch] := SmallInt(V);
    end;
  end;
end;

procedure ChangeRate24(InBuffer, OutBuffer: Pointer; InSampleCount, InSampleRate, OutSampleRate: Cardinal; Stereo: Boolean);
var OutCount, FrameSize, i, SrcIndex: Cardinal;
begin
  if InSampleRate = 0 then Exit;
  FrameSize := 3; if Stereo then FrameSize := 6;
  OutCount := InSampleCount * OutSampleRate div InSampleRate;
  for i := 0 to OutCount-1 do begin
    SrcIndex := i * InSampleRate div OutSampleRate;
    Move(PByteArray(InBuffer)^[SrcIndex*FrameSize], PByteArray(OutBuffer)^[i*FrameSize], FrameSize);
  end;
end;

end.
