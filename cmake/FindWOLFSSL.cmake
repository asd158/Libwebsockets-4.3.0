# This module tries to find miniz library and include files
#
# ZLIB_INCLUDE_DIR, path where to find miniz.h
# ZLIB_LIBRARY_DIR, path where to find libminiz.so
# ZLIB_LIBRARIES, the library to link against
# ZLIB_FOUND, If false, do not try to use miniz
#
# This currently works probably only for Linux
if (WIN32)
    set(EXT_DIR win_x64/release)
elseif (ANDROID)
    set(EXT_DIR android/${ANDROID_ABI})
elseif (APPLE)
    if (IOS)
        set(EXT_DIR ios)
    else ()
        set(EXT_DIR mac_x64)
    endif ()
else ()
    set(EXT_DIR ubt22_x64)
endif ()
set(WOLFSSL_INCLUDE_DIRS ${CMAKE_SOURCE_DIR}/3rd/wolfssl-5.6.0-stable/_bin/include)
set(WOLFSSL_LIBRARIES ${CMAKE_SOURCE_DIR}/3rd/wolfssl-5.6.0-stable/_bin/lib/${EXT_DIR}/libwolfssl.a)
if (WIN32)
    set(WOLFSSL_LIBRARIES ${CMAKE_SOURCE_DIR}/3rd/wolfssl-5.6.0-stable/_bin/lib/${EXT_DIR}/wolfssl.lib)
endif ()
IF (WOLFSSL_LIBRARIES)
    set(WOLFSSL_FOUND 1)
ENDIF (WOLFSSL_LIBRARIES)
MARK_AS_ADVANCED(
        WOLFSSL_INCLUDE_DIRS
        WOLFSSL_LIBRARIES
)
