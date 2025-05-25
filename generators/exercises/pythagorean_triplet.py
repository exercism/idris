def header():
    return "import Data.Vect\n"


def generate_test(case):
    property = case["property"]
    n = case["input"]["n"]
    expected = case["expected"]
    return f"assertEq ({property} {n}) {expected}"
