// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'D3DX9.pas' rev: 6.00

#ifndef D3DX9HPP
#define D3DX9HPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <DXTypes.hpp>	// Pascal unit
#include <Direct3D9.hpp>	// Pascal unit
#include <SysUtils.hpp>	// Pascal unit
#include <ActiveX.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------
#include "d3dx9.h"
#include "dxfile.h"
namespace D3dx9
{
typedef D3DXFLOAT16       TD3DXFloat16;
typedef D3DXFLOAT16      *PD3DXFloat16;
typedef D3DXVECTOR2       TD3DXVector2;
typedef D3DXVECTOR2      *PD3DXVector2;
typedef D3DXVECTOR2_16F       TD3DXVector2_16F;
typedef D3DXVECTOR2_16F      *PD3DXVector2_16F;
typedef D3DXVECTOR3       TD3DXVector3;
typedef D3DXVECTOR3      *PD3DXVector3;
typedef D3DXVECTOR3_16F       TD3DXVector3_16F;
typedef D3DXVECTOR3_16F      *PD3DXVector3_16F;
typedef D3DXVECTOR4       TD3DXVector4;
typedef D3DXVECTOR4      *PD3DXVector4;
typedef D3DXVECTOR4_16F       TD3DXVector4_16F;
typedef D3DXVECTOR4_16F      *PD3DXVector4_16F;
typedef D3DXMATRIX        TD3DXMatrix;
typedef D3DXMATRIX       *PD3DXMatrix;
typedef D3DXMATRIX      **PPD3DXMatrix;
typedef D3DXQUATERNION TD3DXQuaternion;
typedef D3DXPLANE TD3DXPlane;
typedef D3DXCOLOR TD3DXColor;
typedef D3DXCOLOR *PD3DXColor;
DECLARE_DINTERFACE_TYPE(ID3DXMatrixStack);
DECLARE_DINTERFACE_TYPE(ID3DXBuffer);
DECLARE_DINTERFACE_TYPE(ID3DXFont);
DECLARE_DINTERFACE_TYPE(ID3DXSprite);
DECLARE_DINTERFACE_TYPE(ID3DXRenderToSurface);
DECLARE_DINTERFACE_TYPE(ID3DXRenderToEnvMap);
DECLARE_DINTERFACE_TYPE(ID3DXLine);
typedef D3DXHANDLE TD3DXHandle;
typedef D3DXHANDLE *PD3DXHandle;
DECLARE_DINTERFACE_TYPE(ID3DXConstantTable);
DECLARE_DINTERFACE_TYPE(ID3DXFragmentLinker);
DECLARE_DINTERFACE_TYPE(ID3DXEffectPool);
DECLARE_DINTERFACE_TYPE(ID3DXBaseEffect);
DECLARE_DINTERFACE_TYPE(ID3DXEffect);
DECLARE_DINTERFACE_TYPE(ID3DXEffectCompiler);
DECLARE_DINTERFACE_TYPE(ID3DXBaseMesh);
DECLARE_DINTERFACE_TYPE(ID3DXMesh);
DECLARE_DINTERFACE_TYPE(ID3DXPMesh);
DECLARE_DINTERFACE_TYPE(ID3DXSPMesh);
DECLARE_DINTERFACE_TYPE(ID3DXPatchMesh);
DECLARE_DINTERFACE_TYPE(ID3DXSkinInfo);
typedef LPD3DXFILL2D TD3DXFill2D;
typedef LPD3DXFILL3D TD3DXFill3D;
DECLARE_DINTERFACE_TYPE(ID3DXInterpolator);
DECLARE_DINTERFACE_TYPE(ID3DXKeyFrameInterpolator);
DECLARE_DINTERFACE_TYPE(ID3DXAnimationSet);
DECLARE_DINTERFACE_TYPE(ID3DXAnimationController);
}  /* namespace D3dx9 */

