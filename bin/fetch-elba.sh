#!/usr/bin/env bash

set -ex

path="${HOME}/.local/bin"
ELBA_VERSION="0.2.0"
TAR_FILE_NAME="elba-${ELBA_VERSION}-x86_64-unknown-linux-gnu.tar.gz"
RELEASE_URL="https://github.com/elba/elba/releases/download/${ELBA_VERSION}/${TAR_FILE_NAME}"

if ! [[ -d $path ]]; then
    mkdir -p $path
    export PATH=${path}:${PATH}
fi

if ! [[ -f "${path}/elba" ]]; then
    curl -L ${RELEASE_URL} | tar x -C ${path} 'elba'
fi
