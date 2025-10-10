#! /usr/bin/env python3

import argparse
import importlib
import json
import os
import subprocess
import sys

# tomllib is available in the standard library as of Python 3.11
# When using an older release, we use the compatible tomli
try:
    import tomllib
except ModuleNotFoundError:
    import tomli as tomllib

PREFIX = """module Main

import System
import Tester
import Tester.Runner

"""

SUFFIX = """
export
main : IO ()
main = do
  success <- runTests tests
  if success
     then putStrLn "All tests passed"
     else exitFailure
"""


def read_canonical_data(exercise):
    prefix = "Using cached 'problem-specifications' dir: "
    args = ["bin/configlet", "info", "-o", "-v", "d"]
    info = subprocess.run(
        args, capture_output=True, check=True, text=True
    ).stdout.split("\n")
    cache_dir = [line[len(prefix) :] for line in info if line.startswith(prefix)]
    if len(cache_dir) != 1:
        raise Exception("Could not determine 'problem-specifications' dir")
    json_path = f"{cache_dir[0]}/exercises/{exercise}/canonical-data.json"
    if os.path.exists(json_path):
        with open(json_path, "r") as f:
            return json.loads(f.read())
    else:
        return {"cases": []}


def flatten_cases(canonical_data):
    result = []

    def traverse(node):
        nonlocal result
        if "cases" in node:
            for child in node["cases"]:
                traverse(child)
        else:
            result.append(node)

    traverse(canonical_data)
    return result


def filter_cases(exercise, cases):
    toml_path = f"{sys.path[0]}/../exercises/practice/{exercise}/.meta/tests.toml"
    with open(toml_path, "rb") as f:
        test_toml = tomllib.load(f)
    return list(
        filter(lambda case: test_toml.get(case["uuid"], {}).get("include", True), cases)
    )


def write_test_file(f, mod, exercise, cases):
    if hasattr(mod, "extra_cases"):
        cases = cases[:]
        cases.extend(mod.extra_cases())
    exercise_module = exercise.title().replace("-", "")
    max_description_length = max(map(lambda case: len(case["description"]), cases))

    f.write(PREFIX)
    f.write(f"import {exercise_module}\n")
    if hasattr(mod, "header"):
        f.write(mod.header())
    f.write("\n")
    f.write("tests : List Test\n")
    f.write("tests =\n")
    separator = "["
    for case in cases:
        description = case["description"]
        padding = " " * (max_description_length - len(description))
        test_func = mod.generate_test(case)
        f.write(f'  {separator} test "{description}"{padding} ({test_func})\n')
        separator = ","

    f.write("  ]\n")
    f.write(SUFFIX)


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("exercise")
    args = parser.parse_args()
    cases = flatten_cases(read_canonical_data(args.exercise))
    if len(cases) > 0:
        cases = filter_cases(args.exercise, cases)

    mod = importlib.import_module("exercises." + args.exercise.replace("-", "_"))
    path = f"{sys.path[0]}/../exercises/practice/{args.exercise}/test/src/Main.idr"
    with open(path, "w") as f:
        write_test_file(f, mod, args.exercise, cases)


if __name__ == "__main__":
    main()
