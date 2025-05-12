
def header():
    return "import Data.Vect\n"

def generate_test(case):
    property = case["property"]
    expected = case["expected"]
    dominoes = case["input"]["dominoes"]
    if expected:
        prefix = 'assert $      '
    else:
        prefix = 'assert $ not $'

    return f'{prefix} {property} {dominoes}'
