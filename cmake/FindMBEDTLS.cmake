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
set(MBEDTLS_INCLUDE_DIRS ${CMAKE_SOURCE_DIR}/3rd/mbedtls-3.4.0/_bin/include)
set(MBEDTLS_LIBRARY ${CMAKE_SOURCE_DIR}/3rd/mbedtls-3.4.0/_bin/lib/ios/${EXT_DIR}/libmbedtls.a)
set(MBEDX509_LIBRARY ${CMAKE_SOURCE_DIR}/3rd/mbedtls-3.4.0/_bin/lib/ios/${EXT_DIR}/libmbedx509.a)
set(MBEDCRYPTO_LIBRARY ${CMAKE_SOURCE_DIR}/3rd/mbedtls-3.4.0/_bin/lib/ios/${EXT_DIR}/libmbedcrypto.a)
if (WIN32)
    set(MBEDTLS_LIBRARY ${CMAKE_SOURCE_DIR}/3rd/mbedtls-3.4.0/_bin/lib/ios/${EXT_DIR}/mbedtls.lib)
    set(MBEDX509_LIBRARY ${CMAKE_SOURCE_DIR}/3rd/mbedtls-3.4.0/_bin/lib/ios/${EXT_DIR}/mbedx509.lib)
    set(MBEDCRYPTO_LIBRARY ${CMAKE_SOURCE_DIR}/3rd/mbedtls-3.4.0/_bin/lib/ios/${EXT_DIR}/mbedcrypto.lib)
endif ()
MARK_AS_ADVANCED(
        MBEDTLS_INCLUDE_DIRS
        MBEDTLS_LIBRARY
        MBEDX509_LIBRARY
        MBEDCRYPTO_LIBRARY
)
