// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'DirectDraw.pas' rev: 6.00

#ifndef DirectDrawHPP
#define DirectDrawHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <Windows.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------
#define DIRECTDRAW_VERSION         0x0700
#include "ddraw.h"
#include "dvp.h"
DECLARE_DINTERFACE_TYPE(IDirectDraw);
DECLARE_DINTERFACE_TYPE(IDirectDraw2);
DECLARE_DINTERFACE_TYPE(IDirectDraw4);
DECLARE_DINTERFACE_TYPE(IDirectDraw7);
DECLARE_DINTERFACE_TYPE(IDirectDrawSurface);
DECLARE_DINTERFACE_TYPE(IDirectDrawSurface2);
DECLARE_DINTERFACE_TYPE(IDirectDrawSurface3);
DECLARE_DINTERFACE_TYPE(IDirectDrawSurface4);
DECLARE_DINTERFACE_TYPE(IDirectDrawSurface7);
DECLARE_DINTERFACE_TYPE(IDirectDrawPalette);
DECLARE_DINTERFACE_TYPE(IDirectDrawClipper);
DECLARE_DINTERFACE_TYPE(IDirectDrawColorControl);
DECLARE_DINTERFACE_TYPE(IDirectDrawGammaControl);
typedef LPCLIPPERCALLBACK TClipperCallback;
typedef LPCLIPPERCALLBACK TDDEnumModesCallback;
typedef LPDDENUMMODESCALLBACK2 TDDEnumModesCallback2;
typedef LPDDENUMSURFACESCALLBACK TDDEnumSurfacesCallback;
typedef LPDDENUMSURFACESCALLBACK2 TDDEnumSurfacesCallback2;
typedef LPDDENUMSURFACESCALLBACK7 TDDEnumSurfacesCallback7;
DECLARE_DINTERFACE_TYPE(IDirectDrawVideoPort);
DECLARE_DINTERFACE_TYPE(IDDVideoPortContainer);
DECLARE_DINTERFACE_TYPE(IDirectDrawVideoPortNotify);

namespace Directdraw
{
//-- type declarations -------------------------------------------------------
#pragma pack(push, 1)
struct TRefGUID
{
	
