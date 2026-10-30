# ALTEK Audio Player

A classic Win32 audio player written in Delphi, preserved and modernized as an educational source project.

Features include DirectSound playback and effects, MP3/WAV decoding through DirectShow, waveform rendering, FFT spectrum analysis, LED-style VU meters, and volume, pan, frequency, and position controls.

![Platform](https://img.shields.io/badge/platform-Windows%20Win32-0078d4)
![Language](https://img.shields.io/badge/language-Delphi-e62431)

## Source and executable

The complete project is in [`audio-player-delphi-source/`](audio-player-delphi-source/). It includes the Delphi source, DirectX Pascal headers used for Delphi 7 compatibility, and a prebuilt `DSTest.exe`.

See the [detailed project notes](audio-player-delphi-source/README.txt) for architecture, build instructions, compatibility information, removed dependencies, and known DirectShow limitations.

## Build

- Delphi 7 on Windows XP: open `DSTest.dpr`; add the included `DirectX9` folder to the IDE library path if required.
- Modern RAD Studio: open or import `DSTest.dpr` and build for **Win32**.

This project has not been converted to Win64. MP3 support depends on the DirectShow filters installed on Windows.

## Credits

Original authors: Mohammad Samadpour and Vahid Nasehi.

Refactored and prepared for the ALTEK educational archive.

## License

Released under the [MIT License](LICENSE).
