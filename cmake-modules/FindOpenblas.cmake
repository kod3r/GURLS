# - Finds Openblas and all dependencies
# Once done this will define
#  Openblas_FOUND - System has Openblas
#  Openblas_INCLUDE_DIRS - The Openblas include directories
#  Openblas_LIBRARIES - The libraries needed to use Openblas


find_library(Openblas_LIBRARY
    NAMES libopenblas.a libopenblas.so
    PATHS ${Openblas_ROOT}/lib
    )

find_path(Openblas_INCLUDE_DIR
    NAMES openblas_config.h
    PATHS ${Openblas_ROOT}/include
    )

if( ( Openblas_LIBRARY STREQUAL "Openblas_LIBRARY-NOTFOUND") OR ( Openblas_INCLUDE_DIR STREQUAL "Openblas_INCLUDE_DIR-NOTFOUND") )
    set(Openblas_ROOT "" CACHE PATH "Path to the root of a Openblas installation")
    set(Openblas_FOUND 0)
    message(FATAL_ERROR "Openblas not found. Please try specifying Openblas_ROOT")
else()
    set(Openblas_FOUND 1)
    set(Openblas_INCLUDE_DIRS ${Openblas_INCLUDE_DIR})
    set(Openblas_LIBRARIES ${Openblas_LIBRARY} gfortran pthread)

endif()