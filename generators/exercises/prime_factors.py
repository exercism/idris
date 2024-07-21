
def generate_test(case):
    property = case["property"]
    expected = case["expected"]
    value = case["input"]["value"]
    return f'assertEq ({property} {value}) {expected}'
