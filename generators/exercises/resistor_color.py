EXTRA_CASES = [
    {
        "description": "invalid color",
        "property": "colorCode",
        "input": {"color": "teal"},
        "expected": {},
    }
]


def header():
    return "import Data.Vect\n"


def extra_cases():
    return EXTRA_CASES


def generate_test(case):
    property = case["property"]
    expected = case["expected"]
    if property == "colors":
        expected = str(expected).replace("'", '"')
        return f"assertEq {property} {expected}"

    if isinstance(expected, dict):
        expected = "Nothing"
    else:
        expected = f"Just {expected}"
    color = case["input"]["color"]
    return f'assertEq ({property} "{color}") $ {expected}'
