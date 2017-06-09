#!/usr/bin/env bash

set -x

path=$HOME/.local/bin
stack_bin=$path/stack

mkdir -p $path
export PATH=$path:$PATH

[[ -f $stack_bin ]] || curl -L https://www.stackage.org/stack/linux-x86_64 | tar xz --wildcards --strip-components=1 -C $path '*/stack'