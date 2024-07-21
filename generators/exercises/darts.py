
def generate_test(case):
    property = case["property"]
    expected = case["expected"]
    x = float(case["input"]["x"])
    y = float(case["input"]["y"])
    return f'assertEq ({property} ({x}) ({y})) {expected}'
