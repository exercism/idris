from json import dumps


def generate_test(case):
    property = case["property"]
    phrase = dumps(case["input"]["phrase"])
    expected = case["expected"]
    if expected:
        prefix = "assert $      "
    else:
        prefix = "assert $ not $"

    return f"{prefix} {property} {phrase}"
