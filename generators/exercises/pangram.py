from json import dumps


def generate_test(case):
    property = case["property"]
    sentence = dumps(case["input"]["sentence"])
    expected = case["expected"]
    if expected:
        prefix = "assert $      "
    else:
        prefix = "assert $ not $"

    return f"{prefix} {property} {sentence}"
