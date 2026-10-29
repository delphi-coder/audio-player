// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'DirectMusic.pas' rev: 6.00

#ifndef DirectMusicHPP
#define DirectMusicHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <DirectSound.hpp>	// Pascal unit
#include <MMSystem.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------
#include "ks.h"
#include "dls1.h"
#include "dls2.h"
#include "dmdls.h"
#include "dmerror.h"
#include "dmplugin.h"
#include "dmusicc.h"
#include "dmusici.h"
#include "dmusicf.h"
#include "dmusbuff.h"
DECLARE_DINTERFACE_TYPE(IDirectMusic);
DECLARE_DINTERFACE_TYPE(IDirectMusic8);
DECLARE_DINTERFACE_TYPE(IDirectMusicBuffer);
typedef _di_IDirectMusicBuffer _di_IDirectMusicBuffer8;
DECLARE_DINTERFACE_TYPE(IDirectMusicInstrument);
typedef _di_IDirectMusicInstrument _di_IDirectMusicInstrument8;
DECLARE_DINTERFACE_TYPE(IDirectMusicDownloadedInstrument);
typedef _di_IDirectMusicDownloadedInstrument _di_IDirectMusicDownloadedInstrument8;
DECLARE_DINTERFACE_TYPE(IDirectMusicCollection);
typedef _di_IDirectMusicCollection _di_IDirectMusicCollection8;
DECLARE_DINTERFACE_TYPE(IDirectMusicDownload);
typedef _di_IDirectMusicDownload _di_IDirectMusicDownload8;
DECLARE_DINTERFACE_TYPE(IDirectMusicPortDownload);
typedef _di_IDirectMusicPortDownload _di_IDirectMusicPortDownload8;
DECLARE_DINTERFACE_TYPE(IDirectMusicPort);
typedef _di_IDirectMusicPort _di_IDirectMusicPort8;
DECLARE_DINTERFACE_TYPE(IDirectMusicThru);
typedef _di_IDirectMusicThru _di_IDirectMusicThru8;
DECLARE_DINTERFACE_TYPE(IDirectMusicBand);
typedef _di_IDirectMusicBand _di_IDirectMusicBand8;
DECLARE_DINTERFACE_TYPE(IDirectMusicObject);
typedef _di_IDirectMusicObject _di_IDirectMusicObject8;
DECLARE_DINTERFACE_TYPE(IDirectMusicLoader);
DECLARE_DINTERFACE_TYPE(IDirectMusicLoader8);
DECLARE_DINTERFACE_TYPE(IDirectMusicGetLoader);
typedef _di_IDirectMusicGetLoader _di_IDirectMusicGetLoader8;
DECLARE_DINTERFACE_TYPE(IDirectMusicSegment);
DECLARE_DINTERFACE_TYPE(IDirectMusicSegment8);
DECLARE_DINTERFACE_TYPE(IDirectMusicSegmentState);
DECLARE_DINTERFACE_TYPE(IDirectMusicSegmentState8);
DECLARE_DINTERFACE_TYPE(IDirectMusicAudioPath);
typedef _di_IDirectMusicAudioPath _di_IDirectMusicAudioPath8;
DECLARE_DINTERFACE_TYPE(IDirectMusicPerformance);
DECLARE_DINTERFACE_TYPE(IDirectMusicPerformance8);
DECLARE_DINTERFACE_TYPE(IDirectMusicGraph);
typedef _di_IDirectMusicGraph _di_IDirectMusicGraph8;
DECLARE_DINTERFACE_TYPE(IDirectMusicTool);
DECLARE_DINTERFACE_TYPE(IDirectMusicStyle);
DECLARE_DINTERFACE_TYPE(IDirectMusicStyle8);
DECLARE_DINTERFACE_TYPE(IDirectMusicChordMap);
typedef _di_IDirectMusicChordMap _di_IDirectMusicChordMap8;
DECLARE_DINTERFACE_TYPE(IDirectMusicComposer);
typedef _di_IDirectMusicComposer _di_IDirectMusicComposer8;
DECLARE_DINTERFACE_TYPE(IDirectMusicPatternTrack);
typedef _di_IDirectMusicPatternTrack _di_IDirectMusicPatternTrack8;
DECLARE_DINTERFACE_TYPE(IDirectMusicScript);
typedef _di_IDirectMusicScript _di_IDirectMusicScript8;
DECLARE_DINTERFACE_TYPE(IDirectMusicContainer);
typedef _di_IDirectMusicContainer _di_IDirectMusicContainer8;
DECLARE_DINTERFACE_TYPE(IDirectMusicTrack);
DECLARE_DINTERFACE_TYPE(IDirectMusicTool8);
DECLARE_DINTERFACE_TYPE(IDirectMusicTrack8);

