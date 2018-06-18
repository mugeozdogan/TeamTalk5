include (ttlib)
include (speex)
include (speexdsp)
include (opus)
include (libvpx)
include (ogg)
include (opustools)
include (ffmpeg)
include (dshow)
include (vidcap)

set (CODEC_SOURCES ${TEAMTALKLIB_ROOT}/codec/MediaStreamer.cpp ${TEAMTALKLIB_ROOT}/codec/MediaUtil.cpp)
set (CODEC_HEADERS ${TEAMTALKLIB_ROOT}/codec/MediaStreamer.h ${TEAMTALKLIB_ROOT}/codec/MediaUtil.h)

option (SPEEX "Build Speex codec classes" ON)

if (SPEEX)
  list (APPEND CODEC_SOURCES ${TEAMTALKLIB_ROOT}/codec/SpeexEncoder.cpp)
  list (APPEND CODEC_SOURCES ${TEAMTALKLIB_ROOT}/codec/SpeexDecoder.cpp)
  list (APPEND CODEC_HEADERS ${TEAMTALKLIB_ROOT}/codec/SpeexEncoder.h)
  list (APPEND CODEC_HEADERS ${TEAMTALKLIB_ROOT}/codec/SpeexDecoder.h)
  list (APPEND CODEC_COMPILE_FLAGS -DENABLE_SPEEX)
  list (APPEND CODEC_INCLUDE_DIR ${SPEEX_INCLUDE_DIR})
  list (APPEND CODEC_LINK_FLAGS ${SPEEX_STATIC_LIB})
endif()

option (SPEEXDSP "Build SpeexDSP codec classes" ON)

if (SPEEXDSP)
  list (APPEND CODEC_SOURCES ${TEAMTALKLIB_ROOT}/codec/SpeexPreprocess.cpp)
  list (APPEND CODEC_SOURCES ${TEAMTALKLIB_ROOT}/codec/SpeexResampler.cpp)
  list (APPEND CODEC_HEADERS ${TEAMTALKLIB_ROOT}/codec/SpeexPreprocess.h)
  list (APPEND CODEC_HEADERS ${TEAMTALKLIB_ROOT}/codec/SpeexResampler.h)
  list (APPEND CODEC_COMPILE_FLAGS -DENABLE_SPEEX)
  list (APPEND CODEC_INCLUDE_DIR ${SPEEXDSP_INCLUDE_DIR})
  list (APPEND CODEC_LINK_FLAGS ${SPEEXDSP_STATIC_LIB})
endif()

option (OPUS "Build OPUS codec classes" ON)
if (OPUS)
  list (APPEND CODEC_SOURCES ${TEAMTALKLIB_ROOT}/codec/OpusEncoder.cpp)
  list (APPEND CODEC_SOURCES ${TEAMTALKLIB_ROOT}/codec/OpusDecoder.cpp)
  list (APPEND CODEC_HEADERS ${TEAMTALKLIB_ROOT}/codec/OpusEncoder.h)
  list (APPEND CODEC_HEADERS ${TEAMTALKLIB_ROOT}/codec/OpusDecoder.h)
  list (APPEND CODEC_COMPILE_FLAGS -DENABLE_OPUS)
  list (APPEND CODEC_INCLUDE_DIR ${OPUS_INCLUDE_DIR})
  list (APPEND CODEC_LINK_FLAGS ${OPUS_STATIC_LIB})
endif()

option (LIBVPX "Build libVPX codec classes" ON)
if (LIBVPX)
  list (APPEND CODEC_SOURCES ${TEAMTALKLIB_ROOT}/codec/VpxEncoder.cpp)
  list (APPEND CODEC_SOURCES ${TEAMTALKLIB_ROOT}/codec/VpxDecoder.cpp)
  list (APPEND CODEC_HEADERS ${TEAMTALKLIB_ROOT}/codec/VpxEncoder.h)
  list (APPEND CODEC_HEADERS ${TEAMTALKLIB_ROOT}/codec/VpxDecoder.h)
  list (APPEND CODEC_COMPILE_FLAGS -DENABLE_VPX)
  list (APPEND CODEC_INCLUDE_DIR ${LIBVPX_INCLUDE_DIR})
  list (APPEND CODEC_LINK_FLAGS ${LIBVPX_STATIC_LIB})
