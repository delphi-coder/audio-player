// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'Direct3D9.pas' rev: 6.00

#ifndef Direct3D9HPP
#define Direct3D9HPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <Windows.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------
#include "d3d9.h"
#include "d3d9types.h"
#include "d3d9caps.h"
typedef D3DCOLOR TD3DColor;
typedef _D3DVECTOR TD3DVector;
typedef _D3DVECTOR *PD3DVector;
DECLARE_DINTERFACE_TYPE(IDirect3D9);
DECLARE_DINTERFACE_TYPE(IDirect3DDevice9);
DECLARE_DINTERFACE_TYPE(IDirect3DStateBlock9);
DECLARE_DINTERFACE_TYPE(IDirect3DSwapChain9);
DECLARE_DINTERFACE_TYPE(IDirect3DResource9);
DECLARE_DINTERFACE_TYPE(IDirect3DVertexDeclaration9);
DECLARE_DINTERFACE_TYPE(IDirect3DVertexShader9);
DECLARE_DINTERFACE_TYPE(IDirect3DPixelShader9);
DECLARE_DINTERFACE_TYPE(IDirect3DBaseTexture9);
DECLARE_DINTERFACE_TYPE(IDirect3DTexture9);
DECLARE_DINTERFACE_TYPE(IDirect3DVolumeTexture9);
DECLARE_DINTERFACE_TYPE(IDirect3DCubeTexture9);
DECLARE_DINTERFACE_TYPE(IDirect3DVertexBuffer9);
DECLARE_DINTERFACE_TYPE(IDirect3DIndexBuffer9);
DECLARE_DINTERFACE_TYPE(IDirect3DSurface9);
DECLARE_DINTERFACE_TYPE(IDirect3DVolume9);
DECLARE_DINTERFACE_TYPE(IDirect3DQuery9);

