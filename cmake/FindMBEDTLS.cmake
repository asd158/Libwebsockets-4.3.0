# This module tries to find miniz library and include files
#
# ZLIB_INCLUDE_DIR, path where to find miniz.h
# ZLIB_LIBRARY_DIR, path where to find libminiz.so
# ZLIB_LIBRARIES, the library to link against
# ZLIB_FOUND, If false, do not try to use miniz
#
# This currently works probably only for Linux

find_path(MBEDTLS_INCLUDE_DIRS mbedtls/ssl.h
        ${CMAKE_SOURCE_DIR}/3rd/mbedtls-3.4.0/_bin/include
        )
if (WIN32)
    find_library(MBEDTLS_LIBRARY mbedtls.lib
            ${CMAKE_SOURCE_DIR}/3rd/mbedtls-3.4.0/_bin/lib/win_x64/release
            )
    MESSAGE(STATUS ${MBEDTLS_LIBRARY})
    find_library(MBEDX509_LIBRARY mbedx509.lib
            ${CMAKE_SOURCE_DIR}/3rd/mbedtls-3.4.0/_bin/lib/win_x64/release
            )
    find_library(MBEDCRYPTO_LIBRARY mbedcrypto.lib
            ${CMAKE_SOURCE_DIR}/3rd/mbedtls-3.4.0/_bin/lib/win_x64/release
            )
elseif (ANDROID)
    find_library(MBEDTLS_LIBRARY mbedtls
            ${CMAKE_SOURCE_DIR}/3rd/mbedtls-3.4.0/_bin/lib/android/${ANDROID_ABI}
            )
    find_library(MBEDX509_LIBRARY libmbedx509.a
            ${CMAKE_SOURCE_DIR}/3rd/mbedtls-3.4.0/_bin/lib/android/${ANDROID_ABI}
            )
    find_library(MBEDCRYPTO_LIBRARY libmbedcrypto.a
            ${CMAKE_SOURCE_DIR}/3rd/mbedtls-3.4.0/_bin/lib/android/${ANDROID_ABI}
            )
elseif (APPLE)
    find_library(MBEDTLS_LIBRARY libmbedtls.a
            {CMAKE_SOURCE_DIR}/3rd/mbedtls-3.4.0/_bin/lib/ios
            )
    find_library(MBEDX509_LIBRARY libmbedx509.a
            {CMAKE_SOURCE_DIR}/3rd/mbedtls-3.4.0/_bin/lib/ios
            )
    find_library(MBEDCRYPTO_LIBRARY libmbedcrypto.a
            {CMAKE_SOURCE_DIR}/3rd/mbedtls-3.4.0/_bin/lib/ios
            )
else ()
    find_library(MBEDTLS_LIBRARY libmbedtls.a
            {CMAKE_SOURCE_DIR}/3rd/mbedtls-3.4.0/_bin/lib/ubt22_x64
            )
    find_library(MBEDX509_LIBRARY libmbedx509.a
            {CMAKE_SOURCE_DIR}/3rd/mbedtls-3.4.0/_bin/lib/ubt22_x64
            )
    find_library(MBEDCRYPTO_LIBRARY libmbedcrypto.a
            {CMAKE_SOURCE_DIR}/3rd/mbedtls-3.4.0/_bin/lib/ubt22_x64
            )
endif ()
MARK_AS_ADVANCED(
        MBEDTLS_INCLUDE_DIRS
        MBEDTLS_LIBRARY
        MBEDX509_LIBRARY
        MBEDCRYPTO_LIBRARY
)
