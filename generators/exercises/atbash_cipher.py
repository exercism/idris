
def generate_test(case):
    property = case["property"]
    expected = case["expected"]
    phrase = case["input"]["phrase"]
    return f'assertEq ({property} "{phrase}") "{expected}"'
