
def generate_test(case):
    property = case["property"]
    expected = case["expected"]
    number = case["input"]["number"]
    return f'assertEq ({property} {number}) {expected}'
