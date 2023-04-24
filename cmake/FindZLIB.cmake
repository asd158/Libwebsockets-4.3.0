# This module tries to find miniz library and include files
#
# ZLIB_INCLUDE_DIR, path where to find miniz.h
# ZLIB_LIBRARY_DIR, path where to find libminiz.so
# ZLIB_LIBRARIES, the library to link against
# ZLIB_FOUND, If false, do not try to use miniz
#
# This currently works probably only for Linux

FIND_PATH(ZLIB_INCLUDE_DIR zlib.h
        ${CMAKE_SOURCE_DIR}/3rd/zlib-1.2.13/_bin/include
        )
if (WIN32)
    SET(ZLIB_INCLUDE_DIR ${ZLIB_INCLUDE_DIR}/win)
    message(STATUS ${ZLIB_INCLUDE_DIR})
    FIND_LIBRARY(ZLIB_LIBRARIES zlibstatic.lib
            ${CMAKE_SOURCE_DIR}/3rd/zlib-1.2.13/_bin/lib/win_x64/release
            )
elseif (ANDROID)
    FIND_LIBRARY(ZLIB_LIBRARIES libz.a
            ${CMAKE_SOURCE_DIR}/3rd/zlib-1.2.13/_bin/lib/android/${ANDROID_ABI}
            )
elseif (APPLE)
    FIND_LIBRARY(ZLIB_LIBRARIES libz.a
            ${CMAKE_SOURCE_DIR}/3rd/zlib-1.2.13/_bin/lib/ios
            )
else ()
    FIND_LIBRARY(ZLIB_LIBRARIES libz.a
            ${CMAKE_SOURCE_DIR}/3rd/zlib-1.2.13/_bin/lib/ubt22_x64
            )
endif ()
GET_FILENAME_COMPONENT(ZLIB_LIBRARY_DIR ${ZLIB_LIBRARIES} PATH)
set(ZLIB_INCLUDE_DIRS ${ZLIB_INCLUDE_DIR})
SET(ZLIB_FOUND "NO")
IF (ZLIB_LIBRARIES)
    SET(ZLIB_FOUND "YES")
ENDIF (ZLIB_LIBRARIES)
MARK_AS_ADVANCED(
        ZLIB_INCLUDE_DIRS
        ZLIB_LIBRARIES
)
