#!/usr/bin/env bash

set -x
set -o nounset

track_home=$(pwd)

exercises=$(ls exercises | sed 's|/||g')
total_exercises=$(echo ${exercises} | wc -w)
current_exercise_number=1

local -a green=()
local -a red=()
exit_code=0

for exercise in $exercises; do
    percentage=$(((current_exercise_number - 1) * 100 / total_exercises))
    set +x
    echo -e "\n\n"
    echo "============================================="
    echo "${current_exercise_number} of ${total_exercises} (${percentage}) -- ${exercise}"
    echo "============================================="
    set -x

    pushd "exercises/${exercise}"

    pushd example
    cp *.idr ../src
    popd

    if make test; then
        green+=(${exercise})
    else
        red+=(${exercise})
        exit_code=$((exit_code + 1))
    fi
    popd

    current_exercise_number=$((current_exercise_number + 1))
done

set +x

echo "GOOD:"
for i in ${green[@]}; do
    echo " * ${i}"
done

echo -e "\n\nBAD:"
for i in ${red[@]}; do
    echo " * ${i}"
done

exit $exit_code