namespace Directmusic
{
//-- type declarations -------------------------------------------------------
typedef _DLSID *PDLSID;

typedef _DLSID  TDLSID;

typedef _DLSVERSION *PDLSVersion;

typedef _DLSVERSION  TDLSVersion;

typedef _CONNECTION *PConnection;

typedef _CONNECTION  TConnection;

typedef _CONNECTIONLIST *PConnectionList;

typedef _CONNECTIONLIST  TConnectionList;

typedef _RGNRANGE *PRGNRange;

typedef _RGNRANGE  TRGNRange;

typedef _MIDILOCALE *PMIDILocale;

typedef _MIDILOCALE  TMIDILocale;

typedef _RGNHEADER *PRGNHeader;

typedef _RGNHEADER  TRGNHeader;

typedef _INSTHEADER *PInstHeader;

typedef _INSTHEADER  TInstHeader;

typedef _DLSHEADER *PDLSHeader;

typedef _DLSHEADER  TDLSHeader;

typedef _WAVELINK *PWaveLink;

typedef _WAVELINK  TWaveLink;

typedef _POOLCUE *PPoolCUE;

typedef _POOLCUE  TPoolCUE;

typedef _POOLTABLE *PPoolTable;

typedef _POOLTABLE  TPoolTable;

typedef _rwsmp *PWSMPL;

typedef _rwsmp  TWSMPL;

typedef _rloop *PWLoop;

typedef _rloop  TWLoop;

typedef __int64 *PReferenceTime;

typedef __int64 TReferenceTime;

typedef __int64 *PReference_Time;

typedef __int64 TReference_Time;

typedef _DMUS_DOWNLOADINFO *PDMusDownloadInfo;

typedef _DMUS_DOWNLOADINFO  TDMusDownloadInfo;

typedef _DMUS_OFFSETTABLE *PDMusOffsetTable;

typedef _DMUS_OFFSETTABLE  TDMusOffsetTable;

typedef _DMUS_INSTRUMENT *PDMusInstrument;

typedef _DMUS_INSTRUMENT  TDMusInstrument;

typedef _DMUS_REGION *PDMusRegion;

typedef _DMUS_REGION  TDMusRegion;

typedef _DMUS_LFOPARAMS *PDMusLFOParams;

typedef _DMUS_LFOPARAMS  TDMusLFOParams;

typedef _DMUS_VEGPARAMS *PDMusVEGParams;

typedef _DMUS_VEGPARAMS  TDMusVEGParams;

typedef _DMUS_PEGPARAMS *PDMusPEGParams;

typedef _DMUS_PEGPARAMS  TDMusPEGParams;

typedef _DMUS_MSCPARAMS *PDMusMSCParams;

typedef _DMUS_MSCPARAMS  TDMusMSCParams;

typedef _DMUS_ARTICPARAMS *PDMusArticParams;

typedef _DMUS_ARTICPARAMS  TDMusArticParams;

typedef _DMUS_ARTICULATION *PDMusArticulation;

typedef _DMUS_ARTICULATION  TDMusArticulation;

typedef _DMUS_ARTICULATION2 *PDMusArticulation2;

typedef _DMUS_ARTICULATION2  TDMusArticulation2;

typedef _DMUS_EXTENSIONCHUNK *PDMusExtensionChunk;

typedef _DMUS_EXTENSIONCHUNK  TDMusExtensionChunk;

typedef _DMUS_COPYRIGHT *PDMusCopyright;

typedef _DMUS_COPYRIGHT  TDMusCopyright;

typedef _DMUS_WAVEDATA *PDMusWaveData;

typedef _DMUS_WAVEDATA  TDMusWaveData;

typedef _DMUS_WAVE *PDMusWave;

typedef _DMUS_WAVE  TDMusWave;

typedef _DMUS_NOTERANGE *PDMusNoteRange;

typedef _DMUS_NOTERANGE  TDMusNoteRange;

typedef _DMUS_WAVEARTDL *PDMusWaveArtDL;

typedef _DMUS_WAVEARTDL  TDMusWaveArtDL;

typedef _DMUS_WAVEDL *PDMusWaveDL;

typedef _DMUS_WAVEDL  TDMusWaveDL;

typedef __int64 TSampleTime;

typedef __int64 *PSampleTime;

typedef __int64 TSamplePosition;

typedef __int64 *PSamplePosition;

typedef _DMUS_BUFFERDESC *PDMusBufferDesc;

typedef _DMUS_BUFFERDESC  TDMusBufferDesc;

typedef _DMUS_PORTCAPS *PDMusPortCaps;

typedef _DMUS_PORTCAPS  TDMusPortCaps;

typedef _DMUS_PORTPARAMS *PDMusPortParams7;

typedef _DMUS_PORTPARAMS  TDMusPortParams7;

typedef _DMUS_PORTPARAMS8 *PDMusPortParams8;

typedef _DMUS_PORTPARAMS8  TDMusPortParams8;

typedef _DMUS_PORTPARAMS8  TDMusPortParams;

typedef _DMUS_PORTPARAMS8 *PDMusPortParams;

typedef _DMUS_SYNTHSTATS *PDMusSynthStats;

typedef _DMUS_SYNTHSTATS  TDMusSynthStats;

typedef _DMUS_SYNTHSTATS8 *PDMusSynthStats8;

typedef _DMUS_SYNTHSTATS8  TDMusSynthStats8;

typedef _DMUS_WAVES_REVERB_PARAMS *PDMusWavesReverbParams;

typedef _DMUS_WAVES_REVERB_PARAMS  TDMusWavesReverbParams;

typedef DMUS_CLOCKTYPE TDMusClockType;

typedef _DMUS_CLOCKINFO7 *PDMusClockInfo7;

typedef _DMUS_CLOCKINFO7  TDMusClockInfo7;

typedef _DMUS_CLOCKINFO8 *PDMusClockInfo8;

typedef _DMUS_CLOCKINFO8  TDMusClockInfo8;

typedef _DMUS_CLOCKINFO8  TDMusClockInfo;

typedef _DMUS_CLOCKINFO8 *PDMusClockInfo;

typedef _di_IReferenceClock *PIReferenceClock;

typedef _di_IDirectSound *PIDirectSound;

typedef _di_IDirectMusic *PIDirectMusic;

typedef int *PMusicTime;

typedef int TMusicTime;

typedef enumDMUS_STYLET_TYPES *PDMusStyletTypes;

typedef enumDMUS_STYLET_TYPES TDMusStyletTypes;

typedef enumDMUS_COMMANDT_TYPES TDMusCommandtTypes;

typedef enumDMUS_COMMANDT_TYPES *PDMusCommandtTypes;

typedef enumDMUS_SHAPET_TYPES *PDMusShapetTypes;

typedef enumDMUS_SHAPET_TYPES TDMusShapetTypes;

typedef unsigned TDMusComposefFlags;

typedef unsigned *PDMusComposefFlags;

typedef _DMUS_AUDIOPARAMS *PDMusAudioParams;

typedef _DMUS_AUDIOPARAMS  TDMusAudioParams;

typedef unsigned TDMusPmsgfFlags;

typedef unsigned *PDMusPmsgfFlags;

typedef unsigned TDMusPmsgtTypes;

typedef unsigned *PDMusPmsgtTypes;

typedef unsigned enumDMUS_SEGF_FLAGS;

typedef unsigned TDMusSegfFlags;

typedef unsigned *PDMusSegfFlags;

typedef unsigned TDMusTimeResolveFlags;

typedef unsigned *PDMusTimeResolveFlags;

typedef unsigned TDMusChordkeyfFlags;

typedef unsigned *PDMusChordkeyfFlags;

typedef _DMUS_SUBCHORD *PDMusSubChord;

typedef _DMUS_SUBCHORD  TDMusSubChord;

typedef _DMUS_CHORD_KEY *PDMusChordKey;

typedef _DMUS_CHORD_KEY  TDMusChordKey;

typedef unsigned TDMusNotefFlags;

typedef unsigned *PDMusNotefFlags;

typedef Byte enumDMUS_PLAYMODE_FLAGS;

typedef Byte DMUS_PLAYMODE_FLAGS;

typedef _DMUS_VERSION *PDMusVersion;

typedef _DMUS_VERSION  TDMusVersion;

typedef _DMUS_TIMESIGNATURE *PDMusTimeSignature;

typedef _DMUS_TIMESIGNATURE  TDMusTimeSignature;

typedef _DMUS_VALID_START_PARAM *PDMusValidStartParam;

typedef _DMUS_VALID_START_PARAM  TDMusValidStartParam;

typedef _DMUS_PLAY_MARKER_PARAM *PDMusPlayMarkerParam;

typedef _DMUS_PLAY_MARKER_PARAM  TDMusPlayMarkerParam;

typedef _DMUS_OBJECTDESC *PDMusObjectDesc;

typedef _DMUS_OBJECTDESC  TDMusObjectDesc;

typedef _DMUS_SCRIPT_ERRORINFO *PDMusScriptErrorInfo;

typedef _DMUS_SCRIPT_ERRORINFO  TDMusScriptErrorInfo;

typedef _DMUS_COMMAND_PARAM *PDMusCommandParam;

typedef _DMUS_COMMAND_PARAM  TDMusCommandParam;

typedef _DMUS_COMMAND_PARAM_2 *PDMusCommandParam2;

typedef _DMUS_COMMAND_PARAM_2  TDMusCommandParam2;

typedef _di_IDirectMusicSegmentState *PIDirectMusicSegmentState;

typedef _DMUS_PMSG *PDMusPMsg;

typedef _DMUS_PMSG  TDMusPMsg;

typedef _DMUS_NOTE_PMSG *PDMusNotePMsg;

typedef _DMUS_NOTE_PMSG  TDMusNotePMsg;

typedef _DMUS_MIDI_PMSG *PDMusMidiPMsg;

typedef _DMUS_MIDI_PMSG  TDMusMidiPMsg;

typedef _DMUS_PATCH_PMSG *PDMusPatchPMsg;

typedef _DMUS_PATCH_PMSG  TDMusPatchPMsg;

typedef _DMUS_TRANSPOSE_PMSG *PDMusTransposePMsg;

typedef _DMUS_TRANSPOSE_PMSG  TDMusTransposePMsg;

typedef _DMUS_CHANNEL_PRIORITY_PMSG *PDMusChannelPriorityPMsg;

typedef _DMUS_CHANNEL_PRIORITY_PMSG  TDMusChannelPriorityPMsg;

typedef _DMUS_TEMPO_PMSG *PDMusTempoPMsg;

typedef _DMUS_TEMPO_PMSG  TDMusTempoPMsg;

typedef _DMUS_SYSEX_PMSG *PDMusSysexPMsg;

typedef _DMUS_SYSEX_PMSG  TDMusSysexPMsg;

typedef _DMUS_CURVE_PMSG *PDMusCurvePMsg;

typedef _DMUS_CURVE_PMSG  TDMusCurvePMsg;

typedef unsigned enumDMUS_CURVE_FLAGS;

typedef unsigned TDMusCurveFlags;

typedef unsigned *PDMusCurveFlags;

typedef _DMUS_TIMESIG_PMSG *PDMusTimeSigPMsg;

typedef _DMUS_TIMESIG_PMSG  TDMusTimeSigPMsg;

typedef _DMUS_NOTIFICATION_PMSG *PDMusNotificationPMsg;

typedef _DMUS_NOTIFICATION_PMSG  TDMusNotificationPMsg;

typedef _DMUS_WAVE_PMSG *PDMusWavePMsg;

typedef _DMUS_WAVE_PMSG  TDMusWavePMsg;

typedef _DMUS_LYRIC_PMSG *PDMusLyricPMsg;

typedef _DMUS_LYRIC_PMSG  TDMusLyricPMsg;

typedef _DMUS_BAND_PARAM  TDMusBandParam;

typedef _DMUS_BAND_PARAM *PDMusBandParam;

typedef _DMUS_VARIATIONS_PARAM *PDMusVariationsParam;

typedef _DMUS_VARIATIONS_PARAM  TDMusVariationsParam;

typedef _DMUS_IO_SEQ_ITEM *PDMusIoSeqItem;

typedef _DMUS_IO_SEQ_ITEM  TDMusIoSeqItem;

typedef _DMUS_IO_CURVE_ITEM *PDMusIoCurveItem;

typedef _DMUS_IO_CURVE_ITEM  TDMusIoCurveItem;

typedef _DMUS_IO_TEMPO_ITEM *PDMusIoTempoItem;

typedef _DMUS_IO_TEMPO_ITEM  TDMusIoTempoItem;

typedef _DMUS_IO_SYSEX_ITEM *PDMusIoSysExItem;

typedef _DMUS_IO_SYSEX_ITEM  TDMusIoSysExItem;

typedef _DMUS_CHORD_KEY  TDMusChordParam;

typedef _DMUS_CHORD_KEY *PDMusChordParam;

typedef _DMUS_RHYTHM_PARAM  TDMusRhythmParam;

typedef _DMUS_RHYTHM_PARAM *PDMusRhythmParam;

typedef _DMUS_TEMPO_PARAM *PDMusTempoParam;

typedef _DMUS_TEMPO_PARAM  TDMusTempoParam;

typedef _DMUS_MUTE_PARAM *PDMusMuteParam;

typedef _DMUS_MUTE_PARAM  TDMusMuteParam;

typedef Word enumDMUS_EMBELLISHT_TYPES;

typedef Word TDMusEmbellishtTypes;

typedef enumDMUS_VARIATIONT_TYPES TDMusVariationtTypes;

typedef enumDMUS_VARIATIONT_TYPES *PDMusVariationtTypes;

typedef _DMUS_IO_TIMESIG *PDMusIoTimesig;

typedef _DMUS_IO_TIMESIG  TDMusIoTimesig;

typedef _DMUS_IO_STYLE *PDMusIoStyle;

typedef _DMUS_IO_STYLE  TDMusIoStyle;

typedef _DMUS_IO_VERSION *PDMusIoVersion;

typedef _DMUS_IO_VERSION  TDMusIoVersion;

typedef _DMUS_IO_PATTERN *PDMusIoPattern;

typedef _DMUS_IO_PATTERN  TDMusIoPattern;

typedef _DMUS_IO_STYLEPART *PDMusIoStylePart;

typedef _DMUS_IO_STYLEPART  TDMusIoStylePart;

typedef _DMUS_IO_PARTREF *PDMusIoPartRef;

typedef _DMUS_IO_PARTREF  TDMusIoPartRef;

typedef _DMUS_IO_STYLENOTE *PDMusIoStyleNote;

typedef _DMUS_IO_STYLENOTE  TDMusIoStyleNote;

typedef _DMUS_IO_STYLECURVE *PDMusIoStyleCurve;

typedef _DMUS_IO_STYLECURVE  TDMusIoStyleCurve;

typedef _DMUS_IO_STYLEMARKER *PDMusIoStyleMarker;

typedef _DMUS_IO_STYLEMARKER  TDMusIoStyleMarker;

typedef _DMUS_IO_STYLERESOLUTION *PDMusIoStyleResolution;

typedef _DMUS_IO_STYLERESOLUTION  TDMusIoStyleResolution;

typedef _DMUS_IO_STYLE_ANTICIPATION *PDMusIoStyleAnticipation;

typedef _DMUS_IO_STYLE_ANTICIPATION  TDMusIoStyleAnticipation;

typedef _DMUS_IO_MOTIFSETTINGS *PDMusIoMotifSettings;

typedef _DMUS_IO_MOTIFSETTINGS  TDMusIoMotifSettings;

typedef enumDMUS_PATTERNT_TYPES TDMusPatterntTypes;

typedef _DMUS_IO_CHORD *PDMusIoChord;

typedef _DMUS_IO_CHORD  TDMusIoChord;

typedef _DMUS_IO_SUBCHORD *PDMusIoSubChord;

typedef _DMUS_IO_SUBCHORD  TDMusIoSubChord;

typedef _DMUS_IO_COMMAND *PDMusIoCommand;

typedef _DMUS_IO_COMMAND  TDMusIoCommand;

typedef _DMUS_IO_TOOL_HEADER *PDMusIoToolHeader;

typedef _DMUS_IO_TOOL_HEADER  TDMusIoToolHeader;

typedef _DMUS_IO_PORTCONFIG_HEADER *PDMusIoPortConfigHeader;

typedef _DMUS_IO_PORTCONFIG_HEADER  TDMusIoPortConfigHeader;

typedef _DMUS_IO_PCHANNELTOBUFFER_HEADER *PDMusIoPChannelToBufferHeader;

typedef _DMUS_IO_PCHANNELTOBUFFER_HEADER  TDMusIoPChannelToBufferHeader;

typedef _DMUS_IO_BUFFER_ATTRIBUTES_HEADER *PDMusIoBufferAttributesHeader;

typedef _DMUS_IO_BUFFER_ATTRIBUTES_HEADER  TDMusIoBufferAttributesHeader;

typedef _DMUS_IO_BAND_TRACK_HEADER *PDMusIoBandTrackHeader;

typedef _DMUS_IO_BAND_TRACK_HEADER  TDMusIoBandTrackHeader;

typedef _DMUS_IO_BAND_ITEM_HEADER *PDMusIoBandItemHeader;

typedef _DMUS_IO_BAND_ITEM_HEADER  TDMusIoBandItemHeader;

typedef _DMUS_IO_BAND_ITEM_HEADER2 *PDMusIoBandItemHeader2;

typedef _DMUS_IO_BAND_ITEM_HEADER2  TDMusIoBandItemHeader2;

typedef _DMUS_IO_INSTRUMENT *PDMusIoInstrument;

typedef _DMUS_IO_INSTRUMENT  TDMusIoInstrument;

typedef _DMUS_IO_WAVE_HEADER *PDMusIoWaveHeader;

typedef _DMUS_IO_WAVE_HEADER  TDMusIoWaveHeader;

typedef _DMUS_IO_WAVE_TRACK_HEADER *PDMusIoWaveTrackHeader;

typedef _DMUS_IO_WAVE_TRACK_HEADER  TDMusIoWaveTrackHeader;

typedef _DMUS_IO_WAVE_PART_HEADER *PDMusIoWavePartHeader;

typedef _DMUS_IO_WAVE_PART_HEADER  TDMusIoWavePartHeader;

typedef _DMUS_IO_WAVE_ITEM_HEADER *PDMusIoWaveItemHeader;

typedef _DMUS_IO_WAVE_ITEM_HEADER  TDMusIoWaveItemHeader;

typedef _DMUS_IO_CONTAINER_HEADER *PDMusIoContainerHeader;

typedef _DMUS_IO_CONTAINER_HEADER  TDMusIoContainerHeader;

typedef _DMUS_IO_CONTAINED_OBJECT_HEADER *PDMusIoContainedObjectHeader;

typedef _DMUS_IO_CONTAINED_OBJECT_HEADER  TDMusIoContainedObjectHeader;

typedef _DMUS_IO_SEGMENT_HEADER *PDMusIoSegmentHeader;

typedef _DMUS_IO_SEGMENT_HEADER  TDMusIoSegmentHeader;

typedef _DMUS_IO_TRACK_HEADER *PDMusIoTrackHeader;

typedef _DMUS_IO_TRACK_HEADER  TDMusIoTrackHeader;

typedef _DMUS_IO_TRACK_EXTRAS_HEADER *PDMusIoTrackExtrasHeader;

typedef _DMUS_IO_TRACK_EXTRAS_HEADER  TDMusIoTrackExtrasHeader;

typedef _DMUS_IO_REFERENCE *PDMusIoReference;

typedef _DMUS_IO_REFERENCE  TDMusIoReference;

typedef _DMUS_IO_CHORDMAP *PDMusIoChordMap;

typedef _DMUS_IO_CHORDMAP  TDMusIoChordMap;

typedef _DMUS_IO_CHORDMAP_SUBCHORD *PDMusIoChordmapSubChord;

typedef _DMUS_IO_CHORDMAP_SUBCHORD  TDMusIoChordmapSubChord;

typedef _DMUS_IO_CHORDENTRY *PDMusIoChordEntry;

typedef _DMUS_IO_CHORDENTRY  TDMusIoChordEntry;

typedef _DMUS_IO_NEXTCHORD *PDMusIoNextChord;

typedef _DMUS_IO_NEXTCHORD  TDMusIoNextChord;

typedef _DMUS_IO_CHORDMAP_SIGNPOST *PDMusIoChordMapSignPost;

typedef _DMUS_IO_CHORDMAP_SIGNPOST  TDMusIoChordMapSignPost;

typedef _DMUS_IO_SCRIPT_HEADER *PDMusIoScriptHeader;

typedef _DMUS_IO_SCRIPT_HEADER  TDMusIoScriptHeader;

typedef _DMUS_IO_SIGNPOST *PDMusIoSignPost;

typedef _DMUS_IO_SIGNPOST  TDMusIoSignPost;

typedef _DMUS_IO_MUTE *PDMusIoMute;

typedef _DMUS_IO_MUTE  TDMusIoMute;

typedef _DMUS_IO_TIMESIGNATURE_ITEM *PDMusIoTimeSignatureItem;

typedef _DMUS_IO_TIMESIGNATURE_ITEM  TDMusIoTimeSignatureItem;

typedef _DMUS_IO_VALID_START *PDMusIoValidStart;

typedef _DMUS_IO_VALID_START  TDMusIoValidStart;

typedef _DMUS_IO_PLAY_MARKER *PDMusIoPlayMarker;

typedef _DMUS_IO_PLAY_MARKER  TDMusIoPlayMarker;

typedef _DMUS_IO_SEGMENT_TRACK_HEADER *PDMusIoSegmentTrackHeader;

typedef _DMUS_IO_SEGMENT_TRACK_HEADER  TDMusIoSegmentTrackHeader;

typedef _DMUS_IO_SEGMENT_ITEM_HEADER *PDMusIoSegmentItemHeader;

typedef _DMUS_IO_SEGMENT_ITEM_HEADER  TDMusIoSegmentItemHeader;

typedef _DMUS_IO_SCRIPTTRACK_EVENTHEADER *PDMusIoScriptTrackEventHeader;

typedef _DMUS_IO_SCRIPTTRACK_EVENTHEADER  TDMusIoScriptTrackEventHeader;

typedef _DMUS_IO_LYRICSTRACK_EVENTHEADER *PDMusIoLyricsTrackEventHeader;

typedef _DMUS_IO_LYRICSTRACK_EVENTHEADER  TDMusIoLyricsTrackEventHeader;

typedef _DMUS_IO_PARAMCONTROLTRACK_OBJECTHEADER *PDMusIoParamControlTrackObjectHeader;

typedef _DMUS_IO_PARAMCONTROLTRACK_OBJECTHEADER  TDMusIoParamControlTrackObjectHeader;

typedef _DMUS_IO_PARAMCONTROLTRACK_PARAMHEADER *PDMusIoParamControlTrackParamHeader;

typedef _DMUS_IO_PARAMCONTROLTRACK_PARAMHEADER  TDMusIoParamControlTrackParamHeader;

typedef _DMUS_IO_PARAMCONTROLTRACK_CURVEINFO *PDMusIoParamControlTrackCurveInfo;

typedef _DMUS_IO_PARAMCONTROLTRACK_CURVEINFO  TDMusIoParamControlTrackCurveInfo;

typedef _DSOUND_IO_DSBUFFERDESC *PDSoundIoDSBufferDesc;

typedef _DSOUND_IO_DSBUFFERDESC  TDSoundIoDSBufferDesc;

typedef _DSOUND_IO_DSBUSID *PDSoundIoDSBusID;

typedef _DSOUND_IO_DSBUSID  TDSoundIoDSBusID;

typedef _DSOUND_IO_3D *PDSoundIo3D;

typedef _DSOUND_IO_3D  TDSoundIo3D;

typedef _DSOUND_IO_DXDMO_HEADER *PDSoundIoDXDMOHeader;

typedef _DSOUND_IO_DXDMO_HEADER  TDSoundIoDXDMOHeader;

typedef _DSOUND_IO_DXDMO_DATA *PDSoundIoDXDMOData;

typedef _DSOUND_IO_DXDMO_DATA  TDSoundIoDXDMOData;

typedef _DMUS_EVENTHEADER *PDMusEventHeader;

typedef _DMUS_EVENTHEADER  TDMusEventHeader;

typedef unsigned enumDMUS_TRACKF_FLAGS;

typedef unsigned TDMusTrackfFlags;

typedef unsigned *PDMusTrackfFlags;

typedef _DMUS_DOWNLOADINFO *PDMus_Downloadinfo;

typedef _DMUS_DOWNLOADINFO  TDMus_Downloadinfo;

typedef _DMUS_OFFSETTABLE *PDMus_Offsettable;

typedef _DMUS_OFFSETTABLE  TDMus_Offsettable;

typedef _DMUS_INSTRUMENT *PDMus_Instrument;

typedef _DMUS_INSTRUMENT  TDMus_Instrument;

typedef _DMUS_REGION *PDMus_Region;

typedef _DMUS_REGION  TDMus_Region;

typedef _DMUS_LFOPARAMS *PDMus_Lfoparams;

typedef _DMUS_LFOPARAMS  TDMus_Lfoparams;

typedef _DMUS_VEGPARAMS *PDMus_Vegparams;

typedef _DMUS_VEGPARAMS  TDMus_Vegparams;

typedef _DMUS_PEGPARAMS *PDMus_Pegparams;

typedef _DMUS_PEGPARAMS  TDMus_Pegparams;

typedef _DMUS_MSCPARAMS *PDMus_Mscparams;

typedef _DMUS_MSCPARAMS  TDMus_Mscparams;

typedef _DMUS_ARTICPARAMS *PDMus_Articparams;

typedef _DMUS_ARTICPARAMS  TDMus_Articparams;

typedef _DMUS_ARTICULATION *PDMus_Articulation;

typedef _DMUS_ARTICULATION  TDMus_Articulation;

typedef _DMUS_ARTICULATION2 *PDMus_Articulation2;

typedef _DMUS_ARTICULATION2  TDMus_Articulation2;

typedef _DMUS_EXTENSIONCHUNK *PDMus_Extensionchunk;

typedef _DMUS_EXTENSIONCHUNK  TDMus_Extensionchunk;

typedef _DMUS_COPYRIGHT *PDMus_Copyright;

typedef _DMUS_COPYRIGHT  TDMus_Copyright;

typedef _DMUS_WAVEDATA *PDMus_Wavedata;

typedef _DMUS_WAVEDATA  TDMus_Wavedata;

typedef _DMUS_WAVE *PDMus_Wave;

typedef _DMUS_WAVE  TDMus_Wave;

typedef _DMUS_NOTERANGE *PDMus_Noterange;

typedef _DMUS_NOTERANGE  TDMus_Noterange;

typedef _DMUS_WAVEARTDL *PDMus_Waveartdl;

typedef _DMUS_WAVEARTDL  TDMus_Waveartdl;

typedef _DMUS_WAVEDL *PDMus_Wavedl;

typedef _DMUS_WAVEDL  TDMus_Wavedl;

typedef _DMUS_BUFFERDESC *PDMus_Bufferdesc;

typedef _DMUS_BUFFERDESC  TDMus_Bufferdesc;

typedef _DMUS_PORTCAPS *PDMus_Portcaps;

typedef _DMUS_PORTCAPS  TDMus_Portcaps;

typedef _DMUS_PORTPARAMS8 *PDMus_Portparams;

typedef _DMUS_PORTPARAMS8  TDMus_Portparams;

typedef _DMUS_PORTPARAMS8 *PDMus_Portparams8;

typedef _DMUS_PORTPARAMS8  TDMus_Portparams8;

typedef _DMUS_SYNTHSTATS *PDMus_Synthstats;

typedef _DMUS_SYNTHSTATS  TDMus_Synthstats;

typedef _DMUS_SYNTHSTATS8 *PDMus_Synthstats8;

typedef _DMUS_SYNTHSTATS8  TDMus_Synthstats8;

typedef _DMUS_WAVES_REVERB_PARAMS *PDMus_Waves_Reverb_Params;

typedef _DMUS_WAVES_REVERB_PARAMS  TDMus_Waves_Reverb_Params;

typedef _DMUS_CLOCKINFO7 *PDMus_Clockinfo7;

typedef _DMUS_CLOCKINFO7  TDMus_Clockinfo7;

typedef _DMUS_CLOCKINFO8 *PDMus_Clockinfo8;

typedef _DMUS_CLOCKINFO8  TDMus_Clockinfo8;

typedef _DMUS_AUDIOPARAMS *PDMus_Audioparams;

typedef _DMUS_AUDIOPARAMS  TDMus_Audioparams;

typedef _DMUS_SUBCHORD *PDMus_Subchord;

typedef _DMUS_SUBCHORD  TDMus_Subchord;

typedef _DMUS_CHORD_KEY *PDMus_Chord_Key;

typedef _DMUS_CHORD_KEY  TDMus_Chord_Key;

typedef _DMUS_VERSION *PDMus_Version;

typedef _DMUS_VERSION  TDMus_Version;

typedef _DMUS_TIMESIGNATURE *PDMus_Timesignature;

typedef _DMUS_TIMESIGNATURE  TDMus_Timesignature;

typedef _DMUS_VALID_START_PARAM *PDMus_Valid_Start_Param;

typedef _DMUS_VALID_START_PARAM  TDMus_Valid_Start_Param;

typedef _DMUS_PLAY_MARKER_PARAM *PDMus_Play_Marker_Param;

typedef _DMUS_PLAY_MARKER_PARAM  TDMus_Play_Marker_Param;

typedef _DMUS_OBJECTDESC *PDMus_Objectdesc;

typedef _DMUS_OBJECTDESC  TDMus_Objectdesc;

typedef _DMUS_SCRIPT_ERRORINFO *PDMus_Script_Errorinfo;

typedef _DMUS_SCRIPT_ERRORINFO  TDMus_Script_Errorinfo;

typedef _DMUS_COMMAND_PARAM *PDMus_Command_Param;

typedef _DMUS_COMMAND_PARAM  TDMus_Command_Param;

typedef _DMUS_COMMAND_PARAM_2 *PDMus_Command_Param_2;

typedef _DMUS_COMMAND_PARAM_2  TDMus_Command_Param_2;

typedef _DMUS_PMSG *PDMus_Pmsg;

typedef _DMUS_PMSG  TDMus_Pmsg;

typedef _DMUS_NOTE_PMSG *PDMus_Note_Pmsg;

typedef _DMUS_NOTE_PMSG  TDMus_Note_Pmsg;

typedef _DMUS_MIDI_PMSG *PDMus_Midi_Pmsg;

typedef _DMUS_MIDI_PMSG  TDMus_Midi_Pmsg;

typedef _DMUS_PATCH_PMSG *PDMus_Patch_Pmsg;

typedef _DMUS_PATCH_PMSG  TDMus_Patch_Pmsg;

typedef _DMUS_TRANSPOSE_PMSG *PDMus_Transpose_Pmsg;

typedef _DMUS_TRANSPOSE_PMSG  TDMus_Transpose_Pmsg;

typedef _DMUS_CHANNEL_PRIORITY_PMSG *PDMus_Channel_Priority_Pmsg;

typedef _DMUS_CHANNEL_PRIORITY_PMSG  TDMus_Channel_Priority_Pmsg;

typedef _DMUS_TEMPO_PMSG *PDMus_Tempo_Pmsg;

typedef _DMUS_TEMPO_PMSG  TDMus_Tempo_Pmsg;

typedef _DMUS_SYSEX_PMSG *PDMus_Sysex_Pmsg;

typedef _DMUS_SYSEX_PMSG  TDMus_Sysex_Pmsg;

typedef _DMUS_CURVE_PMSG *PDMus_Curve_Pmsg;

typedef _DMUS_CURVE_PMSG  TDMus_Curve_Pmsg;

typedef _DMUS_TIMESIG_PMSG *PDMus_Timesig_Pmsg;

typedef _DMUS_TIMESIG_PMSG  TDMus_Timesig_Pmsg;

typedef _DMUS_NOTIFICATION_PMSG *PDMus_Notification_Pmsg;

typedef _DMUS_NOTIFICATION_PMSG  TDMus_Notification_Pmsg;

typedef _DMUS_WAVE_PMSG *PDMus_Wave_Pmsg;

typedef _DMUS_WAVE_PMSG  TDMus_Wave_Pmsg;

typedef _DMUS_LYRIC_PMSG *PDMus_Lyric_Pmsg;

typedef _DMUS_LYRIC_PMSG  TDMus_Lyric_Pmsg;

typedef _DMUS_BAND_PARAM *PDMus_Band_Param;

typedef _DMUS_BAND_PARAM  TDMus_Band_Param;

typedef _DMUS_VARIATIONS_PARAM *PDMus_Variations_Param;

typedef _DMUS_VARIATIONS_PARAM  TDMus_Variations_Param;

typedef _DMUS_IO_SEQ_ITEM *PDMus_Io_Seq_Item;

typedef _DMUS_IO_SEQ_ITEM  TDMus_Io_Seq_Item;

typedef _DMUS_IO_CURVE_ITEM *PDMus_Io_Curve_Item;

typedef _DMUS_IO_CURVE_ITEM  TDMus_Io_Curve_Item;

typedef _DMUS_IO_TEMPO_ITEM *PDMus_Io_Tempo_Item;

typedef _DMUS_IO_TEMPO_ITEM  TDMus_Io_Tempo_Item;

typedef _DMUS_IO_SYSEX_ITEM *PDMus_Io_Sysex_Item;

typedef _DMUS_IO_SYSEX_ITEM  TDMus_Io_Sysex_Item;

typedef _DMUS_RHYTHM_PARAM *PDMus_Rhythm_Param;

typedef _DMUS_RHYTHM_PARAM  TDMus_Rhythm_Param;

typedef _DMUS_TEMPO_PARAM *PDMus_Tempo_Param;

typedef _DMUS_TEMPO_PARAM  TDMus_Tempo_Param;

typedef _DMUS_MUTE_PARAM *PDMus_Mute_Param;

typedef _DMUS_MUTE_PARAM  TDMus_Mute_Param;

typedef _DMUS_IO_TIMESIG *PDMus_Io_Timesig;

typedef _DMUS_IO_TIMESIG  TDMus_Io_Timesig;

typedef _DMUS_IO_STYLE *PDMus_Io_Style;

typedef _DMUS_IO_STYLE  TDMus_Io_Style;

typedef _DMUS_IO_VERSION *PDMus_Io_Version;

typedef _DMUS_IO_VERSION  TDMus_Io_Version;

typedef _DMUS_IO_PATTERN *PDMus_Io_Pattern;

typedef _DMUS_IO_PATTERN  TDMus_Io_Pattern;

typedef _DMUS_IO_STYLEPART *PDMus_Io_Stylepart;

typedef _DMUS_IO_STYLEPART  TDMus_Io_Stylepart;

typedef _DMUS_IO_PARTREF *PDMus_Io_Partref;

typedef _DMUS_IO_PARTREF  TDMus_Io_Partref;

typedef _DMUS_IO_STYLENOTE *PDMus_Io_Stylenote;

typedef _DMUS_IO_STYLENOTE  TDMus_Io_Stylenote;

typedef _DMUS_IO_STYLECURVE *PDMus_Io_Stylecurve;

typedef _DMUS_IO_STYLECURVE  TDMus_Io_Stylecurve;

typedef _DMUS_IO_STYLEMARKER *PDMus_Io_Stylemarker;

typedef _DMUS_IO_STYLEMARKER  TDMus_Io_Stylemarker;

typedef _DMUS_IO_STYLERESOLUTION *PDMus_Io_Styleresolution;

typedef _DMUS_IO_STYLERESOLUTION  TDMus_Io_Styleresolution;

typedef _DMUS_IO_STYLE_ANTICIPATION *PDMus_Io_Style_Anticipation;

typedef _DMUS_IO_STYLE_ANTICIPATION  TDMus_Io_Style_Anticipation;

typedef _DMUS_IO_MOTIFSETTINGS *PDMus_Io_Motifsettings;

typedef _DMUS_IO_MOTIFSETTINGS  TDMus_Io_Motifsettings;

typedef _DMUS_IO_CHORD *PDMus_Io_Chord;

typedef _DMUS_IO_CHORD  TDMus_Io_Chord;

typedef _DMUS_IO_SUBCHORD *PDMus_Io_Subchord;

typedef _DMUS_IO_SUBCHORD  TDMus_Io_Subchord;

typedef _DMUS_IO_COMMAND *PDMus_Io_Command;

typedef _DMUS_IO_COMMAND  TDMus_Io_Command;

typedef _DMUS_IO_TOOL_HEADER *PDMus_Io_Tool_Header;

typedef _DMUS_IO_TOOL_HEADER  TDMus_Io_Tool_Header;

typedef _DMUS_IO_PORTCONFIG_HEADER *PDMus_Io_Portconfig_Header;

typedef _DMUS_IO_PORTCONFIG_HEADER  TDMus_Io_Portconfig_Header;

typedef _DMUS_IO_PCHANNELTOBUFFER_HEADER *PDMus_Io_Pchanneltobuffer_Header;

typedef _DMUS_IO_PCHANNELTOBUFFER_HEADER  TDMus_Io_Pchanneltobuffer_Header;

typedef _DMUS_IO_BUFFER_ATTRIBUTES_HEADER *PDMus_Io_Buffer_Attributes_Header;

typedef _DMUS_IO_BUFFER_ATTRIBUTES_HEADER  TDMus_Io_Buffer_Attributes_Header;

typedef _DMUS_IO_BAND_TRACK_HEADER *PDMus_Io_Band_Track_Header;

typedef _DMUS_IO_BAND_TRACK_HEADER  TDMus_Io_Band_Track_Header;

typedef _DMUS_IO_BAND_ITEM_HEADER *PDMus_Io_Band_Item_Header;

typedef _DMUS_IO_BAND_ITEM_HEADER  TDMus_Io_Band_Item_Header;

typedef _DMUS_IO_BAND_ITEM_HEADER2 *PDMus_Io_Band_Item_Header2;

typedef _DMUS_IO_BAND_ITEM_HEADER2  TDMus_Io_Band_Item_Header2;

typedef _DMUS_IO_INSTRUMENT *PDMus_Io_Instrument;

typedef _DMUS_IO_INSTRUMENT  TDMus_Io_Instrument;

typedef _DMUS_IO_WAVE_HEADER *PDMus_Io_Wave_Header;

typedef _DMUS_IO_WAVE_HEADER  TDMus_Io_Wave_Header;

typedef _DMUS_IO_WAVE_TRACK_HEADER *PDMus_Io_Wave_Track_Header;

typedef _DMUS_IO_WAVE_TRACK_HEADER  TDMus_Io_Wave_Track_Header;

typedef _DMUS_IO_WAVE_PART_HEADER *PDMus_Io_Wave_Part_Header;

typedef _DMUS_IO_WAVE_PART_HEADER  TDMus_Io_Wave_Part_Header;

typedef _DMUS_IO_WAVE_ITEM_HEADER *PDMus_Io_Wave_Item_Header;

typedef _DMUS_IO_WAVE_ITEM_HEADER  TDMus_Io_Wave_Item_Header;

typedef _DMUS_IO_CONTAINER_HEADER *PDMus_Io_Container_Header;

typedef _DMUS_IO_CONTAINER_HEADER  TDMus_Io_Container_Header;

typedef _DMUS_IO_CONTAINED_OBJECT_HEADER *PDMus_Io_Contained_Object_Header;

typedef _DMUS_IO_CONTAINED_OBJECT_HEADER  TDMus_Io_Contained_Object_Header;

typedef _DMUS_IO_SEGMENT_HEADER *PDMus_Io_Segment_Header;

typedef _DMUS_IO_SEGMENT_HEADER  TDMus_Io_Segment_Header;

typedef _DMUS_IO_TRACK_HEADER *PDMus_Io_Track_Header;

typedef _DMUS_IO_TRACK_HEADER  TDMus_Io_Track_Header;

typedef _DMUS_IO_TRACK_EXTRAS_HEADER *PDMus_Io_Track_Extras_Header;

typedef _DMUS_IO_TRACK_EXTRAS_HEADER  TDMus_Io_Track_Extras_Header;

typedef _DMUS_IO_REFERENCE *PDMus_Io_Reference;

typedef _DMUS_IO_REFERENCE  TDMus_Io_Reference;

typedef _DMUS_IO_CHORDMAP *PDMus_Io_Chordmap;

typedef _DMUS_IO_CHORDMAP  TDMus_Io_Chordmap;

typedef _DMUS_IO_CHORDMAP_SUBCHORD *PDMus_Io_Chordmap_Subchord;

typedef _DMUS_IO_CHORDMAP_SUBCHORD  TDMus_Io_Chordmap_Subchord;

typedef _DMUS_IO_CHORDENTRY *PDMus_Io_Chordentry;

typedef _DMUS_IO_CHORDENTRY  TDMus_Io_Chordentry;

typedef _DMUS_IO_NEXTCHORD *PDMus_Io_Nextchord;

typedef _DMUS_IO_NEXTCHORD  TDMus_Io_Nextchord;

typedef _DMUS_IO_CHORDMAP_SIGNPOST *PDMus_Io_Chordmap_Signpost;

typedef _DMUS_IO_CHORDMAP_SIGNPOST  TDMus_Io_Chordmap_Signpost;

typedef _DMUS_IO_SCRIPT_HEADER *PDMus_Io_Script_Header;

typedef _DMUS_IO_SCRIPT_HEADER  TDMus_Io_Script_Header;

typedef _DMUS_IO_SIGNPOST *PDMus_Io_Signpost;

typedef _DMUS_IO_SIGNPOST  TDMus_Io_Signpost;

typedef _DMUS_IO_MUTE *PDMus_Io_Mute;

typedef _DMUS_IO_MUTE  TDMus_Io_Mute;

typedef _DMUS_IO_TIMESIGNATURE_ITEM *PDMus_Io_Timesignature_Item;

typedef _DMUS_IO_TIMESIGNATURE_ITEM  TDMus_Io_Timesignature_Item;

typedef _DMUS_IO_VALID_START *PDMus_Io_Valid_Start;

typedef _DMUS_IO_VALID_START  TDMus_Io_Valid_Start;

typedef _DMUS_IO_PLAY_MARKER *PDMus_Io_Play_Marker;

typedef _DMUS_IO_PLAY_MARKER  TDMus_Io_Play_Marker;

typedef _DMUS_IO_SEGMENT_TRACK_HEADER *PDMus_Io_Segment_Track_Header;

typedef _DMUS_IO_SEGMENT_TRACK_HEADER  TDMus_Io_Segment_Track_Header;

typedef _DMUS_IO_SEGMENT_ITEM_HEADER *PDMus_Io_Segment_Item_Header;

typedef _DMUS_IO_SEGMENT_ITEM_HEADER  TDMus_Io_Segment_Item_Header;

typedef _DMUS_IO_SCRIPTTRACK_EVENTHEADER *PDMus_Io_Scripttrack_Eventheader;

typedef _DMUS_IO_SCRIPTTRACK_EVENTHEADER  TDMus_Io_Scripttrack_Eventheader;

typedef _DMUS_IO_LYRICSTRACK_EVENTHEADER *PDMus_Io_Lyricstrack_Eventheader;

typedef _DMUS_IO_LYRICSTRACK_EVENTHEADER  TDMus_Io_Lyricstrack_Eventheader;

typedef _DMUS_IO_PARAMCONTROLTRACK_OBJECTHEADER *PDMus_Io_Paramcontroltrack_Objectheader;

typedef _DMUS_IO_PARAMCONTROLTRACK_OBJECTHEADER  TDMus_Io_Paramcontroltrack_Objectheader;

typedef _DMUS_IO_PARAMCONTROLTRACK_PARAMHEADER *PDMus_Io_Paramcontroltrack_Paramheader;

typedef _DMUS_IO_PARAMCONTROLTRACK_PARAMHEADER  TDMus_Io_Paramcontroltrack_Paramheader;

typedef _DMUS_IO_PARAMCONTROLTRACK_CURVEINFO *PDMus_Io_Paramcontroltrack_Curveinfo;

typedef _DMUS_IO_PARAMCONTROLTRACK_CURVEINFO  TDMus_Io_Paramcontroltrack_Curveinfo;

typedef _DMUS_EVENTHEADER *PDMus_Eventheader;

typedef _DMUS_EVENTHEADER  TDMus_Eventheader;

typedef _DSOUND_IO_DSBUFFERDESC *PDSound_Io_Dsbufferdesc;

typedef _DSOUND_IO_DSBUFFERDESC  TDSound_Io_Dsbufferdesc;

typedef _DSOUND_IO_DSBUSID *PDSound_Io_Dsbusid;

typedef _DSOUND_IO_DSBUSID  TDSound_Io_Dsbusid;

typedef _DSOUND_IO_3D *PDSound_Io_3d;

typedef _DSOUND_IO_3D  TDSound_Io_3d;

typedef _DSOUND_IO_DXDMO_HEADER *PDSound_Io_Dxdmo_Header;

typedef _DSOUND_IO_DXDMO_HEADER  TDSound_Io_Dxdmo_Header;

typedef _DSOUND_IO_DXDMO_DATA *PDSound_Io_Dxdmo_Data;

typedef _DSOUND_IO_DXDMO_DATA  TDSound_Io_Dxdmo_Data;

//-- var, const, procedure ---------------------------------------------------
static const int MAKE_DMHRESULTSUCCESS_R = 0x8781000;
static const int MAKE_DMHRESULTERROR_R = 0x88781000;

}	/* namespace Directmusic */
using namespace Directmusic;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// DirectMusic
