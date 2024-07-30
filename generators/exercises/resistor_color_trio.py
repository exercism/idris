
EXTRA_CASES = [
    # The first four cases are from the Julia track.
    {
        "description": "Orange and orange and red",
        "property": "label",
        "input": { "colors": ["orange", "orange", "red"] },
        "expected": { "value": "3.3", "unit": "kiloohms" }
    },
    {
        "description": "Orange and orange and green",
        "property": "label",
        "input": { "colors": ["orange", "orange", "green"] },
        "expected": { "value": "3.3", "unit": "megaohms" }
    },
    {
        "description": "White and white and violet",
        "property": "label",
        "input": { "colors": ["white", "white", "violet"] },
        "expected": { "value": "990", "unit": "megaohms" }
    },
    {
        "description": "White and white and grey",
        "property": "label",
        "input": { "colors": ["white", "white", "grey"] },
        "expected": { "value": "9.9", "unit": "gigaohms" }
    },

    {
        "description": "First color invalid",
        "property": "label",
        "input": { "colors": ["teal", "red", "orange"] },
        "expected": { "error": "" }
    },
    {
        "description": "Second color invalid",
        "property": "label",
        "input": { "colors": ["brown", "teal", "orange"] },
        "expected": { "error": "" }
    },
    {
        "description": "Third color invalid",
        "property": "label",
        "input": { "colors": ["brown", "red", "teal"] },
        "expected": { "error": "" }
    }
]

def header():
    return "import Data.Vect\n"

def extra_cases():
    return EXTRA_CASES

def generate_test(case):
    property = case["property"]
    expected = case["expected"]

    if "error" in expected.keys():
        expected = "Nothing"
    else:
        value = expected["value"]
        unit = expected["unit"]
        expected = f'Just "{value} {unit}"'

    colors = str(case["input"]["colors"]).replace("'", '"')
    return f'assertEq ({property} {colors}) $ {expected}'
