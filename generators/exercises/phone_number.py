def generate_test(case):
    property = case["property"]
    expected = case["expected"]
    if isinstance(expected, dict):
        expected = "Nothing"
    else:
        expected = f'Just "{expected}"'
    phrase = case["input"]["phrase"]
    return f'assertEq ({property} "{phrase}") $ {expected}'
