#!/bin/bash -eux

build_root="${PWD}"

mkdir -p src-version-file

# make SHA2 file
pushd libsodium-fork-src

  quoted="$(grep -r 'SODIUM_VERSION_STRING "\([\.0-9]\+\)"' builds/msvc/version.h | cut -d' ' -f3)"
  trimmed="${quoted#\"}"

popd

echo "${trimmed%\"}" > src-version-file/number