endif()

option (OGG "Build libOgg classes" ON)
if (OGG)
  list (APPEND CODEC_SOURCES ${TEAMTALKLIB_ROOT}/codec/OggOutput.cpp)
  list (APPEND CODEC_HEADERS ${TEAMTALKLIB_ROOT}/codec/OggOutput.h)
  list (APPEND CODEC_COMPILE_FLAGS -DENABLE_OGG)
  list (APPEND CODEC_INCLUDE_DIR ${OGG_INCLUDE_DIR})
  list (APPEND CODEC_LINK_FLAGS ${OGG_STATIC_LIB})
endif()

option (OPUSTOOLS "Build Opus-tools" ON)
if (OPUSTOOLS)
  list (APPEND CODEC_SOURCES ${TTLIBS_ROOT}/opus-tools/src/opus_header.c)
  list (APPEND CODEC_HEADERS ${TTLIBS_ROOT}/opus-tools/src/opus_header.h)
  list (APPEND CODEC_COMPILE_FLAGS -DENABLE_OPUSTOOLS)
  list (APPEND CODEC_INCLUDE_DIR ${OPUSTOOLS_INCLUDE_DIR})
endif()

if (MSVC)
  option (FFMPEG "Build ffmpeg classes" OFF)
else()
  option (FFMPEG "Build ffmpeg classes" ON)
endif()

if (FFMPEG)
  list (APPEND CODEC_SOURCES ${TEAMTALKLIB_ROOT}/codec/FFMpeg3Streamer.cpp)
  list (APPEND CODEC_SOURCES ${TEAMTALKLIB_ROOT}/codec/FFMpeg3Resampler.cpp)
  list (APPEND CODEC_HEADERS ${TEAMTALKLIB_ROOT}/codec/FFMpeg3Streamer.h)
  list (APPEND CODEC_HEADERS ${TEAMTALKLIB_ROOT}/codec/FFMpeg3Resampler.h)
  list (APPEND CODEC_COMPILE_FLAGS -DENABLE_FFMPEG3 ${FFMPEG_COMPILE_FLAGS})
  list (APPEND CODEC_INCLUDE_DIR ${FFMPEG_INCLUDE_DIR})
  list (APPEND CODEC_LINK_FLAGS ${FFMPEG_STATIC_LIB})
  list (APPEND CODEC_LINK_FLAGS ${FFMPEG_LINK_FLAGS})

  if (${CMAKE_SYSTEM_NAME} MATCHES "Linux")
    option(V4L2 "Build Video for Linux 2 (V4L2) classes" ON)

    if (V4L2)
      list (APPEND CODEC_SOURCES ${TEAMTALKLIB_ROOT}/vidcap/FFMpeg3Capture.cpp)
      list (APPEND CODEC_SOURCES ${TEAMTALKLIB_ROOT}/vidcap/VideoCapture.cpp)
      list (APPEND CODEC_SOURCES ${TEAMTALKLIB_ROOT}/vidcap/V4L2Capture.cpp)
      list (APPEND CODEC_HEADERS ${TEAMTALKLIB_ROOT}/vidcap/FFMpeg3Capture.h)
      list (APPEND CODEC_HEADERS ${TEAMTALKLIB_ROOT}/vidcap/VideoCapture.h)
      list (APPEND CODEC_HEADERS ${TEAMTALKLIB_ROOT}/vidcap/V4L2Capture.h)
      list (APPEND CODEC_COMPILE_FLAGS -DENABLE_VIDCAP -DENABLE_V4L2)
    endif()
  endif()

  if (${CMAKE_SYSTEM_NAME} MATCHES "Darwin")
    option(AVF "Build video capture (AVFoundation) classes for macOS" ON)

    if (AVF)
      list (APPEND CODEC_SOURCES ${TEAMTALKLIB_ROOT}/vidcap/AVFCapture.mm)
      list (APPEND CODEC_SOURCES ${TEAMTALKLIB_ROOT}/vidcap/AVFVideoInput.cpp)
      list (APPEND CODEC_SOURCES ${TEAMTALKLIB_ROOT}/vidcap/FFMpeg3Capture.cpp)
      list (APPEND CODEC_SOURCES ${TEAMTALKLIB_ROOT}/vidcap/VideoCapture.cpp)
      list (APPEND CODEC_HEADERS ${TEAMTALKLIB_ROOT}/vidcap/AVFCapture.h)
      list (APPEND CODEC_HEADERS ${TEAMTALKLIB_ROOT}/vidcap/AVFVideoInput.h)
      list (APPEND CODEC_HEADERS ${TEAMTALKLIB_ROOT}/vidcap/FFMpeg3Capture.h)
      list (APPEND CODEC_HEADERS ${TEAMTALKLIB_ROOT}/vidcap/VideoCapture.h)
      list (APPEND CODEC_COMPILE_FLAGS -DENABLE_VIDCAP -DENABLE_AVF)
    endif()
  endif()
