#!/usr/bin/env bash
set -e

die() { echo "$*" >&2; exit 1; }

if [[ $PWD != $(realpath "$(dirname "$0")/..") ]]; then
    die "You must be in the track root directory."
fi
if [[ -z $1 ]]; then
    die "usage: $0 exercise_slug"
fi

slug=$1

existing=$( jq --arg slug "${slug}" '.exercises.practice[] | select(.slug == $slug)' config.json )
if [[ -n ${existing} ]]; then
    die "${slug} already exists in config.json"
fi

pascal=${slug^}
while [[ ${pascal} =~ (.*)-(.*) ]]; do
    pascal=${BASH_REMATCH[1]}${BASH_REMATCH[2]^}
done

bin/fetch-configlet
bin/configlet create --practice-exercise "${slug}"

sed -e "s#hello-world#${slug}#g" exercises/practice/hello-world/pack.toml > exercises/practice/${slug}/pack.toml

sed -e "s#hello-world#${slug}#g" exercises/practice/hello-world/test/test.ipkg > exercises/practice/${slug}/test/test.ipkg

sed -e "s#hello-world#${slug}#g" exercises/practice/hello-world/hello-world.ipkg | sed -e "s#HelloWorld#${pascal}#g" > exercises/practice/${slug}/${slug}.ipkg


if [[ -z $author ]]; then
    echo
    read -rp "What's your github username? " author
fi

conf="exercises/practice/${slug}/.meta/config.json"
jq  --arg author "${author}" \
    '.authors = [$author]' "${conf}" > "${conf}.tmp" \
&& mv "${conf}.tmp" "${conf}"


read -p "What's the difficulty for ${slug}? "
if [[ -n ${REPLY} && ${REPLY} == +([0-9]) ]]; then
    tmp=$(mktemp)
    jq --argjson diff "${REPLY}" --arg slug "${slug}" '
        .exercises.practice |= map(
            if (.slug == $slug)
            then .difficulty = $diff
            else .
            end
        )
    ' config.json > "${tmp}" \
    && mv "${tmp}" config.json
fi
