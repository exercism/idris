def generate_test(case):
    property = case["property"]
    number = case["input"]["number"]
    expected = case["expected"]
    if expected:
        prefix = "assert $      "
    else:
        prefix = "assert $ not $"
    return f"{prefix} {property} {number}"
