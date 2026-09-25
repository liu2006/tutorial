#!/usr/bin/bash

set -xe
PROJECT_DIR="$(realpath "$PWD")"
PROGRAM="$(find "$PROJECT_DIR/build" -maxdepth 1 -type f -executable -print -quit)"
"$PROGRAM"

