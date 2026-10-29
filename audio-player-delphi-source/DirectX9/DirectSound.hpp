// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'DirectSound.pas' rev: 6.00

#ifndef DirectSoundHPP
#define DirectSoundHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <MMSystem.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------
#define DIRECTSOUND_VERSION         0x0900
#include "dsound.h"

#ifndef DX_SHARED_DEFINES_BCB

typedef D3DVALUE TD3DValue;
typedef D3DVALUE *PD3DValue;

#ifndef D3DCOLOR_DEFINED_BCB
typedef D3DCOLOR TD3DColor;
#define D3DCOLOR_DEFINED_BCB
#endif

#ifndef D3DVECTOR_DEFINED_BCB
typedef _D3DVECTOR TD3DVector;
typedef _D3DVECTOR *PD3DVector;
#define D3DVECTOR_DEFINED_BCB
#endif

#define DX_SHARED_DEFINES_BCB
#endif // DX_SHARED_DEFINES_BCB

DECLARE_DINTERFACE_TYPE(IReferenceClock);
DECLARE_DINTERFACE_TYPE(IDirectSound);
DECLARE_DINTERFACE_TYPE(IDirectSound8);
DECLARE_DINTERFACE_TYPE(IDirectSoundBuffer);
DECLARE_DINTERFACE_TYPE(IDirectSoundBuffer8);
DECLARE_DINTERFACE_TYPE(IDirectSound3DListener);
DECLARE_DINTERFACE_TYPE(IDirectSound3DBuffer);
DECLARE_DINTERFACE_TYPE(IDirectSoundCapture);
DECLARE_DINTERFACE_TYPE(IDirectSoundCaptureBuffer);
DECLARE_DINTERFACE_TYPE(IDirectSoundCaptureBuffer8);
DECLARE_DINTERFACE_TYPE(IDirectSoundNotify);
DECLARE_DINTERFACE_TYPE(IKsPropertySet);
DECLARE_DINTERFACE_TYPE(IDirectSoundFXGargle);
DECLARE_DINTERFACE_TYPE(IDirectSoundFXChorus);
DECLARE_DINTERFACE_TYPE(IDirectSoundFXFlanger);
DECLARE_DINTERFACE_TYPE(IDirectSoundFXEcho);
DECLARE_DINTERFACE_TYPE(IDirectSoundFXDistortion);
DECLARE_DINTERFACE_TYPE(IDirectSoundFXCompressor);
DECLARE_DINTERFACE_TYPE(IDirectSoundFXParamEq);
DECLARE_DINTERFACE_TYPE(IDirectSoundFXI3DL2Reverb);
DECLARE_DINTERFACE_TYPE(IDirectSoundFXWavesReverb);
DECLARE_DINTERFACE_TYPE(IDirectSoundCaptureFXAec);
DECLARE_DINTERFACE_TYPE(IDirectSoundCaptureFXNoiseSuppress);
DECLARE_DINTERFACE_TYPE(IDirectSoundFullDuplex);
typedef LPDSENUMCALLBACKA TDSEnumCallbackA;
typedef LPDSENUMCALLBACKW TDSEnumCallbackW;
typedef LPDSENUMCALLBACK TDSEnumCallback;

namespace Directsound
{
//-- type declarations -------------------------------------------------------
typedef _DSCAPS *PDSCaps;

typedef _DSCAPS  TDSCaps;

typedef _DSBCAPS *PDSBcaps;

typedef _DSBCAPS  TDSBcaps;

typedef _DSEFFECTDESC *PDSEffectDesc;

typedef _DSEFFECTDESC  TDSEffectDesc;

typedef _DSCEFFECTDESC *PDSCEffectDesc;

typedef _DSCEFFECTDESC  TDSCEffectDesc;

typedef _DSBUFFERDESC *PDSBufferDesc;

typedef _DSBUFFERDESC  TDSBufferDesc;

typedef _DSBUFFERDESC1 *PDSBufferDesc1;

typedef _DSBUFFERDESC1  TDSBufferDesc1;

typedef _DS3DBUFFER *PDS3DBuffer;

typedef _DS3DBUFFER  TDS3DBuffer;

typedef _DS3DLISTENER *PDS3DListener;

typedef _DS3DLISTENER  TDS3DListener;

typedef _DSCCAPS *PDSCcaps;

typedef _DSCCAPS  TDSCcaps;

typedef _DSCBUFFERDESC1 *PDSCBufferDesc1;

typedef _DSCBUFFERDESC1  TDSCBufferDesc1;

typedef _DSCBUFFERDESC *PDSCBufferDesc;

typedef _DSCBUFFERDESC  TDSCBufferDesc;

typedef _DSCBCAPS *PDSCBCaps;

typedef _DSCBCAPS  TDSCBCaps;

typedef _DSBPOSITIONNOTIFY *PDSBPositionNotify;

typedef _DSBPOSITIONNOTIFY  TDSBPositionNotify;

typedef __int64 *PReferenceTime;

typedef __int64 TReferenceTime;

typedef _DSFXGargle *PDSFXGargle;

typedef _DSFXGargle  TDSFXGargle;

typedef _DSFXChorus *PDSFXChorus;

typedef _DSFXChorus  TDSFXChorus;

typedef _DSFXFlanger *PDSFXFlanger;

typedef _DSFXFlanger  TDSFXFlanger;

typedef _DSFXEcho *PDSFXEcho;

typedef _DSFXEcho  TDSFXEcho;

typedef _DSFXDistortion *PDSFXDistortion;

typedef _DSFXDistortion  TDSFXDistortion;

typedef _DSFXCompressor *PDSFXCompressor;

typedef _DSFXCompressor  TDSFXCompressor;

typedef _DSFXParamEq *PDSFXParamEq;

typedef _DSFXParamEq  TDSFXParamEq;

typedef _DSFXI3DL2Reverb *PDSFXI3DL2Reverb;

typedef _DSFXI3DL2Reverb  TDSFXI3DL2Reverb;

typedef _DSFXWavesReverb *PDSFXWavesReverb;

typedef _DSFXWavesReverb  TDSFXWavesReverb;

typedef _DSCFXAec *PDSCFXAec;

typedef _DSCFXAec  TDSCFXAec;

typedef _DSCFXNoiseSuppress *PDSCFXNoiseSuppress;

typedef _DSCFXNoiseSuppress  TDSCFXNoiseSuppress;

//-- var, const, procedure ---------------------------------------------------
static const int MAKE_DSHRESULT_R = 0x88780000;
#define DirectSoundDll "dsound.dll"
extern PACKAGE bool __fastcall DirectSoundLoaded(void);
extern PACKAGE bool __fastcall UnLoadDirectSound(void);
extern PACKAGE bool __fastcall LoadDirectSound(void);

}	/* namespace Directsound */
using namespace Directsound;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// DirectSound
