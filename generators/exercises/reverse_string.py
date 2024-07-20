
def generate_test(case):
    property = "rev"
    expected = case["expected"]
    value = case["input"]["value"]
    return f'assertEq ({property} "{value}") "{expected}"'
