def generate_test(case):
    property = case["property"]
    expected = case["expected"]
    text = case["input"]["text"]
    shiftKey = case["input"]["shiftKey"]
    return f'assertEq ({property} "{text}" {shiftKey}) "{expected}"'
