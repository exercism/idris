def generate_test(case):
    property = case["property"]
    expected = case["expected"]
    factors = case["input"]["factors"]
    limit = case["input"]["limit"]
    return f"assertEq ({property} {factors} {limit}) {expected}"
