#!/bin/bash

tflite_model="tensorflow/contrib/lite/kernels/internal:tensor_utils_test"
if [ $# -ge 1 ]; then
    tflite_model=$1
fi

echo "Run: $0 ${tflite_model}"

bazel build --copt="-fPIC" --copt="-march=armv6" \
    --copt="-mfloat-abi=hard" \
    --copt="-mfpu=vfp" \
    --copt="-mtune=arm1176jzf-s" \
    --copt="-funsafe-math-optimizations" \
    --copt="-Wno-unused-function" \
    --copt="-Wno-sign-compare" \
    --copt="-ftree-vectorize" \
    --copt="-fomit-frame-pointer" \
    --cxxopt='--std=c++11' \
    --cxxopt="-Wno-maybe-uninitialized" \
    --cxxopt="-Wno-narrowing" \
    --cxxopt="-Wno-unused" \
    --cxxopt="-Wno-comment" \
    --cxxopt="-Wno-unused-function" \
    --cxxopt="-Wno-sign-compare" \
    --cxxopt="-funsafe-math-optimizations" \
    --linkopt="-lstdc++" \
    --linkopt="-mfloat-abi=hard" \
    --linkopt="-mfpu=vfp" \
    --linkopt="-mtune=arm1176jzf-s" \
    --linkopt="-funsafe-math-optimizations" \
    --verbose_failures \
    --strip=always \
    --crosstool_top=//armv6-compiler:toolchain --cpu=armv6 --config=opt \
    ${tflite_model}
#     --linkopt="-mfpu=neon-vfpv4" \
