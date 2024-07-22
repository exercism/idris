#! /usr/bin/env python3

import argparse
import importlib
import json
import sys
import tomllib
import urllib.request

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

def download_canonical_data(exercise):
    url = f"https://raw.githubusercontent.com/exercism/problem-specifications/master/exercises/{exercise}/canonical-data.json"
    with urllib.request.urlopen(url) as f:
        return json.loads(f.read().decode())

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
    test_toml = f"{sys.path[0]}/../exercises/practice/{exercise}/.meta/tests.toml"
    with open(test_toml, "rb") as f:
        test_toml = tomllib.load(f)
    return list(filter(lambda case : test_toml.get(case['uuid'], {}).get("include", True), cases))

def write_test_file(f, mod, exercise, cases):
    exercise_module = exercise.title().replace("-", "")
    max_description_length = max(map(lambda case: len(case["description"]), cases))

    f.write(PREFIX)
    f.write(f"import {exercise_module}\n")
    if hasattr(mod, "header"):
        f.write(mod.header())
    f.write(f"\n")
    f.write(f"tests : List Test\n")
    f.write(f"tests =\n")
    separator = '['
    for case in cases:
        description = case["description"]
        padding = " " * (max_description_length - len(description))
        test_func = mod.generate_test(case)
        f.write(f'  {separator} test "{description}"{padding} ({test_func})\n')
        separator = ','

    f.write(f"  ]\n")
    f.write(SUFFIX)

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("exercise")
    args = parser.parse_args()
    cases = flatten_cases(download_canonical_data(args.exercise))
    cases = filter_cases(args.exercise, cases)

    mod = importlib.import_module("exercises." + args.exercise.replace("-", "_"))
    path = f"{sys.path[0]}/../exercises/practice/{args.exercise}/test/src/Main.idr"
    with open(path, "w") as f:
        write_test_file(f, mod, args.exercise, cases)

if __name__ == "__main__":
    main()
