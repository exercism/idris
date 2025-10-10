def generate_test(case):
    property = case["property"]
    expected = case["expected"]
    name = case["input"]["name"]
    number = case["input"]["number"]
    return f'\n      assertEq ({property} "{name}" {number}) "{expected}"'
