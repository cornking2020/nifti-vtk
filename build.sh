#!/bin/bash
rm -rf build

cmake \
    -DCMAKE_BUILD_TYPE:STRING=Debug \
    -DCMAKE_EXPORT_COMPILE_COMMANDS:BOOL=TRUE \
    -DCMAKE_MAKE_PROGRAM=$(which cmake) \
    -DCMAKE_TOOLCHAIN_FILE:FILEPATH=${VCPKG_ROOT}/scripts/buildsystems/vcpkg.cmake \
    -DCMAKE_PREFIX_PATH:PATH=${QT_DIR}/lib/cmake \
    -DCMAKE_C_COMPILER:FILEPATH=$(which gcc-14) \
    -DCMAKE_CXX_COMPILER:FILEPATH=$(which g++-14) \
    -S "$(pwd)" \
    -B "$(pwd)/build" \
    -G "Ninja Multi-Config"

cmake --build build --config Debug
