def header():
    return "import Data.Vect\n"


def generate_test(case):
    property = case["property"].capitalize()
    sides = case["input"]["sides"]
    expected = case["expected"]
    if expected:
        prefix = "assert $      "
    else:
        prefix = "assert $ not $"

    return f"{prefix} is{property} {sides}"
