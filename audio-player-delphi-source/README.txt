ALTEK Audio Player - Delphi Source
==================================

Overview
--------
This is a cleaned and modernized educational version of an older Delphi audio
player project. The original program was developed by Mohammad Samadpour and
Vahid Nasehi and has now been prepared as an ALTEK educational source project.

The project demonstrates classic Windows audio programming with Delphi:

- DirectSound playback
- DirectSound effects
- MP3/WAV decoding through DirectShow and Sample Grabber
- waveform rendering
- spectrum analyzer display using an in-project FFT helper
- LED-style VU meters
- volume, pan, frequency and playback-position control

The goal is not to compete with modern media players such as VLC.  The goal is
to keep a real Delphi/Win32 audio project understandable, buildable and useful
for learning.

Tested Environments
-------------------
The cleaned source was tested by the project owner in:

- Delphi 7 on Windows XP
- RAD Studio 13 in Win32 mode

RAD Studio users should build the project as a Win32 application.  The project
was not prepared as a Win64 conversion.

Project Structure
-----------------

Main files:

- DSTest.dpr
  Project entry point.

- MainUnit.pas / MainUnit.dfm
  Main form, DirectSound playback, effects, waveform, spectrum analyzer and VU
  meter rendering.

- AudioReader.pas
  Conversion layer that reads decoded PCM and converts it to the player's target
  format: 44.1 kHz, 16-bit, stereo PCM.

- cbAudioFileRead.pas
  Project-owned DirectShow + Sample Grabber audio reader.  It builds a normal
  DirectShow graph, locates the decoded PCM connection, inserts Sample Grabber
  after the decoder, and collects the decoded PCM data in memory.

- DSoundCompat.pas
  Compatibility wrapper for IDirectSoundBuffer.Lock.  Delphi 7-era DirectSound
  headers and modern RAD Studio headers declare this method differently.  This
  helper gives the main code one stable call without compiler-version IFDEFs.

- ReSample.pas
  Basic PCM format conversion helpers.  The 16-bit sample-rate conversion uses
  linear interpolation.

- SimpleFFT.pas
  Small in-project FFT helper for the visual spectrum analyzer.  This replaces
  the old external dspFFT dependency.

- clean.bat
  Deletes common Delphi build-output files.

- DirectX9/
  DirectX Pascal headers used for Delphi 7 compatibility.  In Delphi 7, add this
  folder to Tools > Environment Options > Library > Library Path if the compiler
  cannot find DirectSound, DirectShow9 or related DirectX units.

What Was Removed
----------------
The original project had several dependencies and experimental layers that made
it harder to build.  The cleaned package removes them:

- old plugin/CEP architecture
- MP3Encoder.cep and WaveWriter.cep
- old IAMMultiMediaStream-based reader path
- old third-party audio-reader implementation
- DirectAudio.dll dependency
- Graphics32 / TImage32 dependency
- installed VU meter and spectrum analyzer components
- external/paid dspFFT dependency
- FastMM dependency
- patch-note/version-history files from the refactoring process
- unused export/plugin helper units

Audio Decoding Notes
--------------------
MP3/WAV input is decoded through Windows DirectShow filters.  This keeps the
project small and avoids shipping a large codec library.

The reader intentionally inserts Sample Grabber after the decoded PCM output.
This is important.  If Sample Grabber is inserted directly after the MP3 splitter,
it may capture compressed MP3 packets instead of PCM audio.

Known limitation:
MP3 support depends on the DirectShow filters installed on the user's Windows
system.  Most ordinary MP3 files work, but some unusual encodings may fail.  For
maximum compatibility, use PCM WAV files or convert problematic MP3 files to a
standard MP3/WAV format.

The program now shows a clean error message when DirectShow cannot decode a file.

Build Notes
-----------
Delphi 7:

1. Open DSTest.dpr.
2. Add the included DirectX9 folder to Delphi's Library Path if required.
3. Build the project.

RAD Studio / modern Delphi:

1. Open DSTest.dpr or import the project.
2. Build as Win32.
3. If your IDE already includes DirectSound/DirectShow units, the included
   DirectX9 folder may not be needed.

Design Notes
------------
The player keeps the original form layout and feature set as much as possible,
but standard VCL controls are used for the custom displays:

- TImage for waveform areas
- TPaintBox for VU meters and spectrum analyzers

Rendering is done with off-screen bitmaps where useful to reduce flicker on old
systems.

Credits
-------
Original author: Mohammad Samadpour & Vahid Nasehi

Refactored and prepared for: ALTEK educational archive

This source package is intended for educational and archival use.
