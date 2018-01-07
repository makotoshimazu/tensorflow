#!/bin/bash
bazel build --copt="-fPIC" --copt="-march=armv6" \
    --copt="-mfloat-abi=hard" \
    --copt="-mfpu=vfp" \
    --copt="-mtune=arm1176jzf-s" \
    --copt="-funsafe-math-optimizations" \
    --copt="-Wno-unused-function" \
    --copt="-Wno-sign-compare" \
    --copt="-ftree-vectorize" \
    --copt="-fomit-frame-pointer" \
    --cxxopt="-Wno-maybe-uninitialized" \
    --cxxopt="-Wno-narrowing" \
    --cxxopt="-Wno-unused" \
    --cxxopt="-Wno-comment" \
    --cxxopt="-Wno-unused-function" \
    --cxxopt="-Wno-sign-compare" \
    --cxxopt="-funsafe-math-optimizations" \
    --linkopt="-mfloat-abi=hard" \
    --linkopt="-mfpu=vfp" \
    --linkopt="-mtune=arm1176jzf-s" \
    --linkopt="-funsafe-math-optimizations" \
    --verbose_failures \
    --crosstool_top=//armv6-compiler:toolchain --cpu=armv6 --config=opt \
    tensorflow/examples/label_image/...
