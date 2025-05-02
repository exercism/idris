
HEADER = """
import Data.Nat

isOdd : Int -> Bool
isOdd n = (n `mod` 2) == 1

plusOne : Int -> Int
plusOne n = 1 + n

divide : Nat -> Nat -> Nat
divide acc el = if acc == 0 then 0 else el `div` acc

subtract : Int -> Int -> Int
subtract acc el = el - acc
"""

EXTRA_CASES = [
    {
        "description": "foldl with subtraction",
        "property": "foldl",
        "input": {
            "list": [6, 8],
            "initial": 3,
            "function": "(acc, el) -> el - acc"
        },
        "expected": 5
    },
    {
        "description": "foldr with subtraction",
        "property": "foldr",
        "input": {
            "list": [6, 8],
            "initial": 3,
            "function": "(acc, el) -> el - acc"
        },
        "expected": 1
    }
]

def header():
    return HEADER

def extra_cases():
    return EXTRA_CASES

def serialize(number_list):
    return str(number_list).replace("[]", "(the (List Int) [])")

def serialize_nested(number_list_list):
    if number_list_list == []:
        return "(the (List (List Int)) [])"
    return str(list(map(serialize, number_list_list))).replace("'", "")

def generate_test(case):
    description = case["description"]
    property = case["property"]
    expected = serialize(case["expected"])

    if property == "append":
        list1 = serialize(case["input"]["list1"])
        list2 = serialize(case["input"]["list2"])
        return f"assertEq (ListOps.{property} {list1} {list2}) {expected}"

    if property == "concat":
        lists = serialize_nested(case["input"]["lists"])
        return f"assertEq (ListOps.{property} {lists}) {expected}"

    if property == "filter":
        list1 = serialize(case["input"]["list"])
        return f"assertEq (ListOps.{property} isOdd {list1}) {expected}"

    if property == "length":
        list1 = serialize(case["input"]["list"])
        return f"assertEq (ListOps.{property} {list1}) {expected}"

    if property == "map":
        list1 = serialize(case["input"]["list"])
        return f"assertEq (ListOps.{property} plusOne {list1}) {expected}"

    if property in ["foldl", "foldr"]:
        initial = case["input"]["initial"]
        list1 = serialize(case["input"]["list"])

        function = case["input"]["function"]
        if function == "(acc, el) -> el * acc":
            function = "(*)"
        elif function == "(acc, el) -> el + acc":
            function = "(+)"
        elif function == "(acc, el) -> el / acc":
            function = "divide"
            # Use the original test values for integer division.
            initial = 5
            list1 = [2, 5]
            if property == "foldl":
                expected = 0
            else:
                expected = 2
        elif function == "(acc, el) -> el - acc":
            function = "subtract"
        else:
            raise Exception(f"Unexpected function {function}")

        return f"assertEq (ListOps.{property} {function} {initial} {list1}) {expected}"

    if property == "reverse":
        list1 = serialize(case["input"]["list"])
        return f"assertEq (ListOps.{property} {list1}) {expected}"

    raise Exception(f"Unexpected property {property}")
