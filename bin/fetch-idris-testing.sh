#!/usr/bin/env bash

set -x

mkdir -p build
git clone https://github.com/yurrriq/idris-testing.git build/idris-testing

pushd build/idris-testing
make lib
make install
popd
