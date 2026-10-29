unit SimpleFFT;

{------------------------------------------------------------------------------
  SimpleFFT

  Small in-project FFT helper used only for the spectrum analyzer display.
  It replaces the old external dspFFT component so the project can compile
  without installing paid or third-party visual/audio packages.

  The output is intended for animation and teaching, not precision measurement.
------------------------------------------------------------------------------}

interface

procedure CalculateFFT1024(Samples: PSmallInt; Step: Integer; var Magnitudes: array of Double);

implementation

uses Math;

const
  FFT_SIZE = 1024;

type
  TFloatArray = array[0..FFT_SIZE-1] of Double;

procedure CalculateFFT1024(Samples: PSmallInt; Step: Integer; var Magnitudes: array of Double);
var
  RealPart, ImagPart: TFloatArray;
  i, j, k, n, HalfSize, TableStep: Integer;
  Angle, Wr, Wi, Tr, Ti: Double;
  P: PSmallInt;
begin
  P := Samples;
  for i := 0 to FFT_SIZE-1 do begin
    RealPart[i] := P^ / 32768.0;
    ImagPart[i] := 0.0;
    Inc(P, Step);
  end;

  j := 0;
  for i := 1 to FFT_SIZE-2 do begin
    n := FFT_SIZE shr 1;
    while j >= n do begin
      Dec(j, n);
      n := n shr 1;
    end;
    Inc(j, n);
    if i < j then begin
      Tr := RealPart[i]; RealPart[i] := RealPart[j]; RealPart[j] := Tr;
      Ti := ImagPart[i]; ImagPart[i] := ImagPart[j]; ImagPart[j] := Ti;
    end;
  end;

  HalfSize := 1;
  while HalfSize < FFT_SIZE do begin
    TableStep := HalfSize shl 1;
    for i := 0 to HalfSize-1 do begin
      Angle := -2.0 * Pi * i / TableStep;
      Wr := Cos(Angle);
      Wi := Sin(Angle);
      k := i;
      while k < FFT_SIZE do begin
        j := k + HalfSize;
        Tr := Wr * RealPart[j] - Wi * ImagPart[j];
        Ti := Wr * ImagPart[j] + Wi * RealPart[j];
        RealPart[j] := RealPart[k] - Tr;
        ImagPart[j] := ImagPart[k] - Ti;
        RealPart[k] := RealPart[k] + Tr;
        ImagPart[k] := ImagPart[k] + Ti;
        Inc(k, TableStep);
      end;
    end;
    HalfSize := TableStep;
  end;

  n := High(Magnitudes);
  if n > FFT_SIZE div 2 then n := FFT_SIZE div 2;
  for i := 0 to n do
    Magnitudes[i] := Sqrt(RealPart[i]*RealPart[i] + ImagPart[i]*ImagPart[i]);
end;

end.
