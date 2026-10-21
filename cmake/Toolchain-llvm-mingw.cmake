# CMake Toolchain file for cross-compiling to Windows ARM64 using llvm-mingw
# Target: Windows aarch64 (ARM64)

if(WIN32)
    set(PATH_EXE .exe)
endif()

set(CMAKE_SYSTEM_NAME Windows)
set(CMAKE_SYSTEM_PROCESSOR aarch64)

if(NOT LLVM_ARCH)
    set(LLVM_ARCH aarch64)
endif()

# Compilers and binutils
set(CMAKE_C_COMPILER ${LLVM_PREFIX}/bin/${LLVM_ARCH}-w64-mingw32-clang${PATH_EXE})
set(CMAKE_CXX_COMPILER ${LLVM_PREFIX}/bin/${LLVM_ARCH}-w64-mingw32-clang++${PATH_EXE})
set(CMAKE_RC_COMPILER ${LLVM_PREFIX}/bin/${LLVM_ARCH}-w64-mingw32-windres${PATH_EXE})
set(CMAKE_AR ${LLVM_PREFIX}/bin/${LLVM_ARCH}-w64-mingw32-ar${PATH_EXE} CACHE FILEPATH "Archiver")
set(CMAKE_RANLIB ${LLVM_PREFIX}/bin/${LLVM_ARCH}-w64-mingw32-ranlib${PATH_EXE} CACHE FILEPATH "Ranlib")
set(CMAKE_STRIP ${LLVM_PREFIX}/bin/${LLVM_ARCH}-w64-mingw32-strip${PATH_EXE} CACHE FILEPATH "Strip")

# Static linking flags
set(CMAKE_BUILD_TYPE Release CACHE STRING "Build type")
set(CMAKE_EXE_LINKER_FLAGS "-s -static" CACHE STRING "Linker flags")

# Target search root paths
set(CMAKE_FIND_ROOT_PATH 
    ${LLVM_PREFIX}/generic-w64-mingw32 
    ${LLVM_PREFIX}/${LLVM_ARCH}-w64-mingw32 
    ${VCPKG_LIB_PREFIX} 
    ${LIBS_ROOT} 
    ${LIBS_ROOT}/zlib 
    ${BOOST_SRC}
)

# Cross-compilation search behavior
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ALWAYS)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)
