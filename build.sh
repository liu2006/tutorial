#!/usr/bin/bash

set -xe
PROJECT_DIR="$(realpath "$PWD")"
cmake -S "$PROJECT_DIR" -B "$PROJECT_DIR/build" -G Ninja
cmake --build "$PROJECT_DIR/build"