endif()

if (FFMPEG OR LIBVPX)
  if (${CMAKE_SYSTEM_NAME} MATCHES "Linux" AND ${CMAKE_SIZEOF_VOID_P} EQUAL 8)
    list (APPEND CODEC_LINK_FLAGS "-Wl,-Bsymbolic")
  endif()
endif()

if (MSVC)
  option (MSDMO "Build Microsoft DirectX Media Objects (DMO) Resampler classes" ON)

  if (MSDMO)
    list (APPEND CODEC_HEADERS ${TEAMTALKLIB_ROOT}/codec/DMOResampler.h)
    list (APPEND CODEC_SOURCES ${TEAMTALKLIB_ROOT}/codec/DMOResampler.cpp)
    list (APPEND CODEC_COMPILE_FLAGS -DENABLE_DMORESAMPLER)
    list (APPEND CODEC_LINK_FLAGS Msdmo strmiids)
  endif()

  option (DSHOW "Build Microsoft DirectShow Streaming classes" ON)

  if (DSHOW)
    list (APPEND CODEC_INCLUDE_DIR ${DSHOW_INCLUDE_DIR})
    list (APPEND CODEC_HEADERS ${TEAMTALKLIB_ROOT}/codec/WinMedia.h)
    list (APPEND CODEC_HEADERS ${TEAMTALKLIB_ROOT}/codec/MediaStreamer.h)
    list (APPEND CODEC_SOURCES ${TEAMTALKLIB_ROOT}/codec/WinMedia.cpp)
    list (APPEND CODEC_SOURCES ${TEAMTALKLIB_ROOT}/codec/MediaStreamer.cpp)
    list (APPEND CODEC_COMPILE_FLAGS -DENABLE_DSHOW)
    list (APPEND CODEC_LINK_FLAGS ${DSHOW_STATIC_LIB})
  endif()

  option (VIDCAP "Build DirectShow Video Capture classes" ON)

  if (VIDCAP)
    list (APPEND CODEC_INCLUDE_DIR ${VIDCAP_INCLUDE_DIR})
    list (APPEND CODEC_LINK_FLAGS ${VIDCAP_STATIC_LIB})
    list (APPEND CODEC_HEADERS ${TEAMTALKLIB_ROOT}/vidcap/VideoCapture.h)
    list (APPEND CODEC_HEADERS ${TEAMTALKLIB_ROOT}/vidcap/LibVidCap.h)
    list (APPEND CODEC_SOURCES ${TEAMTALKLIB_ROOT}/vidcap/VideoCapture.cpp)
    list (APPEND CODEC_SOURCES ${TEAMTALKLIB_ROOT}/vidcap/LibVidCap.cpp)
    list (APPEND CODEC_COMPILE_FLAGS -DENABLE_VIDCAP -DENABLE_LIBVIDCAP )
  endif()
  
endif()

if (MSVC)
  option (LAMEMP3 "Build MP3 Lame classes" ON)

  if (LAMEMP3)
    list (APPEND CODEC_COMPILE_FLAGS -DENABLE_MP3 )
    list (APPEND CODEC_INCLUDE_DIR ${TTLIBS_ROOT}/lame-3.97/Dll)
    list (APPEND CODEC_HEADERS ${TEAMTALKLIB_ROOT}/codec/LameMP3.h)
    list (APPEND CODEC_SOURCES ${TEAMTALKLIB_ROOT}/codec/LameMP3.cpp)
  endif()
  
endif()
