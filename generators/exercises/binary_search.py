def header():
    return "import Data.Vect\n"


def generate_test(case):
    property = case["property"]
    expected = case["expected"]
    if isinstance(expected, dict):
        expected = "Nothing"
    else:
        expected = f"Just {expected}"

    array = case["input"]["array"]
    n = len(array)
    if array == []:
        array = "(the (Vect 0 Integer) [])"

    value = case["input"]["value"]

    return f"assertEq ({property} {n} {array} {value}) $ {expected}"