	union
	{
		struct 
		{
			unsigned dwFlags;
			
		};
		struct 
		{
			GUID *guid;
			
		};
		
	};
} ;
#pragma pack(pop)

typedef _DDARGB *PDDARGB;

typedef _DDARGB  TDDARGB;

typedef _DDRGBA *PDDRGBA;

typedef _DDRGBA  TDDRGBA;

typedef _DDCOLORKEY *PDDColorKey;

typedef _DDCOLORKEY  TDDColorKey;

typedef void *PDirectDrawSurface;

typedef _DDBLTFX *PDDBltFX;

typedef _DDBLTFX  TDDBltFX;

typedef _DDSCAPS *PDDSCaps;

typedef _DDSCAPS  TDDSCaps;

typedef _DDOSCAPS *PDDOSCaps;

typedef _DDOSCAPS  TDDOSCaps;

typedef _DDSCAPSEX *PDDSCapsEx;

typedef _DDSCAPSEX  TDDSCapsEx;

typedef _DDSCAPS2 *PDDSCaps2;

typedef _DDSCAPS2  TDDSCaps2;

typedef _DDCAPS_DX1 *PDDCaps_DX1;

typedef _DDCAPS_DX1  TDDCaps_DX1;

typedef _DDCAPS_DX3 *PDDCaps_DX3;

typedef _DDCAPS_DX3  TDDCaps_DX3;

typedef _DDCAPS_DX5 *PDDCaps_DX5;

typedef _DDCAPS_DX5  TDDCaps_DX5;

typedef _DDCAPS_DX6 *PDDCaps_DX6;

typedef _DDCAPS_DX6  TDDCaps_DX6;

typedef _DDCAPS_DX6 *PDDCaps_DX7;

typedef _DDCAPS_DX6  TDDCaps_DX7;

typedef _DDCAPS_DX6 *PDDCaps;

typedef _DDCAPS_DX6  TDDCaps;

typedef _DDPIXELFORMAT *PDDPixelFormat;

typedef _DDPIXELFORMAT  TDDPixelFormat;

typedef _DDPIXELFORMAT *PDDPixelFormat_DX3;

typedef _DDPIXELFORMAT  TDDPixelFormat_DX3;

typedef _DDPIXELFORMAT *PDDPixelFormat_DX5;

typedef _DDPIXELFORMAT  TDDPixelFormat_DX5;

typedef _DDPIXELFORMAT *PDDPixelFormat_DX6;

typedef _DDPIXELFORMAT  TDDPixelFormat_DX6;

typedef _DDPIXELFORMAT *PDDPixelFormat_DX7;

typedef _DDPIXELFORMAT  TDDPixelFormat_DX7;

typedef _DDOVERLAYFX *PDDOverlayFX;

typedef _DDOVERLAYFX  TDDOverlayFX;

typedef _DDBLTBATCH *PDDBltBatch;

typedef _DDBLTBATCH  TDDBltBatch;

typedef _DDGAMMARAMP *PDDGammaRamp;

typedef _DDGAMMARAMP  TDDGammaRamp;

typedef tagDDDEVICEIDENTIFIER *PDDDeviceIdentifier;

typedef tagDDDEVICEIDENTIFIER  TDDDeviceIdentifier;

typedef tagDDDEVICEIDENTIFIER2 *PDDDeviceIdentifier2;

typedef tagDDDEVICEIDENTIFIER2  TDDDeviceIdentifier2;

typedef _DDSURFACEDESC *PDDSurfaceDesc;

typedef _DDSURFACEDESC  TDDSurfaceDesc;

typedef _DDSURFACEDESC *PDDSurfaceDesc_DX5;

typedef _DDSURFACEDESC  TDDSurfaceDesc_DX5;

typedef _DDSURFACEDESC *PDDSurfaceDesc_DX6;

typedef _DDSURFACEDESC  TDDSurfaceDesc_DX6;

typedef _DDSURFACEDESC2 *PDDSurfaceDesc2;

typedef _DDSURFACEDESC2  TDDSurfaceDesc2;

typedef _DDOPTSURFACEDESC *PDDOptSurfaceDesc;

typedef _DDOPTSURFACEDESC  TDDOptSurfaceDesc;

typedef _DDCOLORCONTROL *PDDColorControl;

typedef _DDCOLORCONTROL  TDDColorControl;

typedef _DDVIDEOPORTCONNECT *PDDVideoPortConnect;

typedef _DDVIDEOPORTCONNECT  TDDVideoPortConnect;

typedef _DDVIDEOPORTCAPS *PDDVideoPortCaps;

typedef _DDVIDEOPORTCAPS  TDDVideoPortCaps;

typedef _DDVIDEOPORTDESC *PDDVideoPortDesc;

typedef _DDVIDEOPORTDESC  TDDVideoPortDesc;

typedef _DDVIDEOPORTINFO *PDDVideoPortInfo;

typedef _DDVIDEOPORTINFO  TDDVideoPortInfo;

typedef _DDVIDEOPORTBANDWIDTH *PDDVideoPortBandWidth;

typedef _DDVIDEOPORTBANDWIDTH  TDDVideoPortBandWidth;

typedef _DDVIDEOPORTSTATUS *PDDVideoPortStatus;

typedef _DDVIDEOPORTSTATUS  TDDVideoPortStatus;

typedef _DDVIDEOPORTNOTIFY *PDDVideoPortNotify;

typedef _DDVIDEOPORTNOTIFY  TDDVideoPortNotify;

//-- var, const, procedure ---------------------------------------------------
extern PACKAGE GUID NilGUID;
static const int _MAKE_DDHRESULT = 0x88760000;
#define DirectDrawDll "ddraw.dll"
extern PACKAGE unsigned DDrawDLL;
extern PACKAGE AnsiString __fastcall DDErrorString(HRESULT Value);
extern PACKAGE bool __fastcall DirectDrawLoaded(void);
extern PACKAGE bool __fastcall UnLoadDirectDraw(void);
extern PACKAGE bool __fastcall LoadDirectDraw(void);

}	/* namespace Directdraw */
using namespace Directdraw;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// DirectDraw
