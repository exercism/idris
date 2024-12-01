#!/usr/bin/env bash

# This script is meant to be run in the docker container of idris-test-runner

all_slugs="$*"

exit_code=0

for slug in $all_slugs; do
  local_exit_code=0

  rm -rf /solution
  cp -r /exercises/practice/${slug} /solution

  # Integration test: Check if the example solution passes the tests
  # as run by the idris-test-runner similiarly to a student submitting
  # their solution.
  cp /solution/example/*.idr /solution/src/
  bin/run.sh ${slug} /solution /solution > /dev/null
  solution_pattern=$(cat /solution/results.json | jq -r tostring | grep "{\"version\":1,\"status\":\"pass\"")

  errors=""

  if [ -z "$solution_pattern" ]; then
    errors="${errors}\n\nSolution is incorrect:\n$(cat /solution/results.json | jq -r '.message')"
    local_exit_code=1;
  fi

  if [ $local_exit_code = 0 ]; then
    echo -e "${slug}: \e[32mPASSED\e[0m"
  else
    exit_code=1
    echo -e "${slug}: \e[31mFAILED\e[0m\n${errors}\n\n"
  fi
done

exit ${exit_code}
