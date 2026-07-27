def generate_test(case):
    property = "abbreviate"
    expected = case["expected"]
    phrase = case["input"]["phrase"]
    return f'assertEq ({property} "{phrase}") "{expected}"'