namespace D3dx9
{
//-- type declarations -------------------------------------------------------
typedef TD3DXVector3_16F *PD3DXVector3_16F;

typedef PD3DXMatrix *PPD3DXMatrix;

typedef _D3DMATRIX *PD3DXMatrixA16;

typedef _D3DMATRIX  TD3DXMatrixA16;

typedef TD3DXQuaternion *PD3DXQuaternion;

typedef TD3DXPlane *PD3DXPlane;

typedef _di_ID3DXBuffer *PID3DXBuffer;

typedef _D3DXRTS_DESC *PD3DXRTSDesc;

typedef _D3DXRTS_DESC  TD3DXRTSDesc;

typedef _D3DXRTE_DESC *PD3DXRTEDesc;

typedef _D3DXRTE_DESC  TD3DXRTEDesc;

typedef _D3DXMACRO *PD3DXMacro;

typedef _D3DXMACRO  TD3DXMacro;

typedef _D3DXSEMANTIC *PD3DXSemantic;

typedef _D3DXSEMANTIC  TD3DXSemantic;

typedef _D3DXFRAGMENT_DESC *PD3DXFragmentDesc;

typedef _D3DXFRAGMENT_DESC  TD3DXFragmentDesc;

typedef _D3DXREGISTER_SET TD3DXRegisterSet;

typedef _D3DXPARAMETER_CLASS TD3DXParameterClass;

typedef _D3DXPARAMETER_TYPE TD3DXParameterType;

typedef _D3DXCONSTANTTABLE_DESC *PD3DXConstantTableDesc;

typedef _D3DXCONSTANTTABLE_DESC  TD3DXConstantTableDesc;

typedef _D3DXCONSTANT_DESC *PD3DXConstantDesc;

typedef _D3DXCONSTANT_DESC  TD3DXConstantDesc;

typedef _di_ID3DXConstantTable *PID3DXConstantTable;

typedef _D3DXINCLUDE_TYPE *PD3DXIncludeType;

typedef _D3DXINCLUDE_TYPE TD3DXIncludeType;

typedef ID3DXInclude* *PID3DXInclude;

typedef _D3DXSHADER_CONSTANTTABLE *PD3DXShaderConstantTable;

typedef _D3DXSHADER_CONSTANTTABLE  TD3DXShaderConstantTable;

typedef _D3DXSHADER_CONSTANTINFO *PD3DXShaderConstantInfo;

typedef _D3DXSHADER_CONSTANTINFO  TD3DXShaderConstantInfo;

typedef _D3DXSHADER_TYPEINFO *PD3DXShaderTypeInfo;

typedef _D3DXSHADER_TYPEINFO  TD3DXShaderTypeInfo;

typedef _D3DXSHADER_STRUCTMEMBERINFO *PD3DXShaderStructMemberInfo;

typedef _D3DXSHADER_STRUCTMEMBERINFO  TD3DXShaderStructMemberInfo;

typedef _D3DXEFFECT_DESC  TD3DXEffectDesc;

typedef _D3DXPARAMETER_DESC *PD3DXParameterDesc;

typedef _D3DXPARAMETER_DESC  TD3DXParameterDesc;

typedef _D3DXTECHNIQUE_DESC *PD3DXTechniqueDesc;

typedef _D3DXTECHNIQUE_DESC  TD3DXTechniqueDesc;

typedef _D3DXPASS_DESC *PD3DXPassDesc;

typedef _D3DXPASS_DESC  TD3DXPassDesc;

typedef _D3DXFUNCTION_DESC *PD3DXFunctionDesc;

typedef _D3DXFUNCTION_DESC  TD3DXFunctionDesc;

typedef _D3DXPATCHMESHTYPE TD3DXPatchMeshType;

typedef _D3DXMESH TD3DXMesh;

typedef _D3DXPATCHMESH TD3DXPatchMesh;

typedef _D3DXMESHSIMP TD3DMeshSimp;

typedef _D3DVERTEXELEMENT9 TFVFDeclaration[65];

typedef _D3DXATTRIBUTERANGE *PD3DXAttributeRange;

typedef _D3DXATTRIBUTERANGE  TD3DXAttributeRange;

typedef _D3DXMATERIAL *PD3DXMaterial;

typedef _D3DXMATERIAL  TD3DXMaterial;

typedef _D3DXEFFECTDEFAULTTYPE TD3DXEffectDefaultType;

typedef _D3DXEFFECTDEFAULT *PD3DXEffectDefault;

typedef _D3DXEFFECTDEFAULT  TD3DXEffectDefault;

typedef _D3DXEFFECTINSTANCE *PD3DXEffectInstance;

typedef _D3DXEFFECTINSTANCE  TD3DXEffectInstance;

typedef _D3DXATTRIBUTEWEIGHTS *PD3DXAttributeWeights;

typedef _D3DXATTRIBUTEWEIGHTS  TD3DXAttributeWeights;

typedef _D3DXWELDEPSILONSFLAGS TD3DXWeldEpsilonsFlags;

typedef _D3DXWELDEPSILONS *PD3DXWeldEpsilons;

typedef _D3DXWELDEPSILONS  TD3DXWeldEpsilons;

typedef _D3DXMESHOPT TD3DXMeshOpt;

typedef _D3DXBONECOMBINATION *PD3DXBoneCombination;

typedef _D3DXBONECOMBINATION  TD3DXBoneCombination;

typedef _D3DXPATCHINFO *PD3DXPatchInfo;

typedef _D3DXPATCHINFO  TD3DXPatchInfo;

typedef _D3DXINTERSECTINFO *PD3DXIntersectInfo;

typedef _D3DXINTERSECTINFO  TD3DXIntersectInfo;

typedef _D3DXIMAGE_FILEFORMAT *PD3DXImageFileFormat;

typedef _D3DXIMAGE_FILEFORMAT TD3DXImageFileFormat;

typedef _D3DXIMAGE_INFO *PD3DXImageInfo;

typedef _D3DXIMAGE_INFO  TD3DXImageInfo;

typedef _D3DXMESHDATATYPE TD3DXMeshDataType;

typedef _D3DXMESHDATA *PD3DXMeshData;

typedef _D3DXMESHDATA  TD3DXMeshData;

typedef _D3DXMESHCONTAINER *PD3DXMeshContainer;

typedef _D3DXMESHCONTAINER  TD3DXMeshContainer;

typedef _D3DXFRAME *PD3DXFrame;

typedef _D3DXFRAME  TD3DXFrame;

typedef _di_ID3DXInterpolator *PID3DXInterpolator;

typedef _D3DXKEY_VECTOR3 *PD3DXKeyVector3;

typedef _D3DXKEY_VECTOR3  TD3DXKeyVector3;

typedef _D3DXKEY_QUATERNION *PD3DXKeyQuaternion;

typedef _D3DXKEY_QUATERNION  TD3DXKeyQuaternion;

typedef _D3DXTRACK_DESC *PD3DXTrackDesc;

typedef _D3DXTRACK_DESC  TD3DXTrackDesc;

typedef _D3DXTRACKFLAG *PD3DXTrackFlag;

typedef _D3DXTRACKFLAG TD3DXTrackFlag;

typedef _D3DXTRANSITIONTYPE *PD3DXTransitionType;

typedef _D3DXTRANSITIONTYPE TD3DXTransitionType;

//-- var, const, procedure ---------------------------------------------------
#define d3dx9dll "D3DX9ab.dll"
#define d3dx9mathDLL "D3DX9ab.dll"
#define d3dx9coreDLL "D3DX9ab.dll"
#define d3dx9shaderDLL "D3DX9ab.dll"
#define d3dx9effectDLL "D3DX9ab.dll"
#define d3dx9meshDLL "D3DX9ab.dll"
#define d3dx9shapesDLL "D3DX9ab.dll"
#define d3dx9texDLL "D3DX9ab.dll"
#define d3dx9animDLL "D3DX9ab.dll"
extern PACKAGE TD3DXFloat16 D3DXFloat16Zero;
extern PACKAGE TD3DXVector2 D3DXVector2Zero;
extern PACKAGE TD3DXVector2_16F D3DXVector2_16fZero;
extern PACKAGE Dxtypes::_D3DVECTOR D3DXVector3Zero;
extern PACKAGE TD3DXVector3_16F D3DXVector3_16fZero;
extern PACKAGE TD3DXVector4 D3DXVector4Zero;
extern PACKAGE TD3DXVector4_16F D3DXVector4_16fZero;
extern PACKAGE TD3DXPlane D3DXPlaneZero;
extern PACKAGE TD3DXFloat16 __fastcall D3DXFloat16(float value);
extern PACKAGE bool __fastcall D3DXFloat16Equal(const TD3DXFloat16 v1, const TD3DXFloat16 v2);
extern PACKAGE float __fastcall D3DXFloat16ToFloat(TD3DXFloat16 value);
extern PACKAGE TD3DXVector2 __fastcall D3DXVector2(float _x, float _y);
extern PACKAGE bool __fastcall D3DXVector2Equal(const TD3DXVector2 &v1, const TD3DXVector2 &v2);
extern PACKAGE TD3DXVector2_16F __fastcall D3DXVector2_16F(TD3DXFloat16 _x, TD3DXFloat16 _y);
extern PACKAGE bool __fastcall D3DXVector2_16fEqual(const TD3DXVector2_16F v1, const TD3DXVector2_16F v2);
extern PACKAGE TD3DXVector2_16F __fastcall D3DXVector2_16fFromVector2(const TD3DXVector2 &v);
extern PACKAGE TD3DXVector2 __fastcall D3DXVector2FromVector2_16f(const TD3DXVector2_16F v);
extern PACKAGE Dxtypes::_D3DVECTOR __fastcall D3DXVector3(float _x, float _y, float _z);
extern PACKAGE bool __fastcall D3DXVector3Equal(const Dxtypes::_D3DVECTOR &v1, const Dxtypes::_D3DVECTOR &v2);
extern PACKAGE TD3DXVector3_16F __fastcall D3DXVector3_16F(TD3DXFloat16 _x, TD3DXFloat16 _y, TD3DXFloat16 _z);
extern PACKAGE bool __fastcall D3DXVector3_16fEqual(const TD3DXVector3_16F &v1, const TD3DXVector3_16F &v2);
extern PACKAGE TD3DXVector3_16F __fastcall D3DXVector3_16fFromVector3(const Dxtypes::_D3DVECTOR &v);
extern PACKAGE Dxtypes::_D3DVECTOR __fastcall D3DXVector3FromVector3_16f(const TD3DXVector3_16F &v);
extern PACKAGE TD3DXVector4 __fastcall D3DXVector4(float _x, float _y, float _z, float _w);
extern PACKAGE bool __fastcall D3DXVector4Equal(const TD3DXVector4 &v1, const TD3DXVector4 &v2);
extern PACKAGE TD3DXVector4_16F __fastcall D3DXVector4_16F(TD3DXFloat16 _x, TD3DXFloat16 _y, TD3DXFloat16 _z, TD3DXFloat16 _w);
extern PACKAGE bool __fastcall D3DXVector4_16fEqual(const TD3DXVector4_16F &v1, const TD3DXVector4_16F &v2);
extern PACKAGE TD3DXVector4_16F __fastcall D3DXVector4_16fFromVector4(const TD3DXVector4 &v);
extern PACKAGE TD3DXVector4 __fastcall D3DXVector4FromVector4_16f(const TD3DXVector4_16F &v);
extern PACKAGE _D3DMATRIX __fastcall D3DXMatrix(float _m00, float _m01, float _m02, float _m03, float _m10, float _m11, float _m12, float _m13, float _m20, float _m21, float _m22, float _m23, float _m30, float _m31, float _m32, float _m33);
extern PACKAGE PD3DXMatrix __fastcall D3DXMatrixAdd(/* out */ _D3DMATRIX &mOut, const _D3DMATRIX &m1, const _D3DMATRIX &m2);
extern PACKAGE PD3DXMatrix __fastcall D3DXMatrixSubtract(/* out */ _D3DMATRIX &mOut, const _D3DMATRIX &m1, const _D3DMATRIX &m2);
extern PACKAGE PD3DXMatrix __fastcall D3DXMatrixMul(/* out */ _D3DMATRIX &mOut, const _D3DMATRIX &m, float MulBy);
extern PACKAGE bool __fastcall D3DXMatrixEqual(const _D3DMATRIX &m1, const _D3DMATRIX &m2);
extern PACKAGE TD3DXQuaternion __fastcall D3DXQuaternion(float _x, float _y, float _z, float _w);
extern PACKAGE TD3DXQuaternion __fastcall D3DXQuaternionAdd(const TD3DXQuaternion &q1, const TD3DXQuaternion &q2);
extern PACKAGE TD3DXQuaternion __fastcall D3DXQuaternionSubtract(const TD3DXQuaternion &q1, const TD3DXQuaternion &q2);
extern PACKAGE bool __fastcall D3DXQuaternionEqual(const TD3DXQuaternion &q1, const TD3DXQuaternion &q2);
extern PACKAGE PD3DXQuaternion __fastcall D3DXQuaternionScale(/* out */ TD3DXQuaternion &qOut, const TD3DXQuaternion &q, float s);
extern PACKAGE TD3DXPlane __fastcall D3DXPlane(float _a, float _b, float _c, float _d);
extern PACKAGE bool __fastcall D3DXPlaneEqual(const TD3DXPlane &p1, const TD3DXPlane &p2);
extern PACKAGE _D3DCOLORVALUE __fastcall D3DXColor(float _r, float _g, float _b, float _a);
extern PACKAGE unsigned __fastcall D3DXColorToDWord(const _D3DCOLORVALUE &c);
extern PACKAGE _D3DCOLORVALUE __fastcall D3DXColorFromDWord(unsigned c);
extern PACKAGE bool __fastcall D3DXColorEqual(const _D3DCOLORVALUE &c1, const _D3DCOLORVALUE &c2);

}	/* namespace D3dx9 */
using namespace D3dx9;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// D3DX9
