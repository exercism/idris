#!/usr/bin/env bash

set -x

xtrack_home=$(pwd)
build=${xtrack_home}/build
exercism_home=${build}/exercism
config_file=".journy-test.exercism.json"
exercism_command="./exercism --config ${config_file}"

exercises=$(ls exercises | sed 's|/||g')
total_exercises=$(echo ${exercises} | wc -w)
current_exercise_number=1

pushd ${exercism_home}

green=()
red=()
exit_code=0

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
    exercise_example=${xtrack_home}/exercises/${exercise}/src/example.idr
    cp ${exercise_example} ${exercise_implementation}

    pushd ${exercism_home}/idris/${exercise}
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