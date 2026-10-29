// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'DXFile.pas' rev: 6.00

#ifndef DXFileHPP
#define DXFileHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <Windows.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------
#include "dxfile.h"
#include "rmxfguid.h"
#include "rmxftmpl.h"
typedef System::DelphiInterface<IDirectXFile> _di_IDirectXFile;
typedef System::DelphiInterface<IDirectXFileEnumObject> _di_IDirectXFileEnumObject;
typedef System::DelphiInterface<IDirectXFileSaveObject> _di_IDirectXFileSaveObject;
typedef System::DelphiInterface<IDirectXFileObject> _di_IDirectXFileObject;
typedef System::DelphiInterface<IDirectXFileData> _di_IDirectXFileData;
typedef System::DelphiInterface<IDirectXFileDataReference> _di_IDirectXFileDataReference;
typedef System::DelphiInterface<IDirectXFileBinary> _di_IDirectXFileBinary;

namespace Dxfile
{
//-- type declarations -------------------------------------------------------
typedef unsigned TDXFileFormat;

typedef DXFILELOADOPTIONS TDXFileLoadOptions;

typedef _DXFILELOADRESOURCE *PDXFileLoadResource;

typedef _DXFILELOADRESOURCE  TDXFileLoadResource;

typedef _DXFILELOADMEMORY *PDXFileLoadMemory;

typedef _DXFILELOADMEMORY  TDXFileLoadMemory;

//-- var, const, procedure ---------------------------------------------------
static const int MAKE_DDHRESULT_D = 0x88760000;

}	/* namespace Dxfile */
using namespace Dxfile;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// DXFile
