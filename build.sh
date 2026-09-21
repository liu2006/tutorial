#!/usr/bin/bash

set -xe
cmake -S . -B build -G Ninja -DCMAKE_BUILD_TYPE=Debug
PROJECT_DIR="$(realpath "$PWD")"
cmake --build "$PROJECT_DIR/build"
