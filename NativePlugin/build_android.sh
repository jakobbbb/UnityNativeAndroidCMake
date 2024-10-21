#/usr/bin/bash

ANDROID_NDK=~/Unity/Hub/Editor/6000.0.23f1/Editor/Data/PlaybackEngines/AndroidPlayer/NDK

rm -fr build
mkdir build
cd build

cmake \
-DANDROID_BUILD=True \
-DCMAKE_SYSTEM_NAME=Android \
-DNDK_TOOLCHAIN_VERSION=clang \
-DCMAKE_MAKE_PROGRAM="${ANDROID_NDK}/prebuilt/linux-x86_64/bin/make" \
-DCMAKE_TOOLCHAIN_FILE="${ANDROID_NDK}/build/cmake/android.toolchain.cmake" \
-DANDROID_NDK="${ANDROID_NDK}" \
-DANDROID_PLATFORM=android-20 \
-DANDROID_STL=c++_static \
-DCMAKE_BUILD_TYPE=Release \
-DANDROID_ABI=arm64-v8a \
..

cmake --build .
cmake --install .
