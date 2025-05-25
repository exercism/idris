def header():
    return "import Data.String\n"


def generate_test(case):
    description = case["description"]
    property = case["property"]
    expected = case["expected"]
    expected = str(expected).replace("[]", "(the (List Int) [])").replace("'", '"')

    f = case["input"]["accumulator"]
    if description == "accumulate recursively":
        f = '(\\x => accumulate (\\y => x ++ y) ["1", "2", "3"]'
    if f == "(x) => upcase(x)":
        f = "Data.String.toUpper"
    elif f == "(x) => reverse(x)":
        f = "(pack . reverse . unpack)"
    else:
        f = "(\\x" + f[3:] + ")"

    xs = str(case["input"]["list"]).replace("'", '"')
    return f"assertEq ({property} {f} {xs}) {expected}"