namespace Direct3d9
{
//-- type declarations -------------------------------------------------------
typedef _D3DCOLORVALUE *PD3DColorValue;

typedef _D3DCOLORVALUE  TD3DColorValue;

typedef _D3DRECT *PD3DRect;

typedef _D3DRECT  TD3DRect;

typedef _D3DMATRIX *PD3DMatrix;

typedef _D3DMATRIX  TD3DMatrix;

typedef _D3DVIEWPORT9 *PD3DViewport9;

typedef _D3DVIEWPORT9  TD3DViewport9;

typedef _D3DCLIPSTATUS9 *PD3DClipStatus9;

typedef _D3DCLIPSTATUS9  TD3DClipStatus9;

typedef _D3DMATERIAL9 *PD3DMaterial9;

typedef _D3DMATERIAL9  TD3DMaterial9;

typedef _D3DLIGHTTYPE TD3DLightType;

typedef _D3DLIGHT9 *PD3DLight9;

typedef _D3DLIGHT9  TD3DLight9;

typedef _D3DSHADEMODE TD3DShadeMode;

typedef _D3DFILLMODE TD3DFillMode;

typedef _D3DBLEND TD3DBlend;

typedef _D3DBLENDOP TD3DBlendOp;

typedef _D3DTEXTUREADDRESS TD3DTextureAddress;

typedef _D3DCULL TD3DCull;

typedef _D3DCMPFUNC TD3DCmpFunc;

typedef _D3DSTENCILOP TD3DStencilOp;

typedef _D3DFOGMODE TD3DFogMode;

typedef _D3DZBUFFERTYPE TD3DZBufferType;

typedef _D3DPRIMITIVETYPE TD3DPrimitiveType;

typedef _D3DTRANSFORMSTATETYPE TD3DTransformStateType;

typedef _D3DRENDERSTATETYPE TD3DRenderStateType;

typedef _D3DMATERIALCOLORSOURCE TD3DMaterialSource;

typedef _D3DTEXTURESTAGESTATETYPE TD3DTextureStageStateType;

typedef _D3DSAMPLERSTATETYPE TD3DSamplerStateType;

typedef _D3DTEXTUREOP TD3DTextureOp;

typedef _D3DTEXTUREFILTERTYPE TD3DTextureFilterType;

typedef _D3DDECLUSAGE TD3DDeclUsage;

typedef _D3DDECLMETHOD TD3DDeclMethod;

typedef _D3DDECLTYPE TD3DDeclType;

typedef _D3DVERTEXELEMENT9 *PD3DVertexElement9;

typedef _D3DVERTEXELEMENT9  TD3DVertexElement9;

typedef _D3DSHADER_INSTRUCTION_OPCODE_TYPE TD3DShaderInstructionOpcodeType;

typedef _D3DSHADER_COMPARISON TD3DShaderComparison;

typedef _D3DSAMPLER_TEXTURE_TYPE TD3DSamplerTextureType;

typedef _D3DSHADER_PARAM_REGISTER_TYPE TD3DShaderParamRegisterType;

typedef _D3DSHADER_MISCTYPE_OFFSETS TD3DShaderMiscTypeOffsets;

typedef _D3DVS_RASTOUT_OFFSETS TD3DVSRastoutOffsets;

typedef _D3DVS_ADDRESSMODE_TYPE TD3DVSAddressModeType;

typedef _D3DSHADER_ADDRESSMODE_TYPE TD3DShaderAddressModeType;

typedef _D3DSHADER_PARAM_SRCMOD_TYPE TD3DShaderParamSRCModType;

typedef _D3DBASISTYPE TD3DBasisType;

typedef _D3DDEGREETYPE TD3DDegreeType;

typedef _D3DPATCHEDGESTYLE TD3DPatchEdgeStyle;

typedef _D3DSTATEBLOCKTYPE TD3DStateBlockType;

typedef _D3DVERTEXBLENDFLAGS TD3DVertexBlendFlags;

typedef _D3DTEXTURETRANSFORMFLAGS TD3DTextureTransformFlags;

typedef _D3DDEVTYPE TD3DDevType;

typedef _D3DMULTISAMPLE_TYPE TD3DMultiSampleType;

typedef _D3DFORMAT *PD3DFormat;

typedef _D3DFORMAT TD3DFormat;

typedef _D3DDISPLAYMODE *PD3DDisplayMode;

typedef _D3DDISPLAYMODE  TD3DDisplayMode;

typedef _D3DDEVICE_CREATION_PARAMETERS *PD3DDeviceCreationParameters;

typedef _D3DDEVICE_CREATION_PARAMETERS  TD3DDeviceCreationParameters;

typedef _D3DSWAPEFFECT TD3DSwapEffect;

typedef _D3DPOOL TD3DPool;

typedef _D3DPRESENT_PARAMETERS_ *PD3DPresentParameters;

typedef _D3DPRESENT_PARAMETERS_  TD3DPresentParameters;

typedef _D3DGAMMARAMP *PD3DGammaRamp;

typedef _D3DGAMMARAMP  TD3DGammaRamp;

typedef _D3DBACKBUFFER_TYPE TD3DBackbufferType;

typedef _D3DRESOURCETYPE TD3DResourceType;

typedef _D3DCUBEMAP_FACES TD3DCubemapFaces;

typedef _D3DVERTEXBUFFER_DESC *PD3DVertexBufferDesc;

typedef _D3DVERTEXBUFFER_DESC  TD3DVertexBufferDesc;

typedef _D3DINDEXBUFFER_DESC *PD3DIndexBufferDesc;

typedef _D3DINDEXBUFFER_DESC  TD3DIndexBufferDesc;

typedef _D3DSURFACE_DESC *PD3DSurfaceDesc;

typedef _D3DSURFACE_DESC  TD3DSurfaceDesc;

typedef _D3DVOLUME_DESC *PD3DVolumeDesc;

typedef _D3DVOLUME_DESC  TD3DVolumeDesc;

typedef _D3DLOCKED_RECT *PD3DLockedRect;

typedef _D3DLOCKED_RECT  TD3DLockedRect;

typedef _D3DBOX *PD3DBox;

typedef _D3DBOX  TD3DBox;

typedef _D3DLOCKED_BOX *PD3DLockedBox;

typedef _D3DLOCKED_BOX  TD3DLockedBox;

typedef _D3DRANGE *PD3DRange;

typedef _D3DRANGE  TD3DRange;

typedef _D3DRECTPATCH_INFO *PD3DRectPatchInfo;

typedef _D3DRECTPATCH_INFO  TD3DRectPatchInfo;

typedef _D3DTRIPATCH_INFO *PD3DTriPatchInfo;

typedef _D3DTRIPATCH_INFO  TD3DTriPatchInfo;

typedef _D3DADAPTER_IDENTIFIER9 *PD3DAdapterIdentifier9;

typedef _D3DADAPTER_IDENTIFIER9  TD3DAdapterIdentifier9;

typedef _D3DRASTER_STATUS *PD3DRasterStatus;

typedef _D3DRASTER_STATUS  TD3DRasterStatus;

typedef unsigned TD3DDebugMonitorTokens;

typedef _D3DQUERYTYPE TD3DQueryType;

typedef _D3DRESOURCESTATS *PD3DResourceStats;

typedef _D3DRESOURCESTATS  TD3DResourceStats;

typedef _D3DDEVINFO_RESOURCEMANAGER *PD3DDevInfoResourceManager;

typedef _D3DDEVINFO_RESOURCEMANAGER  TD3DDevInfoResourceManager;

typedef _D3DDEVINFO_D3DVERTEXSTATS *PD3DDevInfoD3DVertexStats;

typedef _D3DDEVINFO_D3DVERTEXSTATS  TD3DDevInfoD3DVertexStats;

typedef _D3DDEVINFO_VCACHE *PD3DDevInfoVCache;

typedef _D3DDEVINFO_VCACHE  TD3DDevInfoVCache;

typedef _D3DVSHADERCAPS2_0 *PD3DVShaderCaps2_0;

typedef _D3DVSHADERCAPS2_0  TD3DVShaderCaps2_0;

typedef _D3DPSHADERCAPS2_0 *PD3DPShaderCaps2_0;

typedef _D3DPSHADERCAPS2_0  TD3DPShaderCaps2_0;

typedef _D3DCAPS9 *PD3DCaps9;

typedef _D3DCAPS9  TD3DCaps9;

typedef _D3DADAPTER_IDENTIFIER9 *PD3DAdapter_Identifier9;

typedef _D3DDEVICE_CREATION_PARAMETERS *PD3DDevice_Creation_Parameters;

typedef _D3DDEVINFO_D3DVERTEXSTATS *PD3DDevInfo_D3DVertexStats;

typedef _D3DDEVINFO_RESOURCEMANAGER *PD3DDevInfo_ResourceManager;

typedef _D3DDEVINFO_VCACHE *PD3DDevInfo_VCache;

typedef _D3DINDEXBUFFER_DESC *PD3DIndexBuffer_Desc;

typedef _D3DLOCKED_BOX *PD3DLocked_Box;

typedef _D3DLOCKED_RECT *PD3DLocked_Rect;

typedef _D3DPRESENT_PARAMETERS_ *PD3DPresent_Parameters;

typedef _D3DRASTER_STATUS *PD3DRaster_Status;

typedef _D3DRECTPATCH_INFO *PD3DRectPatch_Info;

typedef _D3DSURFACE_DESC *PD3DSurface_Desc;

typedef _D3DTRIPATCH_INFO *PD3DTriPatch_Info;

typedef _D3DVERTEXBUFFER_DESC *PD3DVertexBuffer_Desc;

typedef _D3DVOLUME_DESC *PD3DVolume_Desc;

typedef _D3DADAPTER_IDENTIFIER9  TD3DAdapter_Identifier9;

typedef _D3DBACKBUFFER_TYPE TD3DBackBuffer_Type;

typedef _D3DCUBEMAP_FACES TD3DCubeMap_Faces;

typedef _D3DDEVICE_CREATION_PARAMETERS  TD3DDevice_Creation_Parameters;

typedef _D3DDEVINFO_D3DVERTEXSTATS  TD3DDevInfo_D3DVertexStats;

typedef _D3DDEVINFO_RESOURCEMANAGER  TD3DDevInfo_ResourceManager;

typedef _D3DDEVINFO_VCACHE  TD3DDevInfo_VCache;

typedef _D3DINDEXBUFFER_DESC  TD3DIndexBuffer_Desc;

typedef _D3DLOCKED_BOX  TD3DLocked_Box;

typedef _D3DLOCKED_RECT  TD3DLocked_Rect;

typedef _D3DMULTISAMPLE_TYPE TD3DMultiSample_Type;

typedef _D3DPRESENT_PARAMETERS_  TD3DPresent_Parameters;

typedef _D3DRASTER_STATUS  TD3DRaster_Status;

typedef _D3DRECTPATCH_INFO  TD3DRectPatch_Info;

typedef _D3DSAMPLER_TEXTURE_TYPE TD3DSampler_Texture_Type;

typedef _D3DSHADER_ADDRESSMODE_TYPE TD3DShader_AddressMode_Type;

typedef _D3DSHADER_COMPARISON TD3DShader_Comparison;

typedef _D3DSHADER_INSTRUCTION_OPCODE_TYPE TD3DShader_Instruction_Opcode_Type;

typedef _D3DSHADER_MISCTYPE_OFFSETS TD3DShader_MiscType_Offsets;

typedef _D3DSHADER_PARAM_REGISTER_TYPE TD3DShader_Param_Register_Type;

typedef _D3DSHADER_PARAM_SRCMOD_TYPE TD3DShader_Param_SRCMod_Type;

typedef _D3DSURFACE_DESC  TD3DSurface_Desc;

typedef _D3DTRIPATCH_INFO  TD3DTriPatch_Info;

typedef _D3DVERTEXBUFFER_DESC  TD3DVertexBuffer_Desc;

typedef _D3DVOLUME_DESC  TD3DVolume_Desc;

typedef _D3DVS_ADDRESSMODE_TYPE TD3DVS_AddressMode_Type;

typedef _D3DVS_RASTOUT_OFFSETS TD3DVS_RastOut_Offsets;

//-- var, const, procedure ---------------------------------------------------
static const unsigned iTrue = 0x1;
static const unsigned iFalse = 0x0;
static const int MAKE_D3DHRESULT_R = 0x88760000;
static const int MAKE_D3DSTATUS_R = 0x8760000;
extern PACKAGE bool __fastcall Direct3D9Loaded(void);
extern PACKAGE bool __fastcall UnLoadDirect3D9(void);
extern PACKAGE bool __fastcall LoadDirect3D9(void);
extern "C" void * __stdcall _Direct3DCreate9(unsigned SDKVersion);
#pragma option push -w-inl
inline void * __stdcall _Direct3DCreate9(unsigned SDKVersion)
{
	return Direct3DCreate9(SDKVersion);
}
#pragma option pop



}	/* namespace Direct3d9 */
using namespace Direct3d9;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// Direct3D9
