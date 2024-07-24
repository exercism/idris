
def header():
    return "import Data.Vect\n"

def generate_test(case):
    property = case["property"]
    expected = case["expected"]
    if "color" in case["input"]:
        color = case["input"]["color"]
        return f'assertEq ({property} "{color}") $ {expected}'

    expected = str(expected).replace("'", '"')
    return f'assertEq {property} {expected}'
