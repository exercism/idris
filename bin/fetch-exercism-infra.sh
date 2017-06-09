#!/usr/bin/env bash

set -x

xtrack_home=$(pwd)
build=${xtrack_home}/build

xapi_home=${build}/x-api
trackler_home=${build}/trackler
exercism_home=${build}/exercism

## Clone into X-API and trackler
git clone "https://github.com/exercism/x-api" "${xapi_home}"
git clone "https://github.com/exercism/trackler" "${trackler_home}"

#### TRACKLER ####

## Get into trackler directory
pushd ${trackler_home}

## Update submodules
git submodule init -- comoon
git submodule update

## Bake in local version of the track
rm -rf tracks/idris # TODO: generify the trackname!
mkdir -p tracks/idris/exercises
cp "${xtrack_home}/config.json" tracks/idris
cp -rv "${xtrack_home}/exercises" tracks/idris

## Adjust some versioning information
version=$(grep -m 1 'trackler' ${xapi_home}/Gemfile.lock | sed 's/.*(//' | sed 's/)//')
echo "module Trackler VERSION = \"${version}\" end" > lib/trackler/version.rb

## Install bundler and use it to install dependencies
[[ $(which bundler) != "" ]] || gem install bundler
bundle install
gem build trackler.gemspec

## Install the built gem into local registry
gem install --local "trackler-${version}.gem"

popd

#### XAPI ####

pushd ${xapi_home}

## Install the dependencies
bundle install

## Start it in background
RACK_ENV=development rackup &
xapi_pid=$!
sleep 5 # We need to wait a bit here, to avoid race conditions. 5 seconds should be enough

echo "x-api is running, pid is ${xapi_pid}."

popd

#### EXERCISM CLI ####

os=$(case $(uname) in
    (Darwin*)
        echo "mac";;
    (Linux*)
        echo "linux";;
    (Windows*)
        echo "windows";;
    (MINGW*)
        echo "windows";;
    (*)
        echo "linux";;
esac)

arch=$(case $(uname -m) in
    (*64*)
        echo 64bit;;
    (*686*)
        echo 32bit;;
    (*386*)
        echo 32bit;;
    (*)
        echo 64bit;;
esac)

## Retrieve exercism client version
release_url=https://github.com/exercism/cli/releases
latest_url=${release_url}/latest
version=$(curl --head --silent ${latest_url} | awk -v FS=/ '/Location:/{print $NF}' | tr -d '\r')

## download the tarball
file_ending=""
unzip_command=""
unzip_from_file_option=""
if [[ ${os} == "windows" ]]; then
    file_ending="zip"
    unzip_command="unzip -d"
else
    file_ending="tgz"
    unzip_command="tar xz -C"
    unzip_from_file_option="-f"
fi
download_url="${release_url}/download/${version}/exercism-${os}-${arch}.${file_ending}"

mkdir -p ${exercism_home}
temp=$(mktemp)
curl -s --Location ${download_url} > ${temp}
${unzip_command} ${exercism_home} ${unzip_from_file_option} ${temp}

## Configuration
config_file=".journy-test.exercism.json"
port=9292

export exercism_command="./exercism --config ${config_file}"

pushd ${exercism_home}
${exercism_command} configure --dir="${exercism_home}"
${exercism_command} configure --api "http://localhost:${port}"
${exercism_command} debug
popd
