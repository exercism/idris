def generate_test(case):
    property = case["property"]
    expected = case["expected"]
    limit = case["input"]["limit"]
    return f"assertEq ({property} {limit}) {expected}"
