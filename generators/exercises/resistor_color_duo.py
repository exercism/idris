
EXTRA_CASES = [
    {
        "description": "First color invalid",
        "property": "value",
        "input": { "colors": ["teal", "red"] },
        "expected": {}
    },
    {
        "description": "Second color invalid",
        "property": "value",
        "input": { "colors": ["brown", "teal"] },
        "expected": {}
    }
]

def header():
    return "import Data.Vect\n"

def extra_cases():
    return EXTRA_CASES

def generate_test(case):
    property = case["property"]
    expected = case["expected"]
    if expected.__class__ == dict:
        expected = "Nothing"
    else:
        expected = f'Just {expected}'
    colors = str(case["input"]["colors"]).replace("'", '"')
    return f'assertEq ({property} {colors}) $ {expected}'
