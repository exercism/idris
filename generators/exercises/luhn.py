
def generate_test(case):
    property = "isValid"
    value = case["input"]["value"]
    expected = case["expected"]
    if expected:
        prefix = "assert $      "
    else:
        prefix = "assert $ not $"

    return f'{prefix} {property} "{value}"'
