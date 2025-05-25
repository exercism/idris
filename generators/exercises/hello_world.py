def generate_test(case):
    property = case["property"]
    expected = case["expected"]
    return f'assertEq {property} "{expected}"'
