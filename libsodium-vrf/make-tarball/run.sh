#!/bin/bash -eux

build_root="${PWD}"

version="$(cat "${build_root}/src-version-file/number")+vrfs-r0"
tarballfile="libsodium-${version}.tar.gz"

mkdir -p tarball

# make actual tarball
tar -czvf "tarball/$tarballfile" libsodium

# make name file
echo "${version}" > tarball/name

# make SHA2 file
pushd tarball
	sha256sum "$tarballfile" > "${tarballfile}.sha256"
popd
