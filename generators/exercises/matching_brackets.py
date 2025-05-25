from json import dumps


def generate_test(case):
    property = case["property"]
    value = dumps(case["input"]["value"])
    expected = case["expected"]
    if expected:
        prefix = "assert $      "
    else:
        prefix = "assert $ not $"

    return f"{prefix} {property} {value}"
