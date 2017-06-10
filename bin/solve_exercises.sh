#!/usr/bin/env bash

set -x

exercises=$(ls exersises | sed 's|/||g')
total_exercises=$(echo ${exercises} | wc -w)
current_exercise_number=1

pushd ${exercism_home}

for exercise in $exercises; do
    percentage=$(((current_exercise_number - 1) * 100 / total_exercises))
    set +x
    echo -e "\n\n"
    echo "============================================="
    echo "${current_exercise_number} of ${total_exercises} (${percentage}) -- ${exercise}"
    echo "============================================="
    set -x

    ${exercism_command} fetch idris ${exercise} # TODO: track name!
    exercise_implementation=$(ls ${exercism_home}/idris/${exercise}/src/*.idr)
    exercise_example=${xtrack_home}
    cp ${exercise_example} ${exercise_implementation}

    pushd ${exercism_home}/idris/${exercise}
    make test
    popd

    current_exercise_number=$((current_exercise_number + 1))
done
