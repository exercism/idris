def extra_cases():
    return [
        {
            "description": "seventh prime",
            "property": "prime",
            "input": {"number": 7},
            "expected": 17,
        },
        {
            "description": "very big prime",
            "property": "prime",
            "input": {"number": 65537},
            "expected": 821647,
        },
    ]


def generate_test(case):
    property = case["property"]
    expected = case["expected"]
    number = case["input"]["number"]
    return f"assertEq ({property} {number}) {expected}"
